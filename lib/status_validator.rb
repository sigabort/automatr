class StatusValidator < ActiveModel::EachValidator
  
  STATUS_LIST = %w{Active Pending Deleted Suspended}
  
  #
  def validate_each(record, attribute, value)
    if !value.nil? and value.size > 20
      record.errors[attribute] << (options[:message] || " exceeds maximum size") 
    end
    unless value.nil? or STATUS_LIST.include?(value)
      record.errors[attribute] << (options[:message] || "is not valid") 
    end
    
  end
  
end
