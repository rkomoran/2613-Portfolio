class Student:
    def __init__(self, name, studentID):
        self.name = name
        self.studentID = studentID

class Node:
    # student is null unless specified
    def __init__(self, student=None):
        self.student = student
        # initally, these nodes will not be linked
        self.next = None
        self.prev = None

class DoublyLinked:

    # will keep track of this number outside
    current_students = 0;

    def __init__(self):
        # no elements in list yet
        self.head = None
        self.tail = None

    def num_students(self):
        return self.current_students

    def add_student(self, student):

        newNode = Node(student)
        # current will now point to the current node in the list
        current = self.head

        # if the list is currently empty
        if self.head is None and self.tail is None:
            self.head = newNode
            self.tail = newNode
            self.current_students += 1

        # check if this new student id is in order
        else:          
            # front of list
            if (current.student.studentID > newNode.student.studentID):
                newNode.next = current
                current.prev = newNode
                self.head = newNode
                self.current_students += 1
            
            # end of list
            elif(current.student.studentID < newNode.student.studentID):
                self.tail.next = newNode
                newNode.prev = self.tail
                self.tail = newNode
                self.current_students += 1
            else:
            # *** might be an issue here not checking current.next first
                while current is not None and current.student.studentID < newNode.student.studentID:
                    # update position of current -- stops when ID is out of order
                    current = current.next

                # middle of list
                if current is not None and current.prev is not None:
                    newNode.next = current
                    newNode.prev = current.prev
                    current.prev.next = newNode
                    current.prev = newNode
                    self.current_students += 1

    def remove_student(self, studentID):
        # current will now point to the current node in the list
        current = self.head

        if self.head is None and self.tail is None:
            return False
        
        while current is not None and current.student.studentID != studentID:
            # keep looping to find where studentID is equal
            current = current.next

        # student was not found
        if current is None:
            return False
        
        # removing first 
        if current.prev is None:
            # check if it is the only student in list
            # check if objects are the same
            if self.head == self.tail:
                self.head = None
                self.tail = None
            else:
                self.head = current.next
                self.tail = None
        
        # removing last
        elif current.next is None:
            self.tail = current.prev
            self.tail.next = None
        
        # remove from middle
        else:
            current.prev.next = current.next
            current.next.prev = current.prev
        
        self.current_students -= 1
        return True

    def print_ascend(self):
        students = ""
        current = self.head

        while current is not None:
            students += f"{current.student.name}\t{current.student.studentID}\n"
            current = current.next

        return students
    
    def print_descend(self):
        students = ""
        current = self.tail

        while current is not None:
            students += f"{current.student.name}\t{current.student.studentID}\n"
            current = current.prev

        return students

# driver

print("Enter class name and max number of students separated by the ENTER key")
class_name = input()
max_students = int(input())

class_list = DoublyLinked()

message = (f"Please make a selection for the course {class_name}\n"
           + "1:\t Add Student\n2:\t Remove Student\n3:\t Print Number of Students\n"
           + "4:\t Class List in Ascending Order\n5:\t Class List in Descending Order\n0:\t Exit Program")
print(message)

while True:

    user_choice = input()

    if user_choice == "1":
        if class_list.num_students() < max_students:
            print("To add: Input student name and student number (separated by ENTER key)")
            name = input()
            student_id = int(input())
            student = Student(name, student_id)
            class_list.add_student(student)
            print("Added successfully")
        else:
            print(f"ERROR: Class is full\nSize of class is {max_students}, you currently have {class_list.num_students()} students.")
    elif user_choice == "2":
        print("To remove: Input student's unique id")
        student_id = int(input())
        if class_list.remove_student(student_id):
            print("Student successfully removed")
        else:
            print("Student ID is not in list")
    elif user_choice == "3":
        print(f"Number of students in the class: {class_list.num_students()}")
    elif user_choice == "4":
        print(class_list.print_ascend())
    elif user_choice == "5":
        print(class_list.print_descend())
    elif user_choice == "0":
        break
    else:
        print(message)
