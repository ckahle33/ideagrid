import Taggle from 'taggle';

//  this is annoying
document.addEventListener("turbolinks:load", ()=> {
  var idea_tags = document.getElementById("idea_tags");
  if (idea_tags) {
    new Taggle('idea_tags', {placeholder: ""});
  }
});
