<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Automatic_Email_Alert_To_Contributer</fullName>
        <ccEmails>rakeshk@optimizeitsystems.com</ccEmails>
        <description>Automatic Email Alert To Contributer</description>
        <protected>false</protected>
        <recipients>
            <field>Email_ID__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Invoice</template>
    </alerts>
    <fieldUpdates>
        <fullName>Email_Update</fullName>
        <field>Email_ID__c</field>
        <formula>Contributor_ID__r.Email_ID__c</formula>
        <name>Email Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updating_Contrib_Event_Field</fullName>
        <field>Contrib_Event_Field__c</field>
        <formula>Con_Id__c + Eve_Id__c</formula>
        <name>Updating Contrib Event Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updation_of_Id_Field</fullName>
        <field>Con_Id__c</field>
        <formula>Contributor_ID__r.Name</formula>
        <name>Updation of  con Id Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>updation_of_eve_Id_field</fullName>
        <field>Eve_Id__c</field>
        <formula>Event_ID__r.Name</formula>
        <name>updation of eve Id field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Checking Duplicacy</fullName>
        <actions>
            <name>Updating_Contrib_Event_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event_Relationship__c.Con_Id__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Event_Relationship__c.Eve_Id__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email  checking Rule</fullName>
        <actions>
            <name>Automatic_Email_Alert_To_Contributer</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event_Relationship__c.Email_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Id Field Updation</fullName>
        <actions>
            <name>Updation_of_Id_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>updation_of_eve_Id_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contributor__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Event__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Field Rule</fullName>
        <actions>
            <name>Email_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contributor__c.Email_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Event_Relationship__c.Contributed_Money__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
