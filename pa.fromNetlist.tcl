
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name MusicIns -dir "X:/6010110458/MusicIns/planAhead_run_5" -part xc3s200tq144-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "X:/6010110458/MusicIns/music.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {X:/6010110458/MusicIns} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "music.ucf" [current_fileset -constrset]
add_files [list {music.ucf}] -fileset [get_property constrset [current_run]]
link_design
