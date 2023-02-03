module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user!
    end

    private

    def find_verified_user!
      # 本来はcookieなどを使い接続してきたクラウアントのユーザーを検索するが
      # 今回は動作確認したいだけなのでランダムでユーザーを1人返す
      User.all.sample
    end
  end
end