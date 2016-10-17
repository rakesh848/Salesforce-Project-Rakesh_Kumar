// Fetching data(Contributed Money,Contributer Name etc.)  from the Event_ID__c in Event_Relationship__c object and Contributer__c object.
public with sharing class ContributerList{
    public Event__c eventobj{get;set;}
    public List<Event_Relationship__c>everel{get;set;}
  //Constructor 
    public ContributerList(ApexPages.StandardController controller) {
        eventobj= (Event__c)controller.getRecord();
        everel= eventrelationmethod();
    }
    //Populating the LIST for the specified ID that is  fetched by getRecord()
    public List<Event_Relationship__c>eventrelationmethod(){
        return [Select Contributed_Money__c,Contributor_ID__r.First_Name__c from Event_Relationship__c where Event_ID__c =: eventobj.Id];
    }
}