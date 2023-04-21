# Seattle Grace

This repository requires and has been tested on Ruby v2.7.4 and is based on Rails 5.2.8.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`

When you run `bundle exec rspec` you should have 2 passing tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork **once the time is up (not before!)**

## Submission

**Once the time for the assessment is up**, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Description
Seattle Grace is based off of Grey’s Anatomy, but you need NO knowledge of Grey’s Anatomy to complete this final. Make sure to read all instructions and user stories before getting started.
​
## Database Information
* Hospitals have a name
* Doctors have a name, specialty, and university that they attended
* Patients have a name and age
* Hospitals have many Doctors
* Doctors work for just one hospital
* Doctors can have many patients
* Patients can have many doctors

Some of the initial model set up and testing has been done for you.

## User Stories

```
User Story 1, Doctors Show Page
​
As a visitor
When I visit a doctor's show page
I see all of that doctor's information including:
 - name
 - specialty
 - university where they got their doctorate
And I see the name of the hospital where this doctor works
And I see the names of all of the patients this doctor has
```
​
```
User Story 2, Remove a Patient from a Doctor
​
As a visitor
When I visit a Doctor's show page
Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
When I click that button for one patient
I'm brought back to the Doctor's show page
And I no longer see that patient's name listed
And when I visit a different doctor's show page that is caring for the same patient,
Then I see that the patient is still on the other doctor's caseload
```

```
User Story 3, Patient Index Page
​
As a visitor
When I visit the patient index page
I see the names of all adult patients (age is greater than 18),
And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)
```
​
## Extensions


```
Extension, Hospital Show Page
​
As a visitor
When I visit a hospital's show page
I see the hospital's name
And I see the names of all doctors that work at this hospital,
And next to each doctor I see the number of patients associated with the doctor,
And I see the list of doctors is ordered from most number of patients to least number of patients
(Doctor patient counts should be a single query)
```

## Data you can use:

#### Doctors

Name: Meredith Grey, Specialty: General Surgery, Education: Harvard University

Name: Alex Karev, Specialty: Pediatric Surgery, Education: Johns Hopkins University

Name: Miranda Bailey, Specialty: General Surgery, Education: Stanford University

Name: Derek McDreamy Shepherd, Specialty: Attending Surgeon, Education: University of Pennsylvania

#### Hospitals

Name: Grey Sloan Memorial Hospital

Name: Seaside Health & Wellness Center

#### Patients

Name: Katie Bryce, Age: 24

Name: Denny Duquette, Age: 39

Name: Rebecca Pope, Age: 32

Name: Zola Shepherd, Age: 2
