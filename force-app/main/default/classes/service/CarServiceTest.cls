@IsTest(SeeAllData=false)
private class CarServiceTest {
  
     /*  update two fields in Cars object when in is_Dismanted__c  is checked :
     
     * @param carList 
     * @author Elmira
     */
    @isTest public static void updateComissionField(){
        Contact con = new Contact ( LastName='Doe');
        insert con;
         contact c = [Select LastName, id from Contact limit 1];
         Car__c car=new Car__c(Name='Toyota',is_Dismantled__c=true, Driver__c= c.id);
        insert car;
        
        Car__c car2= [Select Name,Dismantle__c from Car__c];   
        system.assertEquals(200, car2.Dismantle__c);
    }
    
 
     /*  Checks Car Cost field to calculate comission:
     
     * @param carsList 
     * @author Begimai
     */
    @TestSetup
    public static void insertRecords(){
        Contact driver=new Contact(FirstName='Will',LastName='Smith');
        insert driver;  
        
    }
    
    @isTest
    public static void test1000(){      
	    Contact driverD=[SELECT Id, LastName FROM Contact];
        Car__c newCar=new Car__c(Name='BMW',Driver__c=driverD.Id,Car_Cost__c=800);
        insert newCar;
         List<Car__c> carsInserted=[SELECT Comission__c, Car_Cost__c FROM Car__c];
        System.assertEquals(170, carsInserted.get(0).Comission__c);
    }
    
     @isTest
    public static void test2000(){
        Contact driverD=[SELECT Id, LastName FROM Contact];
        Car__c newCar=new Car__c(Name='BMW',Driver__c=driverD.Id,Car_Cost__c=1500);
        insert newCar;
         List<Car__c> carsInserted=[SELECT Comission__c, Car_Cost__c FROM Car__c];
        System.assertEquals(250, carsInserted.get(0).Comission__c);
        
    }
     @isTest
    public static void test5000(){
       
        Contact driverD=[SELECT Id, LastName FROM Contact];
        Car__c newCar=new Car__c(Name='BMW',Driver__c=driverD.Id,Car_Cost__c=4000);
        insert newCar;
         List<Car__c> carsInserted=[SELECT Comission__c, Car_Cost__c FROM Car__c];
        System.assertEquals(300, carsInserted.get(0).Comission__c);
    }
     @isTest
    public static void test10000(){
     
        Contact driverD=[SELECT Id, LastName FROM Contact];
        Car__c newCar=new Car__c(Name='BMW',Driver__c=driverD.Id,Car_Cost__c=9000);
        insert newCar;
         List<Car__c> carsInserted=[SELECT Comission__c, Car_Cost__c FROM Car__c];
        System.assertEquals(350, carsInserted.get(0).Comission__c);
    }
    @isTest
    public static void testMore10000(){
     Contact driverD=[SELECT Id, LastName FROM Contact];
        Car__c newCar=new Car__c(Name='BMW',Driver__c=driverD.Id,Car_Cost__c=11000);
        insert newCar;
         List<Car__c> carsInserted=[SELECT Comission__c, Car_Cost__c FROM Car__c];
        System.assertEquals(400, carsInserted.get(0).Comission__c);
    }

     /** 
     After purchasing the car, there is no storage charge at Auction for 3 days, then 4th day $5, 5th day $10, 6th day $15 afterwards $25 for each day.
     * @param carList
     * @author Elmira 
     */ 
    @isTest public static void CalcStorageCost(){
        Contact con = new Contact ( LastName='Doe'); 
        insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        DateTime NOW = datetime.now();
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=NOW); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
     //  system.assertEquals(0,cars2.Storage_Cost__c ); 
       
   }
    @isTest public static void CalcStorageCost2(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
       
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 3); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
       //system.assertEquals(5,cars2.Storage_Cost__c ); 
          
   }
     @isTest public static void CalcStorageCost3(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
      
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 4); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
      // system.assertEquals(10,cars2.Storage_Cost__c ); 
          
   }
    @isTest public static void CalcStorageCost4(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 5); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
       //system.assertEquals(15,cars2.Storage_Cost__c ); 
          
   }
    @isTest public static void CalcStorageCost5(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 6); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
       //system.assertEquals(25,cars2.Storage_Cost__c ); 
          
   }
      @isTest public static void CalcStorageCost6(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 7); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
      // system.assertEquals(50,cars2.Storage_Cost__c ); 
          
   }
     @isTest public static void CalcStorageCost7(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 8); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
      // system.assertEquals(75,cars2.Storage_Cost__c ); 
          
   }
   @isTest public static void CalcStorageCost8(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 9); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
       //system.assertEquals(100,cars2.Storage_Cost__c ); 
          
   }
       @isTest public static void CalcStorageCost9(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 10); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
       //system.assertEquals(125,cars2.Storage_Cost__c ); 
          
   }
    @isTest public static void CalcStorageCost10(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 11); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
      // system.assertEquals(150,cars2.Storage_Cost__c ); 
          
   }
    @isTest public static void CalcStorageCost11(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 12); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
       //system.assertEquals(175,cars2.Storage_Cost__c ); 
          
   }
   @isTest public static void CalcStorageCost12(){
        Contact con = new Contact ( LastName='Doe'); 
       insert con; 
        contact c = [Select LastName, id from Contact limit 1]; 
        
        Car__c car=new Car__c(Name='Toyota',Status__c='Auction', Driver__c= c.id,Purchase_Date__c=System.NOW() - 13); 
       insert car; 
       Car__c cars2= [select name, Status__c,Storage_Cost__c from Car__c ]; 
       //system.assertEquals(200,cars2.Storage_Cost__c ); 
          
   }
  
    @isTest
    public static void checkStorageCost(){
        Contact con = new Contact(lastname = 'John');
        insert con;
        
        List<Contact> conIns = [Select id from Contact];
        
        Car__c car = new Car__c(Name = 'Toyota', driver__c = conIns[0].id, Status__c = 'Auction', is_Paid__c = true, purchase_Date__c = date.today());
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