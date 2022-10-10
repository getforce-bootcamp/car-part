public with sharing class CarService {
  /**
     *  update two fields in Cars object when in is_Dismanted__c  is checked :
     
     * @param carList 
     * @author Elmira
     */

    public static void updateDismantle(List<Car__c> carList){
        trigger CostOfDismantle on Car__c (before update, before insert) {
            for(Car__c c:carList){
                 if(c.Is_Dismantled__c==True){
                     c.Dismantle__c=200;
                 }
             }
         }
    }
}
