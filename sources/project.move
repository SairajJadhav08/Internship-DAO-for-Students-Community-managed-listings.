module MyModule::InternshipDAO {

    use std::string;
    use aptos_framework::signer;

    /// Struct representing a student's internship listing
    struct InternshipListing has store, key {
        title: string::String,
        description: string::String,
    }

    /// Function for a student to create an internship listing
    public fun create_listing(student: &signer, title: string::String, description: string::String) {
        let listing = InternshipListing {
            title,
            description,
        };
        move_to(student, listing);
    }

    /// Function to view an internship listing of a specific student
    public fun get_listing(student_addr: address): (string::String, string::String) acquires InternshipListing {
        let listing = borrow_global<InternshipListing>(student_addr);
        (listing.title.clone(), listing.description.clone())
    }
}
