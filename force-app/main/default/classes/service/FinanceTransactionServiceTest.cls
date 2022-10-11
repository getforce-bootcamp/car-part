@isTest(SeeAllData=false)
private class FinanceTransactionServiceTest {

    @isTest
    static void paymentTest() {
        Contact driver = new Contact(lastName = 'Johns');
        insert driver;
        Car__c car = new Car__c(Name = 'Mercedes',Driver__c = driver.id);
        insert car;
        Finance_Transaction__c payment = new Finance_Transaction__c(Amount__c = 400,Car__c = car.Id,Type__c = 'Storage');
        insert payment;
        
        Car__c retrCar = [select storage_cost__c from car__c where name = 'Mercedes'];
        
        system.assertEquals(400, retrCar.Storage_Cost__c);
        
    }
    
}
