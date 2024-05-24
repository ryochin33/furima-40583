# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    association :user
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    category_id { 1}
    condition_id { 1 }
    shipping_burden_id { 1 }
    shipping_region_id { 1 }
    shipping_time_id { 1 }
    price { 1000 }
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/item_sample.png'), filename: 'item_sample.png', content_type: 'image/png')
    end
  end
end
