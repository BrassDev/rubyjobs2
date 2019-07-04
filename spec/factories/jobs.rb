FactoryBot.define do
  factory :job do

    trait :new_from_form do
      company {"Google"}
      email { "me@google.com" }
      type_id { Type.find_by_name("Permanent").id }
      location_id { Location.find_by_name("Galway").id }
      title { "A new job" }
      description { "Tis a grand job" } 
      how_to_apply { "Just phone" }
      url { "google.com" }
    end

    trait :with_key do
      company {"Google"}
      email { "me@google.com" }
      type_id { Type.find_by_name("Permanent").id }
      location_id { Location.find_by_name("Galway").id }
      title { "A new job" }
      description { "Tis a grand job" } 
      how_to_apply { "Just phone" }
      url { "google.com" }
      key { "#{SecureRandom.hex(8)}" }
    end

    
  end
end
