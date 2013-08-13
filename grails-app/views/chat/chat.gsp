<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Simple Chat</title>
    <g:javascript library="jquery"/>
    <style type="text/css">
        #chatMessages {
            border: 1px solid #000;
            height: 300px;
            width: 900px;
            overflow-y: auto;
        }
        #messageBox {
            width: 888px;
        }
        .nickname {
            color: #f00;
            font-weight: bold;
        }
        .msg {
            color: #444;
            font-weight: normal;
        }
    </style>
</head>
<body>


<div id="chatMessages"></div>
<input type="text" id="messageBox" name="message" onkeypress="messageKeyPress(this,event);"/>
<div id="temp"></div>

<script>
    function messageKeyPress(field,event) {
        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        var message = $('#messageBox').val();

        if (theCode == 13){
            <g:remoteFunction action="submitMessage" params="\'message=\'+message" update="temp"/>
            $('#messageBox').val('');
            return false;
        } else {
            return true;
        }
    }

    function retrieveLatestMessages() {
        <g:remoteFunction action="retrieveLatestMessages" update="chatMessages"/>
    }

    function pollMessages() {
        retrieveLatestMessages();
        setTimeout('pollMessages()', 5000);
    }

    pollMessages();
</script>

</body>
</html>
