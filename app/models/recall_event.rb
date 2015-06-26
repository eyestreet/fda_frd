#
class RecallEvent
  include Mongoid::Document

  # City
  field :city, type: String

  # Classification
  field :classification, type: String

  # Code Info and Code Info Continued
  field :code_info, type: String

  # Country
  field :country, type: String

  # Distribution Pattern
  field :distribution_pattern, type: String

  # Event ID
  field :event_id, type: Integer

  # Initial Firm Notification of Consignee or Public
  field :initial_firm_notification, type: String

  # Voluntary/Mandated
  field :initiated_by, type: String

  # Product Description
  field :product_description, type: String

  # Product Quantity
  field :product_quantity, type: String

  # Product Type
  field :product_type, type: String

  # Reason for Recall
  field :reason_for_recall, type: String

  # Recall Initiation Date
  field :recall_initiation_date, type: Date

  # Recall Number
  field :recall_number, type: String

  # Recalling Firm
  field :recalling_firm, type: String

  # Report Date
  field :report_date, type: Date

  # State
  field :state, type: String

  # Status
  field :status, type: String
end
