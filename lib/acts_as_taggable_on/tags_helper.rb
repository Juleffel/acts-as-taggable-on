module ActsAsTaggableOn
  module TagsHelper
    # See the README for an example using tag_cloud.
    def tag_cloud(tags, classes, number_max_of_tags = 0)
      return [] if tags.empty?

      sorted_tags = tags.sort_by(&:count).reverse
      if number_max_of_tags != 0
        sorted_tags = sorted_tags[0..(number_max_of_tags-1)]
      end
      max_count = sorted_tags.first.count.to_f
      min_count = sorted_tags.last.count.to_f
      if max_count <= min_count
        max_count = min_count + 1
      end

      sorted_tags.shuffle.each do |tag|
        index = (((tag.count - min_count) / (max_count - min_count)) * (classes.size - 1))
        yield tag, classes[index.nan? ? 0 : index.round]
      end
    end
  end
end
