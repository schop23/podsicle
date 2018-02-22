# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all  
Comment.destroy_all

shelley = User.create(email: 'schop23@gmail.com', password: 'password')

posts = shelley.posts.create([
  {title:"Slate Culture Gabfest", subject:"Pop Culture", review:"This is my favorite podcast. The hosts, Steve, Dana, and Julia are witty, intelligent, and funny. They cover and review current movies, TV shows, music, books, and anything related to pop culture. Their intellect is really what sets this podcast apart from all other pop culture podcasts. The guests they have on their show are very complementary to their style of hosting. At the end of every episode, each host endorses one thing. It is anything they are into at the moment, from restaurants to songs. This podcast is really informative and entertaining from start to finish.", podcast_url: "http://www.slate.com/articles/podcasts/culturegabfest.html"},
  {title:"Supergirl Radio", subject:"All things related to Supergirl and the character Kara Zor-El.", review:"This podcast follows and recaps the episodes for the CW TV show, Supergirl. They also read and recap/review the Supergirl comicbooks. The hosts, Rebecca and Morgan, are very knowledgeable about Supergirl and other comic book characters. They are funny and entertaining. They have different segments to let you know about things coming down the pike and, what they call, a spoiler section that talks about the preview for the next episode of the CW show. I really look forward to listening to this podcast after every episode. I don't know many people who watch this show and it is like having a weekly conversation with fans like me.", podcast_url:"www.supergirlradio.com"}
])

comments = shelley.comments.create([
  {body:"I can't wait until they do their Summer Strut Playlist for this year!", post: posts[0]},
  {body:"I love Rebecca and Morgan, but I wish Carly was still on the show.", post: posts[1]}
])
