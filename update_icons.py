import re

with open('resources/js/spa/apps/desktop/components/layout/ApplicationNavbar.vue', 'r') as f:
    content = f.read()

# Revert icons
content = content.replace('name="compass"', 'name="hash-02"')
content = content.replace('name="heart"', 'name="bell-01"')
content = content.replace('name="user"', 'name="user-01"')

with open('resources/js/spa/apps/desktop/components/layout/ApplicationNavbar.vue', 'w') as f:
    f.write(content)
