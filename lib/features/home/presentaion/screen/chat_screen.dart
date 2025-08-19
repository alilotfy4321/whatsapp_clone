import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/utils/colors_manager/colors.dart';
import 'chats_List_screen.dart'; // ChatModel

class ChatScreen extends StatefulWidget {
  final ChatModel chatModel;
  const ChatScreen({super.key, required this.chatModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageModel> messages = [];
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor.withValues(alpha: 100),
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage(widget.chatModel.image ?? ''),
            ),
            SizedBox(width: 8.w),
            Text(
              widget.chatModel.name ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.video_call_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.call_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                bool isMe = msg.isMe;
                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: isMe
                          ? ColorsManager.accentColor.withValues(alpha: 0.3)
                          : ColorsManager.primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      msg.text,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                );
              },
            ),
          ),
          // Input field
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            color: ColorsManager.whiteColor,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ColorsManager.textColor,
                    ),
                    cursorHeight: 20.h,
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: ' message',
                      hintStyle: Theme.of(context).textTheme.titleSmall
                          ?.copyWith(color: ColorsManager.textColor),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      labelStyle: Theme.of(context).textTheme.titleSmall
                          ?.copyWith(color: ColorsManager.textColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                          color: Colors.white24,
                          width: 0.5.w,
                        ),
                      ),
                      filled: true,
                      fillColor: ColorsManager.whiteColor,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: ColorsManager.accentColor,
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: ColorsManager.whiteColor,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      String text = messageController.text.trim();
                      if (text.isNotEmpty) {
                        setState(() {
                          messages.add(MessageModel(text: text, isMe: true));
                          messageController.clear();
                        });
                        // Scroll to bottom
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent + 60.h,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageModel {
  final String text;
  final bool isMe;

  MessageModel({required this.text, this.isMe = true});
}
