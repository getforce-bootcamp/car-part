global  class CarNotPaid implements Schedulable {
    global void execute(SchedulableContext sc){
        
        List<Car__c> cars = [select createdDate, Is_Paid__c, Is_Picked_Up__c from car__c];
        
        for (Car__c car : cars) {
            Date cd = date.valueOf(car.CreatedDate);
            
            if((car.Is_Paid__c == false && cd.daysBetween(date.today()) == 3)) {
                
                List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
                List<String> address = new List<String>{'manager@gmail.com'};
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSubject('Car is not paid yet');
                mail.setplaintextbody(' The Car has not been paid for 3 days ');
                mail.setToAddresses(address);
                emailList.add(mail);
                
                if(!emailList.isEmpty()){
                    Messaging.sendEmail(emailList);
                }   
            }  else if (car.Is_Picked_Up__c == false && cd.daysBetween(date.today()) == 2) {
                List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
                List<String> address = new List<String>{'driver@gmail.com'};
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSubject('Car is taken from the yard');
                mail.setplaintextbody(' The Car has not been taken from the yard ');
                mail.setToAddresses(address);
                emailList.add(mail);
                
                if(!emailList.isEmpty()){
                    Messaging.sendEmail(emailList);
                }
            }
        }
    }
}