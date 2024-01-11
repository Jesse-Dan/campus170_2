// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:campus170_2/src/logic/services/handler/handlers/loading_handler.dart';
import 'package:campus170_2/src/logic/services/handler/handlers/success_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';

import '../src/logic/services/paystack_service/paystack_service.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController amountController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  final PaystackService paystackService = PaystackService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paystack Test App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Test addCustomer function
                  LoadingHandler(context: context);
                  final response = await paystackService.addCustomer(
                    emailController.text.trim(),
                    nameController.text.trim(),
                    phoneController.text.trim(),
                  );
                  Go(context).pop();
                  SuccessHandler(
                      context: context,
                      message: 'Add Customer Response: $response');
                },
                child: const Text('Add Customer'),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  LoadingHandler(context: context);
                  final response = await paystackService.initializeTransaction(
                    double.parse(amountController.text.trim()),
                    emailController.text.trim(),
                  );
                  Go(context).pop();
                  SuccessHandler(
                      context: context,
                      message: 'Initialize Transaction Response: $response');
                },
                child: const Text('Initialize Transaction'),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: referenceController,
                decoration:
                    const InputDecoration(labelText: 'Transaction Reference'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Test verifyTransaction function
                  LoadingHandler(context: context);

                  final response = await paystackService.verifyTransaction(
                    referenceController.text.trim(),
                  );
                  Go(context).pop();
                  SuccessHandler(
                      context: context,
                      message:
                          'Verify Transaction Response: ${response['message']}');
                  if (kDebugMode) {
                    print('Verify Transaction Response: $response');
                  }
                },
                child: const Text('Verify Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
