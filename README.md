# Let's Note

A streamlined productivity application built with Flutter that helps users effectively manage their personal notes and tasks. It functions as a digital workspace where users can jot down thoughts, categorize them with tags, set deadline reminders, and easily filter their information.

## Features

* **Note Management:** Create, edit, and delete notes. Notes serve as actionable items where you can write titles and detailed content.
* **Tagging System:** Create custom tags and assign them to notes for logical grouping (e.g., "Work," "School," "Groceries").
* **Integrated Reminders:** Assign specific deadlines to notes using an intuitive date and time picker. Mark notes as "Complete" or "Not Complete" directly from the home screen.
* **Smart Filtering:** Quickly narrow down your workspace by filtering notes based on their completion status (All, Done, Not Done) or by their associated tags.

## Tech Stack

This application follows the **Model-View-Controller (MVC)** architectural pattern, ensuring a clean separation between the User Interface and the database logic.

* **Frontend (View):** [Flutter](https://flutter.dev/) & Dart
* **Local Backend / ORM (Controller):** [Drift](https://drift.simonbinder.eu/) 
* **Database (Model):** SQLite (managed via Drift)
* **Time Management:** Omni Datetime Picker (for deadline selection)
