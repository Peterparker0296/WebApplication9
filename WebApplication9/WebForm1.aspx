<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"  EnableEventValidation="false" Inherits="WebApplication9.WebForm1" %>

<!DOCTYPE html>


    <!DOCTYPE html>
<html>

<head>
    <title> aa</title>
    <link rel="stylesheet" href="styles.css">
</head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <form id="form1" runat="server">


<body>
    
    <header id="main-header">
        <h1>
            <center> quiz </center>
        </h1>
    </header>
    <div id='container'>
        <div id='title'>
            <h1>Learning Js Properly: Project #1 - Dynamic Quiz</h1>
        </div>
        <br />
        <div id='quiz'></div>






 <%--       onclientclick="window.print();" --%>




       

        <div class='button' runat="server" id='next'><a href=''>Next</a></div>
        <div class='button' runat="server" id='prev'><a href='#'>Prev</a></div>
        <div class='button' runat="server"  id='start'> <a href='#'>Start Over</a></div>
  
        <asp:Button runat="server" Text="Button" OnClick="Unnamed1_Click"  />


    </div>

    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
    <script type="text/javascript" src='questions.json'></script>
    <script type='text/javascript' src='jsquiz.js'></script>

    <script>
        (function () {
            var questions = [{
                question: "What is 2*5?",
                choices: [2, 5, 10, 15, 20],
                correctAnswer: 2
            }, {
                question: "What is 3*6?",
                choices: [3, 6, 9, 12, 18],
                correctAnswer: 4
            }, {
                question: "What is 8*9?",
                choices: [72, 99, 108, 134, 156],
                correctAnswer: 0
            }, {
                question: "What is 1*7?",
                choices: [4, 5, 6, 7, 8],
                correctAnswer: 3
            }, {
                question: "What is 8*8?",
                choices: [20, 30, 40, 50, 64],
                correctAnswer: 4
            }];

            var questionCounter = 0; 
            var selections = []; 
            var quiz = $('#quiz'); 
            displayNext();

            $('#next').on('click', function (e) {
                e.preventDefault();

             
                if (quiz.is(':animated')) {
                    return false;
                }
                choose();

            
                if (isNaN(selections[questionCounter])) {
                    alert('Please make a selection!');
                } else {
                    questionCounter++;
                    displayNext();
                }
            });


            $('#prev').on('click', function (e) {
                e.preventDefault();

                if (quiz.is(':animated')) {
                    return false;
                }
                choose();
                questionCounter--;
                displayNext();
            });


            $('#start').on('click', function (e) {
                e.preventDefault();

                if (quiz.is(':animated')) {
                    return false;
                }
                questionCounter = 0;
                selections = [];
                displayNext();
                $('#start').hide();
            });

            $('.button').on('mouseenter', function () {
                $(this).addClass('active');
            });
            $('.button').on('mouseleave', function () {
                $(this).removeClass('active');
            });

           
            function createQuestionElement(index) {
                var qElement = $('<div>', {
                    id: 'question'
                });

                var header = $('<h2>Question ' + (index + 1) + ':</h2>');
                qElement.append(header);

                var question = $('<p>').append(questions[index].question);
                qElement.append(question);

                var radioButtons = createRadios(index);
                qElement.append(radioButtons);

                return qElement;
            }

   
            function createRadios(index) {
                var radioList = $('<ul>');
                var item;
                var input = '';
                for (var i = 0; i < questions[index].choices.length; i++) {
                    item = $('<li>');
                    input = '<input type="radio" name="answer" value=' + i + ' />';
                    input += questions[index].choices[i];
                    item.append(input);
                    radioList.append(item);
                }
                return radioList;
            }

       
            function choose() {
                selections[questionCounter] = +$('input[name="answer"]:checked').val();
            }

       
            function displayNext() {
                quiz.fadeOut(function () {
                    $('#question').remove();

                    if (questionCounter < questions.length) {
                        var nextQuestion = createQuestionElement(questionCounter);
                        quiz.append(nextQuestion).fadeIn();
                        if (!(isNaN(selections[questionCounter]))) {
                            $('input[value=' + selections[questionCounter] + ']').prop('checked', true);
                        }

                     
                        if (questionCounter === 1) {
                            $('#prev').show();
                        } else if (questionCounter === 0) {

                            $('#prev').hide();
                            $('#next').show();
                        }
                    } else {
                        var scoreElem = displayScore();
                        quiz.append(scoreElem).fadeIn();
                        $('#next').hide();
                        $('#prev').hide();
                        $('#start').show();
                    }
                });
            }


           /* var score =   document.getElementById("Label1").innerHTML;*/

           var score = document.getElementById("<%=Label1.ClientID %>");
      
            function displayScore() {
                var score = $('<p>', {
                    id: 'question'
                });

                var numCorrect = 0;
                for (var i = 0; i < selections.length; i++) {
                    if (selections[i] === questions[i].correctAnswer) {
                        numCorrect++;
                    }
                }

                score.append('You got ' + numCorrect + ' questions out of ' +
                    questions.length + ' right!!!');
                return score;
            }
        })();
    </script>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </form>
</body>

</html>