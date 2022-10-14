@IsTest(SeeAllData=false)
private class CarServiceTest {

    /**When car was bought from Auction and purchase due date expired, storage cost will charged
      
    * @param carList  
    * @author Doolatkan
     **/

        @isTest
        public static void checkStorageCost(){
            Contact con = new Contact(lastname = 'John');
            insert con;
            
            Contact conIns = [Select id from Contact];
            
            Car__c car = new Car__c(Name = 'Toyota', driver__c = conIns.id, Status__c = 'Auction', is_Paid__c = true, purchase_Date__c = date.today());
            insert car;
            
            Car__c carInserted = [Select name, purchase_Date__c, storage_cost__c from Car__c];
    
            system.assertEquals(null, carInserted.storage_cost__c);
            
            carInserted.purchase_Date__c = date.today()-2;
            update carInserted;
            
            Car__c carUpdated = [Select name, purchase_Date__c, storage_cost__c from Car__c];
            
            system.assertEquals(45, carUpdated.storage_cost__c);
            
            carUpdated.purchase_Date__c = date.today()-5;
            update carUpdated;
            
            Car__c carUpdated2 = [Select name, purchase_Date__c, storage_cost__c from Car__c];
            
            system.assertEquals(120, carUpdated2.storage_cost__c);
            
            carUpdated2.purchase_Date__c = date.today()-8;
            update carUpdated2;
            
            Car__c carUpdated3 = [Select name, purchase_Date__c, storage_cost__c from Car__c];
            
            system.assertEquals(215, carUpdated3.storage_cost__c);
            
            carUpdated3.purchase_Date__c = date.today()-11;
            update carUpdated3;
            
            Car__c carUpdated4 = [Select name, purchase_Date__c, storage_cost__c, Status__c from Car__c];
            
            system.assertEquals(null, carUpdated4.Status__c);        
            
        }
        
}