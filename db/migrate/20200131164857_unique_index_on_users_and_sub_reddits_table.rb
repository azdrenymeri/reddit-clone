class UniqueIndexOnUsersAndSubRedditsTable < ActiveRecord::Migration[5.2]
  def change
  	reversible do |dir|
  		
  		dir.up do 
			connection.execute(%q(
                create unique index index_user_sub_reddits_on_interchangable_user_id_and_sub_reddit_id on user_sub_reddits(greatest(user_id,sub_reddit_id), least(user_id,sub_reddit_id));
                create unique index index_user_sub_reddits_on_interchangable_sub_reddit_id_and_user_id on user_sub_reddits(least(user_id,sub_reddit_id), greatest(user_id,sub_reddit_id));
            ))
  		end
  		
  		dir.down do 
  			connection.execute(%q(
                drop index index_user_sub_reddits_on_interchangable_user_id_and_sub_reddit_id;
                drop index index_user_sub_reddits_on_interchangable_sub_reddit_id_and_user_id;
            ))
  		end
  	end
  end
end
