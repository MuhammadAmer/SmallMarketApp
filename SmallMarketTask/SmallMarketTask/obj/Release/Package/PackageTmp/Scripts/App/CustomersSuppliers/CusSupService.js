angular.module("marketapp")
.service("customerSuplierService", function ($http) {

    
    // load all types
    this.getTypes = function ()
    {
        return $http.get("/CustomersSuppliers/SupplierCustomerType")
    }

    // load all CustomersSuppliers
    this.getAllCustomersSuppliers = function ()
    {
        return $http.get("/CustomersSuppliers/AllCustomersSuppliers");
    }

    /// save new customer/supplier
    this.save = function (customersupplier) {
        var response = $http({
            method: "post",
            url: "/CustomersSuppliers/Save",
            data: JSON.stringify(customersupplier),
            dataType: "json"
        });
        return response;
    }

    //new customer/supplier
    this.newCusSup = function () {
        var response = $http({
            method: "get",
            url: "/CustomersSuppliers/NewCusSup",
            dataType: "json"
        });
        return response;
    };
});