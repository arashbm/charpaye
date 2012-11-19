module PostsHelper
  def post_footer(post)
    content="<div>
      <hr />"
      content += "<i class='icon-edit'></i> <a href='#{ edit_post_path(post) }'>#{ t "helpers.links.edit" }</a> |" if current_user.editable_posts.include? post
      content += "<i class='icon-share-alt'></i>
      <a href='#{post_revisions_path(post)}'>#{ Post.human_attribute_name(:audits) } (#{ post.audits.count })</a> |
      <i class='icon-comment'></i>
      <a href='#{post_path(post, anchor: 'reviews')}'>#{ Post.human_attribute_name(:reviews)} (#{ post.reviews.count })</a>
      <hr />
    </div>"
    content.html_safe
  end
end
