<h1>Project Readme</h1>

<h2 style="color:blue;" >Introduction</h2>


This project is a Flutter application with a Flask API that uses ARIMA model for prediction. The application also uses Firebase for authentication and Firestore for database management.

The Flutter application takes input age, cycle length, period length, and date and predicts the next cycle. It also shows how many days are remaining and when the remaining days come to 5 days, it shows a notification every day. The application also includes a calendar, statistics, symptoms, and content UI.



<h2>Installation</h2>


<h2>Flutter</h2>

To add Flutter to your existing project, follow these steps:

Install Flutter on your machine by following the instructions provided in the official documentation: https://flutter.dev/docs/get-started/install

Create a new Flutter project or open your existing project in your preferred IDE or text editor.

Run the following command in your terminal to add the Flutter dependencies to your project:

```terminal
flutter pub get

```

<h2>Flask</h2>

To set up Flask on your machine, follow these steps:

Install Python on your machine. You can download Python from the official website: https://www.python.org/downloads/

Install pip, a package manager for Python. You can find instructions to install pip here: https://pip.pypa.io/en/stable/installing/

Install Flask by running the following command in your terminal:

```terminal
pip install flask
```

Verify that Flask is installed correctly by running the following command:

```terminal
flask --version
```


<h2>Firebase</h2>

To set up Firebase on your machine, follow these steps:

Create a Firebase account and project by following the instructions provided in the official documentation: https://firebase.google.com/docs/web/setup

After creating the project, download the Firebase configuration file and add it to your project.


<h2>
ARIMA Model</h2>

ARIMA (Autoregressive Integrated Moving Average) is a time series model used for prediction. It is a statistical model that analyzes past data to make future predictions. In this project, ARIMA is used to predict the next menstrual cycle based on input parameters like age, cycle length, period length, and date.

To install the required libraries for the ARIMA model, run the following command in your terminal:

``` terminal 
pip install numpy pandas matplotlib statsmodels
```



<h2>Running the Application</h2>


Clone the repository to your local machine by running the following command in your terminal:

```terminal
git clone https://github.com/sammanamgain/MENSTRUAL-PERIOD-TRACKER.git
```

Open the project in your preferred IDE or text editor.

<h3>Run the Flask API by navigating to the "api" directory in your terminal and running the following command:</h3>

```python
python app.py
```

<h3>Run the Flutter application by navigating to the "flutter_app" directory in your terminal and running the following command:</h3>

```terminal 
flutter run
```


<h2>Conclusion</h2>

Congratulations! You have successfully set up and run the Flutter application with a Flask API that uses ARIMA model for prediction, and Firebase for authentication and Firestore for database management. The application includes a menstrual cycle prediction feature along with a calendar, statistics, symptoms, and content UI.

<h2>Report</h2>
you can get our project report from this link https://drive.google.com/file/d/1hSSh3oWzCwbDvhkMkHC9izkYlh_VtuHl/view?usp=sharing
