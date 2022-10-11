@IsTest(SeeAllData=false)

private class LeadServiceTest {

    /**
     * Web to Lead Form
  
     * @author Begimai Akulova
     */

    @isTest
    static void testThatEmailWasSent(){
        Lead lds=new Lead();
        lds.FirstName='Test';
        lds.LastName='Test';
        lds.Company='Google';
        lds.Status='Open Not-Contacted';
        lds.LeadSource='Web';
        insert lds;
        
        List <Lead> ld=[SELECT LeadSource, Id FROM Lead];
        Test.startTest();
        //System.assertEquals(0, Limits.getEmailInvocations(), 'No emails should be sent');
        
       // WebLeadHandlerClass.triggerTest(ld);
        
        System.assertEquals(1, Limits.getEmailInvocations(), 'Emails should be sent');
        Test.stopTest();
    } 
}
