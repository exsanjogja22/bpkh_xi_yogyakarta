import 'package:get/get.dart';

import 'package:bpkh_xi_yogyakarta/app/modules/aprovalbarang/bindings/aprovalbarang_binding.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/aprovalbarang/views/aprovalbarang_view.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/detailalat/bindings/detailalat_binding.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/detailalat/views/detailalat_view.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/homekepalabalai/bindings/homekepalabalai_binding.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/homekepalabalai/views/homekepalabalai_view.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/kontakkepalabalai/bindings/kontakkepalabalai_binding.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/kontakkepalabalai/views/kontakkepalabalai_view.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/morekepalabalai/bindings/morekepalabalai_binding.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/morekepalabalai/views/morekepalabalai_view.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/statistik/bindings/statistik_binding.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/statistik/views/statistik_view.dart';
import '../modules/detailpengajuan/bindings/detailpengajuan_binding.dart';
import '../modules/detailpengajuan/views/detailpengajuan_view.dart';
import '../modules/formstransaksi/bindings/formstransaksi_binding.dart';
import '../modules/formstransaksi/views/formstransaksi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/infopeminjam/bindings/infopeminjam_binding.dart';
import '../modules/infopeminjam/views/infopeminjam_view.dart';
import '../modules/kontak/bindings/kontak_binding.dart';
import '../modules/kontak/views/kontak_view.dart';
import '../modules/listbarang/bindings/listbarang_binding.dart';
import '../modules/listbarang/views/listbarang_view.dart';
import '../modules/loginkepalabalai/bindings/loginkepalabalai_binding.dart';
import '../modules/loginkepalabalai/views/loginkepalabalai_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/peminjaman/bindings/peminjaman_binding.dart';
import '../modules/peminjaman/views/peminjaman_view.dart';
import '../modules/userlevel/bindings/userlevel_binding.dart';
import '../modules/userlevel/views/userlevel_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.PEMINJAMAN,
        page: () => PeminjamanView(),
        binding: PeminjamanBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.INFOPEMINJAM,
        page: () => InfopeminjamView(),
        binding: InfopeminjamBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.KONTAK,
        page: () => KontakView(),
        binding: KontakBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.MORE,
        page: () => MoreView(),
        binding: MoreBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.FORMSTRANSAKSI,
      page: () => FormstransaksiView(),
      binding: FormstransaksiBinding(),
    ),
    GetPage(
      name: _Paths.LISTBARANG,
      page: () => ListbarangView(),
      binding: ListbarangBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPENGAJUAN,
      page: () => DetailpengajuanView(),
      binding: DetailpengajuanBinding(),
    ),
    GetPage(
      name: _Paths.USERLEVEL,
      page: () => UserlevelView(),
      binding: UserlevelBinding(),
    ),
    GetPage(
      name: _Paths.LOGINKEPALABALAI,
      page: () => LoginkepalabalaiView(),
      binding: LoginkepalabalaiBinding(),
    ),
    GetPage(
        name: _Paths.HOMEKEPALABALAI,
        page: () => HomekepalabalaiView(),
        binding: HomekepalabalaiBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.DETAILALAT,
      page: () => DetailalatView(),
      binding: DetailalatBinding(),
    ),
    GetPage(
        name: _Paths.APROVALBARANG,
        page: () => AprovalbarangView(),
        binding: AprovalbarangBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.STATISTIK,
        page: () => StatistikView(),
        binding: StatistikBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.MOREKEPALABALAI,
      page: () => MorekepalabalaiView(),
      binding: MorekepalabalaiBinding(),
    ),
    GetPage(
      name: _Paths.KONTAKKEPALABALAI,
      page: () => KontakkepalabalaiView(),
      binding: KontakkepalabalaiBinding(),
    ),
  ];
}
