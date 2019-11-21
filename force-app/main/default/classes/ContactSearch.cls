public class ContactSearch {
    public static list<contact> searchForContacts(string parameter1 ,string parameter2){
        list<contact> con =[select id,name from contact where lastname =:parameter1 and MailingPostalCode =:parameter2];
        
        return con;
    }

}