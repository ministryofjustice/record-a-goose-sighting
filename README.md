# Recording a goose sighting
This website is primarily a training tool, to help people get into the basics of accessibility testing.

## How to use this
I've filled it with around 15 accessibility issues, and the task is to find as many as you can in ~20 minutes.

There is a worksheet, and there is also a list of answers - but give it the full 20 minutes before you look at the answers first, if you're working through this alone!

## What testing tools to use
I would recommend working through the site in the following order:

- Can you access everything by pressing the tab key? 
- Does WAVE show any errors, or highlight any issues with the HTML structure?
- Does the colour contrast tab on WAVE throw up any errors?
- If you run the Dark Mode browser extension, can you see any issues with the site?

Government Digital Services have recently published how to conduct a basic accessibility audit, which is worth a look at too.

Testing like this is a good way to identify basic accessibility issues. It would not replace an audit against WCAG 2.1 to level AA, and its ~50 criteria. Identifying the basic issues sooner rather than later will help you out though, as it's easier to fix accessibility issues at the start, rather than the end.


## How to run locally
This is built using the GOV.UK prototyping kit. 

To run it locally, clone it down, run `npm install` and then `npm start`. It'll then tell you a port to go to in the browser.

## Suggesting changes
Feedback is welcome. Either submit an issue, or leave a PR.

