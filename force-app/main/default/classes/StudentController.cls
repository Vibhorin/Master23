public class StudentController {

    //Declaration of student variable
    public Student__c student{get;set;}
    public string errorMessage{get;set;}
    //instantiating in constrauctor
    public StudentController(ApexPages.StandardController stdcontroller) {
      student = new Student__c();
       student=(Student__c)stdController.getRecord();
    }
   
    //Three Pagereference methods for three pages, in which last one will contain data of the previous two
    public PageReference step1(){
        PageReference pageRef1 = new PageReference('/apex/Studentinfo1');
        pageRef1.setRedirect(false);
        return pageRef1;
    }
    Public void abc(){
    if(student.Last_Name__c ==NULL)
    errorMessage = 'LastName is required field';
    }
    Public PageReference step2(){
    if(student.Last_Name__c ==NULL){
    errorMessage = 'LastName is required field';
    return null;
    }
    else
    { 
        PageReference pageRef2 = new PageReference('/apex/Studentinfo2');
        pageRef2.setRedirect(false);
        return pageRef2;
        }
    }
    public PageReference step3(){
        PageReference pageRef3 = new PageReference('/apex/Studentinfo3');
        pageRef3.setRedirect(false);
        return pageRef3;
    }
    //Method for save button    
    public PageReference save(){
        try {
            insert student;
            PageReference StudentPage = new PageReference('/'+student.id);
            StudentPage.setRedirect(true);
            return(StudentPage);
        }
        catch(Exception ex){
           ApexPages.addMessages(ex);
           return null;
        }
    }
    //Method for save and New button
    public PageReference saveNew(){
        try {
            insert student;
            PageReference PageSaveNew = new PageReference('/apex/Studentinfo1');
            PageSaveNew.setRedirect(true);
            return(PageSaveNew);
        }
        Catch(Exception ex){
            ApexPages.addMessages(ex);
            return null;
        }
    }
}