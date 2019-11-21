({
    handleSaveRecord: function(component, event, helper) {
        component.find("accountRecord").saveRecord($A.getCallback(function(saveResult) {
            let errMsg;
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving record, error: ' + 
                           JSON.stringify(saveResult.error));
                for(i=0; i< saveResult.error.length; i++){
                    errMsg += saveResult.error[i].message + "\n";
                }
                if(errMsg.length >0){
                    component.set("v.recordSaveError",errMsg);
                } else {
                    component.set("v.recordSaveError", '');
                }
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));}
})