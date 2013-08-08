class JobsAdvSearch
  include PageObject

  text_field   :all_words,               :id => 'what_wrd_c'
  span         :clear_all_words,         :xpath => "//table[@class='adv']//tr[1]//span[@class='clear_x']"

  text_field   :exact_match,             :id => 'what_ph_c'
  span         :clear_exact_match,       :xpath => "//table[@class='adv']//tr[2]//span[@class='clear_x']"

  text_field   :or_matches,              :id => 'what_or_c'
  span         :clear_or_matches,        :xpath => "//table[@class='adv']//tr[3]//span[@class='clear_x']"

  text_field   :exclude_match,           :id => 'what_excl_c'
  span         :clear_exclude_match,     :xpath => "//table[@class='adv']//tr[4]//span[@class='clear_x']"

  text_field   :include_in_title,        :id => 'what_title_c'
  span         :clear_include_in_title,  :xpath => "//table[@class='adv']//tr[5]//span[@class='clear_x']"

  text_field   :company,                 :id => 'adv_c'

  radio_button :contract_type_permanent, :id => 'adv_contract_type_permanent'
  radio_button :contract_type_contract,  :id => 'adv_contract_type_contract'
  link         :clear_contract_type, :xpath => "//table[@class='adv']//tr[8]//a[@href='#']"

  radio_button :contract_time_full_time, :id => 'adv_contract_time_full_time'
  radio_button :contract_time_part_time, :id => 'adv_contract_time_part_time'
  link         :clear_contract_time, :xpath => "//table[@class='adv']//tr[9]//a[@href='#']"

  radio_button :freshness_1,             :id => 'adv_freshness_1'
  radio_button :freshness_3,             :id => 'adv_freshness_3'
  radio_button :freshness_7,             :id => 'adv_freshness_7'

  select_list :distance,                 :id => 'adv_dist'
  text_field  :location,                 :id => 'adv_l'

  select_list :per_page,                 :id => 'adv_per_page'

  select_list :sorting,                  :id => 'sorting'


  a :search, :class => 'btn'

  def search_for criteria

    if criteria[:all_words].upcase != 'OFF'
        self.all_words = criteria[:all_words]
    else
        clear_all_words_element.click if clear_all_words?
    end

    if criteria[:exact_match].upcase != 'OFF'
        self.exact_match = criteria[:exact_match]
    else
        clear_exact_match_element.click if clear_exact_match?
    end

    if criteria[:or_matches].upcase != 'OFF'
        self.or_matches = criteria[:or_matches]
    else
        clear_or_matches_element.click if clear_or_matches?
    end

    if criteria[:exclude_match].upcase != 'OFF'
        self.exclude_match = criteria[:exclude_match]
    else
        clear_exclude_match_element.click if clear_exclude_match?
    end

    if criteria[:include_in_title].upcase != 'OFF'
        self.include_in_title = criteria[:include_in_title]
    else
        clear_include_in_title_element.click if clear_include_in_title?
    end

    if criteria[:company].upcase != 'OFF'
        self.company = criteria[:company]
    end

    if criteria[:hours].eql? "parttime"
        select_contract_time_part_time
    elsif criteria[:hours].eql? "fulltime"
        select_contract_time_full_time
    else
        clear_contract_time if clear_contract_time?
    end

    if criteria[:contract_type].eql? "permanent"
        select_contract_type_permanent
    elsif criteria[:contract_type].eql? "contract"
        select_contract_type_contract
    else
        clear_contract_type if clear_contract_type?
    end

    case criteria[:freshness_days].to_i
        when 1
            select_freshness_1
        when 3
            select_freshness_3
        when 7
            select_freshness_7
        else
    end

    dist_radious = criteria[:radious].to_i
    if [5,10,25,50,100].include?(dist_radious)
        self.distance = self.get_distance_label dist_radious
        self.location = criteria[:location]
    end

    per_page = criteria[:per_page].to_i
    if [10,25,50].include?(per_page)
        self.per_page = criteria[:per_page]
    end

    sorting_label = self.get_sorting_label criteria[:sorting]
    if sorting_label
        self.sorting = sorting_label
    end

    search
  end

  def get_distance_label dist_radious
    "within #{dist_radious} miles of"
  end

  def get_sorting_label sorting
    tag_to_label = {
        'relevant' => 'Most relevant',
        'recent'   => 'Most recent',
        'salary_h' => 'Highest salary',
        'salary_l' => 'Lowest salary'    
    }
    tag_to_label[sorting]
  end
  
end
