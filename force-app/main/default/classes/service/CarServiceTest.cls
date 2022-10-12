@IsTest(SeeAllData=false)
private class CarServiceTest {
  
     /*  update two fields in Cars object when in is_Dismanted__c  is checked :
     
     * @param carList 
     * @author Elmira
     */
    @isTest public static void UpdateComissionField(){
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

    
}