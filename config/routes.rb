Rails.application.routes.draw do
  root to: redirect("/resque_web")
  mount ResqueWeb::Engine => "/resque_web"
end
