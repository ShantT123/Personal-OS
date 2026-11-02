---
type: crm-contact
name: ""
company: ""
role: ""
role_type: ""        # e.g. colleague / client / advisor / vendor / friend / other
phone: ""
email: ""
tier: 2              # 1 = key relationship, 2 = regular, 3 = occasional
source: ""           # Referral / Network / Event / Inbound
first_contacted: YYYY-MM-DD
last_contacted: YYYY-MM-DD
next_action: ""
next_action_date: YYYY-MM-DD
status: active       # active / warm / cold
tags: []
touches:
  - date: YYYY-MM-DD
    type: meeting    # meeting / call / email / message / event
    channel: ""
    content: ""
    outcome: ""
    notes: ""
---

# [Contact Name] — [Company]

## Context
- **How we met:**
- **What they're working on:**
- **Why this relationship matters:**

## Notes
[Running notes. Meeting notes live in `ops/tracking/crm/communications/` and are linked from `touches`.]
