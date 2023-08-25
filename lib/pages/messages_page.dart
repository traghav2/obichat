import 'package:obichat/helpers.dart';
import 'package:obichat/models/message_model.dart';
import 'package:obichat/models/story_data.dart';
import 'package:obichat/screens/chat_screen.dart';
import 'package:obichat/theme.dart';
import 'package:obichat/widgets/avatar.dart';
import 'package:faker/faker.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
      slivers: [
        SliverToBoxAdapter(
          child: _Stories(),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(_delegate)),
      ],
    );
  }
}

Widget _delegate(BuildContext context, int index) {
  final faker = Faker();
  final date = Helpers.randomDate();
  final timeAgo = timeago.format(date, locale: 'en_long');
  return _MessageTile(
      messageData: MessageModel(
    senderName: faker.person.name(),
    message: faker.lorem.sentence(),
    dateMessage: timeAgo,
    profilePicture: Helpers.randomPictureUrl(),
  ));
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({Key? key, required this.messageData}) : super(key: key);

  final MessageModel messageData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 90,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(ChatScreen.route(messageData));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0,top: 5),
              child: Avatar.medium(
                url: messageData.profilePicture,
              ),
            ),
            Expanded(
                child: Padding(
              padding:  const EdgeInsets.only(top: 18.0, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      messageData.senderName!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                          wordSpacing: 1.5),
                    ),
                  ),
                  SizedBox(
                      height: 30,
                      child: Text(
                        messageData.message!,
                        style: TextStyle(
                            color: Colors.grey.shade300, overflow: TextOverflow.ellipsis, fontSize: 12),
                      )),
                ],
              ),
            )),

            Padding(
              padding: const EdgeInsets.only(right: 17.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13.0),
                    child: Text(messageData.dateMessage!.toUpperCase(), style: TextStyle(color: Colors.grey.shade300, fontSize: 10, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.green.shade500,),
                    height: 18,
                    width: 18,
                    child: const Icon(Icons.plus_one, size: 15,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.grey.shade900,
      elevation: 0,
      child: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 12),
              child: Text(
                'Stories',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: AppColors.textFaded,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 60,
                          child: _StoryCard(
                              storyData: StoryData(
                                  name: faker.person.name(),
                                  url: Helpers.randomPictureUrl()))),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
