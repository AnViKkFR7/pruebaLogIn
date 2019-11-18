class SessionsController < ApplicationController
  
  def create
      auth = request.env["omniauth.auth"] #guarda la response del login con el facebook
      session[:omniauth] = auth.except('extra') #Para coger de la sesion solo lo importante
      user = User.sign_in_from_omniouth(auth) #se ha de crear en el user model
      session[:user_id] = user.id #hacemos una sesion con el usuario logeado
      redirect_to root_url, notice: "SIGNED IN"
  end
  
  def destroy
      session[:user_id] = nil
      session[:omniauth] = nil
      redirect_to root_url "SIGNED OUT"
  end
  
end
