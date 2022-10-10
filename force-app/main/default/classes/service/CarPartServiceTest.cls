@isTest (SeeAllData=false)
private class CarPartServiceTest {
    @TestSetup
    
        public static void records(){
            
          Account acc = new Account(Name='Test Account');
          insert acc;
          Account  accNew = [Select Name, id from Account];
            
          Container__c cont = new Container__c(Account__c =accNew.Id);
          insert  cont;
          Container__c contNew =[Select id from  Container__c];
            
          Contact con  = new  Contact(LastName='Test Contact');
          insert con;
          Contact conNew =[Select LastName, id from Contact];
            
          Car__c car = new Car__c(Name='New car', Driver__c=conNew.Id);
          insert car;
        
        }
        @isTest
        public static void testPossitive(){
            
            Car__c carNew = [Select  id from Car__c];
            Container__c contNew =[Select id from  Container__c];
    
            
            List<Car_Part__c> carP=new List<Car_Part__c>();
            try{
               carP.add(new Car_Part__c(Car__c=carNew.Id,Is_Export__c =true));
               insert carP;
             }
            catch(Exception e){
                system.assert(e.getMessage().contains('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, The field should not be empty: [Container__c]'));
                 }
     
        }
        
        @isTest
        public static void testNegative(){
            Account  accNew = [Select Name, id from Account]; 
            Container__c contNew =[Select id from  Container__c];
            Contact conNew =[Select LastName, id from Contact];
            Car__c carNew = [Select name, id from Car__c];
            List<Car_Part__c> carP=new List<Car_Part__c>();
            carP.add(new Car_Part__c(Car__c=carNew.Id, Container__c=contNew.Id));
            try{
            insert carP;
            }
            catch(Exception e){
               system.assert(e.getMessage().contains('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, You can\'t choose the container: [Container__c]')); 
               
            }
            
        }
      
    }
