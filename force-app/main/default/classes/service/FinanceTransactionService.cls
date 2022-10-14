public with sharing class FinanceTransactionService {

    /**
     * Method to update storage cost if finance transaction type is storage
     * 
     * @param newPaymentsList new finance transactions
     * @author AaliAzamatuulu
     */

    public static void storagePaymentTrigger(List<Finance_Transaction__c> newPaymentsList) {
        Map<Id,Car__c> cars = new Map<Id,Car__c>();
        Map<Id,Car__c> carsToUpdate = new Map<Id,Car__c>();
        for (Finance_Transaction__c payment : newPaymentsList) {
            if(payment.Type__c == 'Storage') {
                cars.put(payment.Car__c, null);
            }
        }

        cars.putAll([select storage_cost__c,id from car__c where id in: cars.keySet()]);
        
        for (Finance_Transaction__c payment : newPaymentsList) {
            if(payment.Type__c == 'Storage') {
                Car__c carUpdate = carsToUpdate.get(payment.Car__c);
                if(carUpdate == null) {
                    carsToUpdate.put(payment.Car__c, carUpdate = new Car__c(Id=payment.Car__c));
                }
                carUpdate.Storage_Cost__c = payment.Amount__c;
            }
        }
        
        update carsToUpdate.values();
    }
    public with sharing class FinanceTransactionService { 
        /** 
         * Method update two fields in Cars object when in FinanceTransaction object chosen: 
         *   Type 'Sell' -> 'Amount' from FinanTransaction add to field 'Revenue' in Cars object; 
         * @param financeList  
         * @author Elmira 
         */ 
     
    public static void updateRevenue (List<Finance_Transaction__c> financeList){ 
     
         
            Map<Id,Car__c> cars = new Map<Id,Car__c>(); 
            Map<Id,Car__c> carsToUpdate = new Map<Id,Car__c>(); 
            for(Finance_Transaction__c fin : financeList){ 
                if(fin.Amount__c!=null&& fin.Type__c=='Sell'){ 
                    cars.put(fin.Car__c, null); 
                } 
            } 
            cars.putAll([select Revenue__c,id from car__c where id in: cars.keySet()]); 
            for(Finance_Transaction__c  fin:financeList){ 
                if(fin.Amount__c!=null&& fin.Type__c=='Sell'){ 
                    Car__c carUpdate = carsToUpdate.get(fin.Car__c); 
                    if(carUpdate == null) { 
                            carsToUpdate.put(fin.Car__c, carUpdate = new Car__c(Id=fin.Car__c)); 
                } 
                    carUpdate.Revenue__c = fin.Amount__c; 
                 
            } 
            } 
         
             update carsToUpdate.values(); 
        } 
    }
}
