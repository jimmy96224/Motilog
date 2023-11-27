# 管理者ログインデータ
Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD']
  )

# ユーザーのテストデータ
5.times do |i|
  User.create!(
    name: Faker::Name.name,
    email: "test#{i + 1}@test.com",
    profile: "ユーザー#{i + 1}プロフィール",
    password: 'password'
  )
end

# user_id=1
Instrument.create!(
  id: "1",
  user_id: "1",
  name: "エレキギター",
  profile: "2022.12~",
)

Log.create!(
  id: "1",
  user_id: "1",
  instrument_id: "1",
  date: "Wed, 06 Dec 2023",
  log: "弦張り替え",
)

Log.create!(
  id: "2",
  user_id: "1",
  instrument_id: "1",
  date: "Wed, 11 Dec 2023",
  log: "オイル清掃",
)
# user_id=2
Instrument.create!(
  id: "2",
  user_id: "2",
  name: "ピアノ",
  profile: "",
)

Log.create!(
  id: "3",
  user_id: "2",
  instrument_id: "2",
  date: "Fri, 01 Dec 2023",
  log: "調律",
)

Log.create!(
  id: "4",
  user_id: "2",
  instrument_id: "2",
  date: "Mon, 27 Nov 2023",
  log: "ペダル調整",
)
# user_id=3
Instrument.create!(
  id: "3",
  user_id: "3",
  name: "津軽三味線",
  profile: "金棹",
)

Instrument.create!(
  id: "4",
  user_id: "3",
  name: "マンドリン",
  profile: "オールド1915",
)

Log.create!(
  id: "5",
  user_id: "3",
  instrument_id: "3",
  date: "Mon, 04 Dec 2023",
  log: "弦替",
)

Log.create!(
  id: "6",
  user_id: "3",
  instrument_id: "4",
  date: "Mon, 04 Dec 2023",
  log: "弦高調整",
)
# user_id=4
Instrument.create!(
  id: "5",
  user_id: "4",
  name: "アコギ",
  profile: "相棒",
)

Instrument.create!(
  id: "6",
  user_id: "4",
  name: "マリンバ",
  profile: "2020.4~",
)

Log.create!(
  id: "7",
  user_id: "4",
  instrument_id: "5",
  date: "Mon, 04 Dec 2023",
  log: "ネック反り調整",
)

Log.create!(
  id: "8",
  user_id: "4",
  instrument_id: "6",
  date: "Mon, 04 Dec 2023",
  log: "マレット交換",
)
# user_id=5
Instrument.create!(
  id: "7",
  user_id: "5",
  name: "パイプオルガン",
  profile: "",
)

Log.create!(
  id: "9",
  user_id: "5",
  instrument_id: "7",
  date: "Mon, 07 Dec 2023",
  log: "調整",
)
