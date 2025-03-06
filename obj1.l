%{
#include <stdio.h>
#include <string.h>

void words(char* word);
%}

%%

[a-zA-Z]+  { words(yytext); }
[.,!?]     { printf("%s - punctuation\n", yytext); }
\n         { return 0; }

%%

void words(char* word) {
    const char *propernouns[] = {"Apple", "India", "Charusat", "DEPSTAR", "CSPIT", "Google",NULL};
    const char *pronouns[] = {"he", "she", "it", "her", "him", "I", "you", "his", "they","He", "She", "It", "Her", "Him", "I", "You", "His", "They", NULL};
    const char *verbs[] = {"run", "walk", "eat", "write", "go", "come", "turn","am", "are", "is", "was", "were","had","have","has", NULL};
    const char *adverbs[] = {"quickly", "slowly", "carefully", "happily", "sadly", NULL};
    const char *adjectives[] = {"big", "small", "light", "bright", "heavy", NULL};
    const char *prepositions[] = {"in", "on", "at", "with", "by", "to","In", "On", "At", "With", "By", "To", NULL};
    const char *conjunctions[] = {"and", "or", "but", "because", "so","And", "Or", "But", "Because", "So", NULL};
    const char *interjections[] = {"wow", "oh", "ouch", "hey", "oops","Wow", "Oh", "Ouch", "Hey", "Oops", NULL};


    for (int i = 0; propernouns[i] != NULL; i++) {
        if (strcmp(word, propernouns[i]) == 0) {
        printf("%s - propernoun\n", word);
            return;
        }
    }

    for (int i = 0; pronouns[i] != NULL; i++) {
        if (strcmp(word, pronouns[i]) == 0) {
            printf("%s - pronoun\n", word);
            return;
        }
    }

    for (int i = 0; verbs[i] != NULL; i++) {
        if (strcmp(word, verbs[i]) == 0) {
            printf("%s - verb\n", word);
            return;
        }
    }

    for (int i = 0; adverbs[i] != NULL; i++) {
        if (strcmp(word, adverbs[i]) == 0) {
            printf("%s - adverb\n", word);
            return;
        }
    }

    for (int i = 0; adjectives[i] != NULL; i++) {
        if (strcmp(word, adjectives[i]) == 0) {
            printf("%s - adjective\n", word);
            return;
        }
    }

    for (int i = 0; prepositions[i] != NULL; i++) {
        if (strcmp(word, prepositions[i]) == 0) {
            printf("%s - preposition\n", word);
            return;
        }
    }

    for (int i = 0; conjunctions[i] != NULL; i++) {
        if (strcmp(word, conjunctions[i]) == 0) {
            printf("%s - conjuction\n", word);
            return;
        }
    }

    for (int i = 0; interjections[i] != NULL; i++) {
        if (strcmp(word, interjections[i]) == 0) {
            printf("%s - interjection\n", word);
            return;
        }
    }
    printf("%s - common noun\n", word);
}



int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

