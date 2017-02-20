angular.module("marketapp")
.service("itemsservice", function ($http) {

    
    // load all categories
    this.getAllCategories = function ()
    {
        return $http.get("/Items/GetAllCategories")
    }

    // load all units
    this.getAllUnits = function ()
    {
        return $http.get("/Items/GetAllUnits");
    }
    // load all items
    this.getAllItems = function ()
    {
        return $http.get("/Items/AllItems");
    }

  
    // get item by id
    this.getItemById = function (itemId)
    {
        var response = $http({
            method: "get",
            url: "/Items/GetItemById",
            params: {
                Id: JSON.stringify(itemId)
            }

        });
        return response;
    }


    //save
    this.save = function (item)
    {
        var response = $http({
            method: "post",
            url: "/Items/SaveItem",
            data: JSON.stringify(item),
            dataType: "json"
        });
        return response;
    }


    //new item
    this.newItem = function () {
        var response = $http({
            method: "get",
            url: "/Items/NewItem",
            dataType: "json"
        });
        return response;
    };

    // Delete Item
    this.deleteItem = function (id) {
        var response = $http({
            method: "post",
            url: "/Items/DeleteItem",
            params: {
                Id: JSON.stringify(id)
            }
        });
        return response;
    };
});