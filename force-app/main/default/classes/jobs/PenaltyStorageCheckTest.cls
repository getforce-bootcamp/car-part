@isTest
private class PenaltyStorageCheckTest {
    @isTest
    static void emailTest() {
        Contact con = new Contact(lastname = 'Johnson');
        insert con;
        Contact retrCon = [select id from contact];
        
        Car__c car1 = new Car__c(Name = 'BMW',Driver__c = retrCon.Id,Storage_Cost__c = 777,Penalty_Cost__c = 111);
        insert car1;
        Car__c car2 = new Car__c(Name = 'Mercedes',Driver__c = retrCon.Id,Storage_Cost__c = 777,Penalty_Cost__c = 111);
        insert car2;
        AggregateResult[] cars = [select sum(Penalty_Cost__c)penaltycost,sum(Storage_Cost__c)storagecost from car__c];
        Object penaltySum = cars[0].get('penaltycost');
        Object storageSum = cars[0].get('storagecost');
        
        String cronExp = '0 0 16 ? * FRI';
        PenaltyStorageCheck psc = new PenaltyStorageCheck();
        psc.execute(null);
        system.schedule('PenaltyStorageCheckSchedule', cronExp, psc);
        
        System.assertEquals(1, Limits.getEmailInvocations(), 'emails should be sent');
    }
}
