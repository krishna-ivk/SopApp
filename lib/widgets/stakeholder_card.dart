import 'package:flutter/material.dart';
import '../models/sop_models.dart';
import '../theme/app_theme.dart';

class StakeholderCard extends StatelessWidget {
  final StakeholderSop sop;
  final VoidCallback onTap;

  const StakeholderCard({
    super.key,
    required this.sop,
    required this.onTap,
  });

  IconData _mapIcon(String name) {
    switch (name) {
      case 'school':
        return Icons.school;
      case 'family_restroom':
        return Icons.family_restroom;
      case 'person':
        return Icons.person;
      case 'science':
        return Icons.science;
      case 'admin_panel_settings':
        return Icons.admin_panel_settings;
      case 'folder_shared':
        return Icons.folder_shared;
      case 'how_to_reg':
        return Icons.how_to_reg;
      case 'menu_book':
        return Icons.menu_book;
      case 'account_balance':
        return Icons.account_balance;
      case 'verified_user':
        return Icons.verified_user;
      case 'smart_toy':
        return Icons.smart_toy;
      case 'computer':
        return Icons.computer;
      case 'gavel':
        return Icons.gavel;
      default:
        return Icons.description;
    }
  }

  Color _parseColor(String hex) {
    final hexStr = hex.replaceFirst('#', '');
    return Color(int.parse('FF$hexStr', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _parseColor(sop.colorHex);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(isDark ? 0.2 : 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _mapIcon(sop.icon.name),
                      color: accentColor,
                      size: 22,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right,
                    color: isDark ? Colors.white38 : Colors.black26,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                sop.title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                sop.subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark ? Colors.white54 : Colors.black45,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
