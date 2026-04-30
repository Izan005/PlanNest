import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/added_member_item/added_member_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_members_card_widget.dart' show AddMembersCardWidget;
import 'package:flutter/material.dart';

class AddMembersCardModel extends FlutterFlowModel<AddMembersCardWidget> {
  ///  Local state fields for this component.

  List<UserStruct> addedMembers = [];
  void addToAddedMembers(UserStruct item) => addedMembers.add(item);
  void removeFromAddedMembers(UserStruct item) => addedMembers.remove(item);
  void removeAtIndexFromAddedMembers(int index) => addedMembers.removeAt(index);
  void insertAtIndexInAddedMembers(int index, UserStruct item) =>
      addedMembers.insert(index, item);
  void updateAddedMembersAtIndex(int index, Function(UserStruct) updateFn) =>
      addedMembers[index] = updateFn(addedMembers[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getInvitedUsers] action in AddMembersCard widget.
  List<UserRow>? invitedUsersDb;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for AddedMemberItem dynamic component.
  late FlutterFlowDynamicModels<AddedMemberItemModel> addedMemberItemModels;

  @override
  void initState(BuildContext context) {
    addedMemberItemModels =
        FlutterFlowDynamicModels(() => AddedMemberItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    addedMemberItemModels.dispose();
  }
}
