public with sharing class Vibhor {

public string query{get;set;}

public pagereference searchandfind()
{
system.debug('abc');
system.debug('Query input'+query);
pagereference pg = new pagereference('https://www.google.co.in');
pg.setredirect(false);
return pg;
}
}