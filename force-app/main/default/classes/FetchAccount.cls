public with sharing class FetchAccount {
public JSON2Apex j {get;set;}
public List<Account> acc{get;set;}
String clientId = '3MVG9YDQS5WtC11p0RF4Cj8nQY2Q2yajUMrtPL.16dJfz5K.x3O7YNrPI5baKfThQBOzLvpwmU_W1xQUBRe0k';
String clientSecret = '2366509225174628152';
String username='vaibhavsaxena@sfdc.com';
String password='Password@11';
String LOGIN_DOMAIN = 'vaibhav4-dev-ed.my.salesforce.com';
String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;

 public FetchAccount()
    {
        
    }
    public void fetch()
    {
Http h = new Http();
HttpRequest req = new HttpRequest();
req.setBody(reqbody);
req.setMethod('POST');
req.setEndpoint('https://'+ LOGIN_DOMAIN +'/services/oauth2/token');//Note if my domain is set up use the proper domain name else use login.salesforce.com for prod or developer or test.salesforce.com for sandbox instance

HttpResponse res = h.send(req);

OAuth2 objAuthenticationInfo = (OAuth2)JSON.deserialize(res.getbody(), OAuth2.class);
//RequestWrapper reqst=new RequestWrapper();

System.debug('--->objAuthenticationInfo'+objAuthenticationInfo);
if(objAuthenticationInfo.access_token!=null){
final PageReference theUrl = new PageReference('https://' + LOGIN_DOMAIN + '/services/data/v22.0/query/');
        theUrl.getParameters().put('q','Select a.Phone, a.Name, a.CreatedBy.FirstName, a.CreatedById From Account a limit 10');
        


  Http h1 = new Http();
  HttpRequest req1 = new HttpRequest();
  req1.setHeader('Authorization','Bearer '+objAuthenticationInfo.access_token);
  req1.setHeader('Content-Type','application/json');
  req1.setHeader('accept','application/json');
 // req1.setBody(jsonstr);//Send JSON body
  req1.setMethod('GET');
  //req1.setEndpoint(ts.URL__c+URL);//URL will be your Salesforce REST API end point where you will do POST,PUT,DELETE orGET
  req1.setEndpoint(theUrl.getUrl());
  HttpResponse res1 = h1.send(req1);
  String body = res1.getBody();
  j = JSON2Apex.parse(body);
  System.debug('--->JSON2Apex' + j);
  User u = [Select Id, firstName, lastName from User Limit 1];
  /*acc= new List<Account>();
  System.debug('--->j.Records ---->' + j.Records);
  for(integer i=0; i< j.Records.size(); i++){
      Account accobj = new Account();
      accobj.Name = j.Records[i].Name;
      accobj.CreatedById = j.Records[i].CreatedById;
      accobj.Phone = j.Records[i].Phone;
      accobj.CreatedBy= u;
      acc.add(accobj);
  }*/
  //if(!lstAccount.isEmpty())
    //  insert lstAccount;

 /*       JSONParser parser = JSON.createParser(body);

        do{
            parser.nextToken();
        }while(parser.hasCurrentToken() && !'records'.equals(parser.getCurrentName()));

        parser.nextToken();

        acc = (List<Account>) parser.readValueAs(List<Account>.class);    */ 
        }
   
 // system.debug('RESPONSE_BODY'+res1.getbody());

  }
/*To get aouthentication detail Wrapper*/
 class OAuth2{
  String id{get;set;}
  String issued_at{get;set;}
  String instance_url{get;set;}
  String signature{get;set;}
  String access_token{get;set;}    
}  

}