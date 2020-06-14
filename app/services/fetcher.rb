class Fetcher
  require 'csv'
  def self.fetch_genders
    return CSV.read("#{Rails.root}/db/import/gender_list.csv")
  end
end
