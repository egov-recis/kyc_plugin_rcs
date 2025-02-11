import 'package:flutter/material.dart';

showSheetCustom({
  required BuildContext context,
  required Widget content,
  Widget? title,
  bool? cancelable,
  bool? isMax,
  bool? isPaddingHorizontal,
  bool? isTitle,
}) {
  showModalBottomSheet(
    isDismissible: cancelable == true ? true : false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: isTitle == true
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: isPaddingHorizontal == false ? 0 : 8,
                    ),
                    child: title ?? const Text('Custom Title'),
                  ),
                  Expanded(
                    // height: MediaQuery.of(context).size.height * 0.8,
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          top: isTitle == true ? 0 : 16,
                          bottom: 16,
                          left: isPaddingHorizontal == false ? 0 : 8,
                          right: isPaddingHorizontal == false ? 0 : 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: isMax == true
                              ? MainAxisSize.max
                              : MainAxisSize.min,
                          children: [
                            content,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(
              height: isMax == true
                  ? MediaQuery.of(context).size.height * 0.8
                  : null,
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: isTitle == true ? 0 : 16,
                    bottom: 16,
                    left: isPaddingHorizontal == false ? 0 : 8,
                    right: isPaddingHorizontal == false ? 0 : 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize:
                        isMax == true ? MainAxisSize.max : MainAxisSize.min,
                    children: [
                      content,
                    ],
                  ),
                ),
              ),
            ),
    ),
  );
}
