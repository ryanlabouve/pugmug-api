# create_table "pugs", force: :cascade do |t|
#   t.string   "url"
#   t.string   "title"
#   t.text     "self_text"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

url = "http://api.reddit.com/r/pugs/hot?limit=100"
d = JSON.parse(`curl #{url}`)

d['data']['children'].each do |child|
  post = child['data']
  Pug.create(
    title: post['title'],
    url: (post['url'] =~ /jpg$/) ? post['url'] : "#{post['url']}.jpg",
    self_text: post['selftext_html']
  ) if post['domain'] === "i.imgur.com"
end
