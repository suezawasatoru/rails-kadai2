class Room < ApplicationRecord
  
  belongs_to :user
  has_many :reservations
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :introduction, presence: true
  validates :adress, presence: true
  validate :price_value



def price_value
  if price.blank? 
    errors.add(:price, "を入力して下さい")
  elsif price == 0
    errors.add(:price, "を1円以上にして入力して下さい")
  end
end  

def self.search(search)
  if search 
   Room.where(['name LIKE(?) OR introduction LIKE(?)', "%#{search}%", "%#{search}%"]) 
  else
   Room.all 
  end
end

 def self.searcharea(search)
  if search  
    Room.where('adress LIKE(?)', "%#{search}%")
   end
 end

end