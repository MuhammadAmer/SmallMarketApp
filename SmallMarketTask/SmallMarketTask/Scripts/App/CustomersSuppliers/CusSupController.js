angular.module("marketapp")
.controller("customersSuppliersCtrl", ["$scope", "customerSuplierService", "$modal", "$window", function ($scope, customerSuplierService, $modal, $window) {

    AllCustomersSuppliers();

    // retrieve all items
    function AllCustomersSuppliers() {
        
        var customersSuppliersData = customerSuplierService.getAllCustomersSuppliers();
        customersSuppliersData.then(function (customersupplier) {
            $scope.customerssuppliers = customersupplier.data;
           
        }, function () {
            alert("error about retrive items");
        });
    };
    
    // Add new customer/supplier
    
    $scope.addCustomerSupplier = function () {
        var AddNewCusSup = customerSuplierService.newCusSup();
        AddNewCusSup.then(function (data) {
            $scope.customersupplier = data;
            $scope.open("lg");

        }, function () {
            alert("error occured while add customer/supplier");

        })
    };

     //modal poup
    $scope.open = function (size) {
        var modalInstance = $modal.open({
            size: size,
            animation: false,
            backdrop: 'static',
            templateUrl: 'myModalContent.html',
            controller: 'CustomerSupplierModalCtrl',
            resolve: {
                customersupplier: function () {
                    return $scope.customersupplier;
                }
            }
        });
       
    };
}]);



 // <------------------------- Modal popup Controller ------------------------->///
angular.module("marketapp").controller("CustomerSupplierModalCtrl", ["$scope", "$modalInstance", "customersupplier", "customerSuplierService", "$window", function ($scope, $modalInstance, customersupplier, customerSuplierService, $window) {

   
    // retrieve Customers/Suppliers Type
    var typesList = customerSuplierService.getTypes();
    typesList.then(function (type) {
        $scope.types = type.data;
    },

    function () {
        alert('Error in getting category records');
    });



    $scope.customersupplier = customersupplier;

    if (customersupplier.Id > 0)
        $scope.headerTitle = 'Edit ';
    else
        $scope.headerTitle = 'Add New Customer - Supplier ';


    // here a function to save or update data 
    $scope.save = function () {

        customerSuplierService.save($scope.customersupplier).then(function (response) {
          $modalInstance.close(response.data);
            $window.location.reload();
           
        }, function () {

            alert("error occured while save ");
        });

    };

    // here a function to cancel modal popup
    $scope.cancel = function () {
        $modalInstance.dismiss();
    };
}]);

