({
    handleClick : function(component, event, helper) {
        var btnClicked = event.getSource(); //click the button
        var btnMessage = btnClicked.get("v.label"); // the button's label
        component.set("v.message", btnMessage);
        /*
        2.
        let newMessage = event.getSource().get("v.label"); 
        component.set("v.message", newMessage);

        3.
        component.set("v.message", event.getSource().get("v.label"));
         */
    }
})