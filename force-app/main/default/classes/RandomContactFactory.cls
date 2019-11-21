public class RandomContactFactory {
    
    public static list<Contact> generateRandomContacts(Integer i, String lastname){
        List<Contact> conList = new List<Contact>();
        for(Integer j=0; j<i ; j++){
            Contact con = new Contact();
            con.firstname ='Test' +j;
            con.lastname = lastname;
            conList.add(con);
        }
       return  conList;
    }
}