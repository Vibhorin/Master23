({
    doAction : function(component) {
        var inputCmp = component.find("inputCmp");
        var value = inputCmp.get("v.value");

        // Is input numeric?
        if (isNaN(value)) {
            // Set error
            inputCmp.set("v.errors", [{message:"Input not a number: " + value}]);
        } else {
            // Clear error
            inputCmp.set("v.errors", null);
        }
    },doInit : function(cmp) {
        var opts = [
            { class: "optionClass", label: "Option1", value: "opt1"},
            { class: "optionClass", label: "Option2", value: "opt2" },
            { class: "optionClass", label: "Option3", value: "opt3" }
           
        ];
        cmp.find("InputSelectDynamic").set("v.options", opts);
    }
})