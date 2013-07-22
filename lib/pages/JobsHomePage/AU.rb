class JobsHomePageAU < JobsHomePage

  direct_url "#{AU_BASE_URL}"
  expected_title "Jobs in Sydney, Melbourne and Beyond | Adzuna"

  category_tags.each { |category_tag|
      link_name = category_tag.gsub("-","_")
      link link_name, :xpath => "//div[@class='modal_links']//a[@href='#{AU_BASE_URL}browse/#{category_tag}']"
  }

end
