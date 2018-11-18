public with sharing class AppService {
    @AuraEnabled
    public static String getAppName() {
        AppDefinition app = getActiveApp();
        return app.Label;
    }

    private static AppDefinition getActiveApp() {
        UserAppInfo userAppInfo = [SELECT Id, AppDefinitionId FROM UserAppInfo WHERE UserId = :UserInfo.getUserId() LIMIT 1];
        AppDefinition appDefinition = [SELECT DurableId, Label FROM AppDefinition Where DurableId = :userAppInfo.AppDefinitionId LIMIT 1];
        return appDefinition;
    }
}