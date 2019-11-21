public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(string parameter1){
        list<list<sobject>> abc = [Find :parameter1 in ALL Fields returning contact(Firstname,Lastname) ,lead(Firstname,Lastname)];
        return abc;
    }

}