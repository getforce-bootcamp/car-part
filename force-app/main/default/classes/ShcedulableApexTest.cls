@isTest
public with sharing class ShcedulableApexTest {
    @isTest public static void test(){
        // List<Finance_Transaction__c> finTrans=[Select id,contact__c,amount__c,type__c from Finance_Transaction__c];
        
        List<Contact> conMaster=new List<Contact>();
        conMaster.add(new contact(lastname='Master',position__c='Master'));
        conMaster.add(new contact(lastname='Driver',position__c='Driver'));
        
        insert conMaster;
        Contact conMas=[Select id,position__c,lastName from Contact where position__c='Master'];
        Contact conDr=[Select id,position__c,lastName from Contact where  position__c='Driver'];
        list<Car__c> cars= new list<Car__c>();
        
         for(integer i=0;i<=30;i++){
                car__c c= new car__c(name='Tesla'+i,Master__c=conMas.id,driver__c=conDr.Id,
                                     Dismantled_Date__c=date.newInstance(2022, 09, 08),Is_Dismantled__c=true);
                
                
                cars.add(c);
            }
        
        insert cars;
       // list<Car__c> carsTest=[Select id,name from car__c where name like 'Tesla%'];
       // System.assertEquals(0,finTrans.size());
        
        String CRON_EXP = '0 0 1 * * ?';     
        Test.startTest();
        String jobId=System.schedule('Project Test',CRON_EXP, new ShcedulableApex ());
        Test.stopTest();
        List<Finance_Transaction__c> finTr=[Select id,contact__c,amount__c,type__c from Finance_Transaction__c where contact__c=:conMas.Id];
        
        System.assertEquals(1,finTr.size());
       
       
 }
}
