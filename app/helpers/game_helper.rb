module GameHelper

  def override_username 
    {
      "jonatasdp" => { 
        "github" => "jonatas", 
        "google" => "100136762810302102952"
      },"eliegejachini" => {
        "github" => "eliege", 
        "google" => "105775662756374782259"
      }
    }
  end
  def override_url
    {
      "instagram" => lambda {|c,u| "http://web.stagram.com/n/#{u}"},
      "google" => lambda {|c,u| "http://plus.#{c}.com/#{u}"}
    }
  end
end
