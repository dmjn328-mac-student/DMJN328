#1. Go to census mapper and select "Region Selection"
#2. Try to select the census sub-division of Kitchener 
#3. Select "Overview"
#4. Choose a geographic level of boundaries to download. We will download the Census Tract CT data. 
#5. Copy and past the R code below.

### Setting your API and your Cache path
# Your API is like a signature. Only you have this and you use it to get special access to datasets.
# Your cache is a place on your computer where you can temporarily store large datasets associated with this package. It makes things run more smoothly. Rather than re-downloading geography and data files from your Statistsics Canada everytime, you can download them once, set them in your cache path and then you're done. 

# You can store these variables in an invisible file on your computer called .Rprofile.
#The command file.edit() edits a file that you tell it to. 
#The command file.path() creates a file name that is platform-independent (i.e. it works on macs and PCs.)
# ~ is the universal symbol for your user root directory
#Watch what happens
file.path("~", ".Rprofile")
#uncomment and run this command to edit your .Rprofile 
#file.edit(file.path("~", ".Rprofile"))

#Add these two lines to your .Rprofile file and save. 
#Incidentally, while you are there, you can give yourself a funny message that will run everytime you start R. 
#print("That Dr. Kiss sure was awesome")
#options(cancensus.api_key = "your_api_key")
#options(cancensus.cancensus.cache_path="~")

#Copy the R code into your script below and run. 
#Read the note about downloading the geographic data as well. 


#Plot just like using the commands in the course page. 



#Find out what variables are available. 
#