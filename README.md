```
my sample verified on Ghost
```

#WHY

sometimes I didn't write the proper slug for my post, and after when I try
to export my posts from wordpress to ghost or other markdown blog system,
the post slug would be very ugly! just encoded Chinese, that's too long, 
unreadable.

# How to implement
I try to use `Google translation API` to translation all posts' slug into
english, so it would be more readable.

## How to use

you need a google translation api key 

> https://console.developers.google.com

## put your post source under `json_file` directory
## change a little bit code in `main.rb`
## exec the code
## get result from `result` directory.

DONE!