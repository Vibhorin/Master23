trigger t1 on account(before insert, before update)
{
if(Trigger.isinsert){
for(account c: trigger.new)
if(c.industry == 'Education')
c.adderror('We do not work with education');
}

if(Trigger.isupdate){
for(account c: trigger.new)
if(c.industry == 'Education')
c.adderror('Updated value cannot be education');
}
}