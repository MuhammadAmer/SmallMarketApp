angular.module("marketapp").service("invoiceService", function ($http) {

    // Save Order
    this.saveOrder = function (item) {
        var response = $http({
            method: "post",
            url: "/Invoices/SaveOrder",
            data: JSON.stringify(item),
            dataType: "json"
        });
        return response;
    }

    // load products
    this.getAllProducts = function ()
    {
        return $http.get("/Invoices/AllItems");
    };

    // load customers suppliers
    this.getAllCustomersSuppliers = function () {
        return $http.get("/Invoices/CustomersSuppliers");
    };
});