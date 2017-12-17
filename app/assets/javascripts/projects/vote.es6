class Vote {
  constructor(el, vote_url, id) {
    this.el = el;
    this.vote_url = vote_url;
    this.id = id;
    this.setClickHanders();
  }

  setClickHandlers() {
    this.el.addEventListener("click", ()=> {
      this.postVote();
    })

  }

  postVote() {
    $.ajax({
      method: 'post',
      url: this.vote_url,
      data: { "project": "id": this.id },
    })
    .done((data) => {
      console.log("something happened");

    })
    .fail((data) => {
      this.handleMessage(data.responseJSON['message']);
    })

  }

}

$(() => {

});
