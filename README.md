Overview

This project is a simple expense tracking app implemented using SwiftUI. It demonstrates the use of various SwiftUI components and concepts to build a functional and user-friendly application.

Key Learnings

	1.	SwiftUI Basics:
	•	Implementing a basic List view to display items.
	•	Using NavigationStack for navigation and Form for user input.
	2.	State Management:
	•	Utilized @State for managing state within views.
	•	Implemented a custom Expenses class to handle persistent data storage.
	3.	Data Persistence:
	•	Encoded and decoded data using JSONEncoder and JSONDecoder to persist expenses using UserDefaults.
	4.	Modals and Sheets:
	•	Created a modal view (AddView) for adding new expenses with .sheet.
	5.	Form Controls:
	•	Used TextField for text input and Picker for selecting options.
	•	Incorporated .currency formatting for displaying amounts.
	6.	View Presentation:
	•	Leveraged .navigationTitle and .toolbar to enhance user experience.

Components Used

	•	ContentView: Displays a list of expenses and provides functionality to delete items and present the AddView sheet.
	•	AddView: A form-based view for adding new expenses with fields for name, type, and amount.
	•	Expenses: A class managing a list of ExpenseItem instances with persistent storage through UserDefaults.

This project is a practical example of using SwiftUI and data persistence to create a straightforward, functional app.
