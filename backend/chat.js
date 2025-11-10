// Wait for the document to be fully loaded
document.addEventListener("DOMContentLoaded", () => {
    
    // Get the HTML elements
    const chatForm = document.getElementById("chatForm");
    const chatInput = document.getElementById("chatInput");
    const chatWindow = document.getElementById("chatWindow");
    const sendButton = document.getElementById("chatSendBtn");

    // Add a submit event listener to the form
    chatForm.addEventListener("submit", async (event) => {
        // Prevent the form from reloading the page
        event.preventDefault();

        // Get the user's message (and trim whitespace)
        const userMessage = chatInput.value.trim();

        // If the message is empty, do nothing
        if (!userMessage) {
            return;
        }

        // 1. Display the user's message
        addMessageToChat(userMessage, "user-message");

        // Clear the input field
        chatInput.value = "";
        
        // Disable the form while waiting for the bot's response
        setFormDisabled(true);

        // 2. Send the message to the backend (api.php)
        try {
            const response = await fetch("api.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                // Send the user's message as a JSON object
                body: JSON.stringify({ prompt: userMessage })
            });

            if (!response.ok) {
                throw new Error("Network response was not ok");
            }

            // Get the response data from the backend
            const data = await response.json();
            
            // 3. Display the bot's reply
            addMessageToChat(data.reply, "bot-message");

        } catch (error) {
            console.error("Error:", error);
            // Display an error message if something goes wrong
            addMessageToChat("Sorry, something went wrong. Please try again.", "bot-message");
        } finally {
            // Re-enable the form
            setFormDisabled(false);
        }
    });

    // Helper function to add a message to the chat window
    function addMessageToChat(message, messageType) {
        const messageElement = document.createElement("div");
        messageElement.classList.add("chat-message", messageType);
        messageElement.textContent = message;
        chatWindow.appendChild(messageElement);

        // Scroll to the bottom of the chat window
        chatWindow.scrollTop = chatWindow.scrollHeight;
    }

    // Helper function to disable/enable the form
    function setFormDisabled(isDisabled) {
        chatInput.disabled = isDisabled;
        sendButton.disabled = isDisabled;
    }
});