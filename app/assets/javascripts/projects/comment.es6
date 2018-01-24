document.addEventListener('DOMContentLoaded', () => {
  var comment = new Vue({
    el: '.comment',
    data: {
      visible: false
    },
    methods: {
      showForm: function() {
        this.visible = !this.visible;
      }
    }
  })
});
