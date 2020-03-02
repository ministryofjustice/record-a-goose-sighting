# Accessibility Issues in Register a Goose service

Some of these issues would not be WCAG 2.1 failures. But, they could present issues to users with access needs, and WCAG compliance doesn't neccessarily mean that something is accessible.

## Pages
### Start page

- Two h1 tags
It is good practice to have only one `h1` tag. A `h1` tag specifies what the top level heading is for the entire page. It used to be permissible to have another `h1` tag nested within a `section` element, but this was depracated in HTML 5.1. This isn't a WCAG 2.1 failure.

- Altered tab order on side menu
The tab order is a bit random, when you're tabbing through the list of links on the right-hand side of the page. This is unpredictable, and a bit disorienting. Whilst it's not a huge issue in this scenario, if the links were further apart on the page, or spread out more, it could cause issues for users who use a screen magnifier or browser zoom. They might not be able to tell where focus is gone, and have to hunt from it, or might have had their screen view dragged across the page as it's following focus (depending on how they've configured their assistive technologies).

- Link opens in new tab
Opening a link in a new tab can be appropriate if you tell the user in advance that it's going to happen. This can be done with either with content in the link text or with an icon that has appropriate alternative text. In this case, neither of these techniques have been used. This is an issue because the user may not be aware the the new tab or windows has opened. They then can't use the back button on the keyboard to navigate to where they were, as a new tab history has been opened.

- Undescriptive link text
Screen reader users can view links out of context through a links menu. This can be quicker to skim through. If link text doesn't make sense out of context, it would be unusable when viewed this way. The 'More' link on the start page doesn't make any sense out of context - we can infer it means more about geese by seeing that it is in a section titled 'Information about Geese'. This isn't a failure against WCAG 2.1 Level AA criteria but is really useful to do.

- Poor focus styling on link
If the focus state style doesn't have a high enough contrast and it can be really hard to tell where focus is. This particularly effects people who have a sight impairement. In this instance, this issue can be fixed by adding the appropriate Design System link class.

- `Role=“button”` missing on link to next page
Visually, this is coded to look like a button, but it's actually a link. Links can only be selected by pressing enter, but buttons can be selected by pressing space bar too. This can be told visually, from it's appearance, and giving it a `role="button"` would let screen reader users know this too. This has come about from the Design System not being implemented properly, as the Design System markup contains this. This is a relatively minor issue, but it is best practise to add in appropriate ARIA if you're doing things like this.

### Do you like geese page
- No legend on the radio button
We can visually tell that the buttons relate to the main heading by looking at the page. But, the question isn't linked up to the element in a way that makes sense for users who can't see. For radio buttons and checkboxes, it's important to have a `<legend>` element. The fix would be making sure the 'h1' is inside the 'legend', as per the Design System pattern.

- Continue button isn’t keyboard focusable
You can still get past this page by pressing enter when on the radio buttons, but a user might not know this. They might (understandably) expect that the only way to progress is by submitting enter, and so feel trapped and abandon the service at this point. All interactive elements must be usabled with the keyboard. The fix would be removing the `tabindex="-1"`.

- Insufficient colour contrast of the form hint
The colour contrast is way too low for the form hint text. In the Design System, it's a darker grey, which does have a sufficient colour contrast ratio. Respecting the out-of-the-box colours and not overriding them here would fix this issue.

### What type of goose did you see
- Wrong page title
Some screen readers (like JAWS) read the page title out when a page loads. On this page, the page title is 'Boop - Record a goose sighting', which tells the screen reader user nothing about what's on the page. A better format would be the page question, followed by the service name, and followed by whatever it's hosted on - so 'What type of goose did you see - Recording a goose sighting - GOV.UK', if it were on GOV.UK.

- Visually hidden item you can tab onto
There is some hidden text on the page, that can be tabbed to. Whilst this isn't a particularly realistic example of this issue, sometimes inputs can get hidden off screen. It can be confusing for keyboard users who are tabbing through the screen, because the focus disappears, and you end up not being entirely sure where or when it's going to reappear, or what would happen if you tried to select the element you were on. If something has focus, it's best that it becomes visible, at least for the duration of it having focus. In many cases think whether there is value for other users by having the content visible at all times.

- Transparent text that appears in dark mode
An attempt was made to hide the text 'ghost goose' on the page - but because `color: transparent` was used, it isn't properly hidden, and leaks out in dark mode and Windows high contrast mode. The proper fix would be using the 'govuk-visually-hidden' class. This isn't a WCAG 2.1 failure.


- Placeholder text
Placeholder text disappears when you start to type. This can be confusing, and if you struggle to remember things, you might then need to delete what you've typed in to remind yourself of what was there, in case it was important. It's best to include information like hints outside of the form field, where it can be seen at all times. This is essential if the placeholder text includes important formatting information.

### When did you see the goose
- No issues on this page! Sometimes, when you've found issues on other pages, you expect every page to have issues, and you spend a long time looking. However sometimes, some pages don't have issues, and if the basic tests pass, the best use of time is to move on.

### Check your answers
- Change link - hidden text is incorrect
We talked earlier about links needing to make sense out of context. In this component from the Design System, given the change link is just across from the question, it would look weird to have that visually included in the link. But, we can visually hide text - and that's what is normally done here. A sighted user would see 'change', but a screen reader user would hear 'change what type of goose did you see'. However, it's been configured incorrectly here - and random food items have been put in the visually hidden text, instead of proper text.

- Incorrect heading level hierarchy
The heading hierarchy is currently h1 > h3. The 'goose details' heading should be a h2, as it is a direct descendant of the h1. This is an issue because screen reader users can pull all of the headings out into one summary list, as a quick way of skim reading through what is on the page. If the ordering is incorrect like this, it can be hard to interpret when viewed in this way. When heading levels are not included users might also spend time looking for the heading thinking they are missing something. 


### End date
- Use of capital letters
Text that is in all capital letters loses its shape. This can make it harder for some people with dyslexia to read. Unless absolutely necessary (like it is in a reference number), it's best to avoid writing words entirely in capital letters.

- Justified text
Justified text forces words and letters to space out a little more than they normally would. This distorts the overall sentence shape a little. This justifying and centering content like this can make it harder to read for some people with dyslexia. The fix would be removing the styling that makes it justify, and allowing it to flow normally. This isn't a failure against WCAG 2.1 Level AA criteria but is really useful to do.

- No alternative content for the gif
This gif shows a happy goose celebrating knowledge about geese being shared with the world. This information isn't captured in any other medium like text on the page though, so descriptive alt text needs to be added here. If an `img` element doesn't have an `alt` attribute then the `href` of the image may be read out by screen readers. There is a handy [alt decision tree by W3C](https://www.w3.org/WAI/tutorials/images/decision-tree/) on how to decide how to write alt text, which is worth a look at.

- Animation cannot be stopped.
Moving content such as the happy goose can be a severe distraction for people with conditions such as attention deficit disorders, making it difficult to use the rest of the page. It should run no longer than 5 seconds or be able to be paused or hidden by the users.

- Removed transparent border
When unaltered, the big box at the top has a colour behind it, that gives it visual prominence on the page. If we turn on our dark mode plugin, it loses this. This is because it's been tampered with a little - if you go to this Summary pattern page in the Design System with the dark mode plugin turned on, you'll see a border appears around it. This is because of a transparent border around it. This was used incorrectly earlier, to try to hide the 'ghost goose', but used to positive effect here. Just one example of the many ways in which the Design System is awesome!


## Want to learn more about Accessibility?

- [GOV.UK resources about accessibility](https://www.gov.uk/service-manual/helping-people-to-use-your-service/making-your-service-accessible-an-introduction#further-reading)
- [Udacity course on Accessibility](https://www.udacity.com/course/web-accessibility--ud891)
- [A11y weekly - weekly newsletter about accessibility](https://a11yweekly.com/)
- [GDS WCAG 2.1 Primer](https://alphagov.github.io/wcag-primer/) - good for helping you understand the Web Content Accessibility Guidelines
- [GDS guidance how to conduct a basic accessibility audit](https://www.gov.uk/government/publications/doing-a-basic-accessibility-check-if-you-cant-do-a-detailed-one/doing-a-basic-accessibility-check-if-you-cant-do-a-detailed-one) - mentioned above but listed here as well

Found any other issues? Want to add more resources? [Submit an issue](https://github.com/ministryofjustice/recording-a-goose-sighting/issues), or [create a PR](https://github.com/ministryofjustice/recording-a-goose-sighting/pulls) to either fix it or add it to this answers list.
