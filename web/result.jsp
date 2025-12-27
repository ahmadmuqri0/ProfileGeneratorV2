<%-- 
    Document   : result.jsp
    Created on : Nov 22, 2025, 8:19:05 PM
    Author     : muqri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🌟Your Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #387adf;
            --background-color: #9ec3fc;
            --card-background: #ffffff;
            --text-color: #495057;
            --heading-color: #212529;
            --border-radius: 12px;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --transition-speed: 0.3s;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--background-color);
            min-height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .profile-card {
            background: var(--card-background);
            width: 100%;
            max-width: 700px;
            padding: 40px;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            animation: fadeIn 0.8s ease-out;
            border-left: 5px solid var(--primary-color);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .profile-card h2 {
            text-align: center;
            color: var(--heading-color);
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 1.8rem;
            border-bottom: 2px solid #E9ECEF;
            padding-bottom: 15px;
        }
        
        .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .detail-item {
            padding: 15px;
            background: #f1f7fe;
            border-radius: 8px;
            border-left: 3px solid var(--primary-color);
        }

        .detail-item strong {
            display: block;
            color: var(--secondary-color);
            font-weight: 600;
            margin-bottom: 5px;
            font-size: 0.95rem;
        }

        .detail-item span {
            color: var(--text-color);
            font-weight: 400;
            font-size: 1rem;
        }

        .full-width-section {
            margin-top: 20px;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #DEE2E6;
        }
        
        .full-width-section strong {
            display: block;
            color: var(--heading-color);
            font-weight: 700;
            margin-bottom: 10px;
            font-size: 1.2rem;
        }
        
        .quote {
            background: #FFF3CD;
            border-left: 5px solid #FFC107;
            padding: 15px 20px;
            font-style: italic;
            color: #856404;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>

<div class="profile-card">
    <h2>✨ Profile Summary</h2>
    
    <div class="details-grid">
        
        <div class="detail-item">
            <strong>Name</strong>
            <span>${name}</span>
        </div>
        
        <div class="detail-item">
            <strong>Student ID</strong>
            <span>${studentId}</span>
        </div>
        
        <div class="detail-item">
            <strong>Program</strong>
            <span>${program}</span>
        </div>
        
        <div class="detail-item">
            <strong>Email</strong>
            <span>${email}</span>
        </div>
        
        <div class="detail-item">
            <strong>Hobbies</strong>
            <span>${hobbies}</span>
        </div>
        
        <div class="detail-item">
            <strong>Strengths</strong>
            <span>${strengths}</span>
        </div>
        
        <div class="detail-item">
            <strong>Career Ambition</strong>
            <span>${ambition}</span>
        </div>
        
    </div>

    <div class="quote">
        <strong>Favorite Quote:</strong>
        “${quote}”
    </div>

    <div class="full-width-section">
        <strong>About Me</strong>
        <span>${intro}</span>
    </div>
    
</div>

</body>
</html>