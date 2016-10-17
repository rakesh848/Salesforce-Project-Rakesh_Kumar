//Test Class for ContributerList Apex Class which is used by Event_Details Visualforce page
@isTest
public class ContributerTest {
     public testMethod static void myTest()
     {
     //Manually insertion of data into Event__c.
        Event__c event= new Event__c();
        event.Amount__c=1000;
        event.Event_Name__c='party';
        insert event;
       
            ContributerList contrib= new ContributerList (new ApexPages.StandardController(event));
        
            List<Event_Relationship__c > returnlist = new List<Event_Relationship__c >();
            returnlist = contrib.eventrelationmethod();
        
    }


}