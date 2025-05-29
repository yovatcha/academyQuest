puts "Clearing existing quests..."
Quest.destroy_all

puts "Creating quests..."

quests = [
  { name: "First Day at TIPCO! Setup Macbooks and everything up!", status: true, created_at: Time.parse("2024-01-06") },
  { name: "1st Finova's UX Field Research", status: true, created_at: Time.parse("2024-01-10") },
  { name: "Friendslog Migration", status: false, created_at: Time.parse("2024-01-14") },
  { name: "2nd Finova's UX Field Research", status: true, created_at: Time.parse("2024-01-17") },
  { name: "3rd Finova's UX Field Research", status: true, created_at: Time.parse("2024-01-24") },
  { name: "Create Tipco's card template for printing", status: true, created_at: Time.parse("2024-02-03") },
  { name: "On Board people fron Sukhothai Thammathirat Open University that recently joinned", status: true, created_at: Time.parse("2024-02-18") },
  { name: "NVC Class", status: true, created_at: Time.parse("2024-03-03") },
  { name: "Scrum Class", status: true, created_at: Time.parse("2024-03-04") },
  { name: "Ruby Class", status: true, created_at: Time.parse("2024-03-10") },
  { name: "Ruby On Rails Class", status: true, created_at: Time.parse("2024-03-11") },
  { name: "GIT Class", status: true, created_at: Time.parse("2024-03-17") },
  { name: "Agile Testing Class", status: true, created_at: Time.parse("2024-03-18") },
  { name: "Playwright Testing", status: true, created_at: Time.parse("2024-03-21") },
  { name: "Container Fundamental", status: true, created_at: Time.parse("2024-03-24") },
  { name: "Docker Class", status: true, created_at: Time.parse("2024-03-25") },
  { name: "CI on Gitlabs", status: true, created_at: Time.parse("2024-03-26") },
  { name: "Jenkins Class", status: true, created_at: Time.parse("2024-03-27") },
  { name: "Figma Class", status: true, created_at: Time.parse("2024-03-31") },
  { name: "Create a baseline of running for improvement", status: false, created_at: Time.parse("2024-04-01") }
]

quests.each do |quest_data|
  quest = Quest.create!(quest_data)
  puts "Created quest: #{quest.name} (Status: #{quest.status ? 'Completed' : 'Incomplete'})"
end

puts "Seed completed: Created #{Quest.count} quests"
