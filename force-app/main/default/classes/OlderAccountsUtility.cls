public class OlderAccountsUtility {
public static void updateOlderAccounts() {
    account[] oldAccounts=[Select Id,Description from Account Order BY CreatedDate Asc Limit 5];
    for(Account acc :oldAccounts){
        acc.Description = 'Heritage Account';
    }
    update oldAccounts;
}
}