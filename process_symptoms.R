library(tidyverse)

# read CSV files
symptoms_df <- read_tsv("data/symptoms.csv")
groups_df <- read_tsv("data/groups.csv")

unrolled_symptoms_df <- symptoms_df %>%
    separate_rows(Symptoms, sep = ",\\s*") %>% # split comma/whitespace-separated symptoms into separate lines
    rename( Symptom = Symptoms )               # rename Symptoms column

unrolled_symptoms_groups_df <- unrolled_symptoms_df %>%
    left_join(groups_df, by="Symptom")         # join symptoms and groups tables

symptoms_groups_df <- unrolled_symptoms_groups_df %>% 
    group_by(RowID) %>%                        # merge rows by RowID again
    summarize(
        Symptoms = paste(Symptom, collapse = ", "),      # keeping list of symptoms...
        Groups = paste(unique(Group), collapse = ", ")   # ...and unique groups per RowID
    )
