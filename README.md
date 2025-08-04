# 📝 Task Manager App

A simple task manager app built using **Flutter**, following the **MVVM architecture** and leveraging **Provider** for state management. Tasks are stored locally using **Hive**, ensuring fast and persistent offline access.


## ✨ Features

- Easily manage tasks with options to add, modify, or delete them.
- Tasks stored locally using Hive.
- Clean and intuitive user interface.
- Architecture: MVVM + Repository Pattern.

## Demo
To see the app in action, check out this [demo](https://drive.google.com/drive/folders/1EmluJmn6NWHD-4-5E1-X0qdpDALs5AgA?usp=drive_link).


## 📱 Screenshots

<img width="200" height="450" alt="Tasks List" src="https://github.com/user-attachments/assets/0549ed2c-d18b-4f7d-99aa-005492c0ae0f" />
<img width="200" height="450" alt="Add Task" src="https://github.com/user-attachments/assets/4c33ecad-d3ac-41dc-9443-726754dc3dad" />
<img width="200" height="450" alt="Delete Task" src="https://github.com/user-attachments/assets/c913026f-3470-444d-9528-49af07167352" />



## 🧠 Architecture

This app follows a clean **MVVM architecture**, organized into two main layers:

- **Presentation Layer**:  
  Contains the **View** (Flutter UI) and **ViewModel**.  
  - *View* displays data and listens to state changes.  
  - *ViewModel* manages state and user actions, and communicates with the repository.

- **Data Layer**:  
  Handles all local data operations.  
  - *Repository* abstracts data access and provides a clean API for the ViewModel and a Single Source of Truth.  
  - *Data Source* interacts directly with Hive (local DB).  
  - *Model* defines the Task structure and serialization logic.


## 📁 Project Structure

```bash
lib/
├── core/   # App-wide constants, theming, routing, and DI
├── features/
│ └── home/
│ ├── data/  # Models, repositories, and local data sources
│ └── presentation/  # Screens, widgets and State management 
├── main.dart 
```

## 🛠️ Packages Used

This project leverages the following core packages:

- **[provider](https://pub.dev/packages/provider)**: State management using `ChangeNotifier`, enabling efficient UI updates.
- **[hive](https://pub.dev/packages/hive)** & **[hive_flutter](https://pub.dev/packages/hive_flutter)**: Lightweight, fast local storage for persisting tasks.
- **[get_it](https://pub.dev/packages/get_it)**: A simple service locator for dependency injection and loose coupling between layers.



## 🚀 Getting Started

1. **Clone the repository:**
    ```bash
    git clone https://github.com/nadahossamismail/task_manager.git
    cd task_manager
    ```
    
2. **Install dependencies:**
    ```bash
    flutter pub get
    ```
3. **Generate Hive adapters (if needed):**
   ```bash
    flutter packages pub run build_runner build
    ```
   
5. **Run the app:**
    ```bash
    flutter run --release
    ```

