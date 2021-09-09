remotes::install_github("emitanaka/edibble")
library(edibble)
set.seed(2020) 
spdes <- start_design("Split-plot Design") %>% 
  set_units(Medium_aquarium = 4,
            Small_aquarium = nested_in(Medium_aquarium,
                                       4)) %>% 
  set_trts(Bacterial_strain = c("Sa", "Av", "Sa+Av"),
           Vaccine_dose    = c("Unique", "Booster")) %>% 
  allocate_trts(Bacterial_strain ~ Medium_aquarium, 
                Vaccine_dose ~ Bacterial_strain) %>% 
  randomise_trts()
spdes
plot(spdes)
plot(spdes, view = "low")

set.seed(2020) 
spdes <- start_design("Split-plot Design") %>% 
  set_units(Medium_aquarium = 3,
            Small_aquarium = nested_in(Medium_aquarium, 2)) %>% 
  set_trts(Vaccine_type = c("Sa","Av","Sa+Av"),
           Vaccine_dose    = c("Unique", "Booster")) %>% 
  allocate_trts(Vaccine_type ~ Medium_aquarium, 
                Vaccine_dose  ~ Small_aquarium) %>% 
  randomise_trts()
plot(spdes)
plot(spdes, view = "low")
plot(spdes, view = "low")
plot(spdes, view = "low")
plot(spdes, view = "low")
plot(spdes, view = "low")
plot(spdes, view = "low")
plot(spdes, view = "low")
plot(spdes, view = "low")
start_design("Inactivated vaccines experimental structure") %>% 
  set_units(Medium_aquarium = c("Control","Sa","Av","Sa+Av"),
            Small_aquarium = nested_in(Medium_aquarium,
                                       1 ~ 2,
                                       2 ~ 2 ,
                                       2 ~2 , 
                                       "Sa+Av"~3)) %>% 
  set_trts(Bacterial_strain = c("Sa", "Av", "Sa+Av", "Control"),
           Vaccine_dose  = nested_in(Bacterial_strain, 
                                       "Control" ~ 0)) %>% 
  serve_table() %>% plot(View = "low")


start_design("nesting structure") %>% 
  # there are 3 sites labelled A, B, C
  set_units(site = c("A", "B", "C"),
            # each site has 2 blocks except B with 3 sites
            block = nested_in(site, 
                              "B" ~ 3,
                              . ~ 2),
            # levels can be specified by their number instead
            # so for below "block1" has 30 plots, 
            # "block2" and "block3" has 40 plots,
            # the rest of blocks have 20 plots.
            plot = nested_in(block, 
                             1 ~ 30,
                             c(2, 3) ~ 40,
                             . ~ 20)) %>% 
  serve_table() %>%  plot(view = "low")

set_context(question = "Is the vaccine effective?",
            where = "Tested in the lab",
            "experiment is blinded",
            "experiment is carried out by one technician",
            "More details are in {.file experimental-details.txt}.")
