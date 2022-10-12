@isTest(SeeAllData=false)
private class ContainerServicerTest {

    @isTest
    static void ContainerTrigger(){
        
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
      Car__c carNew = [Select id from Car__c];
        
      List<Car_Part__c> cpList = new List<Car_Part__c>();
        for(integer i = 0;i<10;i++) {
            Car_Part__c cp = new Car_Part__c(Car__c = carNew.Id,Container__c = cont.Id,
                                       Is_Sold__c = true,Is_Export__c = true,Price__c = 7878,Weight__c = 123);
            cpList.add(cp);
        }
      insert cpList;
        
      cont.Status__c = 'Loading';
      update cont;
        
      Container__c newCont = [Select Shipping_Price__c,  Weight__c from Container__c];
        
      system.assertEquals(78780, newCont.Shipping_Price__c);
      system.assertEquals(1230, newCont.Weight__c);
    }
}

