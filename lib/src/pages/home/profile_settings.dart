import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/models/user/user_profile_data.dart';
import 'package:mulki_zerin/src/utils/local_storage_service.dart';

class ProfileSetting extends StatefulWidget {
  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  LocalStorageService _storageService;
  UserProfileDataModel currentUser;

  bool _dark;

  @override
  void initState() {
    super.initState();
    _dark = false;
    _fetchInitData();
  }

  _fetchInitData() async {
    try {
      _storageService = await LocalStorageService.getInstance();
      setState(() {
        currentUser = _storageService.currentUser;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : AppColors.darkPrimaryColor),
          backgroundColor: Colors.transparent,
          title: Text(
            'Settings',
            style: TextStyle(color: _dark ? Colors.white : AppColors.darkPrimaryColor),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.nightlight_round),
              onPressed: () {
                setState(() {
                  _dark = !_dark;
                });
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: AppColors.darkPrimaryColor,
                    child: ListTile(
                      onTap: () {
                        //open edit profile
                      },
                      title: Text(
                        currentUser != null ? currentUser.fullName : "Guest",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(currentUser != null ? currentUser.avatarUrl : ""),
                        backgroundColor: AppColors.lightPrimaryColor,
                      ),

                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            color: AppColors.darkPrimaryColor,
                          ),
                          title: Text(
                            "Change Password",
                            style: TextStyle(color: AppColors.darkPrimaryColor),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: AppColors.darkPrimaryColor,
                          ),
                          onTap: () {
                            //open change password
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.language,
                            color: AppColors.darkPrimaryColor,
                          ),
                          title: Text(
                            "Change Language",
                            style: TextStyle(color: AppColors.darkPrimaryColor),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: AppColors.darkPrimaryColor,
                          ),
                          onTap: () {
                            //open change language
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.email,
                            color: AppColors.darkPrimaryColor,
                          ),
                          title: Text(
                            "Email",
                            style: TextStyle(color: AppColors.darkPrimaryColor),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: AppColors.darkPrimaryColor,
                          ),
                          onTap: () {
                            //open change location
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Notification Settings",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkPrimaryColor,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: AppColors.darkPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Received notification",style: TextStyle(color: AppColors.darkPrimaryColor),),
                    onChanged: (val) {},
                  ),

                  const SizedBox(height: 60.0),
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.darkPrimaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 00,
              left: 00,
              child: IconButton(
                icon: Icon(
                  Icons.power_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  //log out
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: AppColors.lightPrimaryColor,
    );
  }
}
