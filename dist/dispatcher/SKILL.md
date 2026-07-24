---
name: management-consulting
description: "Consulting engagement lifecycle in one skill: strategy and framework analysis, financial modeling, proposals and pricing, implementation planning, due diligence, change management, governance, and client deliverables. Use for any management-consulting task, then load the matching reference file below."
license: MIT
metadata:
  category: consulting-lifecycle
  version: "2.1.0"
  author: Anot
---

# Management Consulting

Skills for the full consulting engagement lifecycle, from problem structuring through implementation and close-out.

---

## Reference Guide

When the user's request matches a topic below, read the corresponding reference file and follow its instructions.

| Topic | Reference File | When to Load |
|---|---|---|
| Strategic Analysis | `references/strategic-analysis.md` | Issue trees, hypothesis development, framework application (Five Forces, PESTLE, 7S, VRIO), cross-framework synthesis, competitive positioning |
| Financial Modeling | `references/financial-modeling.md` | Business cases, ROI/NPV/IRR, scenario analysis, cost-benefit, TCO, sensitivity analysis, break-even |
| Proposal Development | `references/proposal-development.md` | RFP analysis, proposal writing, SOW creation, pitch decks, value propositions, oral defense |
| Engagement Setup | `references/engagement-setup.md` | Kickoff design, discovery planning, stakeholder mapping, standing up workstreams, the first two weeks |
| Engagement Pricing | `references/engagement-pricing.md` | Fee structures (fixed, T&M, value-based, retainer), rate cards, engagement economics, commercial terms |
| Implementation Planning | `references/implementation-planning.md` | Options evaluation, business cases, roadmaps, phased plans, workstreams, dependencies, program recovery |
| Due Diligence | `references/due-diligence.md` | Commercial, operational, financial, strategic, and technology DD, integration planning, synergy quantification |
| Change Management | `references/change-management.md` | Transition planning, stakeholder engagement, resistance management, communication strategy, adoption measurement |
| Process Excellence | `references/process-excellence.md` | DMAIC, value stream mapping, root cause analysis, process mining, control plans, waste identification |
| Org Design | `references/org-design.md` | Operating models, structure design, role frameworks, spans of control, transition planning |
| Project Governance | `references/project-governance.md` | Steering committees, stage gates, RACI, decision rights, risk registers, status reporting (RAG) |
| Client Deliverables | `references/client-deliverables.md` | Reports, executive presentations, storylining, slide design, board decks, PE IC memos |
| Workshop Facilitation | `references/workshop-facilitation.md` | Strategy offsites, design thinking sessions, innovation sprints, facilitation guides, participant dynamics |
| Thought Leadership | `references/thought-leadership.md` | POVs, white papers, case studies, industry briefs, thesis development |
| Project Closeout | `references/project-closeout.md` | Deliverable handover, knowledge transfer, lessons learned, benefits tracking, transition to BAU |

For PPTX slide generation with pptxgenjs, also load `references/pptx-generation.md`.

Multiple references can be loaded when the request spans topics (e.g., a due diligence engagement needs `due-diligence.md` + `financial-modeling.md` + `client-deliverables.md`).

---

## Writing Style

Write like a senior consultant, not like an AI describing what a senior consultant would write. Apply these to every deliverable this skill produces.

- No em-dashes (the `—` character). Use parentheses, periods, or colons instead. This is the most common AI tell.
- Vary sentence length. Short sentences land points. Longer ones carry nuance.
- State opinions directly. "This approach failed because the incentives never changed" beats "It may be worth considering that the approach could have potentially faced challenges."
- No "not just X, but Y" constructions. Say what it is.
- Quantify when possible. "Revenue dropped 12%" beats "revenue experienced a significant decline."
- When uncertain, say so plainly: "We don't have enough data to call this yet."
- Go deep where insight lives, light where routine. Not every section deserves equal airtime.
- Cut AI filler: "it's worth noting," "it should be mentioned," "let's delve into," "in today's rapidly evolving," "navigating the," "when it comes to."

## Depth Calibration

Prioritize depth on the 2-3 sections where the real insight lives. Go deep there and sketch the rest. Equal airtime across every section signals no point of view about what mattered. When presenting risk scores, timeline estimates, or probability assessments without underlying data, label them as directional estimates.

## Content Integrity

- Ask for information rather than fabricating it. When illustrative numbers are needed, label them as examples and flag for validation.
- Present benchmarks as illustrative, not authoritative. Note the source and the context that makes them comparable.
- Never fabricate engagement experience or specific dollar figures. Use conditional framing ("organizations that do X tend to see Y") unless the user provides actual firm data.
