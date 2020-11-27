import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
   
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html=    
    `<div class="message_block">
    <div class="message_top">
      <div class="message_nickname">${data.user}</div>
      <div class="jp_time">${data.time}</div>
    </div>
    <p class="message">${data.text.content}</p>
    </div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_content');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
  }
});
