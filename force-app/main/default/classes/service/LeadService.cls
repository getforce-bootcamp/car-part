public with sharing class LeadService {
    /**
     * Web to Lead Form
  
     * @author Begimai Akulova
     */
    public static void triggerTest(List <Lead> leadList){
        for(Lead l:leadList){
            if(l.LeadSource=='Web'){
                
                //We instantiate our single email message object
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                
                // Strings to hold the email addresses to which you are sending the email.
                List<String> toAddresses = new List<String> {'begimai.akulova@gmail.com'};
                    //Assign the TO address to our mail object
                    mail.setToAddresses(toAddresses);
                
                // Set the subject line for your email address.
                mail.setSubject('Can you dig it?');
                
                // You can specify your plain text here
                mail.setPlainTextBody('Yes we can');
                
                //Specify any html - for example this will display a link in the email
                mail.setHtmlBody('Yes we can');
                
                // Send the email
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
        }
    }
}
