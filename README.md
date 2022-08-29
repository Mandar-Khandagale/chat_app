# flutter_chat_app

A basic chat app in flutter with the help of stream api and getx state-management package

#Step 1:
1. Create a client using **StreamChatClient** widget passing your own **StreamKey**.

#Step 2:
2. Wrap your child of MaterialApp with **StreamChatCore** and pass the client to it so it will initialise the Chat functionality.

#Step 3:
3. Create a User using client from **StreamChatCore** and connect  user using **connectUser** method by passing User info and auto token.

#Step 4:
4. To add new contacts to the user we have to create new users with same method **connectUser**.

#Step 5:
5. To show contact list of the users use **UserListCore** widget which will provide the list of available user in ListItem class and from that we can retrieve data from it.

#Step 6:
6. To start chatting with the contact we have to create a new channel with contact **StreamChatCore.client.channel** method and pass channel type and members[“current_user_id” , “contact_user_id”] and then watch that channel using **channel.watch**.

#Step 7:
7. To show the list of created channels use **ChannelListCore** widget which will provide the list of created channel in Channel class and from that we show diff data accordingly like name, image, last msg, unread msg count etc.

#Step 8:
8. To show ChatScreen data of particular user use **MessageListCore** widget to show the last messages from both side.

