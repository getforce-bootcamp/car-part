public with sharing class ContainerService {
/**
* Demonstrative method to show where put trigger logic.
* Load only the sold parts to Container and add price and weight of car part to ContainerвЂ™s fields.
*      * @author Ainura Akmatova
*/  
   
public static void ContainerTrigger(List<Container__c> ContList, Map<Id, Container__c> oldMap){
    set<id> conIds = new set<id>();
    for(Container__c con :ContList){
        if(oldMap.get(con.id).Status__c==null && con.Status__c=='Loading'){
            conIds.add(con.Id);
            
        }
    }
    List<Car_Part__c> carPartList=[SELECT Id, Name,  Is_Sold__c, Price__c, Weight__c, Container__c FROM Car_Part__c where Container__c in:conIds and is_Sold__c = True];
    
    for(Container__c con:ContList){
        con.Shipping_Price__c=0;
        con.Weight__c=0;
        for(Car_Part__c carPart: carPartList){
            if(con.Id==carPart.Container__c){
                con.Shipping_Price__c+= carPart.Price__c;
                con.Weight__c+= carPart.Weight__c; 
                
            }
        }
        
    } 
}
    }
