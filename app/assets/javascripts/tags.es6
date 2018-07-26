document.addEventListener("turbolinks:load", ()=> {
  var tag_names = document.querySelector("#project_tags_name")
  const choices = new Choices(tag_names, {
      delimiter: ',',
  })
  // $("#project_tags_name").selectize({
  //     delimiter: ',',
  //     persist: false,
  //     create: function(input) {
  //         return {
  //             value: input,
  //             text: input
  //         }
  //     }
  // });
});
