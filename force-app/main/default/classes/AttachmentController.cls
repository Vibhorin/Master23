public class AttachmentController{
    @AuraEnabled
    public static void updatePicturePath(String recId){
        ContentDocumentLink docLink = new ContentDocumentLink();
        //In Lightning Experience, Attachments are stored in ContentDocuments
        try{
            docLink = [ SELECT ContentDocumentId
                               FROM ContentDocumentLink
                               WHERE LinkedEntityId = :recId order by Id desc Limit 1];
        } catch(Exception ex) {
            docLink = new ContentDocumentLink(ContentDocumentId='0690K00000J0owHQAR');
        }
        //ContentVersion Id uniquely identifies the attachment
		ContentVersion ver = [SELECT Id FROM ContentVersion Where ContentDocumentId = :docLink.ContentDocumentId];
        //Update the Picture_Path field with the url of the image
        Speaker__c speaker = [SELECT Id FROM Speaker__c WHERE Id = :recId];
        speaker.Picture_Path__c = '/sfc/servlet.shepherd/version/download/'+ ver.Id;
        upsert speaker;
    }
}