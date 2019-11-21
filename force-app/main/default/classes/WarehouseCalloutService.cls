public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(callout = true)
    public static void runWarehouseEquipmentSync(){
        
        HttpResponse response = getResponce();
        
    }
    
    public static HttpResponse getResponce(){
        
        Http calloutHttp = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        HttpResponse res = calloutHttp.send(request);
        system.debug('Http REs'+res.getBody());
        return res;        
    }

}