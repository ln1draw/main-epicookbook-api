class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  skip_before_filter :verify_authenticity_token, 
                     :if => Proc.new { |app|
                       app.request.headers['X-XSRF-TOKEN'] == form_authenticity_token
                     }

   before_filter :set_xsrf_cookie

   def set_xsrf_cookie
     cookies['XSRF-TOKEN'] = {
       value: form_authenticity_token,
       expires: 1.hour.from_now
     }
   end
end
