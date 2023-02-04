import consumer from "./consumer"
console.log("読み込み完了")
consumer.subscriptions.create("ChatChannel", {
  connected() {
    
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const content = data.json.content
    const html = `
      <li id="chats">${content} </li>
    `
    const comments = document.getElementById("comments")
    comments.insertAdjacentHTML('beforebegin', html)
  }
});