angular.module("marketapp")
.controller("itemsCtrl", ["$scope", "itemsservice", "$modal", "$window", function ($scope, itemsservice, $modal, $window) {

    ALlItems();

    // retrieve all items
    function ALlItems() {
        
        var itemsdata = itemsservice.getAllItems();
        itemsdata.then(function (item) {
            $scope.items = item.data;
           
        }, function () {
            alert("error about retrive items");
        });
    };
    
    // get product id
    $scope.editItem = function (item) {
        var getItem = itemsservice.getItemById(item.Id);
        getItem.then(function (_item) {
            $scope.item = _item.data;
            $scope.Id = item.Id;
            $scope.Name = item.Name;
            $scope.CategoryId = item.CategoryId;
            $scope.PurchasePrice = item.PurchasePrice;
            $scope.SellPrice = item.SellPrice;
            $scope.UnitId = item.UnitId;
            $scope.ValidQuantity = item.ValidQuantity;
            
            $scope.open("lg");
            
        }, function () {
            alert("error for getting item details");
        });
    }

  
    // added new item
    $scope.addItem = function () {
        var AddNewItem =itemsservice.newItem();
        AddNewItem.then(function (data) {
            $scope.item = data;
            $scope.open("lg");
            
        }, function () {
            alert("error occured while add item");

        })
    };

   
    // delete item
    $scope.deleteItem = function ($event, id) {
        var del = confirm('Are you sure to delete item ?');
        if (del) {
            itemsservice.deleteItem(id)
            .then(function () {
                var element = $event.currentTarget;
                $(element).closest('div[class^="col-lg-12"]').hide();
                $window.location.reload();
            })
        };
    };
    // Sorting & Filtering
    $scope.sort = function (keyname) {
        $scope.sortKey = keyname;   //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    };

    // modal poup
    $scope.open = function (size) {
        var modalInstance = $modal.open({
            size: size,
            animation: false,
            backdrop: 'static',
            templateUrl: 'myModalContent.html',
            controller: 'ModalInstanceCtrl',
            resolve: {
                item: function () {
                     return $scope.item;
                }
            }
        });
       
    };
}]);



 // <------------------------- Modal popup Controller ------------------------->///
angular.module("marketapp").controller("ModalInstanceCtrl", ["$scope", "$modalInstance", "item", "itemsservice", "$window", function ($scope, $modalInstance, item, itemsservice, $window) {

   
    // retrieve Categories
    var categoriesList = itemsservice.getAllCategories();
    categoriesList.then(function (category) {
        $scope.categories = category.data;
    },
    function () {
        alert('Error in getting category records');
    });

    //retrieve units
    var unitsList = itemsservice.getAllUnits();
    unitsList.then(function (unit) {
        $scope.units = unit.data;

    }, function () {
        alert('Error in getting category records');
    });

   
    $scope.item = item;

    if (item.Id > 0)
        $scope.headerTitle = 'Edit Item';
    else
        $scope.headerTitle = 'Add Item';


    // here a function to save or update data 
    $scope.save = function () {

        itemsservice.save($scope.item).then(function (response) {
            $modalInstance.close(response.data);
            $window.location.reload();
            alert("Record updated successfully");
        }, function () {

            alert("error occured while save ");
        });

    };

    // here a function to cancel modal popup
    $scope.cancel = function () {
        $modalInstance.dismiss();
    };
}]);

