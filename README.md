# Summary
This visulisation looks at US domestic flight data from 2003 - 2008. It looks at how the performance of different airlines differs offer time. The data has been aggregated by airline by month to reduce the datasets size. 

#Design 
1. Dataset.
I needed to reduce the size of data file so that it was able to be handled without performance problems in the browser. I wanted the user to be able to judge the performance of their airline compared to others. I also considered including the origin airport in the dataset, but this would have increased the json data file to over 100MB which may have caused problems in the browser.

2. Chart type
I was using a time series, and plotting the average flight performance for a given airline per month, so thought a line graph would work to show the trend, and allow for analysis between different airlines.

3. Visual Encoding
I decided to use position on screen as the main encoding of the data, since this is one of the best ways for humans to compare elements. This is supplemented by the use of color to make different series in the chart stand out (like the average)


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

----------------

Work post feedback

I added a different color for hover. 
Plotted the data points for selected airlines.
Used cardinal interpolation rather than basis.
Enabled two different airlines to be selected at once to allow for easier comparison.
Increase the transition duration time.
Provide a story once the page first loads by stepping through the worst to best performing airlines in turn.
Provided detail on hover 
Organised the button in performance rank

#Resources
list any sources you consulted to create your visualization

http://d3js.org/ -d3 docs

https://bimonitor.wordpress.com/2013/03/22/properties-and-best-uses-of-visual-encoding/ - info on visual encodings.

http://bl.ocks.org/Caged/6476579 - tooltips
