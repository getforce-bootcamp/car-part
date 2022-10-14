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
     /**
     *  After purchasing the car, there is no storage charge at Auction for 3 days, then 4th day $5,
     *  5th day $10, 6th day $15 afterwards $25 for each day.
     * @param carsList
     * @author Elmira
     */
         public static void StorageCharge (List<Car__c>carList){
            trigger StorageCharge on Car__c (before insert, before update) {
                for(Car__c car:carList){
                     DateTime NOW = datetime.now();
                    if(car.Status__c=='Auction')
                        if(car.Purchase_Date__c>=NOW||car.Purchase_Date__c>=NOW-3){
                         car.Storage_Cost__c=0;
                    }
                    else if (car.Purchase_Date__c>=NOW-4){
                        car.Storage_Cost__c=5;
                        
                    }
                    else if (car.Purchase_Date__c>=NOW-5){
                        car.Storage_Cost__c=10;
                        
                    }
                    else if (car.Purchase_Date__c>=NOW-6){
                        car.Storage_Cost__c=15;
                        
                    }
                    else if (car.Purchase_Date__c>=NOW-7){
                        car.Storage_Cost__c=25;
                        
                    }
                    else if (car.Purchase_Date__c>=NOW-8){
                        car.Storage_Cost__c=50;
                        
                    }
                     else if (car.Purchase_Date__c>=NOW-9){
                        car.Storage_Cost__c=75;
                        
                    }
                      else if (car.Purchase_Date__c>=NOW-10){
                        car.Storage_Cost__c=100;
                        
                    }
                    else if (car.Purchase_Date__c>=NOW-11){
                        car.Storage_Cost__c=125;
                        
                    }
                    else if (car.Purchase_Date__c>=NOW-12){
                        car.Storage_Cost__c=150;
                        
                    }
                    else if (car.Purchase_Date__c>=NOW-13){
                        car.Storage_Cost__c=175;
                        
                    }
                     
                    else if (car.Purchase_Date__c>=NOW-14){
                        car.Storage_Cost__c=200;
                        
                    }
                }
                
            
            }
         }
    }


