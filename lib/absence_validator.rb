class AbsenceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)  
    record.errors.add(attribute, options[:message] || :absence) unless value.blank?
  end
end
