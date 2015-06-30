#
class RecallEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  CLASSIFICATION_TYPES = ['Class I', 'Class II', 'Class III']

  STATUS_TYPES = ['Completed', 'Ongoing', 'Terminated']

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

  embeds_many :locations, as: :locatable

  index 'locations.coordinates': '2d'
  index classification: 1

  # index({ event_id: 1,  recall_number: 1 }, { unique: true })

  validates :classification, :code_info, :distribution_pattern, :event_id, :initiated_by, :product_description, :product_type,
            :recall_number, :recalling_firm, :status,
            presence: true

  # See https://api.fda.gov/food/enforcement.json\?\&count\=classification.exact
  validates :classification, inclusion: { in: CLASSIFICATION_TYPES }

  # See https://api.fda.gov/food/enforcement.json\?\&count\=status.exact
  validates :status, inclusion: { in: STATUS_TYPES }

  scope :class_one, -> { where classification: CLASSIFICATION_TYPES[0] }
  scope :class_two, -> { where classification: CLASSIFICATION_TYPES[1] }
  scope :class_three, -> { where classification: CLASSIFICATION_TYPES[2] }

  paginates_per 10
end
