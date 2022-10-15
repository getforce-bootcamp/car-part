public with sharing class CarPartService {
  /**
     * If the part for export checks it with green, if it is for local sale check it with red.
     *      * @author Ainura Akmatova
     */  
public static void TriggerCarParts (List<Car_Part__c> CarPartList){
    for(Car_Part__c CarPart:CarPartList){
        if(CarPart.Is_Export__c==True && CarPart.Container__c==Null ){
   CarPart.Container__c.addError('The field should not be empty');       
                   }  
             else if(CarPart.Is_Export__c==False && CarPart.Container__c!=Null){
                                       
                 CarPart.Container__c.addError('You can\'t choose the container');
}
         }
}
}  
