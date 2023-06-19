# ICCS Summer School '23: Using Git & GitHub effectively
## 2023-06-19: planning meeting
  * Paul: "Here's an existing repo that needs work. Let's perform a quick code
    review and prepare an issue board: fix major bug, add license, add CI"
  * Dom: "new title: Using GithHub effectively for collaborative development"
  * Simon: "behind the scenes, fork repo -> PR"




## Notes from the after meeting

Simon is going to write a Reverse Polish Notation (RPN) calculator in Python. It will be lacking in a few respects enabling us to introduce the code via code review, identify pre-known issues and (in a well rehearsed way) fix the problems live, motivating the rest of the session and providing an overall outline for the talk. 

During the code review we will identify issues and create a mini project board. We will then tackle the tasks on the list until the time runs out. We could structure this list for increasing complexity with the more optional information in the second or third issue. It is unlikely that we will complete the list (that is not the goal).

After creating a project board we can assign tasks. Person A can do task 1 which includes investigating/adding to issue, making a change, commiting, making a PR.

Person B (off-stage) can 'fix issue 2' by copying and pasting and pressing some buttons asyncronously to the issue 1 fix. This change could be fixing a lack of doc or more hands on. We can then review the PR made by person B. 

We can deal with a merge conflict which we can contrive if we both change the parser.

We can create a test by passing a string to the calculator which means we can focus on creating tests and identifying bugs rather than how to you write a test in language using package.

Person B could create a feature request to add a CI which allows us to go into integration with github actions (if time allows).

And at the end of the session we can return to the project board and assign work for 'tomorrow' to wrap up. 

Some ideas for bugs:
-	Doesn’t handle divide by zero fix --- proper error handling. 
-	Wrong end stack 
-	Underflowing stack
-	Double delimiter

## rpn\_calc

Usage:
```
python rpn\_calc.py
```
It will read from `stdin` breaking the input into space-separated tokens.  The
tokens are currently `"+", "-", "*", "/", "p"`.  The "p" token will pop the top
of the stack and print it.  Any other token will be parsed as a floating point
number.  At input end, the top of the stack will be popped and printed.

### Example
```
python rpn\_calc.py << EOM
1 2 +
EOM
3.0
```
