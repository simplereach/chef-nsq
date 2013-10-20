ohai "reload_passwd" do
    action :nothing
    plugin "passwd"
end

user "nsqd" do
    action :create
    system true
end

user "nsqlookupd" do
    action :create
    system true
end

user "nsqadmin" do
    action :create
    system true
end

ohai "reload_passwd"
