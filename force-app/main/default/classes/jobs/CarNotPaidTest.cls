@isTest(seeAllData = true)
public class CarNotPaidTest {
    
    @isTest
    static void testEmail(){
        
        String CRON_EXP = '0 0 0 * * ?';
        CarNotPaid cnp = new CarNotPaid();
        cnp.execute(null);
        String jobId=System.schedule('Send Email Notification',  CRON_EXP,  cnp);
        
        //System.assertEquals(1, Limits.getEmailInvocations(), 'emails should be sent');
   
    }
    
}