public class AccountHandler {
    public static account insertNewAccount(String name){
        
        Account acc = new account();
        try{
            acc.name = name;
            insert acc;
                } catch(exception e) {
                   return null; 
                }
        
        return acc;
    }
}