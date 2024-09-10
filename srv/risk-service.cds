using { riskmanagement as rm } from '../db/schema';

@path : 'service/risk'
service RiskService
{
    @odata.draft.enabled
    entity Risks @(restrict: [
        {
            grant: 'READ',
            to   : 'RiskViewer'
        },
        {
            grant: [
                'READ',
                'WRITE',
                'UPDATE',
                'UPSERT',
                'DELETE'
            ], // Allowing CDS events by explicitly mentioning them
            to   : 'RiskManager'
        } ]) as projection on rm.Risks;

    @odata.draft.enabled
    entity Mitigations @(restrict: [
        {
            grant: 'READ',
            to   : 'RiskViewer'
        },
        {
            grant: '*', // Allow everything using wildcard
            to   : 'RiskManager'
        }
    ]) as projection on rm.Mitigations;

    @readonly
    entity BusinessPartners as
        projection on rm.BusinessPartners;

}
