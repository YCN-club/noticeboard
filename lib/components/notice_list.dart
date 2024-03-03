import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noticeboard/models/post.dart';
import 'package:noticeboard/views/info_screen.dart';

class NoticeList extends StatefulWidget {
  final Posts noticeArray;
  const NoticeList({super.key, required this.noticeArray});

  @override
  State<NoticeList> createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: widget.noticeArray.result.map((nt) {
      return Card(
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  width: 150,
                  placeholder: 'assets/loading.gif',
                  image: nt.imageUrl,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nt.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          letterSpacing: -0.6,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      nt.shortDescription,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoScreen(
                                          infoNotice: nt,
                                        )));
                            HapticFeedback.heavyImpact();
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              enableFeedback: true,
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orange)),
                          child: const Text('Read More'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList()));
  }
}
