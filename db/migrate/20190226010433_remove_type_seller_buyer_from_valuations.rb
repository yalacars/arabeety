class RemoveTypeSellerBuyerFromValuations < ActiveRecord::Migration[5.1]
  def change
   remove_column :valuations, :type_Seller_buyer
  end
end
