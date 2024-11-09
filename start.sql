-- Users table: 存储用户信息
CREATE TABLE users (
                       userID VARCHAR(255) PRIMARY KEY,
                       userPassword VARCHAR(255) NOT NULL,
                       userFirstName VARCHAR(255),
                       userLastName VARCHAR(255)
);

-- Projects table: 存储项目信息
CREATE TABLE projects (
                          projectID INT AUTO_INCREMENT PRIMARY KEY,
                          projectName VARCHAR(255) NOT NULL,
                          projectOwner VARCHAR(255) NOT NULL,
                          projectSecurity BOOLEAN NOT NULL,
                          projectPassword VARCHAR(255),
                          FOREIGN KEY (projectOwner) REFERENCES users(userID)
);

-- Project_Users table: 用户和项目的关联表
CREATE TABLE project_users (
                               projectID INT,
                               userID VARCHAR(255),
                               PRIMARY KEY (projectID, userID),
                               FOREIGN KEY (projectID) REFERENCES projects(projectID),
                               FOREIGN KEY (userID) REFERENCES users(userID)
);

-- Tickets table: 存储任务信息
CREATE TABLE tickets (
                         ticketID INT AUTO_INCREMENT PRIMARY KEY,
                         ticketTask VARCHAR(255) NOT NULL,
                         ticketStatus VARCHAR(50) NOT NULL,
                         ticketDescription TEXT
);

-- Project_Tickets table: 项目和任务的关联表
CREATE TABLE project_tickets (
                                 projectID INT,
                                 ticketID INT,
                                 PRIMARY KEY (projectID, ticketID),
                                 FOREIGN KEY (projectID) REFERENCES projects(projectID),
                                 FOREIGN KEY (ticketID) REFERENCES tickets(ticketID)
);

-- Report table: 存储统计信息
CREATE TABLE report (
                        stat VARCHAR(255) PRIMARY KEY,
                        value VARCHAR(255)
);
