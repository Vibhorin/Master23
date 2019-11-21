Public class Utilclass
{

public static string VFPagecode(String Pagename)
{
ApexPage testpage = new apexpage();
String Pagetext='';
if(pagename !='')
{
testpage =[select id,markup from apexpage where name=:Pagename];
Pagetext =testpage.markup;
}
return Pagetext;
}
}