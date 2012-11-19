# encoding: UTF-8
module RevisionsHelper
  def body_diff(str1, str2)
    Diffy::Diff.new(h(str1),h(str2), diff: '--minimal -w -U10000' ).to_s(:html).html_safe
  end
  def next_previous_buttons
    "#{link_to 'قبلی', post_revision_path(@post, @audit.version-1), class: 'btn' if @post.audits.find_by_version(@audit.version-1)}
    #{link_to 'بعدی', post_revision_path(@post, @audit.version+1), class: 'btn' if @post.audits.find_by_version(@audit.version+1)}".html_safe
  end
end
