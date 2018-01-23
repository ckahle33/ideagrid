document.addEventListener('DOMContentLoaded', () => {
  var comment = new Vue({
    el: '.reply',
    data: {},
    methods: {
      createForm: function() {
        console.log('click');
      }
    }
  })
});
