# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  { email: "eglomsostenes@gmail.com", password: "dibre123" },
  { email: "teste1@gmail.com", password: "dibre123" },
])

Video.create!([
  { name: "Noturn", url: "https://bitmovin-a.akamaihd.net/content/playhouse-vr/m3u8s/105560.m3u8", user_id: 1 },
  { name: "Ciclista", url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8", user_id: 1 },
  { name: "Fazenda Animada", url: "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8", user_id: 2 },
  { name: "Sintel", url: "https://multiplatform-f.akamaihd.net/i/multi/april11/sintel/sintel-hd_,512x288_450_b,640x360_700_b,768x432_1000_b,1024x576_1400_m,.mp4.csmil/master.m3u8", user_id: 2}, 
])
