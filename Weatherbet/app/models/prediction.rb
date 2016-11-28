class Prediction < ApplicationRecord
  belongs_to :location
  belongs_to :user
  belongs_to :report

  def self.check(p)
  	if p.report_id; return p.report_id end

  	Report.where(location: p.location).each do |r|
      sINr =(r.start < p.start and p.start < r.end)
      eINr =(r.start < p.end and p.start < r.end)

      thisReportConfirmsPrediction = sINr or eINr
      
      if thisReportConfirmsPrediction
        p.report_id = r.id
        p.save
        return p.report_id 
      end

    end #end Report.wher... do |r|

    return nil
  end # end check

end
