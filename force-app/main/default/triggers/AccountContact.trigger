trigger AccountContact on Account (before update ,after update , before insert) {

if(trigger.isupdate && trigger.isbefore)
TriggeronAcount.beforeUpdate(trigger.old);

if(trigger.isafter && trigger.isupdate)
TriggeronAcount.afterUpdate(trigger.new);

if((trigger.isupdate || trigger.isInsert) && trigger.isbefore)
{
set<string> tocheck = new set<string>();
for(account a : trigger.new)
tocheck.add(a.name);

list<account> abc =[ select name from account where name=:tocheck];

set<string> duplicatelist =new set<string>();
for (account ab :abc)
duplicatelist.add(ab.name);
for(account abcd : trigger.new)
if(duplicatelist.contains(abcd.name))

abcd.name.adderror('This is duplicate record');
else
abcd.name = 'Mr.'+abcd.name;

}
}