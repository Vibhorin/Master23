public with sharing class abc1 {

    public abc1(Custom controller) {
    name = 'vName1';
    amount = 123;
    closeDate = 'today';
 system.debug('----in constructor abc1');
    }

public string name{get;set;}
public integer amount{get;set;}
public String closeDate{get;set;}

//public abc1(ApexPages.StandardController acon) { }
 public Void doSomething()
 {
 name ='vaibhav';
 amount=500;
 closeDate = 'today11';
 system.debug('----in custom abc1');
 }
}