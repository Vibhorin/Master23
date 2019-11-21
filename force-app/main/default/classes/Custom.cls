public class Custom {
public string name{get;set;}
public integer amount{get;set;}
public string closeDate{get;set;}

public custom()
{
closeDate ='as expected';
}
//public abc(ApexPages.StandardController acon) { }
 public Void doSomething()
 {
 this.name ='Ashish';
 this.amount=200;
system.debug('----in custom Con');
 }
}