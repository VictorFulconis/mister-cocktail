class Ingredient < ActiveRecord::Base
  has_many :doses
  before_destroy :check_dose
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true

  def check_dose
    if doses.count > 0
      errors.add_to_base("cannot delete ingredient while doses exist")
      return false
    end
  end
end

# dependent: :restrict_with_exception
