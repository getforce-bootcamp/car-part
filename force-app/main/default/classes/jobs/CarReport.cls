global with sharing class CarReport implements Schedulable  {
    global void execute(SchedulableContext sc){
        List <Car__c> carsDismantled=[SELECT Is_Dismantled__c from Car__c WHERE Is_Dismantled__c=True];
        List <Car__c> carsNotDismantled=[SELECT Is_Dismantled__c from Car__c WHERE Is_Dismantled__c=False];
        Integer count1 = carsDismantled.size();
        Integer count2 = carsDismantled.size();
        
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        List<String> address = new List<String>{'begimai.akulova@gmail.com'};
            
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Car Parts Report');
        mail.setplaintextbody('Number of Cars dismantled: '+count1 + 'Number of Cars not dismantled: '+ count2);
        mail.setToAddresses(address);
        emailList.add(mail);
        
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }        
    }
}
