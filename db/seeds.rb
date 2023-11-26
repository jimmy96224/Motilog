# ランダムなユーザーを作成する
5.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )

  # ユーザーに紐づく楽器を作成する
  instrument = Instrument.create(
    name: Faker::Music.instrument,
    profile: Faker::Lorem.sentence,
    user_id: user.id
  )

  # ユーザーに紐づくログを作成する
  Log.create(
    date: Faker::Date.backward(days: 14),
    log: Faker::Lorem.paragraph,
    instrument_id: instrument.id,
    user_id: user.id
  )

  # ユーザーに紐づく日記を作成する
  Diary.create(
    date: Faker::Date.backward(days: 7),
    title: Faker::Lorem.sentence,
    text: Faker::Lorem.paragraphs(number: 3).join("\n"),
    user_id: user.id
  )

end

guest_user = User.create(
  profile: 'ゲストユーザーでログイン中です',
  is_guest: true
)

2.times do
  guest_instrument = Instrument.create(
    name: Faker::Music.instrument,
    profile: Faker::Lorem.sentence,
    user_id: guest_user.id
  )

  Log.create(
    date: Faker::Date.backward(days: 14),
    log: Faker::Lorem.paragraph,
    instrument_id: guest_instrument.id,
    user_id: guest_user.id
  )

  Diary.create(
    date: Faker::Date.backward(days: 7),
    title: Faker::Lorem.sentence,
    text: Faker::Lorem.paragraphs(number: 3).join("\n"),
    user_id: guest_user.id
  )
end

