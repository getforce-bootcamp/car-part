public with sharing class CarService {
    public static void aprovalProcess( List<Car__c> carList, Map<Id,Car__c> carMap, Map<Id,Car__c> newMap){
        for(Car__c c:carList){
            if (carMap.get(c.id).status__c=='In The Yard' && newMap.get(c.id).status__c=='Dismantling') {
                        Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
                        req.setComments('Approving request for approvals  using Trigger');
                        req.setObjectId(c.Id);
                        req.setNextApproverIds(new Id[]{
                               UserInfo.getUserId()
                        });
                        Approval.ProcessResult result = Approval.Process(req);
        }
         }
    }

}
