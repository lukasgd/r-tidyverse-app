library(tidyverse)

symptoms_df <- read_tsv("data/symptoms.csv")
groups_df <- read_tsv("data/groups.csv")

unrolled_symptoms_df <- symptoms_df %>%
    separate_rows(Symptoms, sep = ",\\s*") %>% 
    rename( Symptom = Symptoms )

unrolled_symptoms_groups_df <- unrolled_symptoms_df %>%
    left_join(groups_df, by="Symptom")

symptoms_groups_df <- unrolled_symptoms_groups_df %>% 
    group_by(RowID) %>% 
    summarize(
        Symptoms = paste(Symptom, collapse = ", "),
        Groups = paste(unique(Group), collapse = ", ")
    )
