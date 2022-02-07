## Data Scraping tips for Sookja's Data Collection

urls_list <- c()
for(i in 1:5) #scrapes links from the first 5 pages
{
  page_url <- paste0("https://community.whattoexpect.com/forums/plus-size-moms-and-moms-to-be.html?page=", i) #identifies the page to scrape
  urls_from_page <- read_html(page_url) %>% #reads the html of the page
    html_node("div.group-discussions__list") %>% #focuses on the discussion list
    html_nodes("a.linkDiscussion") %>% #identifies the node storing the link for each discussion
    html_attr("href") #extracts the "href" or the link information
  urls_list <- c(urls_list, urls_from_page) #combines the links from this page to the links you scraped from previous pages
}

urls_list[1] #note that the output of "href" begins with "/forum..."

#we therefore need to add "https://community.whattoexpect.com" to the front to make it a complete link, like we do below:
urls_list <- paste0("https://community.whattoexpect.com", urls_list)



### Here are some scripts for scraping individual discussion posts, dates, and replies.
### Since you have many links, you will likely want to loop or apply a function that does this iteratively

original_post <- read_html(urls_list[1]) %>% #gets the information of the original post
  html_nodes("div.discussion-original-post__content") %>%
  html_nodes("p") %>% 
  html_text()

original_post_date <- read_html(urls_list[1]) %>% #gets the information for the date
  html_nodes("div.discussion-original-post__author__updated") %>%
  html_attr("data-date") #this date is stored as a UNIX date
as.POSIXct(as.numeric(original_post_date)/1000, origin="1970-01-01") #use this line to get the actual date

replies <- read_html(urls_list[1]) %>% #gets the replies to the original post
  html_nodes(".discussion-replies") %>%
  html_nodes("p") %>% 
  html_text()

replies