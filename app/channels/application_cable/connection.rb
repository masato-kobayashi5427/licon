module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user!
    end

    private
    def find_verified_user!
      # User[session.values[1]]
      # puts User.all[session.values[1]]
      User.all[(cookies.encrypted[:_session_id]["user_id"] -1)]
    end
  end
end