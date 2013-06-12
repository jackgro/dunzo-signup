require 'spec_helper'

describe Category do

  describe "#tasks_by_date" do
    let(:category) { create(:category) }
    let(:today1) { create(:task, category_id: category.id, position: 2, date: Date.today)}
    let(:today2) { create(:task, category_id: category.id, position: 1, date: Date.today)}
    let(:today3) { create(:task, category_id: category.id, position: 3, date: Date.today)}
    let(:tomorrow) { create(:task, category_id: category.id, position: 3, date: 1.days.from_now)}

    it "returns the tasks for the date given ordered by position ASC" do
      expect(category.tasks_by_date(Date.today)).to eq [today2, today1, today3]
    end

    it "doesn't return tasks that are not on the given date" do
      expect(category.tasks_by_date(Date.today)).to_not include tomorrow
    end
  end

  describe "#set_category_uid" do
    let(:user) { create(:user) }
    let(:list) { create(:category, user: user) }

    it "creates an MD5 hash out of the time, slug and name of the category" do
      slug = list.user.slug
      name = list.name

      Timecop.freeze do
        time = Time.now.to_s
        expect(list.set_category_uid).to eq Digest::MD5.hexdigest("#{time}-#{slug}-#{name}")
      end

    end

  end

  describe "#destroyable?" do
    let(:user) { create(:user) }

    context "User has more than 1 category" do
      let(:category1) { create(:category, user_id: user.id) }
      let(:category2) { create(:category, user_id: user.id) }
      
      it "should return true" do
        expect(category1.destroyable?).to be_true
      end

    end

    context "User only has 1 category" do
      
      it "should return false" do
        expect(user.categories.first.destroyable?).to be_false
      end

    end

  end

end
