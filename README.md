## 📱 YARTU Task

### 🔎 Preview

https://user-images.githubusercontent.com/55639112/155801069-aa24fa74-2087-49a1-a006-1581456d2bb2.mov

https://user-images.githubusercontent.com/55639112/155801708-71172d2a-b019-4dd8-80c0-3059f8151c4c.mov

https://user-images.githubusercontent.com/55639112/155802023-582a0b3e-d534-40de-844a-6c61e95b2e51.mov

https://user-images.githubusercontent.com/55639112/155803631-22aad900-c5c3-43f8-8e1c-7415fb92e895.mov

https://user-images.githubusercontent.com/55639112/155803794-5d60e0bf-8f25-4250-b295-cda8856ab0e8.mov

https://user-images.githubusercontent.com/55639112/155804125-dcc858a7-7911-4607-a6af-4dad40065337.mov

### 📁 Description
I did the task that came to me from Yartu. The data in the login system is post to the API. Login is performed according to the arrow status from the API.

### 📶 API
Yartu's API is used in this project. Data in the API is parsed with the ["json_serializable"](https://pub.dev/packages/json_serializable) and ["json_annotation"](https://pub.dev/packages/json_annotation) methods. The ["dio"](https://pub.dev/packages/dio) package is used to send requests to the API.

### 🧑🏻‍💻 Coding
I tried to write this project as clean code as possible. I used mvvm as the software architecture model. In terms of folders, the project proceeds through three main folders. The core folder contains structures such as extensions, singleton classes, base classes, and navigation routes that I use in every project. The Properties folder is the part where each screen is separated according to the MVMM software architecture model, and the design and API integration is done. The product folder is the part where the atomic widgets or components I have prepared or my managers are located. Used as provider state management.


### 🎁 APK
You can find the apk [here.](https://www.mediafire.com/file/l2galzjgl3vpd36/app-release.apk/file)
