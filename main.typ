// Entry point: theme + content. Build: `make build`
#import "themes/onepage.typ": onepage
#import "content/content.typ": cv

// photo options:
//   none                          -> no photo slot
//   auto                          -> gray placeholder box
//   image("assets/photo.jpg")     -> your real photo (add the file, then swap)
#onepage(cv, show-open-source: true, photo: image("assets/photo.jpg"))
