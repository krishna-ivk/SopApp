import 'package:flutter/material.dart';
import '../data/sop_data.dart';
import '../models/sop_models.dart';
import '../theme/app_theme.dart';

class EscalationMatrixScreen extends StatelessWidget {
  const EscalationMatrixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escalation Matrix')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: allSops.length,
        itemBuilder: (context, index) {
          final sop = allSops[index];
          return _EscalationCard(sop: sop);
        },
      ),
    );
  }
}

class _EscalationCard extends StatelessWidget {
  final StakeholderSop sop;
  const _EscalationCard({required this.sop});

  IconData _mapIcon(String name) {
    const map = {
      'school': Icons.school,
      'family_restroom': Icons.family_restroom,
      'person': Icons.person,
      'science': Icons.science,
      'admin_panel_settings': Icons.admin_panel_settings,
      'folder_shared': Icons.folder_shared,
      'how_to_reg': Icons.how_to_reg,
      'menu_book': Icons.menu_book,
      'account_balance': Icons.account_balance,
      'verified_user': Icons.verified_user,
      'smart_toy': Icons.smart_toy,
      'computer': Icons.computer,
      'gavel': Icons.gavel,
    };
    return map[name] ?? Icons.description;
  }

  Color _parseColor(String hex) {
    final hexStr = hex.replaceFirst('#', '');
    return Color(int.parse('FF$hexStr', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _parseColor(sop.colorHex);
    final levels = sop.escalationPath.split(' -> ').map((s) => s.trim()).toList();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(isDark ? 0.2 : 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(_mapIcon(sop.icon.name), color: accentColor, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    sop.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  sop.subtitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: isDark ? Colors.white54 : Colors.black45,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Escalation chain
            Wrap(
              spacing: 4,
              runSpacing: 6,
              children: levels.asMap().entries.map((entry) {
                final isLast = entry.key == levels.length - 1;
                final isFirst = entry.key == 0;
                final levelColor = isFirst
                    ? AppTheme.successGreen
                    : isLast
                        ? AppTheme.dangerRed
                        : AppTheme.accentAmber;

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: levelColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: levelColor.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'L${entry.key + 1}',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: levelColor,
                                ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            entry.value,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: levelColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (!isLast)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Icon(Icons.arrow_forward, size: 14, color: isDark ? Colors.white38 : Colors.black26),
                      ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
