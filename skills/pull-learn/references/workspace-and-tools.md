# Workspace layout and tool detection

## Workspace

Default root: `./pull-workspace/` (ask once if the user prefers another location; remember it for the run).

```
pull-workspace/
  offers/<offer-name>.md                      # from pull-offer
  prospects/<company-slug>--<person-slug>.md  # one dossier per prospect
  runs/<YYYY-MM-DD>-<offer-name>.md           # run summary table (pull-find / pull-draft)
  runs/<YYYY-MM-DD>-learn.md                  # pull-learn rollups
  exports/<YYYY-MM-DD>-<offer-name>.csv       # CSV export when no CRM is connected
```

Slugs: lowercase, hyphens, ASCII only. If a dossier already exists, **update it** and don't create a
duplicate.

### Run summary table columns
`Prospect | Role | Company | Mode | P | U | Look | Lack (tier) | Fit | Gate | Reason / next step | Dossier`

## Tool detection (do this at the start of every run)

Check which tools are actually available in this session, then report in one line what you'll use.

| Capability | How to recognise it | If missing |
|---|---|---|
| Web search | A web search tool | **Degraded mode** (below) |
| Page fetch / browser | Web fetch or a browser tool | Use search snippets only; mark anything not directly read as `I` |
| CRM | Any connected CRM tools (e.g. HubSpot, Salesforce, Zoho CRM, Pipedrive, Attio, Close, Copper) | CSV export to `exports/` |
| Email drafts | A mail tool that can create drafts (e.g. Gmail, Outlook) | Drafts stay in the dossier |

### Degraded mode (no web access)
Say so plainly at the top: *"No web access in this session, so no prospect can reach Evidenced and no
drafts will be produced."* Still produce dossiers for any prospects the user supplied, with everything
marked `I` or `A`, and add a **Manual research tasks** list per prospect (the specific searches a human
should run to verify P and U).

## CRM sync (CRM-agnostic)

1. Look up the contact by work email, else by name + company domain. Look up the company by domain.
2. Build a plan: what will be created (only if missing) and what notes and tags will be added. Show it
   to the user and wait for approval. A batch can be approved once.
3. Write:
   - **Note** on the contact: PULL scorecard (levels, tier, fit), gate + reason, project hypothesis,
     the dossier path, and source URLs.
   - **Tags** (or the closest equivalent, e.g. lists or labels): `pull:draft` | `pull:nurture` | `pull:dq`,
     `pull:mode-buyer` | `pull:mode-champion`, `pull:offer-<offer-name>`. `pull-learn` adds
     `pull:confirmed` | `pull:denied` | `pull:no-reply`.
4. Never overwrite fields, never delete, never create custom fields.
5. Record `crm.system`, `crm.record_id` and `crm.synced_at` in the dossier frontmatter.

If the CRM lacks tags, put them on the first line of the note as `Tags: …`.

## CSV export columns
`prospect,role,company,domain,mode,offer,project_hypothesis,P,U,looking,lacking_level,lacking_tier,fit,gate,gate_reason,status,variant_sent,reply_class,dossier_path`
