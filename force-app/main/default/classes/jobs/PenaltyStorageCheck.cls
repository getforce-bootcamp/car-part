global class PenaltyStorageCheck implements Schedulable {
    global void execute(SchedulableContext sc){
        AggregateResult[] cars = [select sum(Penalty_Cost__c)penaltycost,sum(Storage_Cost__c)storagecost from car__c];
        Object penaltySum = cars[0].get('penaltycost');
        Object storageSum = cars[0].get('storagecost');
        
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        List<String> address = new List<String>{'CEO@gmail.com'};
            
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Weekly Penalty and Storage payments check');
        mail.setplaintextbody('Penalty Pyaments: ');
        mail.setToAddresses(address);
        emailList.add(mail);
        
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }
    }
}
