public class screen1 {

 public account account{get;set;}
   
   public screen1()
   {
   account = new account();
      }
   public pagereference save()
   {
   insert account;
   pagereference pr = new pagereference('/apex/page2?id='+account.id);
   
   return pr;
}
}