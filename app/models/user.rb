class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable
  enum tipo: [:admin, :professor, :aluno]

  validates :email, presence: true        
  validates :username, length: { maximum: 20 }
  validates :nome, presence: true, length: { maximum: 50 }
  validates :responsavel, presence: true, length: { maximum: 50 }
  validates :telefone, length: { maximum: 15 }
  validates :minicv, length: { maximum: 5000 }
  validates :tipo, presence: true  
  
end
