class User < ApplicationRecord
  validates :title, presence: true, length: { in:1..20 }
  validates :end_at, presence: true
  validates :memo, length: { in:1..500 }
  validate :end_at_cannot_be_before_start_at
  
  private

  def end_at_cannot_be_before_start_at
    if end_at.present? && start_at.present? && end_at < start_at
      errors.add(:end_at, "は開始日以降の日付を設定してください")
    end
  end
end