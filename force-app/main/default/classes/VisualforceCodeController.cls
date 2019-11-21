public class VisualforceCodeController {
public boolean showcodesection{get;set;}
public string pagetext{get;set;}
public string currentpagename{get;set;}

public VisualforceCodeController()
{
currentpagename ='';
showcodesection =False;
}
public pagereference Displaycode()
{
if(currentpagename!='')
{
Pagetext=Utilclass.VFPageCode(CurrentpageName);
showcodesection =True;
}
return null;
}
}