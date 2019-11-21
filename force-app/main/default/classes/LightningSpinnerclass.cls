public class LightningSpinnerclass {
  @AuraEnabled
    public static List<Opportunity> getOpportunities() {
        List<Opportunity> opportunities =
                [SELECT Id, Name, CloseDate FROM Opportunity LIMIT 1000];
        return opportunities;
    }
}