public class StringArrayTest {
    
    public static list<String> generateStringArray(Integer j){ 
        list<String> returnList = new list<String>();
        for(integer i=0; i< j ; i++){
            String value = 'Test ' + i;
            returnList.add(value);
        }
        return returnList;
    }

}