json.array!(@posts) do |post|
  json.extract! post, :id, :name, :free, :price, :obo, :expiredate, :tix_eventname, :tix_eventdate, :tb_classname, :tb_classnumber, :tb_edition
  json.url post_url(post, format: :json)
end
