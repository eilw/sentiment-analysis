[![Code Climate](https://codeclimate.com/github/eilw/sentiment-analysis/badges/gpa.svg)](https://codeclimate.com/github/eilw/sentiment-analysis) [![Test Coverage](https://codeclimate.com/github/eilw/sentiment-analysis/badges/coverage.svg)](https://codeclimate.com/github/eilw/sentiment-analysis/coverage)

#Love it or leave it
### A web application for understanding the current sentiment of a search term through Twitter sentiment analysis

Makers Academy final project, made collaboratively by Rufus Raghunath, Eirik Wiig, Scott Gledhill, and Jonny Pickard. View it on Heroku at https://loveit-leaveit.herokuapp.com/.

![main_search](/angular/app/images/screenshots/main.png)

#####Problem statement

Help me understand what the crowd thinks of the topic I am interested in.

#####Approach

The app was pitched, designed and built in a single two-week sprint.

We used Test-Driven Development and pair programming throughout the entire process. We had different pairs every day and regularly switched driver/navigator roles.

We also made use of Agile concepts. We held regular standups and took an "always finished" approach, deploying to Heroku every day. Our Minimum Viable Product was online after only two days.

#####How does it work?

When you submit a search, our app pulls in relevant social media data (Twitter) and passes it through a custom sentiment algorithm.

The algorithm uses a library of positive and negative words, compiled by <a href="https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon">Liu and Hu</a>. We addressed important edge cases such as sentiment negation (e.g. "not good") - full list <a href="https://github.com/rufusraghunath/crowdsource-due-diligence/blob/development/edge_cases.md">here</a>.

#####Technologies used

- AngularJS via Node.js in the front
- angular-chart for data viz
- Bootstrap for styling
- Ruby on Rails in the back
- Twitter REST API for scraping social media data
- RSpec, Jasmine, Karma, and Protractor for testing
- Git/GitHub/Waffle for version control
- Hosted on Heroku

#####Screenshots

![trends](/angular/app/images/screenshots/trends.png)
![explore](/angular/app/images/screenshots/data.png)
![compare](/angular/app/images/screenshots/compare_search.png)
![twitter](/angular/app/images/screenshots/twitter.png)

#####User stories

```
As a user,
So I can find out more about my topic,
I want to be able to search for a search word.
```
```
As a user,
So I can easily understand my search results,
I want to see a very simple breakdown of overall sentiment with % good, bad, and neutral.
```
```
As a user,
So I can see my search results in context,
I want to see changes in sentiment over time.
```
```
As a user,
So I can inform my opinions,
I want to know what other people think of my topic of interest.
```
```
As a user,
So I can compare one thing against another,
I want to be able to search for two things at once.
```
```
As a user,
So I share my opinions,
I want to be share the results through my twitter account.
```
```
As a user,
So I can see what I have searched for before,
I want to see a list of my previous results.
```
```
As a user,
So my screen is not too cluttered,
I want to be able to delete previous results.
```

#####Installation
- clone this repo
- inside ```/angular```, run ```bower install```, then ```npm start```
- inside ```/rails/sentiment-analysis```, run ```bundle```, then ```rails s```
- visit ```localhost:8080``` in your browser
- enjoy!

#####Acknowledgements

Thanks to Bing Liu and Minquing Hu for compiling comprehensive libraries of positive and negative valence words in their <a href='https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon'>Opinion Lexicon</a>. This was used in processing social media input (e.g. tweets) for sentiment.

Emoticon images from https://www.wpclipart.com/smiley/smiley_outlines/smiley_outline_set/.

Twitter icon by http://www.flaticon.com/authors/icomoon
