module Requester
  def select_main_menu_action
    # prompt the user for the "random | scores | exit" actions
    main_tabs = ["random","scores","exit"]
    action = ""
    until action == "exit"
      puts main_tabs.join(" | ")
      print "> "
      action = gets.chomp
      case action
      when "random" then random_trivia
      when "scores" then puts "I'm in scores"
      when "exit" then puts "Thanks for use my app"
      else puts "Invalid option"
      end
    end
  end 

  def ask_question(question)
    p "Pregunta -#{question + 1}-"
    # show category and difficulty from question
    puts "Category: #{questions[:results][question][:category]} | Difficulty: #{questions[:results][question][:difficulty]}"
    # show the question
    puts "Question: #{questions[:results][question][:question]}"
    # show each one of the options
    alternatives = (questions[:results][question][:incorrect_answers] << questions[:results][question][:correct_answer]).sort_by(&:size)
    alternatives.each_with_index do |alternative, index|
      puts "#{index + 1}. #{alternative}"
    end
    # grab user input
    print "> "
    @user_input = gets.chomp
  end

  def will_save?(score)
    # show user's score
    # ask the user to save the score
    # grab user input
    # prompt the user to give the score a name if there is no name given, set it as Anonymous
  end

  def gets_option(prompt, options)
    # prompt for an input
    # keep going until the user gives a valid option
  end
end