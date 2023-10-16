class AccessController < ApplicationController
  skip_before_action :confirm_logged_in, only: [:new, :create]
  # before_action :get_user_info_from_session, only: [:menu, :new] PASO AL APPLICATION CONTROLLER ASI LO PUEDO USAR EN OTROS CONTROLLERS

  def menu
    # get_user_info_from_session LO SACO YA QUE LO TENGO EN EL BEFORE ACTION

    # Examples of render options:
    #
    # render('menu')
    #
    # render(plain: "Just render text.")
    #
    # render(html: "<strong>HTML text</strong>")
    #
    # render(json: Task.first)
    #
    # render(xml: ['dog', 'cat', 'mouse'])
    #
    # render(plain: 'OK', status: 200)
    #
    # path_to_404 = Rails.root.join('public', '404.html')
    # render(file: path_to_404)
    #
    # send_file(path_to_404)
    #
    # string = render_to_string(file: path_to_404)
    # logger.debug(string)
  end

  def new
    # get_user_info_from_session LO SACO YA QUE LO TENGO EN EL BEFORE ACTION
    if logged_in?
      redirect_to(menu_path)
    end
  end

  def create
    logger.info("*** Login User #{params[:username]}")

    cookies[:username] = params[:username]
    session[:user_id] = 1483

    flash[:notice] = 'Log in successful'
    redirect_to(menu_path)
  end

  def destroy
    logger.info("*** Logout User #{cookies[:username]}")

    cookies[:username] = nil
    session[:user_id] = nil

    flash[:notice] = 'Logged out'
    redirect_to(login_path)
  end

  # PASO AL APPLICATION CONTROLLER YA LO QUE LO USO EN DOS METODOS

  # private

  # def get_user_info_from_session
  #   @username =  cookies[:username]
  #   @user_id = session[:user_id]
  # end

  # def logged_in?
  #   session[:user_id].present?
  # end
end
