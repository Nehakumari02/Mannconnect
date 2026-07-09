import re

with open('resources/js/spa/apps/desktop/components/layout/ApplicationNavbar.vue', 'r') as f:
    content = f.read()

# Replace text-[19px] with text-[16px]
content = content.replace('text-[19px]', 'text-[16px]')
# Change gap-3 to gap-1
content = content.replace('flex flex-col gap-3', 'flex flex-col gap-1')
# Change hash-02 to compass
content = content.replace('hash-02', 'compass')
# Change bell-01 to heart
content = content.replace('bell-01', 'heart')

with open('resources/js/spa/apps/desktop/components/layout/ApplicationNavbar.vue', 'w') as f:
    f.write(content)
print("Updated ApplicationNavbar.vue")
