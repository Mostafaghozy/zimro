import 'package:zimro/features/presentation/widgets/cart/CustomButtonToCheckout.dart';
import 'package:zimro/features/presentation/widgets/auth/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({super.key});

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController(
    text: '17/09/99',
  );
  final TextEditingController emailController = TextEditingController(
    text: 'zimrofashion@gmail.com',
  );
  final TextEditingController phoneController = TextEditingController(
    text: '+94 71 123 432 7',
  );

  String selectedGender = 'Male';

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white54),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Edit personal info',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 30),

            CustomInputField(
              label: 'First name',
              controller: firstNameController,

              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 12),
            CustomInputField(
              label: 'Surname',
              controller: lastNameController,

              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 12),
            CustomInputField(
              label: 'Gender',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedGender,
                  items: const [
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                  ],
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => selectedGender = value);
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            CustomInputField(
              label: 'Date of birth',
              child: TextFormField(
                controller: dobController,
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  final now = DateTime.now();
                  final initial = DateTime(now.year - 18, now.month, now.day);
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: initial,
                    firstDate: DateTime(1900),
                    lastDate: now,
                  );
                  if (picked != null) {
                    setState(() {
                      dobController.text =
                          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString().substring(2)}';
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
            const SizedBox(height: 10),
            Text('Email', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),

            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
            const SizedBox(height: 10),
            Text('Phone number', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Enter your phone number',
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),

            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
            const SizedBox(height: 10),
            CustomButtonToCheckout(text: 'Save', onTap: () {}),
          ],
        ),
      ),
    );
  }

  // _buildLabeledBox no longer used; using CustomInputField(child: ...) instead.
}
