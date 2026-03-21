# Management Consulting Plugin

Skills for the full consulting engagement lifecycle, from problem structuring through implementation and close-out.

> Built on the [Agent Skills](https://agentskills.io) open standard. Works with Claude Code, Cowork, Codex, Gemini CLI, and [other compatible agents](https://agentskills.io).

Part of [unsol.dev](https://unsol.dev)

## Why this exists

The mechanics of consulting follow the same patterns every engagement. Scoping, stakeholder alignment, analysis, strategy, delivery, commercials. This plugin encodes that harness so you can focus on the parts that actually require judgment.

## Skills

| Skill | What it covers |
|---|---|
| `strategic-analysis` | Problem structuring, hypothesis development, framework application, cross-framework synthesis |
| `financial-modeling` | Business cases, cost-benefit analysis, ROI/NPV/IRR, sensitivity analysis, scenario modeling |
| `proposal-development` | RFP analysis, proposal writing, SOW creation, pitch decks, oral defense |
| `engagement-setup` | Kickoff design, discovery planning, stakeholder mapping, the first two weeks |
| `engagement-pricing` | Fee structures, rate cards, engagement economics, procurement navigation |
| `implementation-planning` | Phased plans, workstreams, business cases, program recovery |
| `due-diligence` | Commercial, operational, financial, strategic, and technology assessment, integration planning |
| `change-management` | Transition planning, resistance management, adoption measurement |
| `process-excellence` | DMAIC, value stream mapping, root cause analysis, control plans |
| `org-design` | Operating models, structure design, role frameworks, transition planning |
| `project-governance` | Steering committees, stage gates, RACI, risk management, status reporting |
| `client-deliverables` | Presentations, reports, storylining, slide design, PPTX generation patterns |
| `workshop-facilitation` | Strategy workshops, facilitation design, participant dynamics |
| `thought-leadership` | POVs, white papers, case studies, thesis development |
| `project-closeout` | Handover, knowledge transfer, lessons learned, benefits tracking |

## Install

### Claude Desktop

Download [`dist/management-consulting.skill`](dist/management-consulting.skill), then in Claude go to Customize (left nav) > Skills > `+` > Upload a skill. Requires "Code execution and file creation" enabled in Settings > Capabilities.

### Claude Code

```bash
claude plugin marketplace add anotb/management-consulting-plugin
claude plugin install management-consulting@anotb-management-consulting-plugin
```

### Cowork

Download the repo as a ZIP, then in Cowork go to Customize > Browse plugins > click `+` and upload. (Organization admins can sync directly from GitHub via Settings > Plugins > Add plugin.)

### Codex

```bash
$skill-installer install https://github.com/anotb/management-consulting-plugin
```

### Gemini CLI

```bash
gemini skills install https://github.com/anotb/management-consulting-plugin.git
```

### Other agents

Clone into `.agents/skills/` (the cross-platform standard) or the agent's native skills directory.

## Heads up

This plugin produces structured consulting outputs. Everything should be reviewed by someone who knows the client context before it goes near a client.

## License

[MIT](LICENSE)
