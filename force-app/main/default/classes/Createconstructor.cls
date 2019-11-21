public class Createconstructor {
    
    integer i;
    string s;
      public  Createconstructor( integer ii ,string a)
    {
        i = ii;
        s = a;
    }

public Createconstructor( )    
{
    i=10;
    s ='vibhor';
}
    public void show()
    {
        system.debug('Age is'+i);
        system.debug('Name is'+s);   
        
        
    }
}