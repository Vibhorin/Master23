@IsTest
public class TestVerifyDate {

    @IsTest
    public static void testDate(){
            date date1 = date.newInstance(2014,01,22);
            date date2 = date.newInstance(2014,02,15);
        Test.startTest();
            VerifyDate.CheckDates(date1 , date2);
        Test.stopTest();
    }
    
    @IsTest
    public static void testDate1(){
        date date1 = date.newInstance(2014,01,22);
        date date2 = date.newInstance(2014,03,22);
        Test.startTest();
        VerifyDate.CheckDates(date1 , date2);
        Test.stopTest();
    }
    
    @IsTest
    public static void testDate2(){
        date date1 = date.newInstance(2014,01,22);
        date date2 = date.newInstance(2014,01,15);
        Test.startTest();
        VerifyDate.CheckDates(date1 , date2);
        Test.stopTest();
    }
}