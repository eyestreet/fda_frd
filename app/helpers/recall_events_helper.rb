#
module RecallEventsHelper
  def classification_class(recall_event)
    case recall_event.classification
    when 'Class I'
      'danger'
    when 'Class II'
      'warning'
    when 'Class III'
      'info'
    end
  end
end
