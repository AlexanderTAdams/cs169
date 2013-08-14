class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_similar(director)
    Movie.find_all_by_director(director)
  end
  #////////////////////////////////////////9-13-13
  #@all_ratings = ['G', 'PG', 'PG-13', 'R']

  # def self.get_all_ratings
  #  @@all_ratings
  #end
  #////////////////////////////////////////
end
