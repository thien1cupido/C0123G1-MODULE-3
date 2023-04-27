<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        .container-form {
            width: 450px;
            margin: 0 30vw;
            padding: 0 5vw 10vw;
            align-content: center;
        }

        .form {
            text-align: left;
            float: left;
        }

        label {
            float: left;
            width: 150px;
        }

        button, select, input {
            margin-top: 5px;
            float: left;
        }

        button {
            margin-left: 200px;
        }

        legend {
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container-form">
    <h1>Simple Calculator</h1>
    <form class="form" action="/calculator" method="get">
        <fieldset>
            <legend>Calculator</legend>
            <label>First operand:</label>
            <input type="number" name="number1" placeholder="enter number"><br>
            <label>Operator:</label>
            <select name="calculation">
                <option value="add">Additon</option>
                <option value="sub">Subtraction</option>
                <option value="multi">Multiplication</option>
                <option value="div">Division</option>
            </select><br>
            <label>Second operand:</label>
            <input type="number" name="number2" placeholder="enter number"><br>
            <button>Prepare</button>
        </fieldset>
    </form>
</div>
</body>
</html>