class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #Method used in order to retrieve the proper
  #translation for an enum we might want to display
  #This method will be available in all models
  #that inherit from ApplicationRecord
  def self.human_enum_name(enum_name, enum_value)
  	I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
