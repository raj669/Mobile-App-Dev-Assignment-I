import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class ChatMessage {
  final String text;
  final String time;
  final bool isSender;
  final DateTime date;
  final String? audioDuration;
  final bool isAudio;

  ChatMessage({
    required this.text,
    required this.time,
    required this.isSender,
    required this.date,
    this.audioDuration,
    this.isAudio = false,
  });
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
      text: "Hello! John Abraham, How are you?",
      time: "9:25 AM",
      isSender: true,
      date: DateTime.now(),
    ),
    ChatMessage(
      text: "Hello! Kritika, How are you?",
      time: "9:25 AM",
      isSender: false,
      date: DateTime.now(),
    ),
    ChatMessage(
      text: "You did your job well!",
      time: "9:25 AM",
      isSender: true,
      date: DateTime.now(),
    ),
    ChatMessage(
      text: "Have a great working week!!",
      time: "9:25 AM",
      isSender: false,
      date: DateTime.now(),
    ),
    ChatMessage(
      text: "Hope you like it",
      time: "9:25 AM",
      isSender: false,
      date: DateTime.now(),
    ),
    ChatMessage(
      text: "",
      time: "9:25 AM",
      isSender: true,
      date: DateTime.now(),
      audioDuration: "0:16",
      isAudio: true,
    ),
  ];

  bool isFirstInSequence(int index) {
    if (index == 0) return true;
    return messages[index].isSender != messages[index - 1].isSender;
  }

  bool isLastInSequence(int index) {
    if (index == messages.length - 1) return true;
    return messages[index].isSender != messages[index + 1].isSender;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        toolbarHeight: 70,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, size: 25),
              onPressed: () {},
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2AEE83),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.scaffoldBackgroundColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Jhon Abraham', style: theme.appBarTheme.titleTextStyle),
                const SizedBox(height: 4),
                Text(
                  'Active now',
                  style: TextStyle(
                    fontFamily: "Avenir",
                    color: isDark ? Colors.grey[300] : Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call_outlined, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.video_call_outlined, size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                Widget? dateSeparator;
                if (index == 0 ||
                    messages[index].date
                            .difference(messages[index - 1].date)
                            .inDays >
                        0) {
                  final now = DateTime.now();
                  final msgDate = messages[index].date;
                  String label;
                  if (now.difference(msgDate).inDays == 0) {
                    label = "Today";
                  } else if (now.difference(msgDate).inDays == 1) {
                    label = "Yesterday";
                  } else {
                    label = "${msgDate.day}/${msgDate.month}/${msgDate.year}";
                  }
                  dateSeparator = Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[700]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        label,
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black87,
                          fontSize: 13,
                          fontFamily: "Avenir",
                        ),
                      ),
                    ),
                  );
                }
                if (msg.isAudio) {
                  // Audio message bubble
                  return Column(
                    crossAxisAlignment: msg.isSender
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      if (dateSeparator != null) dateSeparator,
                      Row(
                        mainAxisAlignment: msg.isSender
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!msg.isSender) ...[
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                'assets/images/user.jpg',
                              ),
                            ),
                            const SizedBox(width: 14),
                          ],
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: msg.isSender
                                    ? const Color(0xFF21A190)
                                    : (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.grey[800]
                                          : Colors.grey[200]),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    msg.isSender ? 18 : 4,
                                  ),
                                  topRight: Radius.circular(
                                    msg.isSender ? 4 : 18,
                                  ),
                                  bottomLeft: const Radius.circular(18),
                                  bottomRight: const Radius.circular(18),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: msg.isSender
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                  const SizedBox(width: 8),

                                  Row(
                                    children: List.generate(
                                      12,
                                      (i) => Container(
                                        width: 3,
                                        height: (i % 3 + 1) * 6.0,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 1,
                                        ),
                                        decoration: BoxDecoration(
                                          color: msg.isSender
                                              ? Colors.white
                                              : Colors.black54,
                                          borderRadius: BorderRadius.circular(
                                            2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    msg.audioDuration ?? "0:00",
                                    style: TextStyle(
                                      color: msg.isSender
                                          ? Colors.white
                                          : Colors.black87,
                                      fontFamily: "Avenir",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        msg.time,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                          fontFamily: "Avenir",
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                } else if (msg.isSender) {
                  // Sender bubble right aligned
                  return Column(
                    crossAxisAlignment: msg.isSender
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      if (dateSeparator != null) dateSeparator,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFF21A190),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(18),
                                  bottomRight: Radius.circular(18),
                                ),
                              ),
                              child: Text(
                                msg.text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Avenir",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        msg.time,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                          fontFamily: "Avenir",
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 8),
                    ],
                  );
                } else {
                  // Receiver bubble left aligned
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (dateSeparator != null) dateSeparator,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isFirstInSequence(index)) ...[
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                'assets/images/user.jpg',
                              ),
                            ),
                            const SizedBox(width: 14),
                          ] else ...[
                            const SizedBox(width: 54),
                          ],
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (isFirstInSequence(index))
                                  Text(
                                    "Jhon Abraham",
                                    style: Theme.of(context)
                                        .appBarTheme
                                        .titleTextStyle
                                        ?.copyWith(fontSize: 16),
                                  ),
                                if (isFirstInSequence(index))
                                  const SizedBox(height: 4),
                                IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? Colors
                                                    .grey[700] // dark grey in dark mode
                                              : Colors
                                                    .grey[200], // light grey in light mode
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(18),
                                            bottomLeft: Radius.circular(18),
                                            bottomRight: Radius.circular(18),
                                          ),
                                        ),
                                        child: Text(
                                          msg.text,
                                          style: TextStyle(
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black87,
                                            fontSize: 16,
                                            fontFamily: "Avenir",
                                          ),
                                        ),
                                      ),
                                      if (isLastInSequence(index)) ...[
                                        const SizedBox(height: 6),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              msg.time,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white70
                                                    : Colors.grey[600],
                                                fontSize: 12,
                                                fontFamily: "Avenir",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (isLastInSequence(index)) const SizedBox(height: 16),
                      const SizedBox(
                        height: 8,
                      ), // Spacing for consecutive messages.
                    ],
                  );
                }
              },
            ),
          ),
          // Bottom input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .appBarTheme
                  .backgroundColor, // Match AppBar color with input area
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[900]!
                      : Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                // Attachment Icon
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.attach_file, size: 28),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[800]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // Text input field
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write your message",
                              hintStyle: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white70
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        // Clipboard icon
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.content_copy_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
                // Camera icon
                IconButton(
                  icon: const Icon(Icons.camera_alt_outlined),
                  onPressed: () {},
                ),
                // Voice message icon
                IconButton(
                  icon: const Icon(Icons.mic_none_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
