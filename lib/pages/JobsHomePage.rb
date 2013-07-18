class JobsHomePage
  include PageObject
 
  text_field :search_box, :id => 'w'
  a :search, :class => 'subm'
  a :show_categories, :id => 'trigger_categories'
  div :category_list, :class => 'hc'

  ###### Class methods
  def self.country_code
    class_name = self.name
    class_name[-2,2].downcase
  end

  def self.category_tags
    Category.get_all_tags self.country_code
  end

  ###### Instance methods
  def categories
    Category.get_all
  end

  def search_for search_term
    self.search_box = search_term
    search
  end

  def go_to_browse_page(category,cc)
    category_tag = category["tag_"+cc]
    category_link = category_tag.gsub("-","_")
    return send(category_link)
  end

end
