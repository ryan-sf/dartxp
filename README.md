# dartxp
The purpose of this project is to explore the perils of web development with Dart.

The specific options reviewed are AngularDart and Flutter for Web.

## getting started

From the project root, run `./setup.sh`

### Running the web application

From the **web** folder, run `webdev serve --debug` in your terminal.  

### Running the mobile application

From the **mobile** folder, run `flutter run -d chrome` in your terminal.  You must [enable web support](https://flutter.dev/docs/get-started/web) for this to work.

**Important:** If you are using webdev thru Flutter, enabling web support will break the Angular build.  You will need to reinstall the release version of Flutter to fix this, or have a separate install of the dart sdk to run webdev.
