module HeaderMenuHelper
  def admin_menus
    {
      list: [
        ["list.news", ->{admin_news_index_path}, {}],
        ["list.users", ->{admin_users_path}, {}],
        ["list.login_histories", ->{admin_login_histories_path}, {}],
        ["list.exchanges", ->{admin_exchanges_path}, {}],
        ["list.kitty_words", ->{admin_kitty_words_path}, {}],
        ["list.question_answers", ->{admin_question_answers_path}, {}],
        ["list.common_question_answers", ->{admin_common_question_answers_path}, {}]
      ],
      create_new: [
        ["create_new.news", ->{new_admin_news_path}, {}],
        ["create_new.kitty_words", ->{new_admin_kitty_word_path}, {}],
        ["create_new.users", ->{new_admin_user_path}, {}],
        ["create_new.common_question_answers", ->{new_admin_common_question_answer_path}, {}],
      ],
      user_name: [
        ["user_name.sign_out", ->{destroy_admin_session_path}, {}]
      ],
    }
  end
end
