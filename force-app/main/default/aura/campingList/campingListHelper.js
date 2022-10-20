({
    saveItem: function(component, campingItem, callback) {
        let action = component.get("c.saveItem");
        action.setParams({
            "campingItem": campingItem
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    createItem: function(component, item) {
        this.saveItem(component, item, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
    },


})