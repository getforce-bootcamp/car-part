@isTest
public with sharing class CarReportTest {
        
    @isTest
    static void testSchedule(){
        String CRON_EXP = '0 0 16 ? * FRI';
        Test.startTest();
        String jobId=System.schedule('Send Email Notification',  CRON_EXP,  new CarReport());
        Test.stopTest();
        
        //Test Is the schedule job is created
        System.assertEquals(false,String.isBlank(jobId));     
    } 
    
    @isTest
    static void testEmail(){
        Test.startTest();
        System.assertEquals(0, Limits.getEmailInvocations(), 'No emails should be sent');
        CarReport car=new CarReport();
        car.execute(null);
        System.assertEquals(1, Limits.getEmailInvocations(), 'Emails should be sent');
        Test.stopTest();
    } 
}
