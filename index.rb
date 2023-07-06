require 'novu'

client = Novu::Client.new('MY_API_TOKEN')

puts client.notifications

# create a subscriber
create_payload = {
    'subscriberId' => '7789', # replace with system_internal_user_id
    'firstName' => 'John', # optional
    'lastName' => 'Doe', # optional
}
client.create_subscriber(create_payload)

# Update subscriber detail
update_payload = {
    'email' => 'validemail@gmail.com',  # replace with valid email
    'firstName' => '<insert-firstname>', # optional
    'lastName' => 'Obasanjo', # optional
}
client.update_subscriber('7789', update_payload);

# trigger a notification
trigger_payload = {
    'name' => 'Trigger1',
    'payload' => {
        'first-name' => 'Adam'
    },
    'to' => {
        'subscriberId' => '7789'
    }
}
client.trigger_event(trigger_payload)

create_topic_payload = {
    'key'  => 'frontend-users',
    'name' => 'All frontend users'
}
client.create_topic(create_topic_payload)

topicKey = 'frontend-users';
subscribers = ['6460925ce1a93324257d2fc1', '7789'].to_s

# Add subscribers to a topic
client.add_subscribers(topicKey, subscribers)

# Remove subscribers from a topic
client.remove_subscribers(topicKey, subscribers)

# Send notifications to a topic (all frontend users)
client.trigger_event({
    'name' => 'Trigger1',
    'to' => {
        'type' => 'Topic',
        'topicKey' => 'frontend-users'
    }
})
