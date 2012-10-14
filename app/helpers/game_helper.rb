module GameHelper

  def override_username 
    {
      "jonatasdp" => { 
        "github" => "jonatas", 
        "google" => "100136762810302102952"
      },"eliegejachini" => {"google" => "105775662756374782259"}
    }
  end
  def override_url
    {
      "instagram" => lambda {|c,u| "http://web.#{c}.com/p/#{u}"},
      "google" => lambda {|c,u| "http://plus.#{c}.com/#{u}"}
    }
  end
end
