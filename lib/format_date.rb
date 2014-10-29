class Time
  def time_to_date format = "%Y-%m-%d"
    self.to_date.strftime(format)
  end
end
