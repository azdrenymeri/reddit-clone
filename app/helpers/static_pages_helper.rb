module StaticPagesHelper
def count_format(size)
    	number_to_human(size, :format => '%n%u', 
    		:precision => 2, 
    		:units => { :thousand => 'k', 
    					:million => 'm', 
    					:billion => 'b' })
    end
end
