class Url < ActiveRecord::Base
  belongs_to :email
  validates :long_url, presence: true
  validates_format_of :long_url, :with => URI::regexp(%w(http https)), :message => '(original URL) is not valid'
  before_create :set_invitation_code

  private

  def make_invitation_code(a)
    r = ''
    5.times{|i| r << a[Kernel.rand(62)]}
    r
  end

  def set_invitation_code
    an = %w{0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z}
    existing = Url.all.collect{|r| r.short_url}
    r = make_invitation_code(an)
    while existing.include?(r)
      r = make_invitation_code(an)
    end
    self.short_url = r
  end

end
