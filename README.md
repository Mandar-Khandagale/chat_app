# flutter_chat_app

A basic chat app in flutter with the help of stream api and getx state-management package


1. Create a client using **StreamChatClient** widget passing your own **StreamKey**.

2. Wrap your child of MaterialApp with **StreamChatCore** and pass the client to it so it will initialise the Chat functionality.

3. Create a User using client from **StreamChatCore** and connect  user using **connectUser** method by passing User info and auto token.

4. To add new contacts to the user we have to create new users with same method **connectUser**.

5. To show contact list of the users use **UserListCore** widget which will provide the list of available user in ListItem class and from that we can retrieve data from it.

6. To start chatting with the contact we have to create a new channel with contact **StreamChatCore.client.channel** method and pass channel type and members[“current_user_id” , “contact_user_id”] and then watch that channel using **channel.watch**.

7. To show the list of created channels use **ChannelListCore** widget which will provide the list of created channel in Channel class and from that we show diff data accordingly like name, image, last msg, unread msg count etc.

8. To show ChatScreen data of particular user use **MessageListCore** widget to show the last messages from both side.


Screenshot -1 :-

<img width="329" alt="SS-1" src="https://user-images.githubusercontent.com/79316523/187146085-4ef62e1d-521b-4daa-9d2c-56a5130e74be.png">


Screenshot -2 :-

<img width="347" alt="SS-2" src="https://user-images.githubusercontent.com/79316523/187146201-da7e6bb8-5edd-4664-ad10-0e8d3c3dcaec.png">


Screenshot -3 :-

<img width="342" alt="SS-3" src="https://user-images.githubusercontent.com/79316523/187146315-3fb0fd7a-3032-4677-82a8-14087b4aa2fc.png">


Screenshot -4 :-

<img width="339" alt="SS-4" src="https://user-images.githubusercontent.com/79316523/187146369-722abaa1-5fa5-48fe-a0d1-75a11a0d9668.png">


Screenshot -5 :-

<img width="342" alt="SS-5" src="https://user-images.githubusercontent.com/79316523/187146425-e758ff53-9234-40d9-970e-e32cb047cd81.png">

