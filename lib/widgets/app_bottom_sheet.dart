import 'package:flutter/material.dart';

class AppBottomSheet {
  AppBottomSheet._();

  static Future showScrollableBottomSheet({
    required BuildContext context,
    String? title,
    Widget Function(BuildContext context, ScrollController scrollController)?
        builder,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      builder: (BuildContext context) {
        return SafeArea(
          left: false,
          right: false,
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.05,
            builder: (_, scrollController) {
              return Material(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 4,
                        width: 50,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title ?? "",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      if (builder != null)
                        Flexible(child: builder(context, scrollController)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    String? title,
    Widget? child,
    double? sheetHeight,
    bool isDismissible = false,
    bool isScrollable = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollable,
      enableDrag: false,
      isDismissible: isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: sheetHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              if (child != null)
                Flexible(
                  child: SingleChildScrollView(
                    child: child,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
