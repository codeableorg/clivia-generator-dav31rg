# do not forget to require your gem dependencies
require "httparty"
require "json"
require 'terminal-table'
require 'htmlentities'

# do not forget to require_relative your local dependencies
require_relative "presenter"
require_relative "requester"
class CliviaGenerator
  # maybe we need to include a couple of modules?
  include Presenter
  include Requester
  include HTTParty
    attr_reader :questions, :user_input, :alternatives
    attr_accessor :prueba, :history_scores

  def initialize
    # we need to initialize a couple of properties here
    @questions
    @score = 0
    file = File.read("scores.json")   
    @players = JSON.parse(file)["players"]
    puts @players
  end

  def start
    # welcome message
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
      # correct answer
      correct_answer = questions[:results][index][:correct_answer]
      # user answer
      user_answer = @alternatives[@user_input - 1]
      # if response is correct, put a correct message and increase score
      if user_answer == correct_answer
        @score += 10
        puts HTMLEntities.new.decode "#{user_answer}... Correct!"
        puts "--------------------------------------------------"
        # if response is incorrect, put an incorrect message, and which was the correct answer
      else
        puts HTMLEntities.new.decode "#{user_answer}... Incorrect!"
        puts HTMLEntities.new.decode "The correct answer was: #{correct_answer}"
        puts "--------------------------------------------------"          
      end
    end
    # once the questions end, show user's score and promp to save it
    puts "Well done! Your score is #{@score}"
    puts "Do you want to save your score? (y/n)"
    print "> "
    save_input = gets.chomp.downcase
    # only if with "y" to prevente get in the bucle
    if save_input == "y"
    puts "Type the name to assign to the score"
    print "> "
    name = gets.chomp
      save(name, @score)
    end
    @score = 0
  end

  def save(name = "Anonymous", data)
    # write to file the scores data
    actual_player = { "name": "#{name}", "score": "#{data}"}
    #actual_save = { "name"=>"#{name}", "score"=>"#{data}"}
    #actual_save = {:name "#{name}",:score "#{data}"}
    @prueba = @players << actual_player
    prueba_hash = {"param": @prueba}
    pp prueba_hash

    File.open("scores.json", "w") do |file|
       file.write(prueba_hash.to_json)
     end

  end

  def parse_scores
    # get the scores data from file
    
    

    
    # Bring the object back into Ruby
    

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


    p @safe_array
    parsed = parse_scores
    p parsed
    table = Terminal::Table.new 
    table.title = "Top Scores"
    table.headings = ["Name","Score"]
    table.rows = @safe_array.sort_by {|name,score| score.to_i }.reverse
    puts table                            

  end
end

trivia = CliviaGenerator.new
trivia.start