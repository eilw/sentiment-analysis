#Does it suck?
###A tongue-in-cheek due diligence research engine powered by Twitter sentiment analysis

[![Stories in Ready](https://badge.waffle.io/rufusraghunath/crowdsource-due-diligence.png?label=ready&title=Ready)](http://waffle.io/rufusraghunath/crowdsource-due-diligence)

Makers Academy final project, made collaboratively by Rufus Raghunath, Eirik Wiig, Scott Gledhill, and Jonny Pickard.

View it on Heroku at https://does-it-suck.herokuapp.com/.

![main_search](/angular/app/images/screenshots/main_search.png)

#####Problem statement

It's hard to gage the quality of anything before buying it. A simple tool for crowdsourcing an opinion on whether stuff sucks is in order.

#####Approach

The app was pitched, designed and built in a single two-week sprint.

We used Test-Driven Development and pair programming throughout the entire process. We had different pairs every day and regularly switched driver/navigator roles.

We also made use of Agile concepts. We held regular standups and took an "always finished" approach, deploying to Heroku every day. Our Minimum Viable Product was online after only two days.

#####How does it work?

When you submit a search, our app scrapes relevant social media data (Twitter) and passes it through a custom sentiment algorithm.

The algorithm uses a massive library of positive and negative words, compiled by <a href="https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon">Liu and Hu</a>. We addressed important edge cases such as sentiment negation (e.g. "not good") - full list <a href="https://github.com/rufusraghunath/crowdsource-due-diligence/blob/development/edge_cases.md">here</a>.

#####Technologies used:

- AngularJS via Node.js in the front
- angular-chart for data viz
- Ruby on Rails in the back
- Twitter REST API for scraping social media data
- RSpec, Jasmine, Karma, and Protractor for testing
- Git/GitHub/Waffle for version control
- Hosted on Heroku

#####Screenshots:

![trends](/angular/app/images/screenshots/trends.png)
![explore](/angular/app/images/screenshots/explore.png)
![compare](/angular/app/images/screenshots/compare.png)
![about](/angular/app/images/screenshots/about.png)

#####User stories:

```
As a consumer,
So I can decide whether or not to invest in a product,
I want to know whether the product has been well-received.
```
```
As a Does It Suck? user,
So I can find information on the product of my choice,
I want to enter what I'm interested in.
```
```
As a Does It Suck? user,
So I can easily understand my search results,
I want to see a very simple breakdown of overall sentiment with % good, bad, and neutral.
```
```
As an advanced Does It Suck? user,
So I can see my search results in context,
I want to see changes in sentiment over time.
```
```
As an advanced Does It Suck? user,
So I can see my search results in context,
I want to see a breakdown of individual tweets.
```
```
As an advanced Does It Suck? user,
So I can see my search results in context,
I want to compare sentiment scores for different searches.
```

#####Installation:
- clone this repo
- inside ```/angular```, run ```bower install```, then ```npm start```
- inside ```/rails/crowdsource-due-diligence```, run ```bundle```, then ```rails s```
- visit ```localhost:8080``` in your browser
- enjoy!

#####Acknowledgements:

Thanks to Bing Liu and Minquing Hu for compiling comprehensive libraries of positive and negative valence words in their <a href='https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon'>Opinion Lexicon</a>. This was used in processing social media input (e.g. tweets) for sentiment.

Emoticon images from https://www.wpclipart.com/smiley/smiley_outlines/smiley_outline_set/.

Twitter icon by http://www.flaticon.com/authors/icomoon
