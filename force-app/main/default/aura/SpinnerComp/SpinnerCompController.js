({
    showSpinner : function (component, event, helper) {
        component.set("v.showSpinnerImage", true);
    },
    hideSpinner : function (component, event, helper) {
        component.set("v.showSpinnerImage", false);    
    },
    getOpps: function(cmp){
        var action = cmp.get("c.getOpportunities");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state == "SUCCESS") {
                cmp.set("v.opportunities", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
        checkAge: function(component,event){
            var ageField= component.find("abc");
            var ageLabel = ageField.get("v.value");
            if(ageLabel =='')
            {
                ageField.set("v.errors", [{message:"Enter a valid age."}]);
            }
            else if(ageLabel >150)
            {
                ageField.set("v.errors", [{message:"Age cannot be so much"}]);
            }
            else if(parseInt(ageLabel) <18)
            {
                ageField.set("v.errors", [{message:"Age cannot be so less"}]);
            }
            else
              {
                ageField.set("v.errors", null);
            }  
            },
    removeError: function(component,event){
            var ageField= component.find("abc");
            var ageLabel = ageField.get("v.value");
             ageField.set("v.errors", null);
    }
})