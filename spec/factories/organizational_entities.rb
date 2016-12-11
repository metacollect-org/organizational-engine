FactoryGirl.define do
  factory :organizational_entity, class: 'Organizational::Entity' do
    factory :prosper do
      name 'Prosper'
      url 'http://prosper.community'
      logo 'http://prosper.community/assets/logo.png'
    end

    factory :ic do
      name 'Info-Compass'
      url 'http://info-compass.net'
      logo ''
    end
  end
end
