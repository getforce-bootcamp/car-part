public with sharing class CarTriggerHandler extends TriggerHandler {

    private List<Car__c> newCarList;
    private List<Car__c> oldCarList;
    private Map<Id, Car__c> newCarMap;
    private Map<Id, Car__c> oldCarMap;

    public CarTriggerHandler() {
        this.newCarList = (List<Car__c>) Trigger.new;
        this.oldCarList = (List<Car__c>) Trigger.old;
        this.newCarMap = (Map<Id, Car__c>) Trigger.newMap;
        this.oldCarMap = (Map<Id, Car__c>) Trigger.oldMap;
    }
    public override void beforeInsert() {
        CarService.updateDismantle(newCarList);
        CarService.calculateComission(newCarList);

    }
    public override void beforeUpdate() {
        CarService.updateDismantle(newCarList);
        CarService.calculateComission(newCarList);
        CarService.calculateStorageCost(newCarList);

    }
}
