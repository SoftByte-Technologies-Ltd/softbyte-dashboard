//import axios from 'axios'


$(document).ready(function() {

    $('#supplier-datatables').DataTable({
        "processing": true,
        "ajax": "/api/branches/122/supplier-transanctions",
        "columns" : [
            { "data" : 'transaction_date' },
            { "data" : 'transaction_ref' },
            { "data" : 'transaction_amount' },
            { "data" : 'transaction_comment' },
            { "data" : 'running_bal' },
        ]
    });

    $('#customer-datatables').DataTable({
        "processing": true,
        "ajax": "/api/branches/122/customer-transanctions",
        "columns" : [
            { "data" : 'transaction_date' },
            { "data" : 'transaction_ref' },
            { "data" : 'transaction_amount' },
            { "data" : 'transaction_comment' },
            { "data" : 'running_bal' },
        ]
    });

    $('#bank-datatables').DataTable({
        "processing": true,
        "ajax": "/api/branches/122/bank-transanctions",
        "columns" : [
            { "data" : 'transaction_date' },
            { "data" : 'transaction_ref' },
            { "data" : 'transaction_amount' },
            { "data" : 'transaction_comment' },
            { "data" : 'running_bal' },
        ]
    });

    $('select[data-source]').each(function() {
        var $select = $(this);
        
        $select.append(`<option>Select a ${$select.attr('data-resource')}</option>`);
        
        axios.get(`${$select.attr('data-source')}`)
        .then(function(options) {
            options.data.data.map(function(option) {
            var $option = $('<option>');
            
            $option
              .val(option[$select.attr('data-valueKey')])
              .text(option[$select.attr('data-displayKey')]);
            
            $select.append($option);
          });
        });
      });
});

function createNode(element) {
    return document.createElement(element);
}

function append(parent, el) {
  return parent.appendChild(el);
}

const ul = document.getElementById('branches');
const title = document.getElementById('branch-title');
const url = 'http://localhost:5000/api/branches';
axios(url)
//.then((resp) => resp.json())
.then(function(response) {
    let branches = response.data.data
    title.textContent = branches[0].branch_name

        return branches.map(function(branch) {
        let li = createNode('li'),
            a = createNode('a');
            //span = createNode('span');
        //a.href = `/api/branches/${branch.branch_id}`;
        a.innerHTML = `${branch.branch_name}`;
        //span.class = 'link-collapse'
        //append(li, a, span);
        append(li, a);
        append(ul, li);
    })
})
.catch(function(error) {
  console.log(error);
});