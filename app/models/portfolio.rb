class Portfolio < ApplicationRecord


  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on rails')}


  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x300"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end


end
