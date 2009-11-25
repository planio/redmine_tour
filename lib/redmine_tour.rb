module RedmineTour
  def self.tour_name_from_params(params)
    "#{params[:controller]}_#{params[:action]}".downcase
  end
end