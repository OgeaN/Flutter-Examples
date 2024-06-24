import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class CallLogPage extends StatefulWidget {
  @override
  _CallLogPageState createState() => _CallLogPageState();
}

class _CallLogPageState extends State<CallLogPage> {
  List<CallLogEntry> _callLogs = [];

  @override
  void initState() {
    super.initState();
    getCallLogs();
  }

  Future<void> getCallLogs() async {
    final Iterable<CallLogEntry> entries = await CallLog.get();

    setState(() {
      _callLogs = entries.toList();
    });
  }

  String getCallType(CallType? callType) {
    switch (callType) {
      case CallType.incoming:
        return 'Gelen';
      case CallType.outgoing:
        return 'Giden';
      case CallType.missed:
        return 'Cevapsız';
      default:
        return 'Bilinmeyen';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade600,
        title: Text('Arama Kayıtları'),
      ),
      body: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: Container(
          color: Colors.blueGrey.shade800,
          child: ListView.builder(
            itemCount: _callLogs.length,
            itemBuilder: (context, index) {
              final callLog = _callLogs[index];
              String? name;
              name = callLog.name;
              return Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(2),
                color: Colors.blueGrey.shade700,
                child: Slidable(
                  key: ValueKey(callLog),
                  startActionPane: ActionPane(
                    motion: StretchMotion(),
                    dismissible: DismissiblePane(
                      onDismissed: () => setState(() {
                        launch(
                          "https://wa.me/${callLog.number.toString()}",
                        );
                        Fluttertoast.showToast(
                            msg: "WhatsApp Açılıyor...",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }),
                    ),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.green,
                        icon: Icons.chevron_right_sharp,
                        label: "WhatsApp Aç",
                        onPressed: (context) => {
                          launch(
                            "https://wa.me/${callLog.number.toString()}",
                          ),
                          Fluttertoast.showToast(
                              msg: "WhatsApp Açılıyor...",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0),
                        },
                      )
                    ],
                  ),
                  child: ListTile(
                    horizontalTitleGap: 1,
                    title: Text(
                      (name != null && name.isNotEmpty)
                          ? name
                          : callLog.number.toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      (name != null && name.isNotEmpty)
                          ? callLog.number.toString()
                          : "Bilinmeyen",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    trailing: Text(
                      getCallType(callLog.callType),
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: Image.asset("assets/photos/person.png"),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
// GestureDetector(
//                 onTap: () async => await launch(
//                   "https://wa.me/${callLog.number.toString()}",
//                 ),
//                 child: Card(
//                   color: Colors.white70,
//                   child: Icon(
//                     size: 50,
//                     Icons.wechat,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),


