module Requester
  def select_main_menu_action
    # prompt the user for the "random | scores | exit" actions
    main_tabs = ["random","scores","exit"]
    @score = 0
    action = ""
    until action == "exit"
      puts print_welcome
      puts main_tabs.join(" | ")
      print "> "
      action = gets.chomp
      case action
      when "random" then random_trivia
      when "scores" then print_scores
      when "exit" then puts "Thanks for use my app"
      else puts "Invalid option"
      end
    end
  end 

  def ask_question(question)
    # show category and difficulty from question
    puts HTMLEntities.new.decode "Category: #{questions[:results][question][:category]} | Difficulty: #{questions[:results][question][:difficulty]}"
    # show the question
    puts HTMLEntities.new.decode "Question #{question + 1}: #{questions[:results][question][:question]}"
    # show each one of the options
    @alternatives = (questions[:results][question][:incorrect_answers] << questions[:results][question][:correct_answer]).sort_by(&:size)
    alternatives.each_with_index do |alternative, index|
      puts HTMLEntities.new.decode "#{index + 1}. #{alternative}"
    end
    # grab user input
    p questions[:results][question][:correct_answer]
    print "> "
    @user_input = gets.chomp.to_i
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