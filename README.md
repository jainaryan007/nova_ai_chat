# nova_ai_chatbot application

## Demo Video
https://github.com/user-attachments/assets/eec83f3d-7bbe-4548-94e7-fd80a66a9751

### 1. Why did you choose this challenge?
To be honest, I chose the AI chat interface because I’ve always been fascinated by how AI chatbots work. Whenever I use tools like ChatGPT, I often find myself wondering how these systems are able to respond so naturally and carry on conversations with people. That curiosity made me want to explore what goes on behind the scenes.

I decided to build a chat interface because it gave me the chance to try creating something similar on my own and understand how such experiences are built from the ground up. I wanted to see how a user can send a message, how the system responds, and how the whole conversation flow comes together to feel natural. For me, the main goal wasn’t just completing the project, but learning through the process.

### 2. What architecture / state management did you use and why?
For the architecture and state management, I deliberately chose to keep things simple by using Flutter's native StatefulWidget and setState. Since this challenge was focused on building a clean UI prototype with mock data rather than a complex backend, I didn't want to over-engineer it with heavy state management libraries.

My main goal was to nail the UX like to perfectly time the indicator and ensuring the auto-scroll felt smooth. setState was the perfect, lightweight tool to handle these localized state changes. It allowed me to focus entirely on the user experience and keep the code structure extremely clean and readable.

### 3. If this app scaled to 100K users, what would you improve?
I know that scaling to 100K users means completely throwing out how I did things in this prototype!
Right now, the app just uses a simple setState to add messages to a local list on the device. If 100K users were actually using this, that architecture would break down immediately. The very first thing I'd do is rip out the local setState and implement a robust state management system like Riverpod or Bloc. That way, the chat screen logic isn't tightly coupled to the UI.

Secondly, I'd need to connect this to a real backend , probably something like Firebase so the app isn't just relying on a hardcoded mock response. It would need to handle real network delays, offline states, and caching previous conversations locally so the user isn't constantly re-downloading their chat history every time they open the app.

### 4. Why do you want to intern at Avyxon AI Labs?
I’m interested in joining Avyxon AI Labs because the work your team is doing at the intersection of AI and real-world product development is genuinely exciting to me. From what I understand, Avyxon focuses not just on building applications but also on creating intelligent systems powered by technologies like generative AI and conversational AI. I find that combination of strong engineering with modern AI innovation very inspiring.

As someone who is still early in my development journey, I’m looking for an environment where I can learn by building real products and working on meaningful problems. I’m particularly excited about the opportunity to contribute, learn quickly, and grow with a team that is exploring cutting-edge technologies while delivering practical solutions. I would love the chance to be part of that journey and continuously improve my skills along the way.

### 5. What are you hoping to learn in the next 6 months?
Over the next six months, I want to strengthen my ability to build production-ready applications and understand how real products are designed and scaled. Technically, I’m excited to deepen my skills in Flutter development, clean architecture, API integrations, and performance optimization.

I’m also interested in learning how modern technologies like Generative AI, LLM-powered features, and automation workflows can be integrated into applications to create more intelligent user experiences. Understanding how AI-driven systems, conversational interfaces, and real-time services are built would be something I’m very eager to explore. Beyond specific technologies, I want to learn how experienced teams build, ship, and improve products continuously. My goal in these six months is to contribute meaningfully, learn quickly from the team, and grow into a developer who can build scalable and impactful products.
