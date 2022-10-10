@IsTest(SeeAllData=false)
private class CarServiceTest {
  /**
     *  update two fields in Cars object when in is_Dismanted__c  is checked :
     
     * @param carList 
     * @author Elmira
     */
    @isTest public static void UpdateComissionField(){
        Contact con = new Contact ( LastName='Doe');
        insert con;
         contact c = [Select LastName, id from Contact];
         Car__c car=new Car__c(Name='Toyota',is_Dismantled__c=true, Driver__c= c.id);
        insert car;
        
 Car__c car2= [Select Name,Dismantle__c from Car__c];   
        system.assertEquals(200, car2.Dismantle__c);
    }
}