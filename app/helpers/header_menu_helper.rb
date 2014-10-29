module HeaderMenuHelper
  def admin_menus
    {
      list: [
        ["list.users", ->{admin_users_path}, {}],
        ["list.auction_items", ->{admin_auction_items_path}, {}],
        ["list.charge_logs", ->{admin_charge_logs_path}, {}],
        ["list.pricing_plays", ->{admin_pricing_plays_path}, {}],
      ],
      create_new: [
        ["create_new.users", ->{new_admin_user_path}, {}],
        ["create_new.auction_items", ->{new_admin_auction_item_path}, {}],
      ],
      user_name: [
        ["user_name.sign_out", ->{destroy_admin_session_path}, {}]
      ],
    }
  end
end
