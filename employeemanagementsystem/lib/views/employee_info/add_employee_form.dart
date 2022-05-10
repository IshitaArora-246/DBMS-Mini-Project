import 'package:employeemanagementsystem/main.dart';
import 'package:employeemanagementsystem/models/employee_info/employee_info.dart';
import 'package:employeemanagementsystem/views/employee_info/providers/emp_info_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddEditEmployeeForm extends ConsumerStatefulWidget {
  const AddEditEmployeeForm({Key? key, this.employee, this.isAdmin = false})
      : super(key: key);
  final EmployeeInfo? employee;
  final bool isAdmin;
  @override
  _AddEditEmployeeFormState createState() => _AddEditEmployeeFormState();
}

class _AddEditEmployeeFormState extends ConsumerState<AddEditEmployeeForm> {
  late EmployeeInfo? employee;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController empIdCtrl;
  late TextEditingController fNameCtrl;
  late TextEditingController mNameCtrl;
  late TextEditingController lNameCtrl;
  late TextEditingController genderCtrl;
  late TextEditingController dobCtrl;
  late TextEditingController dojCtrl;
  late TextEditingController empSalaryCtrl;
  late TextEditingController empEmailCtrl;
  late TextEditingController empPhoneCtrl;

  @override
  void initState() {
    super.initState();
    employee = widget.employee;

    empIdCtrl = TextEditingController(text: employee?.emp_id.toString());
    fNameCtrl = TextEditingController(text: employee?.fname);
    mNameCtrl = TextEditingController(text: employee?.mname);
    lNameCtrl = TextEditingController(text: employee?.lname);
    genderCtrl = TextEditingController(text: employee?.gender);
    dobCtrl = TextEditingController(text: employee?.dob.toString());
    dojCtrl = TextEditingController(text: employee?.doj.toString());
    empSalaryCtrl =
        TextEditingController(text: employee?.emp_salary.toString());
    empEmailCtrl = TextEditingController(text: employee?.emp_email);
    empPhoneCtrl = TextEditingController(text: employee?.emp_phone.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 70,
                  color: Colors.amber.shade600,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                      Text(
                        employee == null
                            ? "Add new Employee Information"
                            : "Showing Details For- #${employee!.emp_id}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        _buildInputField(
                          title: "Employee Id",
                          hintText: "7",
                          controller: empIdCtrl,
                          isRequired: true,
                          textInputType: TextInputType.number,
                        ),
                        _buildInputField(
                          title: "First Name",
                          hintText: "John",
                          controller: fNameCtrl,
                          isRequired: true,
                          textInputType: TextInputType.name,
                        ),
                        _buildInputField(
                          title: "Middle Name",
                          hintText: "K.",
                          controller: mNameCtrl,
                          isRequired: true,
                          textInputType: TextInputType.name,
                        ),
                        _buildInputField(
                          title: "Last Name",
                          hintText: "Doe",
                          controller: lNameCtrl,
                          isRequired: true,
                          textInputType: TextInputType.name,
                        ),
                        _buildInputField(
                            title: "Gender",
                            hintText: "Male / Female",
                            controller: genderCtrl,
                            isRequired: true,
                            textInputType: TextInputType.text),
                        _buildInputField(
                          title: "Date of Birth",
                          hintText: "12-03-2001",
                          controller: dobCtrl,
                          isRequired: false,
                          textInputType: TextInputType.text,
                        ),
                        _buildInputField(
                          title: "Date of Joining",
                          hintText: "20-12-2019",
                          controller: dojCtrl,
                          isRequired: true,
                          textInputType: TextInputType.text,
                        ),
                        _buildInputField(
                          title: "Salary",
                          hintText: "200000",
                          controller: empSalaryCtrl,
                          isRequired: true,
                          textInputType: TextInputType.number,
                        ),
                        _buildInputField(
                          title: "Email",
                          hintText: "example123@gmail.com",
                          controller: empEmailCtrl,
                          isRequired: true,
                          textInputType: TextInputType.emailAddress,
                        ),
                        _buildInputField(
                          title: "Phone",
                          hintText: "9876543210",
                          controller: empPhoneCtrl,
                          isRequired: true,
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(
                          width: 250,
                          child: CustomButton(
                            text: "Update",
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_formKey.currentState!.validate()) {
                                EmployeeInfo _updatedItem = EmployeeInfo(
                                  emp_id: 17,
                                  fname: "Isha",
                                  mname: "S.",
                                  lname: "aks",
                                  dob: "20-12-1995",
                                  doj: "20-12-2020",
                                  emp_email: "email@gmail.com",
                                  emp_salary: int.parse("20000"),
                                  gender: "Female",
                                  emp_phone: "0987654321",
                                );

                                var requestbody = _updatedItem.toJson();
                                logger.v(requestbody);
                                // ignore: avoid_print
                                print(requestbody);

                                DPToast.showToast("Request Sent");
                                Navigator.pop(context);

                                try {
                                  // EmployeeInfo _updatedItem = EmployeeInfo(
                                  //   emp_id: int.parse(empIdCtrl.text.trim()),
                                  //   fname: fNameCtrl.text.trim(),
                                  //   mname: mNameCtrl.text.trim(),
                                  //   lname: lNameCtrl.text.trim(),
                                  //   dob: dobCtrl.text.trim(),
                                  //   doj: dojCtrl.text.trim(),
                                  //   emp_email: empEmailCtrl.text.trim(),
                                  //   emp_salary:
                                  //       int.parse(empSalaryCtrl.text.trim()),
                                  //   gender: genderCtrl.text.trim(),
                                  //   emp_phone: (empPhoneCtrl.text.trim()),
                                  // );
                                  await ref
                                      .read(
                                          emp_info_repository_provider.notifier)
                                      .addEmployeeInfo(requestbody);

                                  DPToast.showToast("Completed");
                                } on Exception catch (e) {
                                  DPToast.showToast("Some error occurred");
                                  logger.e(e);
                                  return;
                                }
                              } else {
                                DPToast.showToast(
                                    "Please fill the required fields");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String hintText,
    required String title,
    required TextEditingController controller,
    required bool isRequired,
    TextInputType? textInputType,
  }) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 450, minWidth: 320),
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("$title${isRequired ? " *" : ""}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                width: 5,
              ),
              if (textInputType == TextInputType.emailAddress)
                const Tooltip(
                  message: "Incase you don't have a email, Contact Us.",
                  verticalOffset: -45,
                  height: 24,
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              if (textInputType == TextInputType.phone)
                const Tooltip(
                  message: "Please start with country code like +91, +85 etc.",
                  verticalOffset: -45,
                  height: 30,
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.grey,
                    size: 18,
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (value) {
              if (!isRequired) return null;
              if (value == null) {
                return "Invalid Entry";
              }
              if (value.isEmpty) {
                return "This field can't be empty";
              }
            },
            keyboardType: textInputType,
            inputFormatters: textInputType == TextInputType.phone
                ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))]
                : null,
            controller: controller,
            decoration: buildTextFieldStyle(hintText),
          ),
        ],
      ),
    );
  }

  InputDecoration buildTextFieldStyle(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 2, color: Colors.amber)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.amber.withOpacity(0.6),
        ),
      ),
    );
  }
}

class DPToast {
  static void showToast(String msg) {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 4,
      msg: msg,
      textColor: Colors.black,
      backgroundColor: Colors.grey[300],
      fontSize: 15.0,
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.amber,
                Colors.amber.shade600,
              ]),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
