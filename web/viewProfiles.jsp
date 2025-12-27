<%-- 
    Document   : viewProfiles.jsp
    Created on : [Current Date]
    Author     : muqri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, profile.bean.ProfileBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Profiles</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #387adf;
            --background-color: #9ec3fc;
            --card-background: #ffffff;
            --text-color: #495057;
            --heading-color: #212529;
            --table-header: #f8f9fa;
            --table-border: #dee2e6;
            --hover-color: #f1f7fe;
            --border-radius: 8px;
            --shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
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
            padding: 15px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 15px 20px;
            background: var(--card-background);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
        }

        .header h1 {
            color: var(--heading-color);
            font-weight: 600;
            font-size: 1.5rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            background: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
            font-size: 0.9rem;
            transition: background 0.2s, transform 0.2s;
        }

        .btn:hover {
            background: var(--secondary-color);
            transform: translateY(-1px);
        }

        .btn-back {
            background: #6c757d;
        }

        .btn-back:hover {
            background: #5a6268;
        }

        .profile-count {
            background: #e7f3ff;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: 500;
            color: var(--primary-color);
        }

        .table-container {
            background: var(--card-background);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: var(--table-header);
            border-bottom: 2px solid var(--table-border);
        }

        th {
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            color: var(--heading-color);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid var(--table-border);
            color: var(--text-color);
            font-size: 0.9rem;
        }

        tbody tr:hover {
            background: var(--hover-color);
            transition: background 0.2s;
        }

        .profile-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .profile-link:hover {
            text-decoration: underline;
        }

        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #6c757d;
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #adb5bd;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn-small {
            padding: 5px 10px;
            font-size: 0.8rem;
            border-radius: 4px;
        }

        .btn-delete {
            background: #b83717;
        }

        .btn-delete:hover {
            background: #963413;
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }
            
            th, td {
                padding: 8px 10px;
                font-size: 0.85rem;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 5px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0;
            }
            
            body {
                padding: 10px;
            }
            
            table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1><i class="fas fa-users"></i> Student Profiles Management System</h1>
        <div class="profile-count">
            <i class="fas fa-user-graduate"></i> 
            Total Profiles: 
            <%
                List<ProfileBean> profiles = (List<ProfileBean>) request.getAttribute("profiles");
                if (profiles != null) {
                    out.print(profiles.size());
                } else {
                    out.print("0");
                }
            %>
        </div>
        <a href="index.html" class="btn btn-back">
            <i class="fas fa-plus"></i> Add New Profile
        </a>
    </div>

    <div class="table-container">
        <%
            if (profiles != null && !profiles.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Student ID</th>
                    <th>Program</th>
                    <th>Email</th>
                    <th>Hobbies</th>
                    <th>Career Goal</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (ProfileBean profile : profiles) {
                %>
                <tr>
                    <td><%= profile.getId() %></td>
                    <td>
                        <a href="view-profile?id=<%= profile.getId() %>" class="profile-link">
                            <i class="fas fa-user-circle"></i> <%= profile.getFullName() %>
                        </a>
                    </td>
                    <td><%= profile.getStudentId() %></td>
                    <td><%= profile.getProgram() %></td>
                    <td><%= profile.getEmail() %></td>
                    <td>
                        <%
                            String hobbies = profile.getHobbies();
                            if (hobbies != null && hobbies.length() > 30) {
                                out.print(hobbies.substring(0, 30) + "...");
                            } else {
                                out.print(hobbies != null ? hobbies : "-");
                            }
                        %>
                    </td>
                    <td>
                        <%
                            String ambition = profile.getAmbition();
                            if (ambition != null && ambition.length() > 25) {
                                out.print(ambition.substring(0, 25) + "...");
                            } else {
                                out.print(ambition != null ? ambition : "-");
                            }
                        %>
                    </td>
                    <td class="action-buttons">
                        <button onclick="deleteProfile(<%= profile.getId() %>)" class="btn btn-small btn-delete">
                            <i class="fas fa-trash-can"></i> Delete
                        </button>
                    </td> 
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <div class="empty-state">
            <i class="fas fa-inbox"></i>
            <h3>No Profiles Found</h3>
            <p>No student profiles have been created yet.</p>
            <a href="index.html" class="btn" style="margin-top: 15px;">
                <i class="fas fa-plus"></i> Create First Profile
            </a>
        </div>
        <%
            }
        %>
    </div>
</div>

    <script>
        function deleteProfile(profileId) {
            if(confirm("Do you really want to delete this profile?")) {
                window.location.href = 'delete?id=' + profileId;
            }
        }
    </script>
</body>
</html>