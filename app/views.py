# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

# Python modules
import os, logging 

# Flask modules
from flask               import render_template, request, url_for, redirect, send_from_directory
from flask_login         import login_user, logout_user, current_user, login_required
from werkzeug.exceptions import HTTPException, NotFound, abort

from flask import *
from dbconnection import connection
from flask.json import JSONEncoder
import simplejson as json
import hashlib
import uuid

# App modules
from app        import app, lm, db, bc
from app.models import User, Branch, Bank, BankTransaction, Customer, CustomerTransaction, Supplier, SupplierTransaction
from app.forms  import LoginForm, RegisterForm

# provide login manager with load_user callback
@lm.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

# Logout user
@app.route('/logout.html')
def logout():
    logout_user()
    return redirect(url_for('index'))

# Register a new user
@app.route('/register.html', methods=['GET', 'POST'])
def register():
    
    # cut the page for authenticated users
    if current_user.is_authenticated:
        return redirect(url_for('index'))

    # declare the Registration Form
    form = RegisterForm(request.form)

    msg = None

    if request.method == 'GET': 

        return render_template( 'pages/register.html', form=form, msg=msg )

    # check if both http method is POST and form is valid on submit
    if form.validate_on_submit():

        # assign form data to variables
        username = request.form.get('username', '', type=str)
        password = request.form.get('password', '', type=str) 
        email    = request.form.get('email'   , '', type=str) 

        # filter User out of database through username
        user = User.query.filter_by(user=username).first()

        # filter User out of database through username
        user_by_email = User.query.filter_by(email=email).first()

        if user or user_by_email:
            msg = 'Error: User exists!'
        
        else:         

            pw_hash = password #bc.generate_password_hash(password)

            user = User(username, email, pw_hash)

            user.save()

            msg = 'User created, please <a href="' + url_for('login') + '">login</a>'     

    else:
        msg = 'Input error'     

    return render_template( 'pages/register.html', form=form, msg=msg )

# Authenticate user
@app.route('/login.html', methods=['GET', 'POST'])
def login():
    
    # cut the page for authenticated users
    if current_user.is_authenticated:
        return redirect(url_for('index'))
            
    # Declare the login form
    form = LoginForm(request.form)

    # Flask message injected into the page, in case of any errors
    msg = None

    # check if both http method is POST and form is valid on submit
    if form.validate_on_submit():

        # assign form data to variables
        username = request.form.get('username', '', type=str)
        password = request.form.get('password', '', type=str) 

        # filter User out of database through username
        user = User.query.filter_by(user=username).first()

        if user:
            
            #if bc.check_password_hash(user.password, password):
            if user.password == password:
                login_user(user)
                return redirect(url_for('index'))
            else:
                msg = "Wrong password. Please try again."
        else:
            msg = "Unknown user"

    return render_template( 'pages/login.html', form=form, msg=msg )

# App main route + generic routing
@app.route('/', defaults={'path': 'index.html'})
@app.route('/<path>')
def index(path):

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        # try to match the pages defined in -> pages/<input file>
        return render_template( 'pages/'+path )
    
    except:
        
        return render_template( 'pages/error-404.html' )

# POS Administration Routes

@app.route('/pos-administration/receipt-sales.html', methods = ['GET'])
def pos_administator_receipt_sales():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/pos-administration/receipt-sales.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

@app.route('/pos-administration/stock-sales.html', methods = ['GET'])
def pos_administator_stock_sales():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/pos-administration/stock-sales.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

@app.route('/pos-administration/reports.html', methods = ['GET'])
def pos_administator_reports():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/pos-administration/reports.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

# Inventory Routes

@app.route('/inventory/enquiries.html', methods = ['GET'])
def inventory_enquiries():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/inventory/enquiries.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

@app.route('/inventory/reports.html', methods = ['GET'])
def inventory_reports():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/inventory/reports.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

# Supplier Routes

@app.route('/supplier/enquiries.html', methods = ['GET'])
def supplier_enquiries():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/suppliers/enquiries.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

@app.route('/supplier/reports.html', methods = ['GET'])
def supplier_reports():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/suppliers/reports.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

# Customer Routes

@app.route('/customer/enquiries.html', methods = ['GET'])
def customer_enquiries():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/customers/enquiries.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )
@app.route('/customer/reports.html', methods = ['GET'])
def customer_reports():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/customers/reports.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

# Banking Routes

@app.route('/banking/enquiries.html', methods = ['GET'])
def banking_enquiries():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/banking/enquiries.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

@app.route('/api/banking/enquiries', methods = ['GET'])
def GetBankingEnquiries():
    if request.method == "GET":
        conn = connection()
        c = conn.cursor()
        qry="select * from bank_trans" 
        c.execute(qry)

        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result':r,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/banking/reports.html', methods = ['GET'])
def banking_reports():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/banking/reports.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

# General Legder Routes

@app.route('/general-ledger/enquiries.html', methods = ['GET'])
def general_legder_enquiries():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/general-ledger/enquiries.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

@app.route('/general-ledger/reports.html', methods = ['GET'])
def general_legder_reports():

    if not current_user.is_authenticated:
        return redirect(url_for('login'))

    content = None

    try:

        return render_template( 'pages/general-ledger/reports.html' )
    
    except:
        
        return render_template( 'pages/error-404.html' )

# Return sitemap 
@app.route('/sitemap.xml')
def sitemap():
    return send_from_directory(os.path.join(app.root_path, 'static'), 'sitemap.xml')

# Python Json API

# Branch routes
@app.route('/api/branches', methods = ['GET'])
def index_branches(): 
    if request.method == "GET":
        branches = [branch.serialize() for branch in Branch.query.all()]

        return json.dumps({'data': branches,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

# Bank routes
@app.route('/api/branches/<int:id>/banks', methods = ['GET'])
def index_banks(id): 
    if request.method == "GET":
        banks = [bank.serialize() for bank in Bank.query.filter_by(bank_id = id).all()]

        return json.dumps({'data': banks,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

# Bank routes
@app.route('/api/branches/<int:id>/customers', methods = ['GET'])
def index_customers(id): 
    if request.method == "GET":
        customers = [customer.serialize() for customer in Customer.query.filter_by(bank_id = id).all()]

        return json.dumps({'data': customers,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

# Supplier routes
@app.route('/api/branches/<int:id>/suppliers', methods = ['GET'])
def index_suppliers(id): 
    if request.method == "GET":
        suppliers = [supplier.serialize() for supplier in Supplier.query.filter_by(bank_id = id).all()]

        return json.dumps({'data': suppliers,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})


#  Customer Transaction Routes
@app.route('/api/branches/<int:id>/customer-transanctions', methods = ['GET'])
def index_customer_transactions(id):
    if request.method == "GET":
        query = CustomerTransaction.query
        # .options(db.joinload(CustomerTransaction.customer))

        if id:
            query.filter_by(branch_id = id)

        if 'customer_id' in request.args:
             query.filter_by(customer_id = request.args['customer_id'])

        customerTransactions = [ customerTransaction.serialize() for customerTransaction in query.all()]

        return json.dumps({'data': customerTransactions, "error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

#  Bank Transaction Routes
@app.route('/api/branches/<int:id>/bank-transanctions', methods = ['GET'])
def index_bank_transactions(id):
    if request.method == "GET":
        query = BankTransaction.query
        # .options(db.joinload(BankTransaction.bank))

        if id:
            query.filter_by(branch_id = id)

        if 'bank_id' in request.args:
             query.filter_by(bank_id = request.args['bank_id'])

        bankTransactions = [ bankTransaction.serialize() for bankTransaction in query.all()]

        return json.dumps({'data': bankTransactions, "error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

#  Supplier Transaction Routes
@app.route('/api/branches/<int:id>/supplier-transanctions', methods = ['GET'])
def index_supplier_transactions(id):
    if request.method == "GET":
        query = SupplierTransaction.query
        # .options(db.joinload(SupplierTransaction.supplier))

        if id:
            query.filter_by(branch_id = id)

        if 'supplier_id' in request.args:
             query.filter_by(supplier_id = request.args['supplier_id'])

        supplierTransactions = [ supplierTransaction.serialize() for supplierTransaction in query.all()]

        return json.dumps({'data': supplierTransactions, "error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

# API Routes
# @app.route('/')
# def hello_world():
#     return 'Hello from Flask!'

@app.route('/GetUserByCard', methods= ['POST','GET'])
def UserByCard():
    if request.method == "POST":
        sCardDetails = request.form['CardDetails']
        branch_id = request.form['branch_id']
        conn = connection()
        c = conn.cursor()
        qry="select su.*,CONCAT(s.staff_sir_name,' ',s.staff_other_names) as names,sh.shift_id from sys_user su,staff s left join shift sh on (sh.branch_id=s.branch_id and sh.shift_complete='N') where  su.staff_id=s.staff_id and su.card_details='" + getMD5(sCardDetails) + "' and su.branch_id="+ str(branch_id)
        c.execute(qry)

        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result':r,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetShift', methods= ['POST','GET'])
def GetShift():
    if request.method == "POST":
        iBranchID = request.form['branch_id']
        itill = request.form['till']
        conn = connection()
        c = conn.cursor()
        qry="select s.*,t.till_no from shift s,till t where t.till_id=s.till_id and t.till_no='" + itill + "' and s.branch_id=" + iBranchID +" and s.shift_complete='N' order by s.sdate"
        c.execute(qry)
        data = c.fetchall()

        myList={}

        for r in data:
            myList={"shift_id" :  r[0],"till_id" :  r[6] }

        conn.close()
        return json.dumps({'result':myList,"error":False}, use_decimal=True)
    else:
        return json.dumps({'result':"Invalid method",'error':True})
    
@app.route('/GetRoutes', methods= ['POST','GET'])
def GetRoutes():
    if request.method == "POST":
        iBranchId = request.form['branchid']
        conn = connection()
        c = conn.cursor()
        qry="select * from routes where branch_id='" + iBranchId + "'"
        c.execute(qry)
        data = c.fetchall()
        myList1 = []
        for r in data:
            myList = {"route_id" :  str(r[0]), "route_description" :  str(r[2]), "surcharge" :  str(r[4])}
            myList1.append(myList)

        conn.close()
        return json.dumps({'result':myList1,"error":False}, use_decimal=True)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetSuppliers', methods= ['POST','GET'])
def GetSuppliers():
    if request.method == "POST":
        iBranchId = request.form['branchid']
        conn = connection()
        c = conn.cursor()
        qry="select * from supplier where branch_id='" + iBranchId + "'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetCloseShift', methods= ['POST','GET'])
def SetCloseShift():
    if request.method == "POST":
        shift_id = request.form['shift_id']
        conn = connection()
        c = conn.cursor()

        qry="select count(*) as count from pos_receipts where receipt_paid='N' and cancelled='N' and shift_id='" + shift_id + "'"
        c.execute(qry)
        data = c.fetchall()

        for r in data:
            if int(r[0])>0:
                conn.close()
                return json.dumps({'result':"Clear all receipts",'error':True})

        qry="select sum(receipt_cash_amount) as cash,sum(receipt_cheque_amount) as cheque,sum(receipt_card_amount) as card, "
        qry= qry + " sum(receipt_voucher_amount) as on_acc,sum(receipt_mobile_money) as mobile_money,sum(receipt_discount) as discount, "
        qry= qry + "(select sum(cash_amount) from pay_out where pay_type_id=1 and shift_id='" + shift_id + "' ) as shift_float, "
        qry= qry + "(select sum(cash_amount) from pay_out where pay_type_id=5 and shift_id='" + shift_id + "' ) as petty_cash, "
        qry= qry + "(select sum(cash_amount) from pay_out where pay_type_id=8 and shift_id='" + shift_id + "' ) as banking, "
        qry= qry + "(select sum(cash_amount) from pay_out where pay_type_id=6 and shift_id='" + shift_id + "' ) as advance, "
        qry= qry + "(select sum(cash_amount) from pay_out where pay_type_id=19 and shift_id='" + shift_id + "' ) as supplier_payment "
        qry= qry + " from pos_receipts where cancelled='N' and receipt_paid='Y' and shift_id='" + shift_id + "'"

        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetTrips', methods= ['POST','GET'])
def GetTrips():
    if request.method == "POST":
        iBranchId = request.form['branchid']
        conn = connection()
        c = conn.cursor()
        qry="select t.*,r.route_description from trips t,routes r where t.route_id=r.route_id and t.trip_done='N' and t.trip_date > curdate()-5 and t.branch_id=" + iBranchId +" order by trip_date desc"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetCustomers', methods= ['POST','GET'])
def GetCustomers():
    if request.method == "POST":
        iBranchId = request.form['branchid']
        conn = connection()
        c = conn.cursor()
        qry="select * from customer where active='Y' and branch_id='" + iBranchId + "'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetPayTypes', methods= ['POST','GET'])
def GetPayTypes():
    if request.method == "POST":
        conn = connection()
        c = conn.cursor()
        qry="select * from pay_type"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True)
    else:
        conn = connection()
        c = conn.cursor()
        qry="select * from pay_type"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True)

@app.route('/GetBanks', methods= ['POST','GET'])
def GetBanks():
    if request.method == "POST":
        iBranchId = request.form['branchid']
        conn = connection()
        c = conn.cursor()
        qry="select * from banks where branch_id='" + iBranchId + "'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetPayOuts', methods= ['POST','GET'])
def GetPayOuts():
    if request.method == "POST":
        iShiftId = request.form['shift_id']
        conn = connection()
        c = conn.cursor()
        qry="select * from pay_out where shift_id='" + iShiftId + "'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetDeliveryCustomer', methods= ['POST','GET'])
def GetDeliveryCustomer():
    if request.method == "POST":
        iBranchId = request.form['branchid']
        conn = connection()
        c = conn.cursor()
        qry="select * from delivery_customer where branch_id='" + iBranchId +"'"
        c.execute(qry)
        data = c.fetchall()
        myList1 = []
        for r in data:
            myList = {"dcustomer_id" :  r[0], "dcustomer_name" :  r[1], "dcustomer_number" :  str(r[2]), "dcustomer_details" :  str(r[2])}
            myList1.append(myList)

        conn.close()
        return json.dumps({'result': myList1, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetTills', methods= ['POST','GET'])
def GetTills():
    if request.method == "POST":
        iBranchId = request.form['branch_id']
        conn = connection()
        c = conn.cursor()
        qry="select * from till where branch_id=" + iBranchId
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)

        conn.close()
        return json.dumps({'result':myList1,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetTables', methods= ['POST','GET'])
def GetTables():
    if request.method == "POST":
        iBranchId = request.form['branchid']
        conn = connection()
        c = conn.cursor()
        qry="select * from tables where branch_id=" + iBranchId
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)

        conn.close()
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetUomConversion', methods= ['POST','GET'])
def GetUomConversion():
    if request.method == "POST":
        iBranchId = request.form['branch_id']
        iProductId = request.form['product_id']
        conn = connection()
        c = conn.cursor()
        qry="select * from uom_conversion where branch_id=" + iBranchId + " and product_id='" + iProductId + "'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)

        conn.close()
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetLocations', methods= ['POST','GET'])
def GetLocations():
    if request.method == "POST":
        iBranchId = request.form['branchid']
        conn = connection()
        c = conn.cursor()
        qry="select * from location where branch_id=" + iBranchId
        c.execute(qry)
        data = c.fetchall()
        myList1 = []
        for r in data:
            myList = {"location_id" :  r[0], "location_description" :  r[1], "posl" :  str(r[3])}
            myList1.append(myList)

        conn.close()
        return json.dumps({'result': myList1, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetCategoryByLocation', methods= ['POST','GET'])
def GetCategoryByLocation():
    if request.method == "POST":
        sLocationId = request.form['locationId']
        conn = connection()
        c = conn.cursor()
        qry="select c.* from category c where (select COUNT(*) from location_stock where location_id='" + sLocationId + "' and category_id=c.category_id)>0"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetLocationStocks', methods= ['POST','GET'])
def GetLocationStocks():
    if request.method == "POST":
        sLocationId = request.form['locationId']
        sCategoryId = request.form['categoryId']
        conn = connection()
        c = conn.cursor()
        qry="select ls.* from location_stock ls where ls.location_id='" + sLocationId + "' and ls.category_id='" + sCategoryId + "' and ls.active='Y'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetAllLocationStocks', methods= ['POST','GET'])
def GetAllLocationStocks():
    if request.method == "POST":
        sLocationId = request.form['locationId']
        conn = connection()
        c = conn.cursor()
        qry="select ls.* from location_stock ls where ls.location_id='" + sLocationId + "' and ls.active='Y'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetReceipt', methods= ['POST','GET'])
def GetReceipt():
    if request.method == "POST":
        sReceiptId = request.form['receipt_id']

        conn = connection()
        c = conn.cursor()
        qry="select pr.*,t.table_description from pos_receipts pr left join tables t on (pr.table_id=t.table_id) where pr.receipt_id='"+sReceiptId+"'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetBillsByStaff', methods= ['POST','GET'])
def GetBillsByStaff():
    if request.method == "POST":
        sStaffId = request.form['staff_id']
        sBranchId = request.form['branch_id']
        sShiftId = request.form['shift_id']
        conn = connection()
        c = conn.cursor()
        qry="select pr.*,t.table_description from pos_receipts pr left join tables t on (pr.table_id=t.table_id) where pr.cancelled='N' and pr.receipt_paid='N' and pr.shift_id='"+sShiftId+"' and pr.branch_id=" + sBranchId + " and pr.staff_id='" + sStaffId + "'"
        c.execute(qry)
        data = c.fetchall()
        myList1 = []
        for r in data:
            myList = {"receipt_id" :  r[0], "receipt_ref" :  r[1],"receipt_code" :  r[25], "receipt_total_amount" :  str(r[4]), "table_description" :  str(r[29])}
            myList1.append(myList)

        conn.close()
        return json.dumps({'result': myList1, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetLocationStockSearch', methods= ['POST','GET'])
def GetLocationStockSearch():
    if request.method == "POST":
        sLocationId = request.form['locationId']
        sDescription = request.form['description']
        conn = connection()
        c = conn.cursor()
        qry="select ls.* from location_stock ls where ls.location_id='" + sLocationId + "' and ls.location_product_description like '%" + sDescription + "%'"
        c.execute(qry)
        data = c.fetchall()
        myList1 = []
        for r in data:
            myList = {"location_product_id" :  r[0], "product_id" :  r[1], "uom_code" :  str(r[2]), "location_product_quantity" :  str(r[3])
                    , "location_id" :  str(r[6]), "location_productcode" :  str(r[8]), "location_product_scancode" :  str(r[9]), "location_product_description" :  str(r[10]), "location_product_sp" :  str(r[11]), "location_product_vattabble" :  str(r[12])
                    , "fixed_price" :  str(r[13]) , "category_id" :  str(r[14]), "location_product_catlv" :  str(r[15]), "location_product_sp1" :  str(r[16]), "product_image" :  str(r[17]), "accompaniments" :  str(r[18]), "partaccompaniment" :  str(r[19])
                    , "active" :  str(r[22])}
            myList1.append(myList)

        conn.close()
        return json.dumps({'result': myList1, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetBillItems', methods= ['POST','GET'])
def GetBillItems():
    if request.method == "POST":
        sReceiptId = request.form['receipt_id']
        conn = connection()
        c = conn.cursor()
        qry="select prd.*,ls.location_product_description from pos_receipt_details prd left join location_stock ls on (prd.location_product_id=ls.location_product_id) where prd.cancelled='N' and prd.receipt_id='" + sReceiptId + "'"
        c.execute(qry)
        data = c.fetchall()
        myList1 = []
        for r in data:
            myList = {"receipt_details_id" :  r[0], "location_product_description" :  r[15], "trans_quantity" :  str(r[3]), "product_sp" :  str(r[4]), "ln_total" :  r[3]*r[4]}
            myList1.append(myList)

        conn.close()
        return json.dumps({'result': myList1, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetCustomerTrans', methods= ['POST','GET'])
def SetCustomerTrans():
    if request.method == "POST":
        customer_id = request.form['customer_id']
        transaction_ref = request.form['transaction_ref']
        trans_type_id = request.form['trans_type_id']
        amount = float(request.form['amount'])
        comment = request.form['comment']
        staff_id = request.form['staff_id']
        discount = float(request.form['discount'])
        transaction_vat = float(request.form['transaction_vat'])
        branch_id = request.form['branch_id']
        trans_by = request.form['trans_by']
        trip_id = request.form['trip_id']

        if float(amount) >0:
            customer_total_credit = float(amount)
            customer_total_debit = 0
        else:
            customer_total_credit = 0
            customer_total_debit = float(amount)

        conn = connection()
        c = conn.cursor()
        qry = "update customer set customer_running_bal=customer_running_bal+%d, customer_total_credit=customer_total_credit+%d, customer_total_debit=customer_total_debit+%d,updated='N' where customer_id='%s'" % (float(amount),  customer_total_credit, customer_total_debit,customer_id)

        c.execute(qry)
        conn.commit()

        qry ="insert into customer_trans (customer_trans_id,transaction_ref,transaction_date,transaction_amount,transaction_approved,customer_id,trans_type_id,transaction_comment,running_bal,trip_id,updated,branch_id,updated_by,updated_on,created_by,created_on,trans_by,transaction_vat,discount) "
        qry = qry + "values (uuid(),'%s',now(),%d,'1','%s','%s',(select customer_running_bal from customer where customer_id= '%s'),'%s','%s','N',%s,'%s',now(),'%s',now(),'%s',%d,%d)"
        qry = qry  % (transaction_ref,abs(float(amount)),customer_id,trans_type_id,comment,customer_id,trip_id,branch_id,staff_id,staff_id,trans_by,float(transaction_vat),float(discount))

        c.execute(qry)
        conn.commit()


        conn.close()
        myList = {"customer_id" : customer_id}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})
        
@app.route('/GetCustomer', methods= ['POST','GET'])
def GetCustomer():
    if request.method == "POST":
        sCustomerId = request.form['customer_id']
        conn = connection()
        c = conn.cursor()
        qry="select * from customer where active='Y' and customer_id='" + sCustomerId + "'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetShift', methods= ['POST','GET'])
def SetShift():
    if request.method == "POST":
        shift_id = request.form['shift_id']
        shift_complete = request.form['shift_complete']
        sdate = request.form['sdate']
        shift_description = request.form['shift_description']
        branch_id = request.form['branch_id']
        till_id = request.form['till_id']

        conn = connection()
        c = conn.cursor()

        if shift_id=='0':
            shift_id=str(uuid.uuid4())

            qry="INSERT INTO shift (shift_id,shift_day,shift_complete,sdate,shift_description,branch_id,till_id,updated) VALUES "
            qry=qry + "('"+ shift_id +"', 'Y', 'N', '"+ str(sdate) +"', '" + shift_description + "',"+branch_id+",(select till_id from till where till_no= '"+till_id+"' and branch_id="+branch_id+" limit 1),'N')"
        else:
            qry="UPDATE shift set shift_complete='"+shift_complete+"',updated='N' WHERE shift_id='"+ shift_id +"';"

        c.execute(qry)
        conn.commit()

@app.route('/SetCustomer', methods= ['POST','GET'])
def SetCustomer():
    if request.method == "POST":
        customer_id= request.form['customer_id']
        customer_acc= request.form['customer_acc']
        customer_name= request.form['customer_name']
        customer_running_bal= request.form['customer_running_bal']
        customer_bank_acc= request.form['customer_bank_acc']
        customer_phone_no= request.form['customer_phone_no']
        customer_address= request.form['customer_address']
        customer_contact_person= request.form['customer_contact_person']
        customer_credit_limit= request.form['customer_credit_limit']
        branch_id= request.form['branch_id']
        active= request.form['active']
        route_id= request.form['route_id']
        pin_number= request.form['pin_number']
        clearpbalance= request.form['clearpbalance']
        request_orderno= request.form['request_orderno']
        customer_total_credit= request.form['customer_total_credit']
        customer_total_debit= request.form['customer_total_debit']

        conn = connection()
        c = conn.cursor()
        if customer_id=='0':
            customer_id = str(uuid.uuid4())
            qry = "INSERT INTO customer (customer_id, customer_acc, customer_name, customer_running_bal, customer_bank_acc, customer_phone_no, customer_address, customer_contact_person, customer_credit_limit, branch_id, active, customer_total_credit, customer_total_debit, route_id, updated, pin_number, clearpbalance, request_orderno) VALUES "
            qry=qry +"(%s, %s, %s, %d, %s, %s, %s,%s, %d, %d, %s,%d, %d, %s, %s, %s, %s, %s)" % (customer_id, customer_acc, customer_name, 0, customer_bank_acc, customer_phone_no, customer_address, customer_contact_person, customer_credit_limit, branch_id, active, 0, 0, route_id, 'N', pin_number, clearpbalance, request_orderno)
        else:
            qry = "update customer set customer_name=%s, customer_running_bal=customer_running_bal+%d, customer_bank_acc=%s, customer_phone_no=%s, customer_address=%s, customer_contact_person=%s, customer_credit_limit=%d, active=%s, customer_total_credit=customer_total_credit+%d, customer_total_debit=customer_total_debit+%d, route_id=%s, updated='N', pin_number=%s, clearpbalance=%s, request_orderno=%s where customer_id=%s" % (customer_name, customer_running_bal, customer_bank_acc, customer_phone_no, customer_address, customer_contact_person, customer_credit_limit, active, customer_total_credit, customer_total_debit, route_id, updated, pin_number, clearpbalance, request_orderno,customer_id)

        c.execute(qry)
        conn.commit()

        conn.close()
        myList = {"customer_id" : customer_id}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetTrip', methods= ['POST','GET'])
def SetTrip():
    if request.method == "POST":
        trip_id= request.form['trip_id']
        route_id= request.form['route_id']
        trip_date= request.form['trip_date']
        trip_ref= request.form['trip_ref']
        trip_customerno= request.form['trip_customerno']
        trip_invoiceno= request.form['trip_invoiceno']
        trip_done= request.form['trip_done']
        branch_id= request.form['branch_id']
        vehicle_id= request.form['vehicle_id']
        driver_id= request.form['driver_id']
        driver_name= request.form['driver_name']

        conn = connection()
        c = conn.cursor()
        if trip_id=='0':
            trip_id = str(uuid.uuid4())
            qry = "INSERT INTO trips (trip_id, route_id, trip_date, trip_ref, trip_customerno, trip_invoiceno, trip_done, updated, branch_id, vehicle_id, driver_id, driver_name) VALUES "
            qry=qry +"(%s, %s, %s, %s, %d, %d, %s, %s, %d, %s, %s, %s)" % (trip_id, route_id, trip_date, trip_ref, trip_customerno, trip_invoiceno, trip_done, 'N', branch_id, vehicle_id, driver_id, driver_name)
        else:
            qry = "update trips set route_id=%s, trip_date=%s, trip_ref=%s, trip_customerno=%d, trip_invoiceno=%d, trip_done=%s, updated=%s, branch_id=%d, vehicle_id=%s, driver_id=%s, driver_name=%s where trip_id=%s" % (route_id, trip_date, trip_ref, trip_customerno, trip_invoiceno, trip_done, 'N', branch_id, vehicle_id, driver_id, driver_name,trip_id)

        c.execute(qry)
        conn.commit()

        conn.close()
        myList = {"trip_id" : trip_id}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetPayOutByShift', methods= ['POST','GET'])
def GetPayOutByShift():
    if request.method == "POST":
        iShiftId = request.form['shift_id']
        conn = connection()
        c = conn.cursor()
        qry="select * from pay_out where shift_id='" + iShiftId +"'"
        c.execute(qry)
        r = []
        r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]

        conn.close()
        return json.dumps({'result': r, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)

        conn.close()
        return json.dumps({'result':myList1,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetPayOut', methods= ['POST','GET'])
def SetPayOut():
    if request.method == "POST":
        pay_id = request.form['pay_id']
        pay_date = request.form['pay_date']
        pay_time = request.form['pay_time']
        pay_to = request.form['pay_to']
        staff_id = request.form['staff_id']
        pay_amount = request.form['pay_amount']
        pay_type_id = request.form['pay_type_id']
        pay_description = request.form['pay_description']
        shift_id = request.form['shift_id']
        cash_amount = request.form['cash_amount']
        cc_amount = request.form['cc_amount']
        voucher_amount = request.form['voucher_amount']
        mobile_amount = request.form['mobile_amount']
        cheque_amount = request.form['cheque_amount']
        customer_id = request.form['customer_id']
        f_id = request.form['f_id']
        pay_ref = request.form['pay_ref']
        branch_id = request.form['branch_id']
        till_id = request.form['till_id']

        conn = connection()
        c = conn.cursor()

        if pay_id=='0':
            pay_id=str(uuid.uuid4())

            qry="INSERT INTO pay_out (pay_id,pay_date,pay_time,pay_to,staff_id,pay_amount,pay_type_id,pay_description,shift_id,cash_amount,"
            qry=qry + "cc_amount,voucher_amount,mobile_amount,cheque_amount,branch_id,customer_id,till_id,updated,f_id,pay_ref) VALUES "
            qry=qry + "('"+ pay_id +"', '"+ str(pay_date) +"', '"+ str(pay_time) +"', '"+ pay_to +"', '" + staff_id + "',"+pay_amount+","
            qry=qry + pay_type_id+",'"+ pay_description +"','" + shift_id +"',"+ cash_amount + ","+ cc_amount+ ","+voucher_amount+ ","
            qry=qry + mobile_amount+ ","+cheque_amount+ ","+branch_id+ ",'"+customer_id+ "','"+till_id+ "','N','"+f_id+ "','"+pay_ref+ "')"
        else:
            qry="update pay_out set (pay_date,pay_time,pay_to,staff_id,pay_amount,pay_type_id,pay_description,shift_id,cash_amount,"
            qry=qry + "cc_amount,voucher_amount,mobile_amount,cheque_amount,branch_id,customer_id,till_id,updated,f_id,pay_ref) VALUES "
            qry=qry + "('"+ str(pay_date) +"', '"+ str(pay_time) +"', '"+ pay_to +"', '" + staff_id + "',"+pay_amount+","
            qry=qry + pay_type_id+",'"+ pay_description +"','" + shift_id +"',"+ cash_amount + ","+ cc_amount+ ","+voucher_amount+ ","
            qry=qry + mobile_amount+ ","+cheque_amount+ ","+branch_id+ ",'"+customer_id+ "','"+till_id+ "','N','"+f_id+ "','"+pay_ref+ "')"
            qry=qry + " where pay_id='"+ pay_id +"'"
        c.execute(qry)
        conn.commit()
        if pay_type_id =='699999':
            qry="insert into bank_trans (bank_trans_id,bank_id,bank_trans_type_id,trans_ref,trans_date,trans_amount,trans_running_bal,"
            qry=qry +"trans_comment,trans_complete,trans_completed_by,trans_completed_on,trans_cancelled,trans_cancelled_by,"
            qry=qry +"trans_cancelled_on,created_by,created_on,updated_by,updated_on,branch_id,updated,due_date) values ("
            qry=qry +"uuid(),'"+f_id+ "','1D2D6E2C-5795-4655-B132-56C4F1DB0BB8','"+pay_ref+"',now(),"+pay_amount+",0,"
            qry=qry +"'Pos Banking','N','',curdate(),'N','',curdate(),'',now(),'',now(),"+branch_id+ ",'N',curdate())"
            c.execute(qry)
            conn.commit()
        if pay_type_id =='8':
            qry="insert into bank_trans (bank_trans_id,bank_id,bank_trans_type_id,trans_ref,trans_date,trans_amount,trans_running_bal,"
            qry=qry +"trans_comment,trans_complete,trans_completed_by,trans_completed_on,trans_cancelled,trans_cancelled_by,"
            qry=qry +"trans_cancelled_on,created_by,created_on,updated_by,updated_on,branch_id,updated,due_date) values ("
            qry=qry +"uuid(),'"+f_id+ "','1D2D6E2C-5795-4655-B132-56C4F1DB0BB8','"+pay_ref+"',now(),"+pay_amount+",0,"
            qry=qry +"'Pos Banking','N','',curdate(),'N','',curdate(),'',now(),'',now(),"+branch_id+ ",'N',curdate())"
            c.execute(qry)
            conn.commit()
        if pay_type_id =='1999999':
            qry="insert into bank_trans (bank_trans_id,bank_id,bank_trans_type_id,trans_ref,trans_date,trans_amount,trans_running_bal,"
            qry=qry +"trans_comment,trans_complete,trans_completed_by,trans_completed_on,trans_cancelled,trans_cancelled_by,"
            qry=qry +"trans_cancelled_on,created_by,created_on,updated_by,updated_on,branch_id,updated,due_date) values ("
            qry=qry +"uuid(),'"+f_id+ "','1D2D6E2C-5795-4655-B132-56C4F1DB0BB8','"+pay_ref+"',now(),"+pay_amount+",0,"
            qry=qry +"'Pos Banking','N','',curdate(),'N','',curdate(),'',now(),'',now(),"+branch_id+ ",'N',curdate())"
            c.execute(qry)
            conn.commit()


        conn.close()
        myList = {"pay_id" : pay_id}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetReceipt', methods= ['POST','GET'])
def SetReceipt():
    if request.method == "POST":
        sStaffId = request.form['staff_id']
        sBranchId = request.form['branch_id']
        sLocationId = request.form['location_id']
        sTillId = request.form['till_id']
        sShiftId = request.form['shift_id']
        sTableId = request.form['table_id']
        sTotalAmount = request.form['receipt_total_amount']
        receipt_cash_amount = request.form['receipt_cash_amount']
        receipt_cheque_amount = request.form['receipt_cheque_amount']
        receipt_card_amount = request.form['receipt_card_amount']
        receipt_voucher_amount = request.form['receipt_voucher_amount']
        receipt_mobile_money = request.form['receipt_mobile_money']
        tReceiptId = request.form['receipt_id']
        customer_id = request.form['customer_id']
        customer_alias = request.form['customer_alias']

        vat1=float(sTotalAmount)*(16/116)
        vat2=0

        conn = connection()
        c = conn.cursor()

        if tReceiptId=='0':
            tReceiptId=str(uuid.uuid4())
            qry="INSERT INTO pos_receipts(receipt_id, receipt_ref, receipt_date, receipt_time, receipt_total_amount,"
            qry=qry + "total_vat, total_cat_levy, receipt_cash_amount, receipt_cheque_amount, receipt_card_amount, receipt_voucher_amount,"
            qry=qry + "receipt_mobile_money, branch_id, location_id, staff_id, till_id, shift_id, cancelled, table_id, Customer_id, receipt_paid, "
            qry=qry + "customer_alias, stype, dlocation, Sales_staff_id, receipt_code, comments, receipt_discount, updated) VALUES "
            qry=qry + "('"+ tReceiptId +"', concat(REPLACE(curdate(), '-', '') , '-' , LPAD((select CONVERT(count(*)+1,char(10)) from "
            qry=qry + " pos_receipts pr where pr.shift_id='"+ sShiftId +"'),4,'0')), curdate(), curtime(), " + str(sTotalAmount) + ","
            qry=qry + str(vat1) + ", " + str(vat2) +"," + str(receipt_cash_amount) +", " + str(receipt_cheque_amount) +", "
            qry=qry + str(receipt_card_amount) +", " + str(receipt_voucher_amount) +", " + str(receipt_mobile_money) +","
            qry=qry + str(sBranchId) + ", '" + sLocationId + "', '" + sStaffId + "', '" + sTillId + "', '" + sShiftId + "', 'N', '" + sTableId + "', '"+ customer_id +"', 'Y', "
            qry=qry + "'"+ customer_alias +"', '', '', '" + sStaffId + "', '', '', 0, 'N')"
        else:
            qry="update pos_receipts set receipt_total_amount= " + str(sTotalAmount) + ",total_vat="+ str(vat1) + ",total_cat_levy=" + str(vat2) +" where receipt_id='"+ tReceiptId +"';"

        c.execute(qry)
        conn.commit()

        conn.close()
        myList = {"receipt_id" : tReceiptId}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetBill', methods= ['POST','GET'])
def SetBill():
    if request.method == "POST":
        sStaffId = request.form['staff_id']
        sBranchId = request.form['branch_id']
        sLocationId = request.form['location_id']
        sTillId = request.form['till_id']
        sShiftId = request.form['shift_id']
        sTableId = request.form['table_id']
        sTotalAmount = request.form['receipt_total_amount']
        tReceiptId = request.form['receipt_id']

        vat1=float(sTotalAmount)*(16/116)
        vat2=float(sTotalAmount)*(2/116)

        conn = connection()
        c = conn.cursor()

        if tReceiptId=='0':
            tReceiptId=str(uuid.uuid4())
            qry="INSERT INTO pos_receipts(receipt_id, receipt_ref, receipt_date, receipt_time, receipt_total_amount,"
            qry=qry + "total_vat, total_cat_levy, receipt_cash_amount, receipt_cheque_amount, receipt_card_amount, receipt_voucher_amount,"
            qry=qry + "receipt_mobile_money, branch_id, location_id, staff_id, till_id, shift_id, cancelled, table_id, Customer_id, receipt_paid, "
            qry=qry + "customer_alias, stype, dlocation, Sales_staff_id, receipt_code, comments, receipt_discount, updated) VALUES "
            qry=qry + "('"+ tReceiptId +"', '', curdate(), curtime(), " + str(sTotalAmount) + ","
            qry=qry + str(vat1) + ", " + str(vat2) +", 0, 0, 0, 0, 0,"
            qry=qry + str(sBranchId) + ", '" + sLocationId + "', '" + sStaffId + "', '" + sTillId + "', '" + sShiftId + "', 'N', '" + sTableId + "', null, 'N', "
            qry=qry + "'', '', '', '" + sStaffId + "', '', '', 0, 'N')"
        else:
            qry="update pos_receipts set receipt_total_amount= " + str(sTotalAmount) + ",total_vat="+ str(vat1) + ",total_cat_levy=" + str(vat2) +" where receipt_id='"+ tReceiptId +"';"

        c.execute(qry)
        conn.commit()

        conn.close()
        myList = {"receipt_id" : tReceiptId}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetBillItems', methods= ['POST','GET'])
def SetBillItems():
    if request.method == "POST":
        sReceiptId = request.form['receipt_id']
        sProductId = request.form['location_product_id']
        sBranchId = request.form['branch_id']
        sLineNo = request.form['linenum']
        sPrice = request.form['product_sp']
        sQty = request.form['trans_quantity']
        sFootnote = request.form['footnote']
        sAccompaniment = request.form['accompaniment']

        vat1=0
        vat2=0

        conn = connection()
        c = conn.cursor()

        qry="update location_stock set location_product_quantity=location_product_quantity-"+ sQty +" where location_product_id='" + sProductId + "'"
        c.execute(qry)
        conn.commit()

        qry="select * from location_stock where location_product_id='" + sProductId + "'"
        c.execute(qry)
        data = c.fetchall()

        for r in data:
            if r[12]=="Y":
                if r[15]=="Y":
                    vat1=round(float(sPrice)*(16/118),2)
                    vat2=round(float(sPrice)*(2/118),2)
                else:
                    vat1=round(float(sPrice)*(16/116),2)
                    vat2=0
            else:
                if r[15]=="Y":
                    vat1=0
                    vat2=round(float(sPrice)*(2/102),2)
                else:
                    vat1=0
                    vat2=0

            qry="update pos_receipts set total_vat=total_vat+"+ str(vat1) +",total_cat_levy=total_cat_levy+"+ str(vat2) +" where receipt_id='"+sReceiptId+"'"

            c.execute(qry)
            conn.commit()

            qry="INSERT INTO pos_receipt_details(receipt_details_id, receipt_id, location_product_id, trans_quantity, product_sp, product_bp, vat, cat_levy,"
            qry=qry + "cancelled, footnote, accompaniment_id, branch_id, updated, linenum, uom_code)"
            qry=qry + "VALUES (uuid(), '"+sReceiptId+"', '"+r[0]+"', "+ sQty +", "+ sPrice +", 0, "+str(vat1)+","+str(vat2)+", "
            qry=qry + "'N', '" + sFootnote + "','" + sAccompaniment + "' , " + sBranchId + ", 'N', '" + sLineNo + "', '" + r[2]+ "')"

            c.execute(qry)
            conn.commit()

            qry="INSERT INTO trans_file(trans_id, trans_date, trans_reference, branch_id, trans_type_id, uom_code, trans_quantity, trans_base_quantity, batch_no, "
            qry=qry + "trans_comment, Product_id, location_product_id, complete, cancelled, supplier_id, location_id, del_note, inv_no, lpo_no, cost_price, running_balance, "
            qry=qry + "confirmed, batch_id, updated) VALUES "
            qry=qry + "(uuid(), now(), '', " + sBranchId + ", 1, '" + r[2]+ "', "+ sQty +", "+ sQty +", '', "
            qry=qry + "'', '" + r[1]+ "', null, 'Y', 'N', null, '" + r[6]+ "', '', '', '', 0, " + str(r[3])+ ", "
            qry=qry + "'Y', null, 'N')"

            c.execute(qry)
            conn.commit()

        conn.close()

        myList = {"Completed" :  'Sucessfully'}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})
    
@app.route('/SetTripOrder', methods= ['POST','GET'])
def SetTripOrder():
    if request.method == "POST":
        trip_order_id=request.form['trip_order_id']
        trip_id=request.form['trip_id']
        customer_id=request.form['customer_id']
        customer_name = request.form['customer_name']
        branch_id = request.form['branch_id']

        conn = connection()
        c = conn.cursor()

        if trip_order_id=='0':
            trip_order_id=str(uuid.uuid4())
            qry="insert into trip_orders (trip_order_id,trip_id,confirmed,cancelled,confirmed_by,cancelled_by,confirmed_date,Customer_id,customer_name,updated,branch_id,service_vehicle_id) "
            qry=qry+" values ('"+ trip_order_id +"','"+ trip_id +"','N','N','','',CURDATE(),'"+ customer_id +"','"+ customer_name+"','N'," + str(branch_id) +",'')"
            c.execute(qry)
            conn.commit()

        conn.close()

        myList = {"trip_order_id" : trip_order_id}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/SetTripOrderDetails', methods= ['POST','GET'])
def SetTripOrderDetails():
    if request.method == "POST":
        trip_order_detail_id = request.form['trip_order_detail_id']
        trip_order_id = request.form['trip_order_id']
        location_product_id = request.form['location_product_id']
        product_sp = request.form['product_sp']
        trans_quantity = request.form['trans_quantity']
        branch_id = request.form['branch_id']
        linenum = request.form['linenum']
        uom_code = request.form['uom_code']

        conn = connection()
        c = conn.cursor()

        if trip_order_detail_id=='0':
            trip_order_detail_id=str(uuid.uuid4())
            qry="insert into trip_order_details (trip_order_detail_id,trip_order_id,location_product_id,product_sp,trans_quantity,cancelled,updated,branch_id,linenum,uom_code) "
            qry=qry+" values ('"+ trip_order_detail_id +"','"+ trip_order_id +"','"+ location_product_id +"',"+ str(product_sp) +","+ str(trans_quantity) +",'N','N',"+ str(branch_id) +","+ str(linenum) +",'"+ uom_code +"')"
            c.execute(qry)
            conn.commit()

        conn.close()

        myList = {"Completed" :  'Sucessfully'}

        return json.dumps({'result': myList, "error": False}, use_decimal=True, indent=4, sort_keys=True, default=str)
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetRight', methods= ['POST','GET'])
def GetRight():
    if request.method == "POST":
        try:
            iStaffID = request.form['staff_id']
            iRightID = request.form['right_id']

            conn = connection()
            c = conn.cursor()
            qry="select arm.active from access_right_module arm,staff s where s.staff_id='"+ iStaffID +"' and arm.access_right_id="+ iRightID +" and arm.staff_category_id=s.staff_category_id"
            c.execute(qry)
            data = c.fetchall()

            for r in data:
                myList={"active" :  r[0] }

            conn.close()
            return json.dumps({'result':myList,"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
        except Exception as e:
            # flash(e)
            error = str(e)
            return error
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/GetCompany', methods= ['POST','GET'])
def GetCompany():
    if request.method == "POST":
        sBranchID = request.form['branch_id']
        try:
            conn = connection()
            c = conn.cursor()
            c.execute("select c.* from company c,branch b where c.company_id=b.company_id and b.branch_id=" + str(sBranchID))
            r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]
            #data = c.fetchall()

            conn.close()
            #return json.dumps({'result':str(data),"error":False}, use_decimal=True, indent=4, sort_keys=True, default=str)
            return json.dumps({'result':r,"error":False})
        except Exception as e:
            # flash(e)
            error = str(e)
            return error
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/Setsfq', methods= ['POST','GET'])
def Setsfq():
    try:
        sql = request.form['sql']
        conn = connection()
        c = conn.cursor()
        c.execute(sql)
        conn.commit()
        return "Sucessfull"
    except Exception as e:
        # flash(e)
        error = str(e)
        return error


@app.route('/set_query/<sql>', methods= ['POST','GET'])
def set_query(sql):
    if sql != "":
        try:
            conn = connection()
            c = conn.cursor()
            c.execute("REPLACE INTO " + sql)
            conn.commit()
            #data = c.fetchall()

            conn.close()
            #return json.dumps({'result':str(data),"error":False}, use_decimal=True)
            return json.dumps("Sucessfull")
        except Exception as e:
            # flash(e)
            error = str(e)
            return error
    else:
        return json.dumps({'result':"Invalid method",'error':True})

@app.route('/get_queryx/<sql>', methods= ['POST','GET'])
def get_queryx(sql):
    if sql != "":
        try:
            conn = connection()
            c = conn.cursor()
            c.execute(sql)
            r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]
            #data = c.fetchall()

            conn.close()
            #return json.dumps({'result':str(data),"error":False}, use_decimal=True)
            return str(r)
        except Exception as e:
            # flash(e)
            error = str(e)
            return error
    else:
        return json.dumps({'result':"Invalid method",'error':True})


@app.route('/get_query/<sql>', methods= ['POST','GET'])
def get_query(sql):
    if sql != "":
        try:
            conn = connection()
            c = conn.cursor()
            c.execute(sql)
            r = [dict((c.description[i][0], value) \
                for i, value in enumerate(row)) for row in c.fetchall()]
            #data = c.fetchall()

            conn.close()
            #return json.dumps({'result':str(data),"error":False}, use_decimal=True)
            return json.dumps(r)
        except Exception as e:
            # flash(e)
            error = str(e)
            return error
    else:
        return json.dumps({'result':"Invalid method",'error':True})


@app.route('/MMSG', methods=['POST', 'GET'])
def MMSG():
    try:
        if request.method == "POST":
            sms_id = str(uuid.uuid4())
            sms_number = request.json.get("number")
            sms_content = request.json.get("message")
            return json.dumps({'result':sms_content,'error':False})
            word_list = sms_content.split()
            sms_mm_ref = word_list[0]
            sms_client = word_list[9] + ' ' + word_list[10].replace('New', '')
            sms_client_number = word_list[8]
            s1 = 'Ksh'
            sms_amount = float(word_list[5][word_list[5].index(s1) + len(s1):].replace(',', ''))
            # sms_amount = float(str(word_list[6][5:].replace('received','')).replace(',',''))
            xdate = word_list[word_list.index('at') - 1].replace('/18', '/2018') + ' ' + word_list[word_list.index('at') + 1] + ' ' + \
                    word_list[word_list.index('at') + 2].partition('Ksh')[0]
            sms_date = "CONVERT(DATETIME, '" + xdate + "', 103)"
            sms_credited = 'N'
            sms_used = 'N'
            sms_receipt_ref = ''
            sms_type = 'Received'
            updated = 'N'
            branch_id = 13

            if word_list[0] != 'Confirmed':

                conn = connection()
                c = conn.cursor()

                qry = "select count(*) from mm_sms where sms_mm_ref = '" + sms_mm_ref + "'"
                c.execute(qry)
                data = c.fetchall()

                for r in data:
                    if str(r[0])=="0":
                        Query = "INSERT INTO mm_sms (sms_id,sms_number,sms_mm_ref,sms_client,sms_client_number,sms_content, \
                                sms_amount,sms_date,sms_credited,sms_used,sms_receipt_ref,sms_type,updated,branch_id,cancelled, \
                                cancelled_by) \
                                VALUES ('%s', '%s','%s', '%s', '%s', '%s',%s, %s, '%s', '%s','%s','%s','%s','%s','%s','%s')" % \
                                (sms_id, sms_number, sms_mm_ref, sms_client, sms_client_number, sms_content, sms_amount, \
                                 sms_date, sms_credited, sms_used, sms_receipt_ref, sms_type, updated, branch_id, 'N', '')

                        c.execute(Query)
                        conn.commit()

                        conn.close()
                        gc.collect()

                return json.dumps({'result':"Message saved.",'error':False})
            else:
                return json.dumps({'error_msg':"Message Not saved.",'error':True})

    except Exception as e:
        # flash(e)
        error = str(e)
        return json.dumps({'error_msg':error ,'error':True})


def getMD5(text):
    encoding = text.encode("UTF-8")
    md5 = hashlib.md5()
    md5.update(encoding)
    return md5.hexdigest()

class SpecializedJSONEncoder(JSONEncoder):
    def default(o):
        if isinstance(o, date):
            return date.strftime("%Y-%m-%d")
        else:
            super(SpecializedJSONEncoder, self).default(o)

