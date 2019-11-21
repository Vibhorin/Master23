public class SelectlistClass {
    public selectoption[] myoptions {get;set;}
    
    public SelectlistClass()
    {
        selectoption op3 = new selectoption('null','-None-');
        selectoption op4 = new selectoption('One','Jan');
        selectoption op2 = new selectoption('Two','Feb');
        myoptions =new selectoption[]{op3,op4,op2};
    }
    
}