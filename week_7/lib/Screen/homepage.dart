import 'package:flutter/material.dart';

List<Map> data = [
  {
    'title': 'Pasta Kapal Karam',
    'price': 20000,
    'image_url':
        'https://images.immediate.co.uk/production/volatile/sites/30/2013/05/Puttanesca-fd5810c.jpg?quality=90&webp=true&resize=375,341'
  },
  {
    'title': 'Pudding Pak Hambali',
    'price': 30000,
    'image_url':
        'https://img.kurio.network/mnAOL93a9e0d5C4aZ1PbSclJuk8=/440x440/filters:quality(80)/https://kurio-img.kurioapps.com/21/11/02/523b7d41-2228-46d0-8290-33bfdaadd28a.jpe'
  },
  {
    'title': 'Bakpia Coklat Khas Jogja',
    'price': 30000,
    'image_url':
        'https://piaagungbali.com/wp-content/uploads/2020/06/pia-coklat1.jpg'
  },
  {
    'title': 'Lapis Legit Mas Rehan',
    'price': 30000,
    'image_url':
        'https://javara.co.id/wp-content/uploads/2023/01/istockphoto.jpeg'
  },
  {
    'title': 'Kue Lumpur Lapindo Pak Ruslan',
    'price': 30000,
    'image_url':
        'https://static.promediateknologi.id/crop/0x22:881x547/750x500/webp/photo/2022/12/18/879737756.jpg'
  },
  {
    'title': 'Farhan Kebab',
    'price': 30000,
    'image_url':
        'https://www.dapurkobe.co.id/wp-content/uploads/kebab-sosis.jpg'
  },
  {
    'title': 'Risol Mayo Nyit Nyit',
    'price': 30000,
    'image_url':
        'https://www.astronauts.id/blog/wp-content/uploads/2023/11/Resep-Risol-Mayo-Lumer-Cocok-Untuk-Usaha-Kuliner.jpg'
  },
];

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.account_circle, size: 100),
                onPressed: () {},
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Night,',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Rusdi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: const Image(
              image: AssetImage(
                  'assets/images/side-view-cook-making-delicious-pasta.jpg'),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Mau Makan Apa Hari Ini?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              data[index]['image_url'],
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]['title'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rp ${data[index]['price']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data.length),
          ),
        ],
      ),
    ));
  }
}
