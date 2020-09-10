//import axios from 'axios'


$(document).ready(function() {
    // axios.get('/api/branches/122/customer-transanctions')
    // .then(function (response) {

    // })
    $('#customer-datatables').DataTable({
        "processing": true,
        "serverSide": true,
        "dataType" : "json",
        "ajax": "/api/branches/122/customer-transanctions",
    });
});