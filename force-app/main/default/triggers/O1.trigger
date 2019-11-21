trigger O1 on Opportunity (before insert , before update) {

Double Amount_total = 0;
for (Opportunity opp : [select Amount from Opportunity where createddate =today and createdbyid =: userinfo.getuserid()])
Amount_total = Amount_total + opp.amount ;

for(Opportunity opp1 : trigger.new)
{

Amount_total=Amount_total + opp1.amount;

if(Amount_total >1000)
opp1.adderror('Amaount Value is more than 1K');
}
}