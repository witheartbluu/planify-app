import "package:flutter/material.dart";

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 238).withOpacity(.5),
        borderRadius: BorderRadius.circular(18.0), // Apply border radius
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
          const SizedBox(width: 10.0), // Add spacing between icons and text field
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Find Event Organizer ...",
                hintStyle: TextStyle(color: Color.fromARGB(255, 101, 101, 101)),
                border: InputBorder.none, // Remove border for a cleaner look
              ),
            ),
          ),
          const Icon(
            Icons.sort,
            color: Colors.grey,
            size: 26,
          ),
        ],
      ),
    );
  }
}
