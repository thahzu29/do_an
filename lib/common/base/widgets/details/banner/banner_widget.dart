import 'package:flutter/material.dart';
import 'package:multi_store/data/model/banner_model.dart';
import 'package:multi_store/main.dart';
import 'package:multi_store/resource/theme/app_colors.dart';

import '../../../../../controller/banner_controller.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late Future<List<BannerModel>> futureBanners;

  @override
  void initState() {
    super.initState();
    futureBanners = BannerController().loadBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: AppColors.white40,
          borderRadius: BorderRadius.circular(4),
        ),
        child: FutureBuilder(
            future: futureBanners,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child:  CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("No Banners"),
                );
              } else {
                final banners = snapshot.data!;
                return PageView.builder(
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        banner.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
