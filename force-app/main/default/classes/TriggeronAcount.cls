Public class TriggeronAcount{

Public static void beforeUpdate(list<account> acc)
{
for(Account a : acc)
{
if(a.industry == 'Banking'){}
//a.addError('You cannot change banking');
}
}
Public static void afterUpdate(list<account> acc)
{
list<Contact> Con = new list<Contact>();

for(Account ac :acc)
{
contact c = new Contact();
System.debug('*******'+ ac.id);
c.Accountid = ac.id;
c.lastname = ac.name;
c.phone = ac.Phone;

Con.add(c);
}
insert(Con);
}
}