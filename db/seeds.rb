# 5人のユーザーを作成する
# 5.times do
#   user = User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     profile: Faker::Lorem.sentence,
#     password: 'password'
#   )

5.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    profile: Faker::Lorem.sentence,
    password: 'password'
  )

  # ユーザーごとに2つの楽器を作成する
  2.times do
    instrument = Instrument.create(
      name: Faker::Music.instrument,
      profile: Faker::Lorem.sentence,
      user_id: user.id
    )

    # 各楽器に対して3つのログを作成する
    3.times do
      Log.create(
        date: Faker::Date.backward(days: 14),
        log: Faker::Lorem.paragraph,
        instrument_id: instrument.id,
        user_id: user.id
      )
    end

    # 各楽器に対して2つの日記を作成する
    2.times do
      Diary.create(
        date: Faker::Date.backward(days: 7),
        title: Faker::Lorem.sentence,
        text: Faker::Lorem.paragraphs(number: 3).join("\n"),
        instrument_id: instrument.id,
        user_id: user.id
      )
    end
  end
end

guest_user = User.create(
  profile: 'ゲストユーザーでログイン中です',
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

