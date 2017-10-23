class Evento < ApplicationRecord
    mount_uploader :images, ImagesUploader
    has_one :user

    validates :titulo, presence: true, length: { maximum: 100 }
    validates :descricao, presence: true, length: { maximum: 255 }
    validates :local, presence: true, length: { maximum: 100 }
    validates :data, presence: true
    validates :usuario_id, presence: true
end
