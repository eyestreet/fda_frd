#
module RecallEventsHelper
  def classification_class(recall_event)
    case recall_event.classification
    when 'Class I'
      'info'
    when 'Class II'
      'warning'
    when 'Class III'
      'danger'
    end
  end
end
