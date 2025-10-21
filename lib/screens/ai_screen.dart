import 'package:flutter/material.dart';

class AiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Putih bersih
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Asisten Kecerdasan Buatan", style: TextStyle(color: Color(0xFF2B0A46))),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFF2B0A46),
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Switch(
              value: true,
              onChanged: (_) {},
              activeColor: Colors.white,
              activeTrackColor: Color(0xFF2B0A46),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/ai.png',
              height: 180,
            ),
            SizedBox(height: 30),
            Text("Hallo, Ferdy", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              "Masukan Prompt Untuk Mendapatkan Jawaban",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ketik Disini",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2B0A46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Hapus Prompt"),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2B0A46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Kirim Prompt"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
