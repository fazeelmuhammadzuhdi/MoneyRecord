import 'package:d_chart/d_chart.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_record_app/config/app_asset.dart';
import 'package:money_record_app/config/app_color.dart';
import 'package:money_record_app/presentation/controller/c_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(CUser());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            child: Row(
              children: [
                Image.asset(AppAsset.profile),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Obx(() {
                        return Text(
                          cUser.data.name ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Builder(builder: (ctx) {
                  return Material(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.chart,
                      child: InkWell(
                        onTap: (() {
                          Scaffold.of(ctx).openEndDrawer();
                        }),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.menu,
                            color: AppColor.primary,
                          ),
                        ),
                      ));
                }),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            children: [
              Text(
                'Pengeluaran Hari Ini',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DView.spaceHeight(),
              cardToday(context),
              DView.spaceHeight(30),
              Center(
                child: Container(
                  height: 5,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColor.bg,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              DView.spaceHeight(30),
              Text(
                'Pengeluaran Minggu Ini',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DView.spaceHeight(),
              weekly(),
              DView.spaceHeight(),
              Text(
                'Perbandingan Bulan Ini',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DView.spaceHeight(),
              monthly(context),
            ],
          ))
        ],
      ),
    );
  }

  Row monthly(BuildContext context) {
    return Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Stack(
                    children: [
                      DChartPie(
                        data: [
                          {'domain': 'Flutter', 'measure': 28},
                          {'domain': 'React Native', 'measure': 27},
                        ],
                        fillColor: (pieData, index) => Colors.purple,
                        donutWidth: 30,
                        labelColor: Colors.white,
                      ),
                      Center(
                        child: Text(
                          '60%',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: AppColor.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 16,
                          width: 16,
                          color: AppColor.primary,
                        ),
                        DView.spaceWidth(8),
                        const Text('Pemasukan')
                      ],
                    ),
                    DView.spaceHeight(8),
                    Row(
                      children: [
                        Container(
                          height: 16,
                          width: 16,
                          color: AppColor.chart,
                        ),
                        DView.spaceWidth(8),
                        const Text('Pengeluaran')
                      ],
                    ),
                    DView.spaceHeight(8),
                    Text('Pemasukan'),
                    Text('Lebih Besar 20%'),
                    Text('Dari Pengeluaran'),
                    DView.spaceHeight(10),
                    Text('Atau Setara :'),
                    Text(
                      'Rp 20.000,00',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            );
  }

  AspectRatio weekly() {
    return AspectRatio(
              aspectRatio: 16 / 9,
              child: DChartBar(
                data: [
                  {
                    'id': 'Bar',
                    'data': [
                      {'domain': '2020', 'measure': 3},
                      {'domain': '2021', 'measure': 4},
                      {'domain': '2022', 'measure': 6},
                      {'domain': '2023', 'measure': 0.3},
                    ],
                  },
                ],
                domainLabelPaddingToAxisLine: 16,
                axisLineTick: 2,
                axisLinePointTick: 2,
                axisLinePointWidth: 10,
                axisLineColor: Colors.green,
                measureLabelPaddingToAxisLine: 16,
                barColor: (barData, index, id) => Colors.green,
                showBarValue: true,
              ),
            );
  }

  Material cardToday(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(18),
      elevation: 4,
      color: AppColor.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
            child: Text(
              'Rp 500.000,00',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColor.secondary),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Text(
              '+20% dibanding Kemarin',
              style: TextStyle(
                color: AppColor.bg,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Selengkapnya',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  color: AppColor.primary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
