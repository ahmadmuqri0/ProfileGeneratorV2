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
            --border-radius: 8px;
            --shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            --transition-speed: 0.2s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--background-color);
            min-height: 100vh;
            padding: 10px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .profile-card {
            background: var(--card-background);
            width: 100%;
            max-width: 550px;
            padding: 25px;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            animation: fadeIn 0.5s ease-out;
            border-left: 4px solid var(--primary-color);
            margin: 10px 0;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .profile-card h2 {
            text-align: center;
            color: var(--heading-color);
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 1.4rem;
            border-bottom: 1px solid #E9ECEF;
            padding-bottom: 10px;
        }
        
        .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 12px;
            margin-bottom: 20px;
        }
        
        .detail-item {
            padding: 10px 12px;
            background: #f8fafc;
            border-radius: 6px;
            border-left: 2px solid var(--primary-color);
        }

        .detail-item strong {
            display: block;
            color: var(--secondary-color);
            font-weight: 500;
            margin-bottom: 4px;
            font-size: 0.85rem;
        }

        .detail-item span {
            color: var(--text-color);
            font-weight: 400;
            font-size: 0.9rem;
            line-height: 1.3;
        }

        .full-width-section {
            margin-top: 15px;
            padding: 15px;
            border-radius: 6px;
            border: 1px solid #E9ECEF;
            background: #f8fafc;
        }
        
        .full-width-section strong {
            display: block;
            color: var(--heading-color);
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 1rem;
        }
        
        .full-width-section span {
            color: var(--text-color);
            font-size: 0.9rem;
            line-height: 1.4;
        }
        
        .quote {
            background: #FFF9E6;
            border-left: 3px solid #FFD166;
            padding: 12px 15px;
            font-style: italic;
            color: #8B6B00;
            margin-bottom: 15px;
            border-radius: 6px;
            font-size: 0.9rem;
        }
        
        .quote strong {
            color: #8B6B00;
            font-weight: 600;
            margin-bottom: 4px;
            display: block;
        }
        
        @media (max-width: 400px) {
            .profile-card {
                padding: 15px;
            }
            
            .details-grid {
                grid-template-columns: 1fr;
                gap: 8px;
            }
            
            .profile-card h2 {
                font-size: 1.2rem;
                margin-bottom: 15px;
            }
        }
        
        .detail-item:hover {
            background: #f1f7fe;
            transition: background var(--transition-speed);
        }
    </style>
</head>
<body>

<div class="profile-card">
    <h2>✨ Profile Summary</h2>
    
    <div class="details-grid">
        
        <div class="detail-item">
            <strong>Name</strong>
            <span>${profile.fullName}</span>
        </div>
        
        <div class="detail-item">
            <strong>Student ID</strong>
            <span>${profile.studentId}</span>
        </div>
        
        <div class="detail-item">
            <strong>Program</strong>
            <span>${profile.program}</span>
        </div>
        
        <div class="detail-item">
            <strong>Email</strong>
            <span>${profile.email}</span>
        </div>
        
        <div class="detail-item">
            <strong>Hobbies</strong>
            <span>${profile.hobbies}</span>
        </div>
        
        <div class="detail-item">
            <strong>Strengths</strong>
            <span>${profile.strengths}</span>
        </div>
        
        <div class="detail-item">
            <strong>Career Ambition</strong>
            <span>${profile.ambition}</span>
        </div>
        
    </div>

    <div class="quote">
        <strong>Favorite Quote:</strong>
        “${profile.quotes}”
    </div>

    <div class="full-width-section">
        <strong>About Me</strong>
        <span>${profile.intro}</span>
    </div>
    
</div>

</body>
</html>