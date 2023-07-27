<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Connect to the database (replace 'db_username', 'db_password', 'db_name', and 'localhost' with your database credentials)
    $conn = new mysqli('localhost', 'root', '', 'tba database');

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get form data and sanitize inputs
    $full_name = $_POST["full_name"];

    // Perform server-side validation for full name
    if (!preg_match('/^[A-Za-z]/', $full_name)) {
        die("Full Name must start with a letter.");
    }

    $email = $_POST["email"];

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Please enter a valid email address.");
    }

    $phone = $_POST["phone"];

    if (!preg_match('/^\d{10}$/', $phone)) {
        die("Please enter a valid 10-digit phone number.");
    }

    $address = $_POST["address"];
    $date_of_birth = $_POST["date_of_birth"];
    $nationality = $_POST["nationality"];
    $institution = $_POST["institution"];
    $field_of_study = $_POST["field_of_study"];
    $training_area = $_POST["training_area"];
    $start_date = $_POST["start_date"];
    $duration = $_POST["duration"];
    $motivation = $_POST["motivation"];
    $career_goals = $_POST["career_goals"];

    // Prepare and execute the SQL query to insert data into the 'students' table
    $sql = "INSERT INTO students (full_name, email, phone, address, date_of_birth, nationality, institution, field_of_study) 
            VALUES ('$full_name', '$email', '$phone', '$address', '$date_of_birth','$nationality', '$institution', '$field_of_study')";

    if ($conn->query($sql) === TRUE) {
        $student_id = $conn->insert_id; // Get the auto-generated student ID

        // Prepare and execute the SQL queries to insert data into other tables using the student_id as the foreign key
        $sql_training_preferences = "INSERT INTO training_preferences (student_id, training_area, start_date, duration) 
                                    VALUES ($student_id, '$training_area', '$start_date', '$duration')";

        $sql_motivation_goals = "INSERT INTO motivation_goals (student_id, motivation, career_goals) 
                                VALUES ($student_id, '$motivation', '$career_goals')";

        // Execute the queries
        if ($conn->query($sql_training_preferences) === TRUE && $conn->query($sql_motivation_goals) === TRUE) {
            // If all queries are successful, inform the user about the successful submission
            echo "Application submitted successfully!";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

        // Close the database connection
        $conn->close();
        
        // Redirect to the user interface HTML file (index.html)
        header("Location: index.html");
        exit();

    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Close the database connection
    $conn->close();
}
?>
