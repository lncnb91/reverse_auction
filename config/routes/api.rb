Rails.application.routes.draw do
  post_to = ->path{post path, to: path.gsub("/", "#")}
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      [
        "question_answers/create",
        "common_question_answers/index",
        "kitties/show",
        "kitties/update",
        "news/index",
        "news/show",
        "sessions/create",
        "users/show",
        "users/update",
        "users/create",
        "users/edit",
        "coin_histories/index",
        "probabilities/show",
        "sanrio_links/index"
      ].each &post_to
    end
  end
end
