<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<style>
    table {
        height: 80%;
        width: 50%;
        background-color: whitesmoke;
        border-radius: 20pt;
    }

    .p {
        text-align: center;
        font-size: 350%;
    }

    button {
        width: 40%;
        height: 30pt;
        background-color: seagreen;
        color: whitesmoke;
        border-radius: 20pt;
        font-style: normal;
        font-family: Georgia, 'Times New Roman', Times, serif;
    }
    
    #message {
        color: red;
    }
</style>
</head>
<body>
    <table align="center" width="50%" cellspacing="" cellpadding="20">
        <p><h1 class="p">Registration Form</h1></p>
        <form action="insert" name="registrationForm" onsubmit="return validateForm()" enctype="multipart/form-data">
            <tr>
                <td><label>Name</label></td>
                <td><input type="text" placeholder="Username" name="name" id="name" required></td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td><input type="email" placeholder="email" name="email" id="email" required></td>
            </tr>
            <tr>
                <td><label>Mobile Number</label></td>
                <td><input type="text" placeholder="mobile number" maxlength="10" name="mobilenumber" id="mobilenumber" required></td>
            </tr>
            <tr>
                <td><label>Date of birth</label></td>
                <td><input type="date" placeholder="date of birth" name="dob" id="dob" required></td>
            </tr>
            
            <tr>
                <td><label>Upload Resume</label></td>
                <td><input type="file" placeholder="upload resume" name="file" id="file" required></td>
            </tr>
            <tr>
                <td><label for="location">Location</label></td>
                <td>
                    <select name="location" id="location">
                        <option>Any location</option>
                        <option>Bengaluru</option>
                        <option>Hyderabad</option>
                        <option>Chennai</option>
                        <option>New Delhi</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">Submit</button>
                </td>
            </tr>
        </form>
        <tr>
            <td colspan="2">
                <div id="message"></div>
            </td>
        </tr>
    </table>

    <script>
        function validateForm() {
            var name = document.forms["registrationForm"]["name"].value;
            var email = document.forms["registrationForm"]["email"].value;
            var mobileNumber = document.forms["registrationForm"]["mobilenumber"].value;
            var dob = document.forms["registrationForm"]["dob"].value;
            var location = document.forms["registrationForm"]["location"].value;

            var nameRegex = /^[a-zA-Z]+$/;
            if (name === "" || !name.match(nameRegex)) {
                displayMessage("Name must contain only alphabets.");
                return false;
            }

            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === "" || !email.match(emailRegex)) {
                displayMessage("Invalid email format.");
                return false;
            }

            var mobileRegex = /^[0-9]+$/;
            if (mobileNumber === "" || !mobileNumber.match(mobileRegex)) {
                displayMessage("Mobile number must contain only numbers.");
                return false;
            }

            var dobDate = new Date(dob);
            var today = new Date();
            var age = today.getFullYear() - dobDate.getFullYear();
            var m = today.getMonth() - dobDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < dobDate.getDate())) {
                age--;
            }
            if (age < 21) {
                displayMessage("Age must be above 21 years.");
                return false;
            }

            if (location === "") {
                displayMessage("Please select a location.");
                return false;
            }

            // Identification Document validation (file type and size)
            var identificationDocument = document.getElementById('file').value;
            var identificationFileType = identificationDocument.split('.').pop().toLowerCase();
            if (identificationDocument === "" || (identificationFileType !== "pdf")) {
                displayMessage("Identification document must be a PDF file.");
                return false;
            }

            var identificationFileSize = document.getElementById('identificationDocument').files[0].size;
            if (identificationFileSize > 2000000) {
                displayMessage("Identification document file size must be less than 2MB.");
                return false;
            }

            return true;
        }

        function displayMessage(message) {
            document.getElementById("message").innerText = message;
        }
    </script>
</body>
</html>
    