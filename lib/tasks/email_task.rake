namespace "email" do
  desc "checks tool expiration daily"
  task "check" => :environment do |t|
    UserTool.where(status: "out").each do |user_tool|
      user_tool.return_email
    end
  end
end
