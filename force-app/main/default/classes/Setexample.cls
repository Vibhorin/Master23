public class Setexample {
    
    public set<string> names{get;set;}
    public Setexample()
    {
        
        list<string> ab = new list<string>();	
        	ab.add('vibhor');
            ab.add('vibhor');
            ab.add('vaibhav');
            ab.add('vibhor');
			names =  new set<string>();
            names.add('abc');    
       		names.addall(ab);
            }
}