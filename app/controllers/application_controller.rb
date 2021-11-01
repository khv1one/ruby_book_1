class ApplicationController < ActionController::Base
  def hello
    render plain: "¡Hola, mundo!"
  end
end
