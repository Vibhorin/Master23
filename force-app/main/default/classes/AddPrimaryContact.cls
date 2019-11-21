public class AddPrimaryContact implements Queueable{
    private contact c;
    private string st;
    
    public AddPrimaryContact (contact con, string str) {
        this.c =con;
        this.st = str;
    }
    
    public void execute(QueueableContext context)
    {
        List<Account> ListAccount = [Select Id,Name ,(Select Id,FirstName,LastName from Contacts) from account where billingstate =:st];
        List<Contact> lstContact = new List<Contact>();
         for (Account acc:ListAccount)
         {
                 Contact cont = c.clone(false,false,false,false);
                 cont.AccountId =  acc.id;
                 lstContact.add( cont );
         }
         
         if(lstContact.size() >0 )
         {
             insert lstContact;
         }
    }
}