class Category
  require 'psych'
  require 'csv'

  def initialize(row)
    @data = {
        "id" => row[0],
        "context" => row[1],
        "description" => row[2],
        "label" => row[3],
        "tag_uk" => row[4],
        "tag_de" => row[5],
        "tag_ca" => row[6],
        "tag_za" => row[7],
        "tag_br" => row[8],
        "tag_au" => row[9],
        "keywords" => row[10],
        "default_search" => row[11],
    }
  end

  def tag_de
    return @data["tag_de"]
  end

  def tag_uk
    return @data["tag_uk"]
  end

  def [](attr_name)
    return @data[attr_name]
  end

  def self.get_all
    categories = []
    CSV.foreach("./lib/DB/categories.csv") do |row|
        categories.push Category.new(row)
    end
    return categories
  end

  def self.get_label_from_tag tag
    tag_to_label = Psych.load_file('./lib/DB/tag_to_label.yaml')
    label = tag_to_label['category'][tag]
  end

  def self.get_all_tags country_code
    categories = self.get_all;

# <Category id: 13, context: "jobs", description: "Admin / clerical / secretarial", label: "Admin Jobs", tag_uk: "admin-jobs", tag_de: "verwaltungsstellen", tag_ca: "admin-jobs", tag_za: "admin-jobs", tag_br: "vagas-administracao", tag_au: "admin-jobs", keywords: "Admin jobs", default_search: "admin">]
    
    tags = []
    categories.each do |category|
        tags.push(category["tag_"+country_code])
    end
    tags
  end
end
