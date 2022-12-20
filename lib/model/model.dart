class Quiz{
   const Quiz(this.questions,this.answer);

   final String  questions;
   final bool answer;
}

const q1 = Quiz('There are 7 regions in Kyrgyzstan.', true);
const q2 = Quiz('There are 43 states in USA.', false);
const q3 = Quiz('Shanghai capital of China.',false);
const q4 = Quiz('Canadians speak french.',true);
const q5 = Quiz('Mothers is the most precious people in the world.',true);
const q6 = Quiz('Face to face written by Chyngyz Aitmatov.',true);
const q7 = Quiz('Eiffel tower is located in Berlin.',false);
const q8 = Quiz('The hundred years war lasted 100 years.',false);
const q9 = Quiz('Manass horse name is Akkula.',true);
const q10 = Quiz('Watermelon is a fruit.',false);

const quiz = <Quiz> [q1,q2,q3,q4,q5,q6,q7,q8,q9,q10];