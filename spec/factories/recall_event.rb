FactoryGirl.define do

  factory :recall_event do
    city "Swainsboro"
    classification "Class I"
    code_info "Lot Code: 130912XHB"
    country "US"
    distribution_pattern "AL, FL, GA and TN"
    event_id 66960
    initial_firm_notification "Telephone"
    initiated_by "Voluntary: Firm Initiated"
    product_description "Heavenly Blue, (Raw milk, salt, culture, coagulant ), Flat Creek Lodge,  367 Bishop Chapel Church Rd, Swainsboro, GA 30401. The raw milk blue cheese is packaged in clear plastic, with sizes ranging from 1/2 lb to whole wheels. "
    product_quantity "203 lbs"
    product_type "Food"
    reason_for_recall "Product was found to be contaminated with Salmonella. "
    recall_initiation_date "2013-11-22T00:00:00.000Z"
    recall_number "F-1437-2014"
    recalling_firm "Flat Creek Farm & Dairy"
    report_date "2014-01-29T00:00:00.000Z"
    state "GA"
    status "Ongoing"
  end

end
