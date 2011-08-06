class User
  # Class Configuration :::::::::::::::::::::::::::::::::::::::::::::
  include MongoMapper::Document
  devise :authenticatable, :recoverable, :rememberable

  # Attributes ::::::::::::::::::::::::::::::::::::::::::::::::::::::
  key :email,  String
  key :username,  String
  key :comment_count, Integer
  key :encrypted_password, String
  key :password_salt, String
  key :reset_password_token, String
  key :remember_token, String
  key :remember_created_at, Time
  key :sign_in_count, Integer
  key :current_sign_in_at, Time
  key :current_sign_in_ip, String  
  timestamps!
  
  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  RegEmailName   = '[\w\.%\+\-]+'
  RegDomainHead  = '(?:[A-Z0-9\-]+\.)+'
  RegDomainTLD   = '(?:[A-Z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  RegEmailOk     = /\A#{RegEmailName}@#{RegDomainHead}#{RegDomainTLD}\z/i
  
  validates_length_of :email, :within => 6..100, :allow_blank => true
  validates_format_of :email, :with => RegEmailOk, :allow_blank => true

  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  many :comments

end