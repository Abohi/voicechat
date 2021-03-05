import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:voice_chat/models/message_model.dart';
import 'package:voice_chat/services/message_service.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: const SizedBox(height: 20,),
              ),
              SliverToBoxAdapter(
                child:const TopHeader(headerName: "Good Morning, Evans",headerDate: "March,5 2021",)
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: 15,),
              ),
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints:BoxConstraints(maxWidth:size.width,maxHeight: size.height*0.15 ),
                 child: ListView(
                   shrinkWrap: true,
                   scrollDirection: Axis.horizontal,
                   children: [
                     GroupListItem(authorName: "Evans Abohi",groupNameColor: Colors.blue,groupMemeberCount: 15,
                       authorImage: Image.asset("assets/images/evans2.jpg",fit: BoxFit.fill,),groupBgColor: Colors.white,groupName:"Programming And Tech" ,),
                     GroupListItem(authorName: "Evans Abohi",groupNameColor: Colors.blue,groupMemeberCount: 15,
                       authorImage: Image.asset("assets/images/evans3.jpg",fit: BoxFit.fill,),groupBgColor: Colors.white,groupName:"Programming And Tech" ,),
                     GroupListItem(authorName: "Evans Abohi",groupNameColor: Colors.blue,groupMemeberCount: 15,
                       authorImage: Image.asset("assets/images/evans.jpg",fit: BoxFit.fill,),groupBgColor: Colors.white,groupName:"Programming And Tech" ,)
                   ],
                 ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: 15,),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: size.height*0.65,width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChatsHeaderList(),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Scaffold(
                        body: Container(
                          child: ListView(
                            children:MessageService().messageList.map((message) => _buildMessage(message, context)).toList(),
                          ),
                        ),
                          bottomNavigationBar: BottomAppBar(
                            color: Colors.white,
                            child: _buildMessageComposer(context),
                          )
                      ),
                    )
                  ],
                ),),
              )
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildMessage(Message message,BuildContext context,{String userId}) {
    var size = MediaQuery.of(context).size;
    final Container msg = Container(
      width:size.width*0.7,
      margin: message.isMe
          ? EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
      )
          : EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffE6E6E6),
        borderRadius: message.isMe
            ? BorderRadius.only(
            topLeft: Radius.circular(11.0),
            bottomLeft: Radius.circular(11.0),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(11.0)
        )
            : BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(11.0),
            topRight: Radius.circular(11.0),
            bottomRight: Radius.circular(11.0)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Lottie.asset("assets/waves/wave1.json",width: size.width*0.35,height:size.height*0.07,),
                ),
                message.isMe?Text(""):Icon(Icons.pause,color: Colors.blue,)
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(left:15),
              child: Text("03:02",style:GoogleFonts.roboto(textStyle:TextStyle(fontSize:14,color:Colors.grey)))),
          Padding(
            padding: const EdgeInsets.only(right:10.0,bottom:7,top:8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  message.createdAt,
                  style: GoogleFonts.roboto(textStyle: TextStyle(
                    color: const Color(0xff7C7C7C),
                    fontSize: 10.0,
                    fontWeight: FontWeight.normal,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    if (message.isMe) {
      return msg;
    }
    return msg;
  }
  Widget _buildMessageComposer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("02:04"),
                Text("Cancel",style: GoogleFonts.roboto(textStyle:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red)),),
                Icon(Icons.mic)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopHeader extends StatelessWidget {
  final String headerName,headerDate;
  const TopHeader({this.headerName,this.headerDate});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width*0.1,
          height: size.width*0.1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset("assets/images/evans.jpg",fit: BoxFit.fill,),
          ),
        ),
        const SizedBox(width: 15,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(headerName,style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black,fontSize: 20)),),
            const SizedBox(height: 5,),
            Text(headerDate,style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w500,
                color: Colors.grey,fontSize: 14)),),
          ],
        ),
        Spacer(),
        Container(
          width: size.width*0.07,
          height: size.width*0.07,
          child: Center(child: Icon(Icons.add)),
          decoration: BoxDecoration(color: Colors.white,boxShadow: [
            BoxShadow(color: Colors.grey,offset: Offset(2,2),blurRadius: 2.1)
          ],shape: BoxShape.circle),
        )
      ],
    );
  }
}

class GroupListItem extends StatelessWidget {
  final String groupName,authorName;
  final int groupMemeberCount;
  final Image authorImage;
  final Color groupBgColor,groupNameColor;
  const GroupListItem({this.authorName,this.groupName,this.groupMemeberCount,this.authorImage,this.groupBgColor,this.groupNameColor});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.75,
      height: size.height*0.25,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),
       boxShadow: [
          BoxShadow(color: Colors.grey,offset: Offset(2,2),blurRadius: 2.1)
        ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: size.height*0.25,
            decoration: BoxDecoration(color: groupNameColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)))),
          Expanded(
            child: Container(
              width: size.width,
              height: size.height*0.25,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.02,),
                  Text("${groupName.length<15?groupName:groupName.replaceRange(16, groupName.length, "...")}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 17,color: groupNameColor,fontWeight: FontWeight.w700)),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width*0.085,
                        height: size.width*0.085,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: authorImage,
                        ),
                      ),
                      Text(authorName.replaceRange(5, authorName.length, ".."),style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w700)),),
                      Container(
                        width: size.width*0.06,
                        height: size.width*0.06,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),
                        child: Center(child: Text("${groupMemeberCount<=10?groupMemeberCount.toString():"+"+groupMemeberCount.toString()}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatsHeaderList extends StatelessWidget {
  const ChatsHeaderList();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight:size.height*0.65,maxWidth:size.width*0.2  ),
        child: ListView(
          shrinkWrap: true,
          children: [
             ChatHeader(imageUri: "assets/images/evans2.jpg",),
            ChatHeader(imageUri:"assets/images/evans.jpg"),
            ChatHeader(imageUri: "assets/images/evans3.jpg",),
            ChatHeader(imageUri: "assets/images/evans2.jpg",),
            ChatHeader(imageUri:"assets/images/evans.jpg"),
            ChatHeader(imageUri: "assets/images/evans3.jpg",),

          ],
        ),
      ),
    );
  }
}
class ChatHeader extends StatelessWidget {
  final String imageUri;
  const ChatHeader({this.imageUri});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      height: size.height*0.13,
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.blue))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 10,
              height: 10,
              decoration: BoxDecoration(color: Colors.blue,shape: BoxShape.circle)),
          const SizedBox(width: 5,),
          SizedBox(
            width: size.width*0.14,
            height: size.width*0.14,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(imageUri,fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
    );
  }
}

