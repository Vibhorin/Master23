({
    handleApplicationEvent : function(component, event) {
        //alert(event);   
        var ResultValue = event.getParam("Show_Result");
        //alert("cmp2 :: "+ ResultValue);
        //alert(document.getElementById('test'));
        // set the handler attributes based on event data
        // 
        //window.setTimeout(
        //$A.getCallback(function(){
        component.set("v.res", ResultValue);
        //console.log(document.getElementById('test'));
        // }), 20);
        }
                    
})