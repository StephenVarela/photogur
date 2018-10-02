class Picture < ApplicationRecord


  validates :artist, presence: true
  validates :title, length: { maximum: 20}
  validates :title, length: { minimum: 3}
  validates :url, presence: true
  validates :url, uniqueness: true


  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_month_before
    number_of_days = 30 #change this value to see query work for a sooner time for testing
    Picture.where("created_at < ?", (Time.now-60*60*24*number_of_days))
  end

  def self.pictures_created_in_year(year)
    Picture.where("created_at <= ? AND created_at > ?", Time.new(year.to_i+1), Time.new(year.to_i))
  end

end
