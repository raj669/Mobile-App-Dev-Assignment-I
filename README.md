# Flutter Chat UI Replica (Assignment-I Mobile App Development)

This project replicates a **simple and elegant chat screen UI** using **Flutter**, focusing on layout accuracy, styling precision, and user interface components often found in modern messaging apps.

---

## Features Implemented

### 1. App Bar

- Back arrow icon on the **left**.
- Center-aligned **user avatar** and **profile name**:  
  - Username 
  - Active Status
- **Call** and **video call** icons on the **right**.

### 2. Date Separator

- A **"Today"** label centered between messages.
- Styled like a **chip** (e.g., light background, rounded corners).

### 3. Chat Messages

#### Outgoing Messages (Right-aligned)
- Teal text bubbles.
- Text + timestamp (`e.g., 09:25 AM`) aligned below the message.
- Rounded corners with a **flat or smaller bottom-right** corner.

#### Incoming Messages (Left-aligned)
- Light grey/white text bubbles.
- Text + timestamp aligned similarly.
- Rounded corners with a **flat or smaller bottom-left** corner.

#### Audio Message Bubble
- Outgoing message bubble with:
  - **Play icon**
  - **Waveform visualization**
  - **Duration label** (`e.g., 00:16`)
  - **Timestamp**

### 4. Message Input Area

- Positioned at the bottom.
- **Left:** Attachment (paperclip) icon.
- **Center:** Expandable **text input field** with placeholder `"Write your message"`.
- **Right:**  
  - Image icon  
  - Camera icon  
  - Microphone icon

---

## Technologies Used

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

---

##  UI Preview
### UI provided

  ![CleanShot 2025-07-01 at 12 50 27@2x](https://github.com/user-attachments/assets/7d9976d6-3155-4948-a316-21ce839719f3)

### Replicated UI

  ![Screenshot_1751351088](https://github.com/user-attachments/assets/72cbc188-d30e-4bd3-99bf-bc976e91cd1b)


## Widget Tree
This widget tree represents a structured breakdown of the UI components used in the chat screen layout. Each widget plays a specific role in constructing the chat interface.

![Widget Tree](https://github.com/user-attachments/assets/01b5d1dd-218f-4fcc-8c95-de042365d436)

---

## Usage

1. Clone the repo:
   ```bash
   git clone https://github.com/par-mhr/Mobile-App-Dev-Assignment-I.git
   cd flutter-chat-ui
