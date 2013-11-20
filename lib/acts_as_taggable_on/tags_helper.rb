module ActsAsTaggableOn
  module TagsHelper
    # See the README for an example using tag_cloud.
    def tag_cloud(tags, classes, number_max_of_tags)
      return [] if tags.empty?

      sorted_tags = tags.sort_by(&:count).reverse
      if (number_max_of_tags) {
        sorted_tags = sorted_tags[0..(number_max_of_tags-1)]
      }
      max_count = sorted_tags.first.count.to_f

      sorted_tags.shuffle.each do |tag|
        index = ((tag.count / max_count) * (classes.size - 1))
        yield tag, classes[index.nan? ? 0 : index.round]
      end
    end
  end
end
