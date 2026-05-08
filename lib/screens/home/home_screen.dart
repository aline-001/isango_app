import 'package:flutter/material.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_radii.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';
import 'package:isango_app/widgets/isango_bottom_navigation.dart';

class Event {
  final String id;
  final String title;
  final String organization;
  final String date;
  final String time;
  final String location;
  final String imageUrl;
  final String category;
  final bool isFeatured;
  bool isSaved;

  Event({
    required this.id,
    required this.title,
    required this.organization,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.category,
    this.isFeatured = false,
    this.isSaved = false,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Event> events = [
    Event(
      id: '1',
      title: 'Annual Tech Symposium',
      organization: 'Academic',
      date: 'Oct 15',
      time: '2:00 PM - 5:00 PM',
      location: 'Main Hall, North Campus',
      imageUrl: '',
      category: 'Academic',
      isFeatured: true,
      isSaved: false,
    ),
    Event(
      id: '2',
      title: 'Student Union Leadership Summit 2024',
      organization: 'Student Union',
      date: 'Oct 15',
      time: '10:00 AM',
      location: 'Student Center',
      imageUrl: '',
      category: 'Leadership',
      isSaved: false,
    ),
    Event(
      id: '3',
      title: 'Fall Semester Career & Internship Fair',
      organization: 'Career Services',
      date: 'Oct 18',
      time: '9:00 AM',
      location: 'Athletic Complex',
      imageUrl: '',
      category: 'Career',
      isSaved: false,
    ),
  ];

  final List<String> categories = [
    'Academic',
    'Career',
    'Sports',
    'Social',
  ];

  String selectedCategory = 'Academic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Isango',
          style: AppTextStyles.headline,
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Navigate to search
            },
          ),
        ],
      ),
      bottomNavigationBar: const IsangoBottomNavigation(currentIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Event Section
            Padding(
              padding: const EdgeInsets.all(AppSpacing.page),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.logisticsNavy,
                          AppColors.commandBlue,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(AppRadii.card),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Featured Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.xxs,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.safetyOrange,
                            borderRadius: BorderRadius.circular(AppRadii.chip),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              Text(
                                'Featured',
                                style: AppTextStyles.label.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        // Event Title
                        Text(
                          events[0].title,
                          style: AppTextStyles.headline.copyWith(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        // Time
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(
                              events[0].time,
                              style: AppTextStyles.body.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        // Location
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Text(
                                events[0].location,
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        // Register Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.safetyOrange,
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.md,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppRadii.button),
                              ),
                            ),
                            onPressed: () {
                              // TODO: Handle registration
                            },
                            child: Text(
                              'Register Now',
                              style: AppTextStyles.title.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  // Category Filter
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        final isSelected = selectedCategory == category;
                        return Padding(
                          padding: const EdgeInsets.only(right: AppSpacing.md),
                          child: FilterChip(
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  selectedCategory = category;
                                }
                              });
                            },
                            label: Text(category),
                            backgroundColor: Colors.transparent,
                            side: BorderSide(
                              color: isSelected
                                  ? AppColors.logisticsNavy
                                  : AppColors.softBorder,
                            ),
                            labelStyle: AppTextStyles.body.copyWith(
                              color: isSelected
                                  ? AppColors.logisticsNavy
                                  : AppColors.mutedOperationalInk,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Upcoming Events Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.page,
                vertical: AppSpacing.md,
              ),
              child: Text(
                'Upcoming Events',
                style: AppTextStyles.headline,
              ),
            ),
            // Events List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
              child: Column(
                children: events.sublist(1).map((event) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Navigate to event detail
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.cardWhite,
                          borderRadius: BorderRadius.circular(AppRadii.card),
                          border: Border.all(color: AppColors.softBorder),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Event Image
                            Container(
                              width: double.infinity,
                              height: 200,
                              color: AppColors.paleSignalBlue,
                              child: const Icon(
                                Icons.image_outlined,
                                size: 40,
                                color: AppColors.logisticsNavy,
                              ),
                            ),
                            // Event Details
                            Padding(
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Event Title
                                  Text(
                                    event.title,
                                    style: AppTextStyles.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: AppSpacing.sm),
                                  // Organization
                                  Text(
                                    event.organization,
                                    style: AppTextStyles.bodyMuted,
                                  ),
                                  const SizedBox(height: AppSpacing.md),
                                  // Date and Location
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 18,
                                        color: AppColors.mutedOperationalInk,
                                      ),
                                      const SizedBox(width: AppSpacing.xs),
                                      Text(
                                        event.date,
                                        style: AppTextStyles.bodyMuted,
                                      ),
                                      const SizedBox(width: AppSpacing.md),
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 18,
                                        color: AppColors.mutedOperationalInk,
                                      ),
                                      const SizedBox(width: AppSpacing.xs),
                                      Expanded(
                                        child: Text(
                                          event.location,
                                          style: AppTextStyles.bodyMuted,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: AppSpacing.page),
          ],
        ),
      ),
    );
  }
}
