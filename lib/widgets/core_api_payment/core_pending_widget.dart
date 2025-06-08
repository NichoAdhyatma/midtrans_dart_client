import 'package:flutter/material.dart';

class CorePendingWidget extends StatelessWidget {
  const CorePendingWidget({
    super.key,
    required this.remainingTime,
    required this.qrImageUrl,
    required this.amount,
  });

  final ValueNotifier<Duration> remainingTime;
  final String qrImageUrl;
  final double amount;

  String formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'Pembayaran Tertunda',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              floating: true,
              snap: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withValues(
                      alpha: 0.2,
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Scan QR Code untuk melanjutkan pembayaran'),
                    SizedBox(height: 5),
                    Text('Rp ${amount.toStringAsFixed(0)}'),
                    SizedBox(height: 10),
                    Image.network(
                      'https://hosttools.com/wp-content/uploads/QR-Code-.png',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withValues(
                          alpha: 0.1,
                        ),
                      ),
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: remainingTime,
                          builder: (context, value, child) {
                            return Text(
                              'Kode berlaku ${formatDuration(value)}',
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    //download code qr
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blueGrey.withValues(
                              alpha: 0.2,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Download Kode QR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Cara Membayar dengan QR Code'),
                    SizedBox(height: 10),
                    Text(
                      '1. Buka aplikasi dompet digital Anda (Gopay, OVO, DANA, dll).\n'
                      '2. Scan atau upload gambar QR Code".\n'
                      '3. Periksa kembali total pembayaran.\n'
                      '4. Selesaikan pembayaran.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffd63c3c),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'PILIH PEMBAYARAN LAIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xffd63c3c),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'KEMBALI KE LAYAR UTAMA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffd63c3c),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
