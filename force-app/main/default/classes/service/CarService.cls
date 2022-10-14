public with sharing class CarService {

    /**When car was bought from Auction and purchase due date expired, storage cost will charged
      
    * @param carList  
    * @author Doolatkan
     **/

   public static void updateStorageCost(List<Car__c> carList){ 
        integer days = 0;
       if(Trigger.isBefore && Trigger.isUpdate){
           for(Car__c c: carList){
               if(c.Status__c == 'Auction' && c.is_Paid__c == true && c.is_Picked_Up__c == false){
                  date purch_date = date.newInstance(c.Purchase_Date__c.year(), c.Purchase_Date__c.month(), c.Purchase_Date__c.day());
                   system.debug(purch_date);
                   if(c.Purchase_Date__c < Date.today()){
                       days = purch_date.daysBetween(Date.today());
                       system.debug(days);
                   }
               }
               
               if(days>0 && days<=3){                
                   c.Storage_Cost__c = 15 * days;
               }else if(days>3 && days<=7){                
                   c.Storage_Cost__c = (15 * 3) + ((days-3)*25);
               }else if(days>7 && days<=10){                
                   c.Storage_Cost__c = (15 * 3) + (4*25) + ((days-7)*35);
               }else if(days>10){
                   c.Status__c = null;
               }else{
                  c.Storage_Cost__c = null; 
               }
           }        
           
       }
       
   }
    

}
