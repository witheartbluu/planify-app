import 'package:flutter/material.dart';
import 'package:planify/components/chat.dart';
import 'package:planify/components/inbox_list.dart';



class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: chat.length,
            itemBuilder: (context, index) {
              return Column(children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(chat[index]['name'].toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          chat[index]['message'].toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: chat[index].containsKey('profilePic')
                            ? NetworkImage(chat[index]['profilePic'].toString())
                            : null, // Or provide a default imag
                        radius: 30,
                      ),
                      trailing: Text(chat[index]['time'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          )),
                    ))
              ]);
            }));
  }
}