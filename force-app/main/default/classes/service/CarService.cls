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

         
    }


