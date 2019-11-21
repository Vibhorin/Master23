trigger O2 on Opportunity (before insert) {

for(opportunity opp : trigger.new)
{
ID acid = opp.accountid;

system.debug('===ID is'+acid);
account acc =[select name, industry from account where id =: acid];
system.debug('===Industry is'+opp.account.industry);
if(acc.industry =='Finance')
opp.adderror('Oppoertunity cannot be created on account with finance');

}
}