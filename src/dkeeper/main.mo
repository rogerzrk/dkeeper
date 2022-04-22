import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeeper {

  // Create a public type of data called Note
 public type Note = {
   title: Text;
   content: Text;
 };

  // Create a List to store your notes as note data type
  stable var notes: List.List<Note> = List.nil<Note>();

  // function to create a new note and add it to list of notes
  public func createNote(titleText: Text, contentText: Text){

    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));
  };

  // To read list of notes from the cannister and return an array
  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(id: Nat){
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id+1);
    notes := List.append(listFront, listBack);
  };
};
