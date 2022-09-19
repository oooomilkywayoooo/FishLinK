# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

Spot.create!(
   [
      {
         name: '札幌',
         spot_id: 2128295
      },
      {
         name: '青森',
         spot_id: 2130658
      },
      {
         name: '盛岡',
         spot_id: 2111834
      },
      {
         name: '仙台',
         spot_id: 2111149
      },
      {
         name: '秋田',
         spot_id: 2113126
      },
      {
         name: '山形',
         spot_id: 2110556
      },
      {
         name: '福島',
         spot_id: 2112923
      },
      {
         name: '水戸',
         spot_id: 2111901
      },
      {
         name: '宇都宮',
         spot_id: 1849053
      },
      {
         name: '前橋',
         spot_id: 1857843
      },
      {
         name: '埼玉',
         spot_id: 6940394
      },
      {
         name: '千葉',
         spot_id: 2113015
      },
      {
         name: '東京',
         spot_id: 1850147
      },
      {
         name: '横浜',
         spot_id: 1848354
      },
      {
         name: '新潟',
         spot_id: 1855431
      },
      {
         name: '富山',
         spot_id: 1849876
      },
      {
         name: '金沢',
         spot_id: 1860243
      },
      {
         name: '福井',
         spot_id: 1863983
      },
      {
         name: '山梨',
         spot_id: 1848649
      },
      {
         name: '長野',
         spot_id: 1856215
      },
      {
         name: '岐阜',
         spot_id: 1863640
      },
      {
         name: '静岡',
         spot_id: 1851715
      },
      {
         name: '名古屋',
         spot_id: 1856057
      },
      {
         name: '津',
         spot_id: 1849796
      },
      {
         name: '大津',
         spot_id: 1853574
      },
      {
         name: '京都',
         spot_id: 1857910
      },
      {
         name: '大阪',
         spot_id: 1853909
      },
      {
         name: '神戸',
         spot_id: 1859171
      },
      {
         name: '奈良',
         spot_id: 1855612
      },
      {
         name: '和歌山',
         spot_id: 1926004
      },
      {
         name: '鳥取',
         spot_id: 1849890
      },
      {
         name: '松江',
         spot_id: 1857550
      },
      {
         name: '岡山',
         spot_id: 1854383
      },
      {
         name: '広島',
         spot_id: 1862415
      },
      {
         name: '山口',
         spot_id: 1848689
      },
      {
         name: '徳島',
         spot_id: 1850158
      },
      {
         name: '高松',
         spot_id: 1851100
      },
      {
         name: '松山',
         spot_id: 1926099
      },
      {
         name: '高知',
         spot_id: 1859146
      },
      {
         name: '福岡',
         spot_id: 1863967
      },
      {
         name: '佐賀',
         spot_id: 1853303
      },
      {
         name: '長崎',
         spot_id: 1856177
      },
      {
         name: '熊本',
         spot_id: 1858421
      },
      {
         name: '大分',
         spot_id: 1854487
      },
      {
         name: '宮崎',
         spot_id: 1856717
      },
      {
         name: '鹿児島',
         spot_id: 1860827
      },
      {
         name: '那覇',
         spot_id: 1856035
      }
   ]
)