
angular.module("marketapp").controller("invoiceCtrl", ["$scope", "invoiceService", function ($scope, invoiceService) {
    loadItems();
    loadCustomersSuppliers();
    $scope.addItems = false;
    
    // load items
    function loadItems() {

        var dataItems = invoiceService.getAllProducts();
        dataItems.then(function (product) {
            $scope.products = product.data;

        }, function (msg) {
            alert(msg);
        })
    };

    //load customers/suppliers
    function loadCustomersSuppliers() {

        var getCustomersSuppliers = invoiceService.getAllCustomersSuppliers();
        getCustomersSuppliers.then(function (customerssupplier) {
            $scope.customerssuppliers = customerssupplier.data;

        }, function (msg) {
            alert(msg);
        })
    };

    
    // save function
    $scope.save = function () {
        var Item = {
            OrderNo: $scope.item.OrderNo,
            DateString: $scope.item.Date,
            CustomerSupplierId: $scope.item.CustomerSupplierId,
            IsPurchase: $scope.item.IsPurchase,
            PurchaseSellInvoceDetails: $scope.items
        };

        var getItemData = invoiceService.saveOrder(Item);
        getItemData.then(function (msg) {
            
            alert('item add successfully');
            $scope.addItems = false;
            $scope.item.OrderNo = "";
            $scope.item.Date="";
            $scope.item.CustomerSupplierId="";
            $scope.item.IsPurchase = "";
            $scope.item.ItemId = "";
            $scope.item.Quantity = "";
            $scope.item.Price = "";
            $scope.item.TotalDiscount = "";
            
        }, function () {
            alert('Error in adding item');
        });
    }
    ///
    $scope.items = [];
    $scope.add = function ()

    {
        var newItem = {
            ItemId: $scope.item.ItemId,
            Quantity: $scope.item.Quantity,
            Price: $scope.item.Price,
            TotalDiscount: $scope.item.TotalDiscount,
        };
        $scope.items.push(newItem);
        $scope.addItems = true;
    };

    $scope.removeItem = function (item)
    {
        var index = $scope.items.indexOf(item);
        $scope.items.splice(index);
    };

    $scope.cancel = function () {
        $scope.addItems = false;
    };
    
 
}]);