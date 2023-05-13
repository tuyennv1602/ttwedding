import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Banking extends StatelessWidget {
  final double width;
  const Banking({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    const snackBar = SnackBar(
      content: Text('Đã copy số tài khoản'),
    );
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Mừng cưới cô dâu và chú rể',
            style: TextStyle(
              fontFamily: FontFamily.openSans,
              color: AppColors.secondText,
              fontSize: isSmallScreen ? 16 : 20,
            ),
          ),
          const Divider(
            color: AppColors.backgroundShadow,
            indent: 100,
            endIndent: 100,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: '9374841404')).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Chú rể',
                        style: TextStyle(
                          fontFamily: FontFamily.openSans,
                          fontSize: isSmallScreen ? 15 : 20,
                          height: 1.3,
                          color: AppColors.secondText,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Assets.images.vcb.image(
                        width: context.isSmallScreen ? width / 3 : width / 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'VCB: 9374841404',
                          style: TextStyle(
                            fontFamily: FontFamily.openSans,
                            fontSize: isSmallScreen ? 15 : 20,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: '225088888')).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Cô dâu',
                        style: TextStyle(
                          fontFamily: FontFamily.openSans,
                          fontSize: isSmallScreen ? 15 : 20,
                          height: 1.3,
                          color: AppColors.secondText,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Assets.images.acb.image(
                        width: context.isSmallScreen ? width / 3 : width / 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'ACB: 225088888',
                          style: TextStyle(
                            fontFamily: FontFamily.openSans,
                            fontSize: isSmallScreen ? 15 : 20,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
