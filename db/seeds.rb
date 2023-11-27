# ユーザーのテストデータ
5.times do |i|
  User.create!(
    name: Faker::Name.name,
    email: "test#{i + 1}@test.com",
    profile: Faker::Lorem.sentence,
    password: 'password'
  )
end