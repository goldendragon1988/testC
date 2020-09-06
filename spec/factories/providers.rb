FactoryBot.define do
  factory :provider do
    association         :user, factory: :user
    name 								{"google_oauth2"}
    uid 								{"117935050446553310905a"}
    token 							{"ya29.a0AfH6SMCZGOrr0Z7FsL7KMG8-rFV9z0LiCsCwlIwYpt7E3hxYG5s1FAeV98ajTz2Rk0gsduLk9FNJukB5bJzVSug5W3Gr-4BxkuJEEzfWgNDFi-p5KAsw0ShFSIui-aJdL3ZrxS04oGajNUj2dpuIz5CcRtSe00KuxzI"}
  end
end
