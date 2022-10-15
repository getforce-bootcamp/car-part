public with sharing class CarService {
  /**
     *  update two fields in Cars object when in is_Dismanted__c  is checked :
     
     * @param carList 
     * @author Elmira
     */

    public static void updateDismantle(List<Car__c> carList){
       
            for(Car__c c:carList){
                 if(c.Is_Dismantled__c==True){
                     c.Dismantle__c=200;
                 }
             }
         }

          /**
     *  Checks Car Cost field to calculate comission:
     
     * @param carsList
     * @author Begimai
     */
         public static void calculateComission(List<Car__c> carsList){
            for (Car__c car:carsList){
                if(car.Car_Cost__c<=1000){
                    car.Comission__c=170;
                }else if(car.Car_Cost__c<=2000){
                    car.Comission__c=250;
                }else if(car.Car_Cost__c<=5000){
                     car.Comission__c=300;
                }else if(car.Car_Cost__c<=10000){
                    car.Comission__c=350;
                }else if(car.Car_Cost__c>10000){
                    car.Comission__c=400;
                }
            }
         }


    //  public static void calcDistance(List<Car__c> newCars) {
    //     Account[] accList = [select id,Geolocation__c from account];
    //     Set<Id> accIds = new Set<Id>();
        
    //     for (Account acc : accList) {
    //         accIds.add(acc.id);
    //     }
        
    //     List<Car__c> cars = [select id,Yard_Coordinates__c,Distance__c,Account__c from car__c where Account__c in :accIds];
        
    //     Double longt = 0;
    //     Double lat = 0;
        
    //     for(Car__c carRecord : trigger.new) {
    //         for(Car__c car : cars){
    //             Location loc = car.Yard_Coordinates__c;
    //             longt += loc.longitude;
    //             lat += loc.latitude;
    //         }
            
    //         Double acclongt = 0;
    //         Double acclat = 0;
            
    //         for(Account acc : accList) {
    //             try{
    //                 Location accloc = acc.Geolocation__c;
    //                 acclongt += accloc.longitude;
    //                 acclat += accloc.latitude;
    //             }
    //             catch(Exception e) {
    //                 system.debug(e.getMessage());
    //             }
    //         }
            
    //         Location loc1 = Location.newInstance(acclat,acclongt);
    //         Location loc2 = Location.newInstance(lat,longt);
    //         Double dist = Location.getDistance(loc1, loc2, 'km');
    //         carRecord.Distance__c = dist;
    //     }
    // }
}