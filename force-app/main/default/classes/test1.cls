public class test1{

public test1(){
}

    public PageReference switch() {
       PageReference pageRef = new PageReference('http://www.google.com');
        pageRef.setRedirect(true);
        return pageRef;
    }

}