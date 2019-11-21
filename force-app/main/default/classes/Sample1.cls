public class Sample1 {  
   
    public Sample1() {
    }
   
    public pageReference switch() {
        PageReference pageRef = new PageReference('/apex/pagereference');
        pageRef.setRedirect(false);
        return pageRef;
    }           
}