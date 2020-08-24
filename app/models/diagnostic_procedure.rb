class DiagnosticProcedure < ApplicationRecord
	belongs_to :patient

	def description_and_time
    "#{self.description} #{I18n.t(:preposition_on)} #{I18n.l(self.moment,format: :date_long)} #{I18n.t(:preposition_at)} #{I18n.l(self.moment,format: :time_only)} "
	end

end