class Category < ActiveRecord::Base
  require 'psych'
  self.table_name = 'Category'

  def self.get_all
    categories = self.find_all_by_context('jobs');
  end

  def self.get_label_from_tag tag
    tag_to_label = Psych.load_file('./lib/DB/tag_to_label.yaml')
    label = tag_to_label['category'][tag]
  end

  def self.get_all_tags country_code
    categories = self.find_all_by_context('jobs');
    
    tags = []
    categories.each do |category|
        tags.push(category["tag_"+country_code])
    end
    tags
  end
end
