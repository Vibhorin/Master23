global class DailyLeadProcessor implements Schedulable{
global void execute(Schedulablecontext cxt)
{
    List<lead> leads =[Select Id,Name from lead where LeadSource =null limit 200];
    if(!leads.isEmpty())
        for(lead lst: leads)
            {
            lst.LeadSource ='Dreamforce';
            }
        update leads;
}
}