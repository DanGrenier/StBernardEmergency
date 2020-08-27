class DiagnosticProcedure < ApplicationRecord
	belongs_to :patient

	#Make sure we have a timestamp
	validates :moment, presence: true
	#Make sure the user enters a description
  validates :description, presence: true

  #Method that formats a single Diagnostic procedure
  #for human reading purposes
	def description_and_time
    "#{self.description} #{I18n.t(:preposition_on)} #{I18n.l(self.moment,format: :date_long)} #{I18n.t(:preposition_at)} #{I18n.l(self.moment,format: :time_only)}"
	end

end