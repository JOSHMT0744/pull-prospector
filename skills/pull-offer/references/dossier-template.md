# Prospect dossier template

One file per prospect: `prospects/<company-slug>--<person-slug>.md`.
The frontmatter is the machine-readable record (read by `pull-draft`, `pull-learn`, CRM sync and CSV export).
The body is the **information pack** the user reads.

```markdown
---
prospect: Jane Doe
role: VP Operations
company: Acme Ltd
domain: acme.com
linkedin: https://www.linkedin.com/in/...        # optional, public profile URL only
mode: buyer                                       # buyer | champion
offer: offers/acme-offer.md
project_hypothesis: "Replace manual month-end reconciliation before the Q1 audit"
scores:
  project:      { level: E, evidence: [1, 2] }
  unavoidable:  { level: E, evidence: [3] }
  looking:      { level: I, evidence: [] , reasoning: "Hiring a finance-systems analyst" }
  lacking:      { level: I, tier: L2, fit: yes, evidence: [4] }
gate: draft                                       # draft | nurture | dq
gate_reason: "P and U evidenced; fit yes"
path_to_buyer:                                    # champion mode only
  buyer_named: yes
  buyer: "John Roe, CFO"
  project_matters_to_buyer: I
potential_champions:                              # buyer mode only, light list
  - "Sam Lee, Finance Systems Lead"
sources:
  - { id: 1, url: "https://...", published: 2026-10-02, level: account, note: "Job post names reconciliation automation project" }
status: researched                                # researched | drafted | sent | replied | confirmed | denied | no_reply
variant_sent:                                     # project-led | lacking-led
reply_class:                                      # set by pull-learn
crm: { system: , record_id: , synced_at: }
created: 2026-11-14
updated: 2026-11-14
---

# Jane Doe — VP Operations, Acme Ltd

## PULL scorecard
| | Level | Evidence |
|---|---|---|
| Project | E | [1][2] … |
| Unavoidable | E | [3] … |
| Looking | I | reasoning … |
| Lacking | I · L2 · fit yes | [4] … |

**Gate:** draft. Reason: …

## Their project, in their words
One or two sentences describing the project the way *they* would say it, not the product's language.

## Alternatives they're likely using, and where they fall short
## Path to buyer            (champion mode)
## Possible champions       (buyer mode)
## Discovery questions for a call
## Likely objections
## Champion kit             (champion mode)
## Drafts
### Email — Project-led
### Email — Lacking-led
### LinkedIn DM — Project-led
### LinkedIn DM — Lacking-led

## Sources
[1] Title — URL — published date
```

For `dq` prospects, keep only the frontmatter, the scorecard and the gate reason.
