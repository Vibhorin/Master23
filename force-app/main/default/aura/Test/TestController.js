({
	removeError: function(component,event){
            var ageField= component.find("abc");
            var ageLabel = ageField.get("v.value");
             ageField.set("v.errors", null);
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
                ageField.set("v.errors", [{message:"Age cannot be so less as this may lead to problem for the world you need to growup man!"}]);
            }
            else
              {
                ageField.set("v.errors", null);
            }  
            },
    checkName: function(component,event){
            var nameField= component.find("abc1");
            var nameLabel = nameField.get("v.value");
            if(nameLabel =='')
            {
                nameField.set("v.errors", [{message:"Enter a valid Name."}]);
            }
            else if(isNAN(nameLabel))
            {
                nameField.set("v.errors", [{message:"Name cannot be number"}]);
            }
            else
              {
                nameField.set("v.errors", null);
            }  
            }
})