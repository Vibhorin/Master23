trigger emailcheck on Contact (before update,after update) {

if(trigger.isbefore)
{

Map<id,Contact> o = new Map<id,Contact>();
//List<Contact> o = new List<Contact>();
o=trigger.oldMap;
//o= trigger.old;
for( contact c:trigger.new)
{

contact old = new Contact();

old = o.get(c.id);

if(old.Email != NULL && c.Email !=old.Email)
c.adderror('You cannot change the Email');
}
}
if(Trigger.isafter)
{
list<contact> con = new list<contact>();
for(contact c:trigger.new){
if(c.email==null){
contact co = new contact(Id =c.id,Email='throughtrigger@test.com');
con.add(co);
}
}
update con;
}
}