require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  belongs_to :user, dependent: :destroy

end
