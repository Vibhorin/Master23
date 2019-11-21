{
    Add : function(component, event, helper) {
        
        var num1 = component.find("n1").get("v.value");
        var num2 = component.find("n2").get("v.value");
        var res = parseInt(num1) + parseInt(num2);
        res = res + '';
        alert("Add-"+ res);    
        var evt1 = $A.get("e.c:Result");
        evt1.setParams({ "Show_Result": res});
        evt1.fire();
    },
		doInit : function(component, event, helper) {
            
            //if(!component.get("v.isDoneRendering") && document.getElementById("sumButton")){    
            //component.set("v.isDoneRendering", true);     
            var num1 = component.find("n1").get("v.value");
            var num2 = component.find("n2").get("v.value");
            var res1 = parseInt(num1) + parseInt(num2);
            //alert("Add1 - " + res1);             
            var evt = $A.get("e.c:Result");
            window.setTimeout(function(){ 
                evt.setParams({ "Show_Result": res1});
                evt.fire();
                 },30);
        }
            
}