require 'open-uri'
class Photo < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable  
  has_attached_file :image,
    :default_url   => "/images/rails.png",
    :styles => {
    :thumb=> "100x100#",
    :gallery  => "150x150>" ,
    :avatar =>  "200x200>"},
    :withy => false  
  #使用这个就不能删除图片了
  #validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => [ 'image/gif', 'image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg','image/pjpeg','image/x-png']
  #……………………
 

  attr_accessor :image_url
  before_validation :download_remote_image, :if => :image_url_provided?

  validates_presence_of :image_remote_url, :if => :image_url_provided?, :message => '地址不合法'
  #=============================其他代码=====================
  #=============================删除图片=====================
  def delete_image=(value)
    @delete_image = !value.to_i.zero?
  end

  def delete_image
    !!@delete_image
  end
  alias_method :delete_image?, :delete_image
  before_validation :clear_image

  def clear_image
    self.image = nil if delete_image? && !image.dirty?
  end
  #===============================其他代码===================
  private
  def image_url_provided?
    !self.image_url.blank?
  end

  def download_remote_image
    self.image = do_download_remote_image
    self.image_remote_url = image_url
  end

  def do_download_remote_image
    io = open(URI.parse(image_url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
  rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  end
end