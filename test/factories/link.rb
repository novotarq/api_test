FactoryGirl.define do
  factory :link do
    url 'http://google.com'
    page { create(:page) }
  end
end
