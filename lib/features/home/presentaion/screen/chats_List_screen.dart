import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/utils/colors_manager/colors.dart';
import 'package:whatsapp_clone/features/home/presentaion/screen/chat_screen.dart';
import 'package:whatsapp_clone/features/home/presentaion/widgets/search_field.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<ChatModel> chatsList = [
    ChatModel(
      image: 'assets/images/2.png',
      name: 'Ali lotfy',
      lastMessage: 'Hey there!',
      date: '10:30 AM',
    ),
    ChatModel(
      image: 'assets/images/failure.png',
      name: 'Ahmed',
      lastMessage: 'How are you?',
      date: '9:45 AM',
    ),
    ChatModel(
      image: 'assets/images/2.png',
      name: 'Yaser omar',
      lastMessage: 'See you later!',
      date: 'Yesterday',
    ),
    ChatModel(
      image: 'assets/images/failure.png',
      name: 'mahmoud fawzy',
      lastMessage: 'Let\'s catch up!',
      date: 'Last week',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Column(
      children: [
        AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: ElasticInDown(
            child: Text(
              'WhatsApp',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),

          elevation: 1,
          actions: [
            IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        //build whatsapp chat list
        WhatsAppSearchBar(
          controller: searchController,
          onChanged: (value) {
          },
        ),

        Expanded(
          child: ListView.builder(
            itemCount: chatsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(chatModel: chatsList[index]),
                    ),
                  );
                },
                child: ElasticInLeft(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: (index % 2 == 0)
                          ? ColorsManager.accentColor
                          : ColorsManager.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.all(3.0.r),
                        child: CircleAvatar(
                          radius: 30.sp,
                          backgroundImage: AssetImage(chatsList[index].image ?? ''),
                        ),
                      ),
                    ),
                    title: Text(
                      chatsList[index].name ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,),
                    subtitle: Text(
                      chatsList[index].lastMessage ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  
                    trailing: Text(
                      chatsList[index].date ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ChatModel {
  final String? image;
  final String? name;
  final String? lastMessage;
  final String? date;

  ChatModel({this.image, this.name, this.lastMessage, this.date});
}
