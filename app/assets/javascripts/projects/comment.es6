class Reply {
  constructor(el) {
    this.el = el;
    this.link = this.el.querySelector('[data-reply]');
    this.cancel = this.el.querySelector('[data-cancel]');
    this.endpoint = this.el.dataset.endpoint;
    this.comment_id = this.el.dataset.commentId;
    this.reply_form = document.querySelector(`#comment-${this.comment_id }`);
    this.setHandlers();
  }

  setHandlers() {
    this.link.addEventListener('click', (e) => {
      e.preventDefault();
      this.createForm();
    })
    this.cancel.addEventListener('click', (e) => {
      e.preventDefault();
      this.destroyForm();
    })
  }

  createForm() {
    this.reply_form.innerHTML = this.template();
  }

  destroyForm() {
    this.reply_form.innerHTML = '';
  }

  template() {
    return `
      <form action='${this.endpoint}' method='post'>
        <input type="hidden" name="comment[parent_id]" value='${this.comment_id}'>
        <div class="form-group">
          <input type="text" name="comment[body]" id="comment_body">
        </div>
        <div class="form-group">
          <input type="submit" name="commit" value="Save" data-disable-with="Save">
        </div>
      </form>
    `
  }

}

$(document).on("turbolinks:load", ()=> {
  var comments = document.querySelectorAll('.comment');
  if (comments) {
    comments.forEach(function(c) {
      new Reply(c);
    })
  }
});
