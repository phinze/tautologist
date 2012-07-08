FactoryGirl.define do
  sequence :class_c_network_cidr do |n|
    div, mod = n.divmod(255)
    "10.#{div}.#{mod}.0/24"
  end

  factory :network do
    cidr { generate(:class_c_network_cidr) }
    name { "#{Faker::Internet.domain_word}_net" }
    description { "Network to #{Faker::Company.bs}" }
    location
  end
end
