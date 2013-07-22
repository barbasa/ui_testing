class JobsHomePageBR < JobsHomePage

  direct_url "#{BR_BASE_URL}"
  expected_title "Empregos em S\u00e3o Paulo, Brasil &amp; Al\u0039m | Adzuna"

  category_tags.each { |category_tag|
      link_name = category_tag.gsub("-","_")
      link link_name, :xpath => "//div[@class='modal_links']//a[@href='#{BR_BASE_URL}browse/#{category_tag}']"
  }

end
