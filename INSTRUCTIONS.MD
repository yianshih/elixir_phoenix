# Fresh Equities coding challenge

Our platform is mainly a way for users to find companies raising capital and place bids to invest in those raises. We have a Phoenix backend with Next.js and React Native client apps interfacing with GraphQL.

For this challenge, we have set up a simplified version of the website - a Phoenix application with a form to bid into capital raises. For simplicity, it uses Phoenix server-rendered views rather than our full tech stack.

## Your task

Implement the bidding process:
* A form where users can bid on the number of shares they want to buy in the raise
* A receipt page where a user can see a confirmation of their bid with:
  * Identifying which offer the bid is for
  * Amount of shares
  * $ value of shares
  * Amount of options they would get with the shares (if the offer has options attached)
* The total amount of bids in an offer should not exceed the amount being raised.  Any bids that will push the total beyond that amount should be rejected.
* Bonus (not required): ability to increase their bid (should not be allowed to decrease it)

In summary, a user should be able to choose a capital raise, place a bid (number of shares), and then see a confirmation of their bid.

If you have any questions about the business logic, please reach out and ask.

We have left some hints in the codebase on where to start the task. You do not need to create users or authentication in this task.

## Get started

To get started read the Phoenix setup notes and resources in the `README.md`. Once you have the app running on http://localhost:4000, implement the bidding process.

Please ask any questions you need about about Elixir / Phoenix. The developer who you spoke to in your initial conversation will be your contact point for these questions and to submit your test to.

## Submitting

use git to zip the files:

`git add -A && git commit -m “your message”`
`git archive --format zip --output fresh-equities.zip master`

Send us the `fresh-equities.zip` file.

Please send us the project back within 3 days. Let us know early if you will need more time. Ideally the project would take less than 4 hours.
