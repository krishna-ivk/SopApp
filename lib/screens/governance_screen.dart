import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GovernanceScreen extends StatelessWidget {
  const GovernanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Governance Module')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          // Governance Bodies
          _GovernanceSection(
            icon: Icons.groups,
            color: AppTheme.primaryBlue,
            title: 'Governance Bodies & Committees',
            children: [
              _BodyTile(
                name: 'School Management Committee (SMC)',
                members: 'Principal, Vice Principal, Parent Reps, Teacher Reps, Management Nominee',
                responsibilities: 'Strategic oversight, policy approval, budget sanction, grievance resolution',
              ),
              _BodyTile(
                name: 'Academic Council',
                members: 'Academic Head, Curriculum Lead, Subject Coordinators',
                responsibilities: 'Curriculum alignment, assessment policy, teacher development',
              ),
              _BodyTile(
                name: 'Examination Committee',
                members: 'Exam Cell In-charge, Admin Head, Principal',
                responsibilities: 'Board exam compliance, internal assessment integrity, date sheet management',
              ),
              _BodyTile(
                name: 'Discipline & Welfare Committee',
                members: 'Vice Principal, Counselor, Class Teachers',
                responsibilities: 'Student welfare, anti-bullying, attendance compliance',
              ),
            ],
          ),

          // Decision Rights
          _GovernanceSection(
            icon: Icons.gavel,
            color: AppTheme.accentAmber,
            title: 'Decision Rights & Approval Matrix',
            children: [
              _ApprovalRow(decision: 'Academic calendar changes', approver: 'Principal → SMC'),
              _ApprovalRow(decision: 'Fee structure revision', approver: 'Management → Board'),
              _ApprovalRow(decision: 'Exam schedule changes', approver: 'Exam Committee → Principal'),
              _ApprovalRow(decision: 'Staff hiring / termination', approver: 'Principal → Management'),
              _ApprovalRow(decision: 'Data sharing with third parties', approver: 'Principal → Consent Coordinator → Management'),
              _ApprovalRow(decision: 'Emergency closures', approver: 'Principal (immediate) → SMC (within 24h)'),
            ],
          ),

          // Governance Cadence
          _GovernanceSection(
            icon: Icons.calendar_month,
            color: AppTheme.successGreen,
            title: 'Governance Cadence',
            children: [
              _CadenceCard(frequency: 'Daily', items: 'Attendance tracking, task status, incident reporting'),
              _CadenceCard(frequency: 'Weekly', items: 'Pending actions review, parent communication, teacher feedback'),
              _CadenceCard(frequency: 'Monthly', items: 'SMC review, risk register update, compliance check, data audit'),
              _CadenceCard(frequency: 'Quarterly', items: 'Board registration verification, academic review, escalation audit'),
              _CadenceCard(frequency: 'Annually', items: 'Policy renewal, calendar approval, governance audit, improvement plan'),
            ],
          ),

          // Maker-Checker-Approver
          _GovernanceSection(
            icon: Icons.verified,
            color: AppTheme.primaryDark,
            title: 'Maker-Checker-Approver Control',
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ControlRow(role: 'Maker', description: 'Creates the entry, uploads evidence, initiates the action'),
                      const SizedBox(height: 8),
                      _ControlRow(role: 'Checker', description: 'Verifies accuracy, completeness, and compliance'),
                      const SizedBox(height: 8),
                      _ControlRow(role: 'Approver', description: 'Authorises the action after checker verification'),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppTheme.accentAmber.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline, size: 16, color: AppTheme.accentAmber),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'No single person can both create and approve the same entry. Segregation of duties is mandatory.',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.accentAmber),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Grievance & Escalation
          _GovernanceSection(
            icon: Icons.campaign,
            color: AppTheme.dangerRed,
            title: 'Grievance & Escalation Governance',
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('All grievances must be logged through official channels.', style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      _BulletPoint(text: 'Level 1: Class Teacher / Coordinator (48h resolution)'),
                      _BulletPoint(text: 'Level 2: Vice Principal / Admin Head (72h resolution)'),
                      _BulletPoint(text: 'Level 3: Principal (5 working days)'),
                      _BulletPoint(text: 'Level 4: SMC / Management (10 working days)'),
                      _BulletPoint(text: 'Level 5: CBSE / External authority (as per regulation)'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Audit Procedure
          _GovernanceSection(
            icon: Icons.fact_check_outlined,
            color: const Color(0xFF6A1B9A),
            title: 'Audit Procedure',
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _BulletPoint(text: 'Internal audit conducted quarterly by Academic Council'),
                      _BulletPoint(text: 'Evidence register reviewed monthly by designated checker'),
                      _BulletPoint(text: 'Compliance audit before board exam season (Oct–Nov)'),
                      _BulletPoint(text: 'Annual governance audit by SMC'),
                      _BulletPoint(text: 'Findings documented and tracked to closure'),
                      _BulletPoint(text: 'Non-compliance escalated per severity matrix'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Evidence Register
          _GovernanceSection(
            icon: Icons.folder_special_outlined,
            color: const Color(0xFF00838F),
            title: 'Governance Evidence Register',
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _BulletPoint(text: 'Meeting minutes for all governance body meetings'),
                      _BulletPoint(text: 'Decision logs with maker-checker-approver trail'),
                      _BulletPoint(text: 'Escalation records with resolution timestamps'),
                      _BulletPoint(text: 'Audit reports and corrective action evidence'),
                      _BulletPoint(text: 'Consent records and data privacy compliance proof'),
                      _BulletPoint(text: 'Risk register updates with mitigation evidence'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Success Indicators
          _GovernanceSection(
            icon: Icons.emoji_events_outlined,
            color: AppTheme.successGreen,
            title: 'Success Indicators',
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _BulletPoint(text: '100% governance body meetings held as per cadence'),
                      _BulletPoint(text: 'Zero unapproved actions in maker-checker-approver trail'),
                      _BulletPoint(text: 'All grievances resolved within SLA'),
                      _BulletPoint(text: 'Audit findings closed within agreed timelines'),
                      _BulletPoint(text: 'Evidence register complete and up-to-date'),
                      _BulletPoint(text: 'Risk register reviewed monthly with no stale entries'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─── Section wrapper ─────────────────────────────────────────────────────────

class _GovernanceSection extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final List<Widget> children;

  const _GovernanceSection({
    required this.icon,
    required this.color,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                ),
              ),
            ],
          ),
        ),
        ...children,
      ],
    );
  }
}

// ─── Sub-widgets ─────────────────────────────────────────────────────────────

class _BodyTile extends StatelessWidget {
  final String name;
  final String members;
  final String responsibilities;

  const _BodyTile({
    required this.name,
    required this.members,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 14),
        childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
        title: Text(name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
        children: [
          _InfoRow(label: 'Members', value: members),
          const SizedBox(height: 6),
          _InfoRow(label: 'Responsibilities', value: responsibilities),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: AppTheme.primaryBlue),
          ),
        ),
        Expanded(child: Text(value, style: Theme.of(context).textTheme.bodySmall)),
      ],
    );
  }
}

class _ApprovalRow extends StatelessWidget {
  final String decision;
  final String approver;

  const _ApprovalRow({required this.decision, required this.approver});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(decision, style: Theme.of(context).textTheme.bodyMedium),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                approver,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.accentAmber,
                    ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CadenceCard extends StatelessWidget {
  final String frequency;
  final String items;

  const _CadenceCard({required this.frequency, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.successGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                frequency,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.successGreen,
                    ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(items, style: Theme.of(context).textTheme.bodySmall)),
          ],
        ),
      ),
    );
  }
}

class _ControlRow extends StatelessWidget {
  final String role;
  final String description;

  const _ControlRow({required this.role, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: AppTheme.primaryDark.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            role,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryDark,
                ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(description, style: Theme.of(context).textTheme.bodySmall)),
      ],
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Icon(Icons.circle, size: 5, color: AppTheme.primaryBlue),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: Theme.of(context).textTheme.bodySmall)),
        ],
      ),
    );
  }
}
