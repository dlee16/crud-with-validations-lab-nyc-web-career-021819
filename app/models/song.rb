class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validate :missing_release_year, :future_release_year


  def missing_release_year
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "must have a release year")
    end
  end

  def future_release_year
    if self.release_year.to_i > Time.now.strftime("%Y").to_i
      errors.add(:release_year, "release year can't be in the future")
    end
  end
end
