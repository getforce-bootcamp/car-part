@IsTest(SeeAllData=false)
private class CarServiceTest {
    @isTest
    public static void approvalTest(){
        Contact con =new Contact(lastName='Test Driver',position__c='Driver');
        insert con;
        contact c=[Select id,lastName,position__c from contact where position__c='Driver'  limit 1];
        
        Car__c carsToapprove = new Car__c(Name='Car Test',driver__c=c.Id,status__c='In The Yard');
        insert carsToapprove;
        
        Car__c toUpdate=[Select id,status__c,driver__c,createdDate  from Car__c limit 1];
        toUpdate.status__c='Dismantling';
        update toUpdate;
        
        Car__c upDated=[Select id,status__c,driver__c,createdDate from Car__c limit 1];
        ProcessInstance pi = [SELECT TargetObjectId, CreatedDate FROM ProcessInstance WHERE TargetObjectId = :upDated.Id];
            System.assertEquals(upDated.CreatedDate,pi.CreatedDate);

        
   }
    
}