class JobsHomePageZA < JobsHomePage

  direct_url "#{ZA_BASE_URL}"
  expected_title "Jobs in Johannesburg, Cape Town, South Africa &amp; Beyond | Adzuna"

  category_tags.each { |category_tag|
      link_name = category_tag.gsub("-","_")
      link link_name, :xpath => "//div[@class='modal_links']//a[@href='#{ZA_BASE_URL}browse/#{category_tag}']"
  }

end
