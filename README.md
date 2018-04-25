# Project 5 - *Twitter*

**Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **16** hours spent in total

## User Stories

- [x] User sees app icon in home screen and styled launch screen. 
- [x] User can sign in using OAuth login flow. 
- [x] User can Logout. 
- [x] Create Data Models for User and Tweet. 
- [x] User can view last 20 tweets from their home timeline with the user profile picture, username, tweet text, and timestamp. 
- [x] User can pull to refresh. 
- [x] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet. 
- [x] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation. 
- [x] The current signed in user will be persisted across restarts. 
- [x] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. 
- [x] Links in tweets are clickable. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/IBkXyyN.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Had to debug a pesky 401 error, learned quite a bit about using breakpoints and the terminal to get response information

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [ActiveLabel](https://github.com/optonaut/ActiveLabel.swift) - UILabel drop-in replacement 

## License

Copyright [2018] [Joe Antongiovanni]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


---


# Project 6 - *Twitter2*

Time spent: **12** hours spent in total

## User Stories

- [x] User can tap on a tweet to view it in a detail view, with controls to retweet, favorite, and reply 
- [x] User can compose a new tweet by tapping on a compose button. 
- [x] When composing a tweet, user sees a countdown for the number of characters remaining for the tweet (out of 140) 
- [x] User can view their profile in a *profile tab* 
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src= 'https://i.imgur.com/n78fZOh.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Difficulty passing user data from the tableview to the detail view proved to be very frustrating, turned out to be a small error made initially in the storyboard rather than a problem in the code itself

## License

Copyright [2018] [Joe Antongiovanni]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
