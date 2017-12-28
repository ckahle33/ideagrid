$(() => {
  $("#project_tags_name").selectize({
      delimiter: ',',
      persist: false,
      create: function(input) {
          return {
              value: input,
              text: input
          }
      }
  });
});
