Public with sharing class inlineEditControl {
Public Boolean InLineFlag{get;set;}
    public inlineEditControl(ApexPages.StandardController controller) {
     InLineFlag = false;
    }
   Public void SetInlineEdit(){
    if(InLineFlag == false)
      InLineFlag = true;
    else
     InLineFlag = false;
   }
}