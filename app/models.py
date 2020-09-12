# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

from app         import db
from flask_login import UserMixin
from sqlalchemy.sql import func

class User(UserMixin, db.Model):

    id       = db.Column(db.Integer,     primary_key=True)
    user     = db.Column(db.String(64),  unique = True)
    email    = db.Column(db.String(120), unique = True)
    password = db.Column(db.String(500))

    def __init__(self, user, email, password):
        self.user       = user
        self.password   = password
        self.email      = email

    def __repr__(self):
        return str(self.id) + ' - ' + str(self.user)

    def save(self):

        # inject self into db session    
        db.session.add ( self )

        # commit change and save the object
        db.session.commit( )

        return self 

# Branch model
class Branch(db.Model):
    __tablename__ = 'branch'

    branch_id = db.Column(db.Integer, primary_key=True)
    branch_name = db.Column(db.Text(4294000000))
    company_id = db.Column(db.CHAR(1))
    cat_levy_charged = db.Column(db.CHAR(1))
    period = db.Column(db.DateTime, default=func.now())
    reprint = db.Column(db.CHAR(1))
    printcaptain = db.Column(db.CHAR(1))
    billheader = db.Column(db.CHAR(1))
    randomnames = db.Column(db.CHAR(1))
    routetrips = db.Column(db.CHAR(1))
    string1 = db.Column(db.Integer)
    string2 = db.Column(db.Integer)
    changeqty = db.Column(db.CHAR(1))
    custbalinrct = db.Column(db.CHAR(1))
    expdate = db.Column(db.String(36))
    branchcontact = db.Column(db.Text(4294000000))
    sms_api_key = db.Column(db.Text(4294000000))
    sms_user_name = db.Column(db.String(50))
    updated = db.Column(db.CHAR(1))
    modem_enabled = db.Column(db.CHAR(1))
    modem_port = db.Column(db.String(50))
    mpesa = db.Column(db.CHAR(1))
    wsale = db.Column(db.CHAR(1))
    postouch = db.Column(db.CHAR(1))
    mpesaurl = db.Column(db.String(250))
    online_sync = db.Column(db.CHAR(1))
    selforder = db.Column(db.CHAR(1))
    print_credetails = db.Column(db.CHAR(1))
    sendsms = db.Column(db.CHAR(1))
    tallyinter = db.Column(db.CHAR(1))
    tallyserver = db.Column(db.Text(4294000000))

    def __init__(self, branch_id, branch_name, company_id):
        self.branch_id       = branch_id
        self.company_id   = company_id
        self.branch_name      = branch_name

    def serialize(self):
        return {
            "branch_id": self.branch_id,
            "branch_name": self.branch_name            
        }

# Bank model
class Bank(db.Model):
    __tablename__ = 'banks'

    bank_id = db.Column(db.String(36), primary_key=True)
    bank_acc_no = db.Column(db.String(50))
    bank_name = db.Column(db.String(250))
    bank_running_bal = db.Column(db.DECIMAL(18, 2))
    total_credit = db.Column(db.DECIMAL(18, 2))
    total_debit = db.Column(db.DECIMAL(18, 2))
    account_manager = db.Column(db.String(250))
    account_details = db.Column(db.String(250))
    active = db.Column(db.CHAR(1))
    created_by = db.Column(db.String(36))
    created_on = db.Column(db.DECIMAL(18, 2))
    updated_by = db.Column(db.String(36))
    updated_on = db.Column(db.DECIMAL(18, 2))
    branch_id = db.Column(db.Integer)
    updated = db.Column(db.CHAR(1))

    def __init__(self, bank_id, bank_name, company_id):
        self.bank_id = bank_id
        self.company_id = company_id
        self.bank_name = bank_name

    def serialize(self):
        return {
            "bank_id": self.bank_id,
            "bank_name": self.bank_name            
        }

# Supplier model
class Supplier(db.Model):
    __tablename__ = 'supplier'

    supplier_id = db.Column(db.Integer, primary_key=True)
    supplier_name = db.Column(db.Text())
    supplier_pin = db.Column(db.String(50))
    supplier_running_bal = db.Column(db.DECIMAL(18, 2))
    supplier_bank_acc = db.Column(db.CHAR(10))
    supplier_phone_no = db.Column(db.CHAR(16))
    supplier_address = db.Column(db.CHAR(50))
    supplier_contact_person = db.Column(db.CHAR(30))
    supplier_code = db.Column(db.String(10))
    supplier_total_debit = db.Column(db.DECIMAL(18, 2))
    supplier_total_credit = db.Column(db.DECIMAL(18, 2))
    branch_id = db.Column(db.Integer)
    active = db.Column(db.CHAR(1))
    updated = db.Column(db.CHAR(1))

    def __init__(self, supplier_id, supplier_name, company_id):
        self.supplier_id       = supplier_id
        self.company_id   = company_id
        self.supplier_name      = supplier_name

    def serialize(self):
        return {
            "supplier_id": self.supplier_id,
            "supplier_name": self.supplier_name            
        }

# Customer  model
class Customer(db.Model):
    __tablename__ = 'customer'

    customer_id = db.Column(db.String(36), primary_key=True)
    customer_acc = db.Column(db.String(50))
    customer_name = db.Column(db.Text())
    customer_running_bal = db.Column(db.DECIMAL(18, 2))
    customer_bank_acc = db.Column(db.CHAR(20))
    customer_phone_no = db.Column(db.CHAR(16))
    customer_address = db.Column(db.CHAR(50))
    customer_contact_person = db.Column(db.String(50))
    customer_credit_limit = db.Column(db.DECIMAL(18, 2))
    branch_id = db.Column(db.Integer)
    active = db.Column(db.CHAR(1))
    customer_total_credit = db.Column(db.DECIMAL(18, 2))
    customer_total_debit = db.Column(db.DECIMAL(18, 2))
    route_id = db.Column(db.String(36))
    updated = db.Column(db.CHAR(1))
    credit_period = db.Column(db.Integer)
    credit_status = db.Column(db.String(250))
    pin_number = db.Column(db.String(50))
    clearpbalance = db.Column(db.CHAR(1))
    request_orderno = db.Column(db.CHAR(1))
    fprint = db.Column(db.LargeBinary(length=(2**32)-1))

    customer_transactions = db.relationship("CustomerTransaction", back_populates="customer", lazy="dynamic")

    def __init__(self, customer_id, customer_name, branch_id):
        self.customer_id       = customer_id
        self.branch_id   = password
        self.customer_name      = customer_name

    def serialize(self):
        return {
            "branch_id": self.branch_id,
            "customer_id": self.customer_id,            
            "customer_name": self.customer_name,            
        }

# Bank Transaction model
class BankTransaction(db.Model):
    __tablename__ = 'bank_trans'

    bank_trans_id = db.Column(db.String(36), primary_key=True)
    bank_id = db.Column(db.String(36))
    bank_trans_type_id = db.Column(db.String(36))
    trans_ref = db.Column(db.String(50))
    trans_date = db.Column(db.DateTime, default=func.now())
    trans_amount = db.Column(db.DECIMAL(18, 2))
    trans_running_bal = db.Column(db.DECIMAL(18, 2))
    trans_comment = db.Column(db.String(250))
    trans_complete = db.Column(db.CHAR(36))
    trans_completed_by = db.Column(db.String(36))
    trans_completed_on = db.Column(db.DateTime, default=func.now())
    trans_cancelled = db.Column(db.String(36))
    trans_cancelled_by = db.Column(db.String(36))
    trans_cancelled_on = db.Column(db.DateTime, default=func.now())
    created_by = db.Column(db.String(36))
    created_on = db.Column(db.DateTime, default=func.now())
    updated_by = db.Column(db.String(36))
    updated_on = db.Column(db.DateTime, default=func.now())
    branch_id = db.Column(db.String(36))
    updated = db.Column(db.CHAR(36))
    due_date = db.Column(db.DateTime, default=func.now())

    def __init__(self, bank_trans_id, bank_id, branch_id):
        self.branch_id = branch_id
        self.bank_id = bank_id
        self.bank_trans_id = bank_trans_id

    def serialize(self):
        return {
            "branch_id": self.branch_id,
            "bank_id": self.bank_id,            
            "bank_trans_id": self.bank_trans_id,            
            "trans_date": self.trans_date,            
            "trans_ref": self.trans_ref,            
            "trans_amount": self.trans_amount,            
            "trans_comment": self.trans_comment,            
            "trans_running_bal": self.trans_running_bal,            
        }
    
# Customer Transaction model
class CustomerTransaction(db.Model):
    __tablename__ = 'customer_trans'

    customer_trans_id = db.Column(db.String(36), primary_key=True)
    transaction_ref = db.Column(db.String(36))
    transaction_date = db.Column(db.DateTime, default=func.now())
    transaction_amount = db.Column(db.DECIMAL(18, 2))
    transaction_approved = db.Column(db.CHAR(1))
    customer_id = db.Column(db.String(36), db.ForeignKey("customer.customer_id"), nullable=False)
    trans_type_id = db.Column(db.Integer)
    transaction_comment = db.Column(db.TEXT())
    running_bal = db.Column(db.DECIMAL(18, 2))
    trip_id = db.Column(db.String(36))
    updated = db.Column(db.CHAR(1))
    branch_id = db.Column(db.Integer)
    updated_by = db.Column(db.DateTime, default=func.now())
    created_on = db.Column(db.String(36))
    updated_by = db.Column(db.DateTime, default=func.now())
    trans_by = db.Column(db.String(50))
    transaction_vat = db.Column(db.DECIMAL(18, 2))
    discount = db.Column(db.DECIMAL(18, 2))
    
    customer = db.relationship("Customer", lazy="joined")

    def __init__(self, customer_trans_id, customer_id, branch_id):
        self.branch_id = branch_id
        self.customer_id = customer_id
        self.customer_trans_id = customer_trans_id

    def serialize(self):
        return {
            "branch_id": self.branch_id,
            "customer_id": self.customer_id,            
            "customer_trans_id": self.customer_trans_id,            
            "transaction_date": self.transaction_date,            
            "transaction_ref": self.transaction_ref,            
            "transaction_amount": self.transaction_amount,            
            "transaction_comment": self.transaction_comment,            
            "running_bal": self.running_bal,            
        }

# Supplier Transaction model
class SupplierTransaction(db.Model):
    __tablename__ = 'supplier_trans'

    supplier_trans_id = db.Column(db.String(36), primary_key=True)
    transaction_ref = db.Column(db.String(250))
    transaction_date = db.Column(db.DECIMAL(18, 2))
    transaction_amount = db.Column(db.DECIMAL(18, 2))
    transaction_approved = db.Column(db.CHAR(1))
    supplier_id = db.Column(db.String(36))
    trans_type_id = db.Column(db.Integer)
    transaction_payment_type = db.Column(db.Text())
    transaction_payment_ref = db.Column(db.Text())
    transaction_comment = db.Column(db.Text())
    transaction_vat_total = db.Column(db.DECIMAL(18, 2))
    transaction_due_date = db.Column(db.DECIMAL(18, 2))
    trans_by = db.Column(db.String(50))
    created_by = db.Column(db.String(36))
    created_on = db.Column(db.DECIMAL(18, 2))
    updated_by = db.Column(db.String(36))
    updated_on = db.Column(db.DECIMAL(18, 2))
    running_bal = db.Column(db.DECIMAL(18, 2))
    updated = db.Column(db.CHAR(1))
    branch_id = db.Column(db.Integer)
    discount = db.Column(db.DECIMAL(18, 2))

    def __init__(self, supplier_trans_id, supplier_id, branch_id):
        self.branch_id = branch_id
        self.supplier_id = supplier_id
        self.supplier_trans_id = supplier_trans_id

    def serialize(self):
        return {
            "branch_id": self.branch_id,
            "supplier_id": self.supplier_id,            
            "supplier_trans_id": self.supplier_trans_id,            
            "transaction_date": self.transaction_date,            
            "transaction_ref": self.transaction_ref,            
            "transaction_amount": self.transaction_amount,            
            "transaction_comment": self.transaction_comment,            
            "running_bal": self.running_bal,            
        }