class JobsHomePageCA < JobsHomePage

  direct_url "#{CA_BASE_URL}"
  expected_title "Jobs in Canada &amp; Beyond | Adzuna"

  category_tags.each { |category_tag|
      link_name = category_tag.gsub("-","_")
      link link_name, :xpath => "//div[@class='modal_links']//a[@href='#{CA_BASE_URL}browse/#{category_tag}']"
  }

end
