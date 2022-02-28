# Voice_Journalling_Assistant

<p>A mobile-based journaling application, intended to address mental health issues by providing users with an opportunity to speak out about their challenges, while at the same time storing a journal of these events using speech to text technology</p>

## MVP(Minimum Viable Product)

### Architecture

![Architecture](assets/images/arch.png)

### API Endpoints

#### USER

- /api/v1/user/:id
<p>GET: This returns a user with id
PUT: Updates user data with data</p>

- /api/v1/user/create
<p>POST: This creates a new user and saves to the database</p>

- /api/v1/user/login
<p> POST: This receives login details from user and authenticate
user with an authorization token</p>

- /api/v1/user/reset_password
<p>POST: This enables users to reset their password</p>

- /api/v1/admin/users
<p>GET: This returns all users from the database</p>

- /api/v1/user/settings
<p>GET: returns user app settings</p>

#### JOURNALS

- /api/v1/journal/create
<p>POST : creates a new journal for user with id and saves to the database with a payload
</p>
- /api/v1/journal/:id
<p>GET: gets journal with id from the database
PUT: Updates content of the journal from database
DELETE: deletes the journal with id from the database</p>

- /api/v1/journals
<p>GET: returns all journals belonging to a user
</p>

### User Stories

- As Tandiwe, a remote-based SEO writer, I want to have a conversation at the end of the day, so I can relief my mind of the rollercoaster of events that transpired.
- As Mwangi, a bachelor in Nairobi city, I want to journal my experience in dating, so I can see what might be going wrong or right in the experience.
- As Mohammed, a banking cyber security expert, I want assurance that my data is secure, so that I can avoid a leak of potentially sensitive information from my work journals
- As Simi, a consultant constantly travelling the world, I want to arrange my thoughts just before bed, so that I can wake up in the morning to sort out unresolved matters.
- As Samantha, a non-tech savvy individual, I need to be directed on how to create journals, so that I can start journaling on the application.
- As S’bu, a successful businessman, I want to easily login and access my consolidated thoughts, so that I can speed up my decision-making process.

### Data Modelling

![Data Modelling](assets/images/dm.png)

### Mockups

#### Login/Auth Samples

![Login](assets/images/SampleLogin.png)

#### Splash Screen Samples

![Splash Screen](assets/images/journalling.png)

#### App Conversation

![Conversation](assets/images/conversation.png)

## Authors

- Elijah Daniel - Backend developer
- Edafe Oke - Mobile interface developer
- [Njagi Ndungo - Documentation, Flutter & Speech Developer](https://github.com/enzonjagi)
