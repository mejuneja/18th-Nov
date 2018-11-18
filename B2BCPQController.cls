public class B2BCPQController {

    @AuraEnabled
    public static User getCurrentUser() {
        Id userId = UserInfo.getUserId();
        return [SELECT Id, Name FROM User WHERE Id = :userId];
    }

	@AuraEnabled
    public static b2bcpq_Quote__c getQuoteDetails(Id quoteId) {
		return [
			SELECT
				Business_Segment__c,
				CreatedById,
				CreatedDate,
				Customer__c,
				Customer_ID__c,
				Id,
				IsDeleted,
				LastActivityDate,
				LastModifiedById,
				LastModifiedDate,
				//LastReferencedDate,
				//LastViewedDate,
				MG2__c,
				Name,
				//OwnerId,
				PQR__c,
				PQR_Number__c,
				PQR_Year__c,
				Price_Effective_As_Of__c,
				Pricing_Analyst__r.Name,
				Primary_Marketing_Manager__r.Name,
				Pricing_Bemis_Parent_Name__c,
				Quote_ID__c,
				Quote_Product_Count__c,
				Quote_Request_Received__c,
				Quote_Round__c,
				Quote_Round_Auto_Number__c,
				Status__c,
				Market_Reference__c
			FROM
				b2bcpq_Quote__c
			WHERE
				Id = :quoteId
		];
    }

	@AuraEnabled
    public static Material__c getNewMaterial() {
        Material__c newMaterial = new Material__c();
		insert newMaterial;
		return newMaterial;
    }
}