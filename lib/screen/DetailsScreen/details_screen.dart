import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_apps/controller/todo_details_controller.dart';
import 'package:todo_apps/model/todo_model.dart';
import 'package:todo_apps/utils/colors.dart';
import 'package:todo_apps/utils/text.dart';
import 'package:todo_apps/widgets/button_loading.dart';
import 'package:todo_apps/widgets/custom_loading.dart';
import 'package:todo_apps/widgets/custom_padding.dart';

import '../../utils/text_style.dart';
import '../../widgets/custom_text_field.dart';

class TodoDetailsScreen extends StatelessWidget {
  TodoDetailsScreen({super.key});

  final TodoModel data = Get.arguments;

  final _todoDetailsController = Get.put(TodoDetailsController());
  @override
  Widget build(BuildContext context) {
    _todoDetailsController.title.value = data.title;
    _todoDetailsController.description.value = data.description;
    return Scaffold(
      appBar: _appBar(context),
      body: Obx(
        () => _todoDetailsController.isDeleteLoading.value
            ? const CustomLoading()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _headerText(AppText.titile),
                    Obx(
                      () => Text(
                        _todoDetailsController.title.value,
                        style: CustomTextStyle.h4(
                          color: AppColors.contentTextColor,
                        ),
                      ),
                    ),
                    const SizedPad(10),
                    _headerText(AppText.description),
                    Obx(
                      () => Text(
                        _todoDetailsController.description.value,
                        style: CustomTextStyle.h4(
                          color: AppColors.contentTextColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  _headerText(String text) => Text(
        text,
        style: CustomTextStyle.h3(
            fontWeight: FontWeight.w500, color: AppColors.mainColor),
      );

  _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.mainColor,
            size: 20.sp,
          )),
      title: Text(AppText.details),
      actions: [
        PopupMenuButton(
          onSelected: (v) {
            if (v == "edit") {
              _todoDetailsController.titileTextCtrl.text =
                  _todoDetailsController.title.value;
              _todoDetailsController.desTextCtrl.text =
                  _todoDetailsController.description.value;
              _updateBottomSheet(context);
            } else {
              showDialog(
                  context: context, builder: (context) => _todosDeleteDialog());
            }
          },
          icon: Icon(
            Icons.adaptive.more,
            color: AppColors.headerTextColor,
          ),
          itemBuilder: (BuildContext bc) {
            return [
              PopupMenuItem(
                onTap: () {},
                value: "edit",
                child: Text(AppText.edit),
              ),
              PopupMenuItem(
                onTap: () {},
                value: "delete",
                child: Text(AppText.delete),
              ),
            ];
          },
        )
      ],
    );
  }

  _updateBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r))),
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.titile,
                    style: CustomTextStyle.h3(
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor),
                  ),
                  CustomTextField(
                    hintText: AppText.titile,
                    controller: _todoDetailsController.titileTextCtrl,
                  ),
                  const SizedPad(8),
                  Text(
                    AppText.description,
                    style: CustomTextStyle.h3(
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor),
                  ),
                  CustomTextField(
                    controller: _todoDetailsController.desTextCtrl,
                    hintText: AppText.write,
                    maxLines: 5,
                  ),
                  const SizedPad(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              side: BorderSide(
                                  color: AppColors.mainColor, width: 1),
                              backgroundColor: AppColors.backgroundColor),
                          child: Text(
                            AppText.cancel,
                            style: CustomTextStyle.h3(
                                fontWeight: FontWeight.w600,
                                color: AppColors.headerTextColor),
                          )),
                      SizedBox(
                        width: 15.w,
                      ),
                      Obx(
                        () => ElevatedButton(
                            onPressed: () {
                              _todoDetailsController.updateData(data.id!);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainColor),
                            child: _todoDetailsController.isLoading.value
                                ? const ButtonLoading()
                                : Text(
                                    AppText.update,
                                    style: CustomTextStyle.h3(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.backgroundColor),
                                  )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  _todosDeleteDialog() {
    return AlertDialog(
      title: Text(
        AppText.deleteTodos,
        style: CustomTextStyle.h3(
            fontWeight: FontWeight.w600, color: AppColors.headerTextColor),
      ),
      content: Text(
        "Do you want to delete the Todos?",
        style: CustomTextStyle.h5(color: AppColors.contentTextColor),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(AppText.cancel)),
        TextButton(
            onPressed: () {
              Get.back();
              _todoDetailsController.deleteDocument(data.id!);
            },
            child: Text(AppText.delete))
      ],
    );
  }
}
