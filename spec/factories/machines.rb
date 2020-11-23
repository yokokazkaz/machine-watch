FactoryBot.define do
  factory :machine do
    name              { 'インクラインベンチA' }
    detail            { 'インクラインベンチAです' }
    association :user

    after(:build) do |machine|
      machine.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
