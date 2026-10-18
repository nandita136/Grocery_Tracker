CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    MobileNumber VARCHAR(15),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Meals (
    MealID INT IDENTITY(1,1) PRIMARY KEY,
    MealName VARCHAR(100) NOT NULL,
    MealType VARCHAR(30) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    BaseServing INT NOT NULL DEFAULT 2
);

CREATE TABLE MealIngredients (
    MealIngredientID INT IDENTITY(1,1) PRIMARY KEY,
    MealID INT NOT NULL,
    IngredientName VARCHAR(100) NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL,
    Unit VARCHAR(20) NOT NULL,
    IngredientCategory VARCHAR(50) NOT NULL,

    FOREIGN KEY (MealID)
        REFERENCES Meals(MealID)
        ON DELETE CASCADE
);

CREATE TABLE WeeklyPlans (
    PlanID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    WeekStartDate DATE NOT NULL,
    NumberOfMembers INT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


CREATE TABLE PlanMeals (
    PlanMealID INT IDENTITY(1,1) PRIMARY KEY,
    PlanID INT NOT NULL,
    MealID INT NOT NULL,
    DayOfWeek VARCHAR(15) NOT NULL,
    MealType VARCHAR(30) NOT NULL,
    FOREIGN KEY (PlanID) REFERENCES WeeklyPlans(PlanID),
    FOREIGN KEY (MealID) REFERENCES Meals(MealID)
);



CREATE TABLE GroceryItems (
    GroceryItemID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    PlanID INT NULL,
    ItemName VARCHAR(100) NOT NULL,
    Quantity DECIMAL(10,2) NULL,
    Unit VARCHAR(30) NULL,

    FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    FOREIGN KEY (PlanID)
        REFERENCES WeeklyPlans(PlanID)
);

CREATE TABLE SpecialMealRequests (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    RequestedMealName VARCHAR(100) NOT NULL,
    Occasion VARCHAR(100) NOT NULL,
    NumberOfMembers INT NOT NULL,
    Requirements VARCHAR(500) NULL,
    RequestDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status VARCHAR(30) NOT NULL DEFAULT 'Pending',

    FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    CONSTRAINT CK_SpecialMealRequests_Members
        CHECK (NumberOfMembers > 0),

    CONSTRAINT CK_SpecialMealRequests_Status
        CHECK (Status IN ('Pending', 'Approved', 'Rejected'))
);

CREATE TABLE ContactMessages (
    MessageID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Subject VARCHAR(200),
    MessageText VARCHAR(1000) NOT NULL,
    SubmittedAt DATETIME DEFAULT GETDATE()
);