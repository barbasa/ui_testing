class JobStatsRegionaloverviewUK < JobStats

  direct_url "#{UK_BASE_URL}jobs/get_stats?data_set=Regionaloverview&months=6"

  def get_not_found_string
    'Page not found'
  end

end
