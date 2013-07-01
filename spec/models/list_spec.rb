require 'spec_helper'

describe List do

  describe "#tasks_by_date" do
    let(:list) { create(:list) }
    let(:today1) { create(:task, list_id: list.id, position: 2, date: Date.today)}
    let(:today2) { create(:task, list_id: list.id, position: 1, date: Date.today)}
    let(:today3) { create(:task, list_id: list.id, position: 3, date: Date.today)}
    let(:tomorrow) { create(:task, list_id: list.id, position: 3, date: 1.days.from_now)}

    it "returns the tasks for the date given ordered by position ASC" do
      expect(list.tasks_by_date(Date.today)).to eq [today2, today1, today3]
    end

    it "doesn't return tasks that are not on the given date" do
      expect(list.tasks_by_date(Date.today)).to_not include tomorrow
    end
  end

  describe "#set_list_uid" do
    let(:user) { create(:user) }
    let(:list) { create(:list, user: user) }

    it "creates an 8 character SecureRandom hex" do
      expect(list.uid).to_not be_nil
      expect(list.uid.length).to eq 8
    end

  end

  describe "#destroyable?" do
    let(:user) { create(:user) }

    context "User has more than 1 list" do
      let(:list1) { create(:list, user_id: user.id) }
      let(:list2) { create(:list, user_id: user.id) }

      it "should return true" do
        expect(list1.destroyable?).to be_true
      end

    end

    context "User only has 1 list" do

      it "should return false" do
        expect(user.lists.first.destroyable?).to be_false
      end

    end

  end

end
