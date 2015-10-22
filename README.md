# Summary
This visulisation looks at US domestic flight data from 2003 - 2008. It looks at how the performance of different airlines differs offer time, highlighting the 2 series, Hawaiin airlines and Aloha airlines that consistently outperform other airlines. The data has been aggregated by airline by month to reduce the datasets size. In later versions I told the user the a story by running through the airlines by rank in an animation, always keeping the Hawaiin and Aloha airline series visible, then allowing them to explore the data afterwards. I also delved into the data a bit more and as suggested decided to also bring out the proportion of flights from busy airports, so the user could also compare that with average performance. 

#Design 
1. Dataset.
I needed to reduce the size of data file so that it was able to be handled without performance problems in the browser. I wanted the user to be able to judge the performance of their airline compared to others. I also considered including the origin airport in the dataset, but this would have increased the json data file to over 100MB which may have caused problems in the browser. 

In order to add another bit of information to my visulisation I worked out which airports were comparably busy, so that I could work out the proportion of flights from an operator were from busier, airports. 
flights_by_origin$cat <- 'Normal'
flights_by_origin$cat[flights_by_origin$flights >1000000 ] <- 'V.Busy'
flights_by_origin$cat[flights_by_origin$flights >250000 & flights_by_origin$flights <1000000 ] <- 'Busy'
flights_by_origin$cat[flights_by_origin$flights >10000 & flights_by_origin$flights <50000 ] <- 'Quiet'
flights_by_origin$cat[flights_by_origin$flights < 10000 ] <- 'V.Quiet'
flights_by_origin$cat <- ordered(flights_by_origin$cat, c('V.Busy', 'Busy', 'Normal', 'Quiet', 'V.Quiet'))

I imported this into my visualisation as a seperate enrichment dataset.


2. Chart type
Since I wanted the user to be able to compare different time series of data, I decided that a line graph would be a better way to help them see trends. To aid with understanding of the data, I also added the points that the line was interpolated from on selection, so that the user new the true values. When i incorporated the 'busy airport' information into the visulisation, I decided that a stacked bar chart, would be a good way to compare the proportion of flights from the various categories, and also aid with visually comaring this with other airlines distributions. 

3. Visual Encoding
I decided to use position on screen as the main encoding of the data, since this is one of the best ways for humans to compare elements (thus the placement of lines, and points). This is supplemented by the use of color to make different series in the chart stand out (like the average), and each subsequent airline was giving a unique colour, which was also used on information panels when the series was sected for consistency, and to allow the user to associate the 2 together more easily. I also decided to alter the average line to appear dotted so it stood out from other series. When I incorporated the stacked bar charts into the visualisation, I wanted the size of the chart to be the same on each airlines panel, to allow for easy comparison. I also chose colors to use for the different airport busyness categorys, consistently, so that it was easier for the user to quickly compare 2 different selections.

4. Legend
I did not want to clutter the page too much with axis and legends to distract the user from the main visualisation. When a series is selected a panel is rendered on the screen which gives more information, and is colored in the same colour as the series in the chart to enable the user to associate the two. I decided to use pop up boxes on hover to give the user more information on their selections. This meant that I could give them more information without distracting them from the main information. 

5. Animation
After my first submission, I decided to hide the information panels when the animation was running, as it was distracting the user, and just include a simple label describing the ranking and airline name. Once the animation was finished the information panels appear, so that the user can then begin exploring the data. I also decided to always keep the Hawaiin and Aloha airlines series displayed, since I wanted to highlight this to the user, as they were extraordinary.

#Feedback

After my initial attempt at plotting the chart i created this post to gain feedback:
https://discussions.udacity.com/t/p6-project-feedback/32277


Hi @mark_160718276,

Nice work on the visualization smile ! Here are some observations:

The color of the selected airline span element is the same as the corresponding delay trend line. The airline associated with the 2nd line that gets selected on mouseover however is unclear. You could, for example, assign a different color to this line and also change the color of the span element of the corresponding airline on mouseover.

Screen Shot 2015-09-18 at 2.37.10 PM.png965x506 191 KB
You mentioned that the plot is of average delay over a monthly period. It would be good to indicate which data points on the interpolated lines correspond to the values available to us for each month (Display the start and endpoints of each segment of the svg path element as in the following image). Or you could use drop down lines from each data point to the x axis.


Interpolation gives rise to the assumption that we have data for the interval between 2 months. This could result in misinterpretation of trends which could be a result of the specific interpolation function used. For example it isn't clear if delay keeps increasing after 2008. The next data point could actually have a decrease in delay however the output of the interpolation function makes it look like there is a sharp continuing rise in average delay towards the end of the 2008.



Reply
Reply as linked Topic

daniel_68718711d
Hi Mark,

Nice visualization! Some more short comments:

I wanted to activate more than one airline to compare them!

Hovering over the lines is a bit confusing when the lines appear/disappear so fast and are difficult to 'aim' at because they are thin. I think you should at least increase the transition duration time.

Maybe you can automatically cycle through the airlines when a viewer is landing on the page? You can stop the cycle when the viewer clicks on a button (otherwise it would be annoying).


----------------

Feedback in person from J. Messer  22nd Sepetember 2015

* Looks cool, how about more detail about the airlines is displayed when you click on one?


Visualisation after first set of feedback:

http://bl.ocks.org/uwrighty/raw/f40da3aa6e4dd839f9a5/


Feedback in person my B. Lewis 02 October 2015.
* Maybe the information for both of the visible series should be presented at the same time?
* could the button be better at the bottom?
* The label values should be rounded.

----------------
Version History:

line graph
line series
buttons to select airline
average trend line.

version 1: http://bl.ocks.org/uwrighty/raw/4f58321e01334c8a2567/
I added a different color for hover. 
Plotted the data points for selected airlines.
Used cardinal interpolation rather than basis.
Enabled two different airlines to be selected at once to allow for easier comparison.
Increase the transition duration time.
Provide a story once the page first loads by stepping through the worst to best performing airlines in turn.
Provided detail on hover 
Organised the button in performance rank

version 2: http://bl.ocks.org/uwrighty/raw/f40da3aa6e4dd839f9a5/ 

Dynamically create the information div and append to the DOM.
Move buttons to bottom.
Rounded values.
Added total flights to info panel.
Submitted. 

version 3:
Post submission.
Reduce the size of info boxes.
Get rid of buttons and replace by hover events again.
Increase the animation delay.
Add a stacked bar of number of flights from busy airports as additional bit of information for comparison.
Add a simple label on the visualisation during animation, rather than information panels.

version 4:
Added navigation buttons
Added button to skip animation
Added more comments to code.
Added code to toggle whether nav button can be triggered.

version 5:
Tried to emphasise a story about the data more effectivley, since the visualisation was still exploratory rather than explanatory. After the comments by the reviewer decided to bring out the number 1 and 2 ranked airlines because they were significantly different to the others.

#Resources
list any sources you consulted to create your visualization

http://d3js.org/ -d3 docs

https://bimonitor.wordpress.com/2013/03/22/properties-and-best-uses-of-visual-encoding/ - info on visual encodings.

http://bl.ocks.org/Caged/6476579 - tooltips
