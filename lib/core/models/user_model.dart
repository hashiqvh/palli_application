List<UserModel> dummyDataList = [
  UserModel(
    name: 'John Doe',
    email: 'john@example.com',
    phone: '+1234567890',
    image: 'https://randomuser.me/api/portraits/men/9.jpg',
  ),
  UserModel(
    name: 'Jane Smith',
    email: 'jane@example.com',
    phone: '+9876543210',
    image: 'https://randomuser.me/api/portraits/men/65.jpg',
  ),
  UserModel(
    name: 'Alice Johnson',
    email: 'alice@example.com',
    phone: '+1112223333',
    image: 'https://randomuser.me/api/portraits/men/86.jpg',
  ),
  // Add more dummy data as needed
];

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String image;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.image});
}
