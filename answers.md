# Accessibility Issues in Register a Goose service

Some of these issues would not be WCAG 2.1 failures. But, they could present issues to users with access needs, and WCAG compliance doesn't neccessarily mean that something is accessible.

## Pages
### Start page

- Two h1 tags
A page should only have one `h1` tag. A `h1` tag specifies what the top level heading is for the entire page. It used to be permissible to have another `h1` tag nested within a `section` element, but this was depracated in HTML 5.1.

- Altered tab order on side menu
The tab order is a bit random, when you're tabbing through the list of links on the right-hand side of the page. This is unpredictable, and a bit disorienting. Whilst it's not a huge issue in this scenario, if the links were further appart on the page, or spread out more, it could cause issues for users who zoom in a lot, who might then not be able to tell where focus is gone, and have to hunt from it, or might have had their screen view dragged across the page as it's following focus state (depending on how they've configured their assistive technologies).

- Link opens in new tab
Opening a link in a new tab can be appropriate if you tell the user in advance that it's going to happen. This can be done with either with text in the link description or with an icon that has alt text. In this scenario, neither of these techniques have been used. This is an issue because the user then can't use the back button on the keyboard to navigate to where they were, as a new tab history has been opened.

- Undescriptive link text
Sometimes, screen reader users view links out of context. Some screen readers can pull all of the links out of a page and put them into one list, that is quicker to skim through. If link text doesn't make sense out of context, it would be unusable when viewed this way. The 'More' link on the start page doesn't make any sense out of context - we can infer it means more about geese by seeing the visual link with the section header, but this isn't sufficient.

- Poor focus state on link
If the focus state doesn't have a high enough contrast, it can be really hard to tell where focus is. This particularly affects people who have a visual impairement. In this instance, this issue can be fixed by adding the appropriate Design System link class.

- `Role=“button”` missing on link to next page
Visually, this is coded to look like a button, but it's actually a link. Links can only be selected by pressing enter, but buttons can be selected by pressing space bar too. This can be told visually, from it's appearance, and giving it a `role="button"` would let screen reader users know this too. This has come about from the Design System not being implemented properly, as the Design System markup contains this. This is a relatively minor issue, but it is best practise to add in appropriate ARIA if you're doing things like this.

### Do you like geese page
- No legend on the radio button
We can visually tell the link by looking at the page. But, the question isn't linked up to the element in a way that makes sense for users who can't see. For radio buttons and checkboxes, it's important to have a `<legend>` element. The fix would be making sure the 'h1' is inside the 'legend', as per the Design System pattern. 

- Continue button isn’t keyboard focusable
You can still get past this page by pressing enter when on the radio buttons, but a user might not know this. They might (understandably) expect that the only way to progress is by submitting enter, and so feel trapped and abandon the service at this point. The fix would be removing the `tabindex="-1"`.

- Insufficient colour contrast of the form hint
The colour contrast is way too low for the form hint text. In the Design System, it's a darker grey, which does have a sufficient colour contrast ratio. Respecting the out-of-the-box colours and not overriding them here would fix this issue.

### What type of goose did you see
- Wrong page title
Some screen readers (like JAWS) read the page title out when a page loads. On this page, the page title is 'boop', which tells the screen reader user nothing about what's on the page. A better format would be the page question, followed by the service name, and followed by whatever it's hosted on - so 'What type of goose did you see - Recording a goose sighting - GOV.UK', if it were on GOV.UK. 

- Visually hidden item you can tab onto
There is some hidden text on the page, that is tab focusable. Whilst this isn't a particularly realistic example of this issue, sometimes inputs can get hidden of screen. It can be confusing for keyboard users who are tabbing through the screen, because the focus disappears, and you end up not being entirely sure where or when it's going to reappear, or what would happen if you tried to select the element you were on. If something has focus, it's best that it becomes visible, at least for the duration of it having focus.

- Transparent text that appears in dark mode
An attempt was made to hide the text 'ghost goose' on the page - but because `color: transparent` was used, it isn't properly hidden, and leaks out in dark mode. The proper fix would be using the 'govuk-visually-hidden' class. This issue will be visible if you're using the plugin suggested for this exercise (Dark Mode), but won't appear if you're using high contrast mode on your laptop.

- Placeholder text
Placeholder text disappears when you start to type. This can be confusing, and if you struggle to remember things, you might then need to delete what you've typed in to remind yourself of what was there, in case it was important. It's best to include information like hints outside of the form field, where it can be seen at all times.

### When did you see the goose
- No issues on this page! Sometimes, when you've found issues on other pages, you expect every page to have issues, and you spend a long time looking. However sometimes, some pages don't have issues, and if the basic tests pass, the best use of time is to move on.

### Check your answers
- Change link - hidden text is incorrect
We talked earlier about links needing to make sense out of context. In this component from the Design System, given the change link is just across from the question, it would look weird to have that visually included in the link. But, we can visually hide text - and that's what is normally done here. A sighted user would see 'change', but a screen reader user would hear 'change what type of goose did you see'. However, it's been configured incorrectly here - and random food items have been put in the visually hidden text, instead of proper text. 

- Incorrect heading level hierarchy
The heading hierarchy is currently h1 > h3. The 'goose details' heading should be a h2, as it is a direct descendant of the h1. This is an issue because screen reader users can pull all of the headings out into one summary list, as a quick way of skim reading through what is on the page. If the ordering is incorrect like this, it can be hard to interpret when viewed in this way.

- Justified text
Justified text forces words and letters to space out a little more than they normally would, which in turn distorts the overal sentence shape a little. The shape is beneficial for some people with dyslexia though, and so justifying and centering content like this can make it harder to read. The fix would be removing the styling that makes it justify, and allowing it to flow normally.

### End date
- Use of capital letters
Text that is in all capital letters loses its shape. This can make it harder for some people with dyslexia to read. Unless absolutely necessary (like it is in a reference number), it's best to avoid writing words entirely in capital letters.

- No alt text on the gif
This gif shows a happy goose celebrating knowledge about geese being shared with the world. This information isn't captured in any other medium like text on the page though, so descriptive alt text needs to be added here. There is a handy [alt decision tree by W3C](https://www.w3.org/WAI/tutorials/images/decision-tree/) on how to decide how to write alt text, which is worth a look at.

- Removed transparent border
When unaltered, the big box at the top has a colour behind it, that gives it visual prominence on the page. If we turn on our dark mode plugin, it loses this. This is because it's been tampered with a little - if you go to this Summary pattern page in the Design System with the dark mode plugin turned on, you'll see a border appears around it. This is because of a transparent border around it. This was used incorrectly earlier, to try to hide the 'ghost goose', but used to positive effect here. Just one example of the many ways in which the Design System is awesome!


## Want to learn more about Accessibility?

- [GOV.UK resources about accessibility](https://www.gov.uk/service-manual/helping-people-to-use-your-service/making-your-service-accessible-an-introduction#further-reading)
- [Udacity course on Accessibility](https://www.udacity.com/course/web-accessibility--ud891)
- [A11y weekly - weekly newsletter about accessibility](https://a11yweekly.com/)
- [GDS WCAG 2.1 Primer](https://alphagov.github.io/wcag-primer/) - good for helping you understand the Web Content Accessibility Guidelines
- [GDS guidance how to conduct a basic accessibility audit](https://www.gov.uk/government/publications/doing-a-basic-accessibility-check-if-you-cant-do-a-detailed-one/doing-a-basic-accessibility-check-if-you-cant-do-a-detailed-one) - mentioned above but listed here as well

Found any other issues? Want to add more resources? [Submit an issue](https://github.com/ministryofjustice/recording-a-goose-sighting/issues), or [create a PR](https://github.com/ministryofjustice/recording-a-goose-sighting/pulls) to either fix it or add it to this answers list.