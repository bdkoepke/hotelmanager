class PriceValidator < ActiveModel::EachValidator
  # validates prices up to $9999.99
  def validate_each(record, attribute, value)
    if (value != nil  &&( value < 0.01 || value >= 10000))
      record.errors[attribute] << "Invalid price, must be greater than or equal to $0.01 and less than $10,000"
    end
  end
end
