public with sharing class withSOSL{

public list<account> acclist{get;set;}
public list<opportunity> optylist{get;set;}
public list<contact> conlist{get;set;}
public list<lead> leadlist{get;set;}

public void sosldemo_methord()
{
acclist = new list<account>();
optylist = new list<opportunity>();
 conlist = new list<contact>();
 leadlist = new list<lead>();
 
 list<list<sobject>> serchlist =[ Find 'test' in all fields returning account (id,name,type),contact(name,email),opportunity(name,stagename),lead(company,name,status)];
 acclist =((list<account>)serchlist[0]);
 optylist =((list<opportunity>)serchlist[2]);
  conlist =((list<contact>)serchlist[1]);
   leadlist =((list<lead>)serchlist[3]);


}
}