public class Process {
    @InvocableMethod
    public static void updateProcess(List<ID> ids)
    {
        List<lead> leads =[Select Name from lead where id in :ids];
        for(lead le:leads)
        {
            le.firstname ='sfdcTest';
        }  
        delete leads;
      }
        
}