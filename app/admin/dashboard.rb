ActiveAdmin.register_page "Dashboard" do
  content :title => proc{ I18n.t("active_admin.dashboard") } do
    
        panel "Recent Posts" do
          table_for Post.order("id desc").limit(15) do
                column :id
                column "Post Title",:name do |post|
                    link_to post.name,[:admin,post]
                end
                column "Author",:admin_user
                column :category, :sortable => :category
                column :created_at
            end
            strong (link_to "Show All Posts" , :admin_posts )
        end    

        panel "Categories" do
          table_for Post.order("id desc").limit(15) do
                column :id
                column "Categories Title",:name do |category|
                    link_to category.name,[:admin,category]
                end
                column :created_at
            end
            strong (link_to "Show All Category" , :admin_categories)
        end   
  end
end
