module TasksHelper
	def menu_urls
		#first pair is active pair
  	@links = [["Tasks", tasks_url], ["Account", '#'], ["Help", '#']]
	end
end
