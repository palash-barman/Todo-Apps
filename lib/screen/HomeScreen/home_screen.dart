import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_apps/controller/home_controller.dart';
import 'package:todo_apps/model/todo_model.dart';
import 'package:todo_apps/routes/routes.dart';
import 'package:todo_apps/utils/colors.dart';
import 'package:todo_apps/utils/text.dart';
import 'package:todo_apps/utils/text_style.dart';
import 'package:todo_apps/widgets/button_loading.dart';
import 'package:todo_apps/widgets/custom_loading.dart';
import 'package:todo_apps/widgets/custom_padding.dart';

import '../../widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  _body() {
    return StreamBuilder(
        stream: _homeController.stream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.docs.isEmpty
                ? Center(
                    child: Text(
                    AppText.noDataAvailable,
                    style: CustomTextStyle.h4(),
                  ))
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    itemBuilder: (context, index) {
                      TodoModel data = TodoModel(
                          title: snapshot.data!.docs[index]["title"],
                          description: snapshot.data!.docs[index]
                              ["description"],
                          id: snapshot.data!.docs[index].id);
                      return _todoCard(
                          onTap: () {
                            Get.toNamed(Routes.todoDetails, arguments: data);
                          },
                          data: data);
                    });
          } else {
            return const CustomLoading();
          }
        });
  }

  _appBar() {
    return AppBar(
      title: Text(AppText.allTodos),
    );
  }

  _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(context: context, builder: (context) => _todosAddDialog());
      },
      backgroundColor: AppColors.mainColor,
      child: Icon(
        Icons.add,
        color: AppColors.backgroundColor,
        size: 25.sp,
      ),
    );
  }

  _todosAddDialog() {
    return AlertDialog(
      title: Text(
        AppText.addTodos,
        style: CustomTextStyle.h3(
            fontWeight: FontWeight.w600, color: AppColors.headerTextColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.titile,
            style: CustomTextStyle.h3(
                fontWeight: FontWeight.w500, color: AppColors.mainColor),
          ),
          CustomTextField(
            hintText: AppText.titile,
            controller: _homeController.titleTextCtrl,
          ),
          const SizedPad(8),
          Text(
            AppText.description,
            style: CustomTextStyle.h3(
                fontWeight: FontWeight.w500, color: AppColors.mainColor),
          ),
          CustomTextField(
            hintText: AppText.write,
            controller: _homeController.desTextCtrl,
            maxLines: 5,
          ),
          const SizedPad(15),
          Center(
            child: Obx(
              () => ElevatedButton(
                  onPressed: () {
                    _homeController.addTodos();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor),
                  child: _homeController.isLoading.value
                      ? const ButtonLoading()
                      : Text(
                          AppText.add,
                          style: CustomTextStyle.h3(
                              fontWeight: FontWeight.w600,
                              color: AppColors.backgroundColor),
                        )),
            ),
          )
        ],
      ),
    );
  }

  _todoCard({required Function()? onTap, required TodoModel data}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
                color: AppColors.mainColor.withOpacity(0.5), width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: CustomTextStyle.h3(
                  fontWeight: FontWeight.w600,
                  color: AppColors.headerTextColor),
              maxLines: 1,
            ),
            const SizedPad(6),
            Text(
              data.description,
              style: CustomTextStyle.h4(color: AppColors.contentTextColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
