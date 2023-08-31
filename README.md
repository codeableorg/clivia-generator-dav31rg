# CLIvia Generator

CLIvia Generator is a command-line program designed to challenge your knowledge with a series of trivia questions. Test your expertise in various categories and earn points for correct answers, also can save your score.

## Getting Started

1. Clone this repository: `git clone https://github.com/dav31rg/clivia-generator.git`
2. Install required dependencies: `bundle install`
3. Start the program: `ruby clivia_generator.rb`

## Usage

Upon launching CLIvia Generator, you'll be greeted with a welcome screen presenting three options: "random," "scores," or "exit."

- Choose **"random"** to begin a trivia round. The program will fetch 10 random questions from an external API and present them one by one.

- For each question, input your answer by selecting the corresponding option number. The program will inform you whether your answer is correct or incorrect, providing the correct answer for incorrect responses. Correct answers earn you 10 points.

- After completing all questions, the program will display your total score and prompt you to save it. Respond with 'y' to save your score, and provide a name for identification. If no name is given, the score will be saved as "Anonymous."

- To view **"scores,"** select this option to display the top scores saved from previous rounds. The scores are presented in a table format with columns for "Name" and "Score."

- Select **"exit"** to leave the program.

## Technologies Used

- Ruby
- [HTMLEntities](https://www.rubydoc.info/gems/htmlentities/4.3.2/HTMLEntities) gem
- [Open Trivia Database](https://opentdb.com/) API

## Acknowledgments

Special thanks to the [Open Trivia Database](https://opentdb.com/) for providing the trivia questions.

## Enjoy the Challenge!

CLIvia Generator offers a fun way to engage your knowledge across diverse categories. Challenge yourself and enjoy the trivia experience.
