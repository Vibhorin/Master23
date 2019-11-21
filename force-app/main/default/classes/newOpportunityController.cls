/*
 * This class is the controller behind the New Customer Opportunity
 * wizard. The new wizard is comprised of three pages, each of
 * which utilizes the same instance of this controller.
 */  
    
public class newOpportunityController {

   // These Three class variables maintain the state of the wizard.  
    
   // When users enter data into the wizard, their input is stored  
    
   // in these variables.  
    
   Account account;
  Contact contact;
 Opportunity opportunity;


   // The next three methods return one of each of the four class  
    
   // variables. If this is the first time the method is called,  
    
   // it creates an empty record for the variable.  
    
   public Account getAccount() {
      if(account == null) account = new Account();
      return account;
   }
  public Contact getContact() {
      if(contact == null) contact = new Contact();
      return contact;
   } 
   public opportunity getOpportunity() {
      if(opportunity == null) opportunity = new Opportunity();
      return opportunity;
   } 
   //There three methords will control the navigation through wizzard
   public PageReference step1(){
   return Page.opptyStep1;
   }
   public PageReference step2(){
   return Page.opptyStep2;
   }
   public PageReference step3(){
   return Page.opptyStep3;
   }
   //This method performs the final save operation
   public PageReference save(){
   //First we will save the account
   account.phone =contact.phone;
   insert account;
   //then we will use the id of account to link it with contact(i.e will create relationship
   contact.accountid= account.id;
   insert contact;
   //then a relationship between account and opportunity.
   opportunity.accountid = account.id;
   insert opportunity;
   //Finally sending user to the opportunity page being created.
   PageReference opptyPage = new PageReference('/'+opportunity.id);
   opptyPage.setRedirect(true);
   return(opptyPage);
   }
   }