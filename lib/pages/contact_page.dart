import 'package:flutter/material.dart';
import 'package:project1_flutter/controller/contact_controller.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/widgets/custom_button.dart';
import 'package:project1_flutter/widgets/custom_textfield.dart';


class ContactPage extends StatelessWidget {
  final ContactController controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Name Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    textEditingController: controller.nameController,
                    labelText: 'Input Name',
                    IsPassword: false,
                  ),
                ),
                const SizedBox(width: 8),
                CustomButton(
                  text: 'Save',
                  textColor: Colors.black,
                  onPressed: controller.addName,
                ),
              ],
            ),
            const SizedBox(height: 16),

            
            Expanded(
              child: Obx(() {
                if (controller.names.isEmpty) {
                  return const Center(
                    child: Text('No names saved yet'),
                  );
                }

                return ListView.builder(
                  itemCount: controller.names.length,
                  itemBuilder: (context, index) {
                    final item = controller.names[index];
                    final id = item['id'];
                    final name = item['name'];

                    return Card(
                      child: ListTile(
                        title: Text(name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                final editController =
                                    TextEditingController(text: name);

                                Get.defaultDialog(
                                  title: 'Edit Name',
                                  content: Column(
                                    children: [
                                      TextField(
                                        controller: editController,
                                        decoration: const InputDecoration(
                                          labelText: 'New Name',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.updateName(
                                              id, editController.text);
                                          Get.back();
                                        },
                                        child: const Text('Update'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'Delete Name',
                                  middleText:
                                      'Are you sure you want to delete "$name"?',
                                  confirm: ElevatedButton(
                                    onPressed: () {
                                      controller.deleteName(id);
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text('Delete'),
                                  ),
                                  cancel: TextButton(
                                    onPressed: Get.back,
                                    child: const Text('Cancel'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}