class Private::Message < ApplicationRecord
    self.table_name = 'private_messages'
    belongs_to :user
    belongs_to :conversation, class_name: 'Private::Conversation', foreign_key: :conversation_id

    default_scope -> {order(created_at: :asc)}

    validates :content, presence: true, length: {maximum: 200}
end
