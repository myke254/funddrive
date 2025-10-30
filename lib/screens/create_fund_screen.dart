import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:funddrive/widgets/base_scaffold.dart';
import 'package:funddrive/widgets/text_input_field.dart';
import 'package:file_picker/file_picker.dart';

class CreateFundScreen extends StatefulWidget {
  const CreateFundScreen({super.key});

  @override
  State<CreateFundScreen> createState() => _CreateFundScreenState();
}

class _CreateFundScreenState extends State<CreateFundScreen> {
  Uint8List? _imageBytes;
  String? _fileName;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _imageBytes = result.files.single.bytes;
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return BaseScaffold(
      title: '',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Center(
            child: Container(
              //height: size.height,
              width: size.width / 1.6,
              decoration: BoxDecoration(
                color: theme.canvasColor,
                border: Border.all(color: theme.dividerColor, width: .7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'Launch a New Initiative',
                      style: theme.textTheme.headlineMedium,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Fill out the details below to get your fundraising campaign started.',
                    ),
                    SizedBox(height: 30),
                    Text('Initiative title'),
                    SizedBox(height: 12),
                    TextInputField(
                      hintText: 'e.g., Community Library Renovation',
                    ),
                    SizedBox(height: 30),
                    Text('Description'),
                    SizedBox(height: 12),
                    TextInputField(
                      hintText: 'Tell us more about your cause...',
                      maxLines: 5,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Fundraising Goal'),
                              SizedBox(height: 12),
                              TextInputField(
                                keyboardType: TextInputType.number,
                                suffix: Text('KES'),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('WhatsApp Group Link (Optional)'),
                              SizedBox(height: 12),
                              TextInputField(
                                hintText: 'https://chat.whatsapp.com/...',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: theme.dividerColor,
                          width: .7,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              'Cover Image',
                              style: theme.textTheme.headlineMedium,
                            ),
                            SizedBox(height: 5),
                            Text('Upload an image for your initiative.'),

                            SizedBox(height: 20),
                            Text('Upload Image'),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: () => _pickImage(),
                              child: Container(
                                height: 45,
                                width:
                                    ((size.width / 1.6 / 2) - 56) < 200
                                        ? 200
                                        : (size.width / 1.6 / 2) - 56,
                                decoration: BoxDecoration(
                                  color: theme.scaffoldBackgroundColor,
                                  border: Border.all(
                                    color: theme.dividerColor,
                                    width: .7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 6),
                                      Text('Pick a File -'),
                                      Text(
                                        _fileName == null
                                            ? 'No File Chosen'
                                            : _fileName!,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                radius: Radius.circular(10),
                                dashPattern: [10, 5],
                                strokeWidth: 2,
                                color: theme.dividerColor,
                                padding: EdgeInsets.all(0),
                              ),
                              child: Container(
                                height: 180,
                                width:
                                    ((size.width / 1.6 / 2) - 56) < 200
                                        ? 200
                                        : (size.width / 1.6 / 2) - 56,
                                decoration: BoxDecoration(
                                  color: theme.scaffoldBackgroundColor,

                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    _imageBytes == null
                                        ? Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.image_outlined,
                                                color: Colors.grey,
                                                size: 50,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Image preview will appear here',
                                              ),
                                            ],
                                          ),
                                        )
                                        : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.memory(
                                            _imageBytes!,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: theme.canvasColor,
                        minimumSize: Size(120, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed:
                          () => Navigator.of(context).pushNamed('/create'),
                      child: Text(
                        'Create Initiative',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.canvasColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
