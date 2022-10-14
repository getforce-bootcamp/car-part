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
     /** 
     * Method update two fields in Cars object when in FinanceTransaction object chosen: 
     *   Type 'Sell' -> 'Amount' from FinanTransaction add to field 'Revenue' in Cars object; 
     * @param financeList  
     * @author Elmira 
     */ 
 
 
    @isTest static void updateParentRecord(){ 
        Contact con = new Contact ( LastName='Doe'); 
        insert con; 
         contact c = [Select LastName, id from Contact]; 
         Car__c car=new Car__c(Name='Toyota', Driver__c= c.id); 
        insert car; 
        Car__c cars2= [select name, Revenue__c from Car__c ]; 
       Finance_Transaction__c fin = new Finance_Transaction__c(Amount__c=50,Type__c='Sell', Car__c = cars2.id); 
        insert fin; 
        Finance_Transaction__c ft=[Select Amount__c from Finance_Transaction__c];  
        Car__c car3= [select name, Revenue__c from Car__c ]; 
         
       
        
           system.assertEquals(car3.Revenue__c,ft.Amount__c ); 
       
    } 
 
    
}
