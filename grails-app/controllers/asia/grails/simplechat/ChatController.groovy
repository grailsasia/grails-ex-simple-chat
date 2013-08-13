package asia.grails.simplechat

class ChatController {

    def index() {
    }

    def join(String nickname) {
        if ( nickname.trim() == '' ) {
            redirect(action:'index')
        } else {
            session.nickname = nickname
            render (view: 'chat')
        }
    }

    def retrieveLatestMessages() {
        def messages = Message.listOrderByDate(order: 'desc', max:10)
        [messages:messages.reverse()]
    }

    def submitMessage(String message) {
        new Message(nickname: session.nickname, message:message).save()
        render "<script>retrieveLatestMessages()</script>"
    }
}
