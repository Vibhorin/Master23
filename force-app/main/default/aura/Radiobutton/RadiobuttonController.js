({
		 onGroup: function(component, event) {
		 var selected = event.getSource().get("v.label");
		var resultCmp = component.find("radioGroupResult");
		 resultCmp.set("v.value", selected);
	 }
})