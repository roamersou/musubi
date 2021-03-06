class User < ApplicationRecord
    has_many :thanksletters, dependent: :destroy
    has_many :payforwards, dependent: :destroy
    has_many :give_mes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :tl_comments, dependent: :destroy
    has_many :gy_comments, dependent: :destroy
    has_many :private_messages, class_name: 'Private::Message', dependent: :destroy
    has_many  :private_conversations, foreign_key: :sender_id, class_name: 'Private::Conversation', dependent: :destroy
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    mount_uploader :picture, PictureUploader
    validates :name, presence: true, length:{maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length:{maximum: 255},
               format: { with: VALID_EMAIL_REGEX },
               uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length:{minimum:6}, allow_nil: true
    # validates :self_intro, length:{maximum: 150}
    validate :picture_size

    # fixture向けのdigestメソッド追加
    # 渡された文字列のハッシュ値を返す
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # ランダムなトークンを返す
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    # 永続セッションのためにユーザーをデータベースに記憶する
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    #  渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    #  ユーザーのログイン情報を破棄する
    def forget
      update_attribute(:remember_digest, nil)
    end

    private

      # アップロードされた画像のサイズをバリデーションする
      def picture_size
        if picture.size > 5.megabytes
          errors.add(:picture, "5MB以下でお願いします")
        end
      end
end
