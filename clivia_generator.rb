# do not forget to require your gem dependencies
require "httparty"
require "json"
# do not forget to require_relative your local dependencies
require_relative "presenter"
require_relative "requester"
class CliviaGenerator
  # maybe we need to include a couple of modules?
  include Presenter
  include Requester
  include HTTParty
    attr_reader :questions, :user_input

  def initialize
    # we need to initialize a couple of properties here
    @questions
  end

  def start
    # welcome message
    puts print_welcome
    # prompt the user for an action
    # keep going until the user types exit
    select_main_menu_action
  end

  def random_trivia
    # load the questions from the api
    response = HTTParty.get("https://opentdb.com/api.php?amount=2")
    # questions are loaded, then let's ask them  
    @questions = JSON.parse(response.body, symbolize_names: true)
    ask_questions
  end

  def ask_questions
    # ask each question
    @questions[:results].each_with_index do |question, index| 
      ask_question(index)   
      puts questions[:results][index][:correct_answer]
    end
  
    # if response is correct, put a correct message and increase score
    # if response is incorrect, put an incorrect message, and which was the correct answer
    # once the questions end, show user's score and promp to save it
  end

  def save(data)
    # write to file the scores data
  end

  def parse_scores
    # get the scores data from file
  end

  def load_questions
    # ask the api for a random set of questions
    # then parse the questions
  end

  def parse_questions
    # questions came with an unexpected structure, clean them to make it usable for our purposes
  end

  def print_scores
    # print the scores sorted from top to bottom
  end
end

trivia = CliviaGenerator.new
trivia.start