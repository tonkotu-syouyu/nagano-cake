class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

   def active_for_authentication?
       super && (is_deleted == false)
   end

   validates :last_name,  presence: true
   validates :first_name, presence: true
   validates :last_name_kana,  presence: true
   validates :first_name_kana, presence: true
   validates :telephone_number, presence: true
   validates :postal_code,  presence: true
   validates :address, presence: true
  
  # 住所自動入力(記述間違えてるかもです)
  # include JpPrefecture
  # jp_prefecture :address

  # def address

  # JpPrefecture::Address.find(code: address).try(:name)

  # end

  # def address=(prefecture_name)
  #   self.address = JpPrefecture::Address.find(name: address).code

  # end
  
  def self.looks(searches, words)
    if searches == "perfect_match"
      @customer = Customer.where("name LIKE ?", "#{words}")
    else
      @customer = Customer.where("name LIKE ?", "%#{words}%")
    end
  end

end
