import 'package:flutter/material.dart';
import 'package:promptix_ai_flutter/core/utils/app_colors.dart';
import 'package:promptix_ai_flutter/core/utils/helper_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark
          ? AppColors.darkPrimary
          : AppColors.primaryColor,
      appBar: AppBar(
        leadingWidth: 64,
        // important for spacing
        leading: Padding(
          padding: const EdgeInsets.only(left: 8), // your padding
          child: Builder(
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  color: context.isDark
                      ? AppColors.darkSecondary
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(50), // smooth corners
                  border: Border.all(
                    color: context.isDark ? Colors.grey : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    color: context.isDark ? Colors.white : Colors.black,
                    size: 22,
                  ),
                ),
              );
            },
          ),
        ),
        backgroundColor: context.isDark
            ? AppColors.darkPrimary
            : AppColors.primaryColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                color: context.isDark
                    ? AppColors.darkSecondary
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(50), // smooth corners
                border: Border.all(
                  color: context.isDark ? Colors.grey : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // context.read<GptBloc>().add(
                      //   CreateConversationEvent(),
                      // );
                    },
                    icon: Icon(Icons.add),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    onPressed: () {
                      // showSettingsBottomSheet(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(child: Center(child: Text('Hello '))),
      drawer: _buildDrawer(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      backgroundColor: isDark ? AppColors.darkPrimary : AppColors.primaryColor,
      child: SafeArea(
        child: Column(
          children: [
            // NEW CHAT BUTTON
            ListTile(
              trailing: IconButton(
                onPressed: () {
                  // context.read<GptBloc>().add(CreateConversationEvent());
                  Navigator.pop(context);
                },

                icon: Icon(Icons.add),
              ),
              title: const Text(
                'InPrompt AI',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //conversation list
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  // final c = state.conversations[index];
                  return GestureDetector(
                    onLongPressStart: (details) {
                      // showContextMenuAtPosition(
                      //   context,
                      //   details.globalPosition,
                      //   index,
                      // );
                    },
                    child: ListTile(
                      title: Text(
                        'hello',
                        // c.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.darkPrimary,
                        ),
                      ),
                      // selected: index == state.selectedConversationIndex,
                      selectedTileColor: Colors.grey.withOpacity(0.1),

                      onTap: () {
                        // context.read<GptBloc>().add(
                        //   SelectConversationEvent(index),
                        // );
                        Navigator.pop(context);
                      },

                      // trailing: IconButton(
                      //   icon: Icon(
                      //     Icons.delete,
                      //     size: 20,
                      //     color: isDark
                      //         ? AppColors.whiteColor
                      //         : AppColors.darkPrimary,
                      //   ),
                      //   onPressed: () {
                      //     context.read<GptBloc>().add(
                      //       DeleteConversationEvent(index),
                      //     );
                      //   },
                      // ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            //login/logout button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? AppColors.primaryColor
                        : AppColors.darkSecondary,
                    foregroundColor: isDark
                        ? AppColors.darkPrimary
                        : Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    // if (authStates is AuthenticatedState) {
                    //   // LOGOUT
                    //   context.read<AuthBloc>().add(LogoutEvent());
                    //
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text("Logged out successfully")),
                    //   );
                    //
                    //   // Reload state
                    //   context.read<GptBloc>().add(LoadInitialDataEvent());
                    // } else {
                    //   // LOGIN (open mobile input sheet)
                    //   showMobileNumberSheet(context);
                    // }
                  },
                  child: Text(
                    'login',
                    // authStates is AuthenticatedState ? 'Logout' : 'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
