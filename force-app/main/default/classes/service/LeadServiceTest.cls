@IsTest(SeeAllData=false)

private class LeadServiceTest {

    /**
     * Web to Lead Form
  
     * @author Begimai Akulova
     */

    @isTest
    static void testThatEmailWasSent(){
        List <Lead> leadList=new List <Lead>();
        Lead lds=new Lead();
        lds.FirstName='Test';
        lds.LastName='Test';
        lds.Company='Google';
        lds.Status='Open Not-Contacted';
        lds.LeadSource='Web';
        leadList.add(lds);
        
        Lead ld=new Lead();
        ld.FirstName='Test';
        ld.LastName='Test';
        ld.Company='Google';
        ld.Status='Open Not-Contacted';
        ld.LeadSource='Phone';
        leadList.add(ld);
        
        System.assertEquals(0, Limits.getEmailInvocations(), 'No emails should be sent');
        insert leadList;
      
        System.assertEquals(1, Limits.getEmailInvocations(), 'Emails should be sent');
        
        List <Lead> ldUpdate=[SELECT LeadSource, Id FROM Lead];
        for(Lead l:ldUpdate){
            if(l.LeadSource!='Web'){
                l.LeadSource='Web';
            }       
        }
        
        update ldUpdate;
        
        System.assertEquals(3, Limits.getEmailInvocations(), 'Emails should be sent');
        
    } 
}
