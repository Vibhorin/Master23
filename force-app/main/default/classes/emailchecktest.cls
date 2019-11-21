@istest
public class emailchecktest{

public static testmethod void emailcheckmethord()
{
contact a = new contact(Lastname='Test_methord');
insert a;

Contact inserteddata=[select lastname, email from contact Limit 1];

system.assertEquals(null,inserteddata.email);
inserteddata.firstname ='to_check';
update inserteddata;
Contact updateddata=[ select lastname, email from contact Limit 1];
system.assertEquals('throughtrigger@test.com',updateddata.email);
}
}