import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/sop_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/stakeholder_card.dart';
import '../widgets/section_header.dart';
import 'sop_detail_screen.dart';
import 'checklist_screen.dart';
import 'governance_screen.dart';
import 'risk_register_screen.dart';
import 'escalation_matrix_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _showSearch = false;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _HomeTab(
            showSearch: _showSearch,
            searchController: _searchController,
            onSearchToggle: () {
              setState(() {
                _showSearch = !_showSearch;
                if (!_showSearch) {
                  _searchController.clear();
                  context.read<SopProvider>().setSearchQuery('');
                }
              });
            },
          ),
          const _StakeholdersTab(),
          const ChecklistScreen(),
          const _MoreTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.people_outline), selectedIcon: Icon(Icons.people), label: 'Stakeholders'),
          NavigationDestination(icon: Icon(Icons.checklist_outlined), selectedIcon: Icon(Icons.checklist), label: 'Checklist'),
          NavigationDestination(icon: Icon(Icons.more_horiz_outlined), selectedIcon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

// ─── Home Tab ────────────────────────────────────────────────────────────────

class _HomeTab extends StatelessWidget {
  final bool showSearch;
  final TextEditingController searchController;
  final VoidCallback onSearchToggle;

  const _HomeTab({
    required this.showSearch,
    required this.searchController,
    required this.onSearchToggle,
  });

  @override
  Widget build(BuildContext context) {
    final sops = context.watch<SopProvider>().filteredSops;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Skola CBSE SOP'),
          floating: true,
          pinned: true,
          actions: [
            IconButton(
              icon: Icon(showSearch ? Icons.close : Icons.search),
              onPressed: onSearchToggle,
            ),
          ],
          bottom: showSearch
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: TextField(
                      controller: searchController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search SOPs…',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (q) => context.read<SopProvider>().setSearchQuery(q),
                    ),
                  ),
                )
              : null,
        ),

        // Operating model header card
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Card(
              color: AppTheme.primaryBlue.withOpacity(0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: AppTheme.primaryBlue.withOpacity(0.2)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'English Governance Edition 2025',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.primaryBlue,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        'Calendar', 'Owner', 'Action', 'Evidence', 'Review',
                        'Escalation', 'Closure', 'Improvement',
                      ].map((step) {
                        final isLast = step == 'Improvement';
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Chip(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppTheme.primaryBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                              label: Text(step),
                              padding: EdgeInsets.zero,
                            ),
                            if (!isLast)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Icon(Icons.arrow_forward, size: 12, color: AppTheme.primaryBlue.withOpacity(0.5)),
                              ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Stakeholder SOPs section
        SliverToBoxAdapter(child: SectionHeader(title: 'Stakeholder SOPs')),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.05,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final sop = sops[index];
                return StakeholderCard(
                  sop: sop,
                  onTap: () => _navigateToDetail(context, sop.id),
                );
              },
              childCount: sops.length,
            ),
          ),
        ),

        // Governance section
        SliverToBoxAdapter(child: SectionHeader(title: 'Governance')),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _GovernanceCard(
                icon: Icons.account_balance,
                title: 'Governance Module',
                subtitle: 'Bodies, cadence & controls',
                color: AppTheme.primaryBlue,
                onTap: () => _navigate(context, const GovernanceScreen()),
              ),
              _GovernanceCard(
                icon: Icons.warning_amber_rounded,
                title: 'Risk Register',
                subtitle: 'Track & manage risks',
                color: AppTheme.warningOrange,
                onTap: () => _navigate(context, const RiskRegisterScreen()),
              ),
              _GovernanceCard(
                icon: Icons.swap_vert,
                title: 'Escalation Matrix',
                subtitle: 'Master escalation paths',
                color: AppTheme.dangerRed,
                onTap: () => _navigate(context, const EscalationMatrixScreen()),
              ),
            ]),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }

  void _navigateToDetail(BuildContext context, String sopId) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SopDetailScreen(sopId: sopId)),
    );
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}

// ─── Stakeholders Tab ────────────────────────────────────────────────────────

class _StakeholdersTab extends StatelessWidget {
  const _StakeholdersTab();

  @override
  Widget build(BuildContext context) {
    final sops = context.watch<SopProvider>().filteredSops;
    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text('All Stakeholders'), floating: true),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final sop = sops[index];
                return StakeholderCard(
                  sop: sop,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SopDetailScreen(sopId: sop.id)),
                  ),
                );
              },
              childCount: sops.length,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── More Tab ────────────────────────────────────────────────────────────────

class _MoreTab extends StatelessWidget {
  const _MoreTab();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text('More'), floating: true),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'Governance',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryBlue,
                  ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _MoreTile(
            icon: Icons.account_balance,
            title: 'Governance Module',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GovernanceScreen())),
          ),
        ),
        SliverToBoxAdapter(
          child: _MoreTile(
            icon: Icons.warning_amber_rounded,
            title: 'Risk Register',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RiskRegisterScreen())),
          ),
        ),
        SliverToBoxAdapter(
          child: _MoreTile(
            icon: Icons.swap_vert,
            title: 'Escalation Matrix',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EscalationMatrixScreen())),
          ),
        ),
        SliverToBoxAdapter(
          child: _MoreTile(
            icon: Icons.checklist,
            title: 'Checklist Tracker',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ChecklistScreen())),
          ),
        ),
        const SliverToBoxAdapter(
          child: Divider(indent: 16, endIndent: 16, height: 32),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'About',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryBlue,
                  ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skola CBSE SOP Stakeholder App',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'English Governance Edition 2025\n13 Stakeholder SOPs · Calendar-Driven · Evidence-Based',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white54 : Colors.black54,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

// ─── Reusable helpers ────────────────────────────────────────────────────────

class _GovernanceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _GovernanceCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(isDark ? 0.2 : 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: isDark ? Colors.white54 : Colors.black45)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: isDark ? Colors.white38 : Colors.black26),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoreTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MoreTile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryBlue),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
