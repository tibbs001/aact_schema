# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161212174016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baseline_counts", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "result_group_id"
    t.string  "ctgov_group_code"
    t.string  "units"
    t.string  "scope"
    t.integer "count"
  end

  create_table "baseline_measurements", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "result_group_id"
    t.string  "ctgov_group_code"
    t.string  "classification"
    t.string  "category"
    t.string  "title"
    t.text    "description"
    t.string  "units"
    t.string  "param_type"
    t.string  "param_value"
    t.decimal "param_value_num"
    t.string  "dispersion_type"
    t.string  "dispersion_value"
    t.decimal "dispersion_value_num"
    t.decimal "dispersion_lower_limit"
    t.decimal "dispersion_upper_limit"
    t.string  "explanation_of_na"
  end

  add_index "baseline_measurements", ["category"], name: "index_baseline_measurements_on_category", using: :btree
  add_index "baseline_measurements", ["classification"], name: "index_baseline_measurements_on_classification", using: :btree
  add_index "baseline_measurements", ["dispersion_type"], name: "index_baseline_measurements_on_dispersion_type", using: :btree
  add_index "baseline_measurements", ["param_type"], name: "index_baseline_measurements_on_param_type", using: :btree

  create_table "brief_summaries", force: :cascade do |t|
    t.string "nct_id"
    t.text   "description"
  end

  create_table "browse_conditions", force: :cascade do |t|
    t.string "nct_id"
    t.string "mesh_term"
  end

  add_index "browse_conditions", ["mesh_term"], name: "index_browse_conditions_on_mesh_term", using: :btree
  add_index "browse_conditions", ["nct_id"], name: "index_browse_conditions_on_nct_id", using: :btree

  create_table "browse_interventions", force: :cascade do |t|
    t.string "nct_id"
    t.string "mesh_term"
  end

  add_index "browse_interventions", ["mesh_term"], name: "index_browse_interventions_on_mesh_term", using: :btree
  add_index "browse_interventions", ["nct_id"], name: "index_browse_interventions_on_nct_id", using: :btree

  create_table "calculated_values", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "number_of_facilities"
    t.integer "number_of_nsae_subjects"
    t.integer "number_of_sae_subjects"
    t.integer "registered_in_calendar_year"
    t.date    "nlm_download_date"
    t.integer "actual_duration"
    t.boolean "were_results_reported",       default: false
    t.integer "months_to_report_results"
    t.boolean "has_us_facility",             default: false
    t.boolean "has_single_facility",         default: false
    t.integer "minimum_age_num"
    t.integer "maximum_age_num"
    t.string  "minimum_age_unit"
    t.string  "maximum_age_unit"
  end

  add_index "calculated_values", ["actual_duration"], name: "index_calculated_values_on_actual_duration", using: :btree
  add_index "calculated_values", ["months_to_report_results"], name: "index_calculated_values_on_months_to_report_results", using: :btree
  add_index "calculated_values", ["number_of_facilities"], name: "index_calculated_values_on_number_of_facilities", using: :btree

  create_table "central_contacts", force: :cascade do |t|
    t.string "nct_id"
    t.string "contact_type"
    t.string "name"
    t.string "phone"
    t.string "email"
  end

  add_index "central_contacts", ["contact_type"], name: "index_central_contacts_on_contact_type", using: :btree

  create_table "conditions", force: :cascade do |t|
    t.string "nct_id"
    t.string "name"
  end

  create_table "countries", force: :cascade do |t|
    t.string  "nct_id"
    t.string  "name"
    t.boolean "removed"
  end

  create_table "data_definitions", force: :cascade do |t|
    t.string   "db_section"
    t.string   "table_name"
    t.string   "column_name"
    t.string   "data_type"
    t.string   "source"
    t.text     "ctti_note"
    t.string   "nlm_link"
    t.integer  "row_count"
    t.json     "enumerations"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "design_group_interventions", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "design_group_id"
    t.integer "intervention_id"
  end

  create_table "design_groups", force: :cascade do |t|
    t.string "nct_id"
    t.string "group_type"
    t.string "title"
    t.text   "description"
  end

  add_index "design_groups", ["group_type"], name: "index_design_groups_on_group_type", using: :btree

  create_table "design_outcomes", force: :cascade do |t|
    t.string "nct_id"
    t.string "outcome_type"
    t.text   "measure"
    t.text   "time_frame"
    t.string "population"
    t.text   "description"
  end

  add_index "design_outcomes", ["outcome_type"], name: "index_design_outcomes_on_outcome_type", using: :btree

  create_table "designs", force: :cascade do |t|
    t.string  "nct_id"
    t.string  "allocation"
    t.string  "intervention_model"
    t.string  "observational_model"
    t.string  "primary_purpose"
    t.string  "time_perspective"
    t.string  "masking"
    t.text    "masking_description"
    t.text    "intervention_model_description"
    t.boolean "subject_masked"
    t.boolean "caregiver_masked"
    t.boolean "investigator_masked"
    t.boolean "outcomes_assessor_masked"
  end

  add_index "designs", ["caregiver_masked"], name: "index_designs_on_caregiver_masked", using: :btree
  add_index "designs", ["investigator_masked"], name: "index_designs_on_investigator_masked", using: :btree
  add_index "designs", ["masking"], name: "index_designs_on_masking", using: :btree
  add_index "designs", ["outcomes_assessor_masked"], name: "index_designs_on_outcomes_assessor_masked", using: :btree
  add_index "designs", ["subject_masked"], name: "index_designs_on_subject_masked", using: :btree

  create_table "detailed_descriptions", force: :cascade do |t|
    t.string "nct_id"
    t.text   "description"
  end

  create_table "drop_withdrawals", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "result_group_id"
    t.string  "ctgov_group_code"
    t.string  "period"
    t.string  "reason"
    t.integer "count"
  end

  add_index "drop_withdrawals", ["period"], name: "index_drop_withdrawals_on_period", using: :btree

  create_table "eligibilities", force: :cascade do |t|
    t.string  "nct_id"
    t.string  "sampling_method"
    t.string  "gender"
    t.string  "minimum_age"
    t.string  "maximum_age"
    t.string  "healthy_volunteers"
    t.text    "population"
    t.text    "criteria"
    t.text    "gender_description"
    t.boolean "gender_based"
  end

  add_index "eligibilities", ["gender"], name: "index_eligibilities_on_gender", using: :btree
  add_index "eligibilities", ["healthy_volunteers"], name: "index_eligibilities_on_healthy_volunteers", using: :btree
  add_index "eligibilities", ["maximum_age"], name: "index_eligibilities_on_maximum_age", using: :btree
  add_index "eligibilities", ["minimum_age"], name: "index_eligibilities_on_minimum_age", using: :btree

  create_table "facilities", force: :cascade do |t|
    t.string "nct_id"
    t.string "status"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
  end

  add_index "facilities", ["city"], name: "index_facilities_on_city", using: :btree
  add_index "facilities", ["country"], name: "index_facilities_on_country", using: :btree
  add_index "facilities", ["name"], name: "index_facilities_on_name", using: :btree
  add_index "facilities", ["state"], name: "index_facilities_on_state", using: :btree
  add_index "facilities", ["status"], name: "index_facilities_on_status", using: :btree

  create_table "facility_contacts", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "facility_id"
    t.string  "contact_type"
    t.string  "name"
    t.string  "email"
    t.string  "phone"
  end

  add_index "facility_contacts", ["contact_type"], name: "index_facility_contacts_on_contact_type", using: :btree

  create_table "facility_investigators", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "facility_id"
    t.string  "role"
    t.string  "name"
  end

  create_table "id_information", force: :cascade do |t|
    t.string "nct_id"
    t.string "id_type"
    t.string "id_value"
  end

  add_index "id_information", ["id_type"], name: "index_id_information_on_id_type", using: :btree

  create_table "intervention_other_names", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "intervention_id"
    t.string  "name"
  end

  create_table "interventions", force: :cascade do |t|
    t.string "nct_id"
    t.string "intervention_type"
    t.string "name"
    t.text   "description"
  end

  add_index "interventions", ["intervention_type"], name: "index_interventions_on_intervention_type", using: :btree

  create_table "keywords", force: :cascade do |t|
    t.string "nct_id"
    t.string "name"
  end

  create_table "links", force: :cascade do |t|
    t.string "nct_id"
    t.string "url"
    t.text   "description"
  end

  create_table "load_events", force: :cascade do |t|
    t.string   "event_type"
    t.string   "status"
    t.text     "description"
    t.text     "problems"
    t.integer  "should_add"
    t.integer  "should_change"
    t.integer  "processed"
    t.string   "load_time"
    t.datetime "completed_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "result_group_id"
    t.string  "ctgov_group_code"
    t.string  "title"
    t.string  "period"
    t.text    "description"
    t.integer "count"
  end

  add_index "milestones", ["period"], name: "index_milestones_on_period", using: :btree

  create_table "outcome_analyses", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "outcome_id"
    t.string  "non_inferiority_type"
    t.text    "non_inferiority_description"
    t.string  "param_type"
    t.decimal "param_value"
    t.string  "dispersion_type"
    t.decimal "dispersion_value"
    t.decimal "p_value"
    t.string  "ci_n_sides"
    t.decimal "ci_percent"
    t.decimal "ci_lower_limit"
    t.decimal "ci_upper_limit"
    t.string  "ci_upper_limit_na_comment"
    t.string  "p_value_description"
    t.string  "method"
    t.text    "method_description"
    t.text    "estimate_description"
    t.text    "groups_description"
    t.text    "other_analysis_description"
  end

  add_index "outcome_analyses", ["dispersion_type"], name: "index_outcome_analyses_on_dispersion_type", using: :btree
  add_index "outcome_analyses", ["param_type"], name: "index_outcome_analyses_on_param_type", using: :btree

  create_table "outcome_analysis_groups", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "outcome_analysis_id"
    t.integer "result_group_id"
    t.string  "ctgov_group_code"
  end

  create_table "outcome_counts", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "outcome_id"
    t.integer "result_group_id"
    t.string  "ctgov_group_code"
    t.string  "scope"
    t.string  "units"
    t.integer "count"
  end

  create_table "outcome_measurements", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "outcome_id"
    t.integer "result_group_id"
    t.string  "ctgov_group_code"
    t.string  "classification"
    t.string  "category"
    t.string  "title"
    t.text    "description"
    t.string  "units"
    t.string  "param_type"
    t.string  "param_value"
    t.decimal "param_value_num"
    t.string  "dispersion_type"
    t.string  "dispersion_value"
    t.decimal "dispersion_value_num"
    t.decimal "dispersion_lower_limit"
    t.decimal "dispersion_upper_limit"
    t.text    "explanation_of_na"
  end

  add_index "outcome_measurements", ["category"], name: "index_outcome_measurements_on_category", using: :btree
  add_index "outcome_measurements", ["classification"], name: "index_outcome_measurements_on_classification", using: :btree
  add_index "outcome_measurements", ["dispersion_type"], name: "index_outcome_measurements_on_dispersion_type", using: :btree

  create_table "outcomes", force: :cascade do |t|
    t.string "nct_id"
    t.string "outcome_type"
    t.text   "title"
    t.text   "description"
    t.text   "time_frame"
    t.text   "population"
    t.string "anticipated_posting_month_year"
    t.string "units"
    t.string "units_analyzed"
    t.string "dispersion_type"
    t.string "param_type"
  end

  add_index "outcomes", ["dispersion_type"], name: "index_outcomes_on_dispersion_type", using: :btree
  add_index "outcomes", ["param_type"], name: "index_outcomes_on_param_type", using: :btree

  create_table "overall_officials", force: :cascade do |t|
    t.string "nct_id"
    t.string "role"
    t.string "name"
    t.string "affiliation"
  end

  add_index "overall_officials", ["affiliation"], name: "index_overall_officials_on_affiliation", using: :btree
  add_index "overall_officials", ["nct_id"], name: "index_overall_officials_on_nct_id", using: :btree

  create_table "participant_flows", force: :cascade do |t|
    t.string "nct_id"
    t.text   "recruitment_details"
    t.text   "pre_assignment_details"
  end

  create_table "reported_events", force: :cascade do |t|
    t.string  "nct_id"
    t.integer "result_group_id"
    t.string  "ctgov_group_code"
    t.text    "time_frame"
    t.string  "event_type"
    t.string  "default_vocab"
    t.string  "default_assessment"
    t.integer "subjects_affected"
    t.integer "subjects_at_risk"
    t.text    "description"
    t.integer "event_count"
    t.string  "organ_system"
    t.string  "adverse_event_term"
    t.integer "frequency_threshold"
    t.string  "vocab"
    t.string  "assessment"
  end

  add_index "reported_events", ["event_type"], name: "index_reported_events_on_event_type", using: :btree
  add_index "reported_events", ["subjects_affected"], name: "index_reported_events_on_subjects_affected", using: :btree

  create_table "responsible_parties", force: :cascade do |t|
    t.string "nct_id"
    t.string "responsible_party_type"
    t.string "name"
    t.string "title"
    t.string "organization"
    t.text   "affiliation"
  end

  add_index "responsible_parties", ["nct_id"], name: "index_responsible_parties_on_nct_id", using: :btree
  add_index "responsible_parties", ["organization"], name: "index_responsible_parties_on_organization", using: :btree
  add_index "responsible_parties", ["responsible_party_type"], name: "index_responsible_parties_on_responsible_party_type", using: :btree

  create_table "result_agreements", force: :cascade do |t|
    t.string "nct_id"
    t.string "pi_employee"
    t.text   "agreement"
  end

  create_table "result_contacts", force: :cascade do |t|
    t.string "nct_id"
    t.string "organization"
    t.string "name"
    t.string "phone"
    t.string "email"
  end

  add_index "result_contacts", ["organization"], name: "index_result_contacts_on_organization", using: :btree

  create_table "result_groups", force: :cascade do |t|
    t.string "nct_id"
    t.string "ctgov_group_code"
    t.string "result_type"
    t.string "title"
    t.text   "description"
  end

  add_index "result_groups", ["result_type"], name: "index_result_groups_on_result_type", using: :btree

  create_table "sanity_checks", force: :cascade do |t|
    t.string   "table_name"
    t.string   "nct_id"
    t.integer  "row_count"
    t.text     "description"
    t.boolean  "most_current"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sanity_checks", ["created_at"], name: "index_sanity_checks_on_created_at", using: :btree
  add_index "sanity_checks", ["most_current"], name: "index_sanity_checks_on_most_current", using: :btree
  add_index "sanity_checks", ["table_name"], name: "index_sanity_checks_on_table_name", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string "nct_id"
    t.string "agency_class"
    t.string "lead_or_collaborator"
    t.string "name"
  end

  add_index "sponsors", ["agency_class"], name: "index_sponsors_on_agency_class", using: :btree
  add_index "sponsors", ["name"], name: "index_sponsors_on_name", using: :btree

  create_table "studies", id: false, force: :cascade do |t|
    t.string   "nct_id"
    t.string   "nlm_download_date_description"
    t.date     "first_received_date"
    t.date     "last_changed_date"
    t.date     "first_received_results_date"
    t.date     "received_results_disposit_date"
    t.string   "start_month_year"
    t.string   "start_date_type"
    t.date     "start_date"
    t.string   "verification_month_year"
    t.date     "verification_date"
    t.string   "completion_month_year"
    t.string   "completion_date_type"
    t.date     "completion_date"
    t.string   "primary_completion_month_year"
    t.string   "primary_completion_date_type"
    t.date     "primary_completion_date"
    t.string   "target_duration"
    t.string   "study_type"
    t.string   "acronym"
    t.text     "baseline_population"
    t.text     "brief_title"
    t.text     "official_title"
    t.string   "overall_status"
    t.string   "last_known_status"
    t.string   "phase"
    t.integer  "enrollment"
    t.string   "enrollment_type"
    t.string   "source"
    t.string   "limitations_and_caveats"
    t.integer  "number_of_arms"
    t.integer  "number_of_groups"
    t.string   "why_stopped"
    t.boolean  "has_expanded_access"
    t.boolean  "expanded_access_type_individual"
    t.boolean  "expanded_access_type_intermediate"
    t.boolean  "expanded_access_type_treatment"
    t.boolean  "has_dmc"
    t.boolean  "is_fda_regulated_drug"
    t.boolean  "is_fda_regulated_device"
    t.boolean  "is_unapproved_device"
    t.boolean  "is_ppsd"
    t.boolean  "is_us_export"
    t.string   "biospec_retention"
    t.text     "biospec_description"
    t.string   "plan_to_share_ipd"
    t.string   "plan_to_share_ipd_description"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "studies", ["completion_date"], name: "index_studies_on_completion_date", using: :btree
  add_index "studies", ["enrollment_type"], name: "index_studies_on_enrollment_type", using: :btree
  add_index "studies", ["first_received_results_date"], name: "index_studies_on_first_received_results_date", using: :btree
  add_index "studies", ["last_known_status"], name: "index_studies_on_last_known_status", using: :btree
  add_index "studies", ["nct_id"], name: "index_studies_on_nct_id", unique: true, using: :btree
  add_index "studies", ["overall_status"], name: "index_studies_on_overall_status", using: :btree
  add_index "studies", ["phase"], name: "index_studies_on_phase", using: :btree
  add_index "studies", ["primary_completion_date"], name: "index_studies_on_primary_completion_date", using: :btree
  add_index "studies", ["primary_completion_date_type"], name: "index_studies_on_primary_completion_date_type", using: :btree
  add_index "studies", ["received_results_disposit_date"], name: "index_studies_on_received_results_disposit_date", using: :btree
  add_index "studies", ["source"], name: "index_studies_on_source", using: :btree
  add_index "studies", ["start_date"], name: "index_studies_on_start_date", using: :btree
  add_index "studies", ["start_date_type"], name: "index_studies_on_start_date_type", using: :btree
  add_index "studies", ["study_type"], name: "index_studies_on_study_type", using: :btree

  create_table "study_references", force: :cascade do |t|
    t.string "nct_id"
    t.string "pmid"
    t.string "reference_type"
    t.text   "citation"
  end

  add_index "study_references", ["reference_type"], name: "index_study_references_on_reference_type", using: :btree

  create_table "study_xml_records", force: :cascade do |t|
    t.string   "nct_id"
    t.xml      "content"
    t.datetime "created_study_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "study_xml_records", ["created_study_at"], name: "index_study_xml_records_on_created_study_at", using: :btree
  add_index "study_xml_records", ["nct_id"], name: "index_study_xml_records_on_nct_id", using: :btree

  create_table "use_case_attachments", force: :cascade do |t|
    t.integer  "use_case_id"
    t.string   "file_name"
    t.binary   "payload"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "use_cases", force: :cascade do |t|
    t.string   "status"
    t.string   "title"
    t.string   "brief_summary"
    t.text     "detailed_description"
    t.string   "url"
    t.string   "submitter_name"
    t.string   "contact_info"
    t.string   "email"
    t.binary   "image"
    t.string   "remote_image_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_foreign_key "baseline_counts", "result_groups", name: "baseline_c_result_group_id_fkey"
  add_foreign_key "baseline_measurements", "result_groups", name: "baseline_m_result_group_id_fkey"
  add_foreign_key "brief_summaries", "studies", column: "nct_id", primary_key: "nct_id", name: "brief_summaries_fkey"
  add_foreign_key "browse_conditions", "studies", column: "nct_id", primary_key: "nct_id", name: "browse_conditions_nct_id_fkey"
  add_foreign_key "browse_interventions", "studies", column: "nct_id", primary_key: "nct_id", name: "browse_interventions_nct_id_fkey"
  add_foreign_key "calculated_values", "studies", column: "nct_id", primary_key: "nct_id", name: "calculated_values_nct_id_fkey"
  add_foreign_key "central_contacts", "studies", column: "nct_id", primary_key: "nct_id", name: "central_contacts_nct_id_fkey"
  add_foreign_key "conditions", "studies", column: "nct_id", primary_key: "nct_id", name: "conditions_nct_id_fkey"
  add_foreign_key "countries", "studies", column: "nct_id", primary_key: "nct_id", name: "countries_nct_id_fkey"
  add_foreign_key "design_group_interventions", "design_groups", column: "intervention_id", name: "design_groups_interventions_design_group_id_fkey"
  add_foreign_key "design_group_interventions", "interventions", column: "design_group_id", name: "design_groups_interventions_intervention_id_fkey"
  add_foreign_key "design_groups", "studies", column: "nct_id", primary_key: "nct_id", name: "design_groups_nct_id_fkey"
  add_foreign_key "design_outcomes", "studies", column: "nct_id", primary_key: "nct_id", name: "design_outcomes_nct_id_fkey"
  add_foreign_key "designs", "studies", column: "nct_id", primary_key: "nct_id", name: "designs_nct_id_fkey"
  add_foreign_key "detailed_descriptions", "studies", column: "nct_id", primary_key: "nct_id", name: "detailed_descriptions_nct_id_fkey"
  add_foreign_key "drop_withdrawals", "result_groups", name: "drop_with_group_id_fkey"
  add_foreign_key "eligibilities", "studies", column: "nct_id", primary_key: "nct_id", name: "eligibilities_nct_id_fkey"
  add_foreign_key "facilities", "studies", column: "nct_id", primary_key: "nct_id", name: "facilities_nct_id_fkey"
  add_foreign_key "facility_contacts", "facilities", name: "facility_contacts_facility_id_fkey"
  add_foreign_key "facility_investigators", "facilities", name: "facility_i_f_fkey"
  add_foreign_key "id_information", "studies", column: "nct_id", primary_key: "nct_id", name: "id_study_fkey"
  add_foreign_key "intervention_other_names", "interventions", name: "ion_intervention_id_fkey"
  add_foreign_key "interventions", "studies", column: "nct_id", primary_key: "nct_id", name: "interventions_nct_id_fkey"
  add_foreign_key "keywords", "studies", column: "nct_id", primary_key: "nct_id", name: "keywords_nct_id_fkey"
  add_foreign_key "links", "studies", column: "nct_id", primary_key: "nct_id", name: "links_nct_id_fkey"
  add_foreign_key "milestones", "result_groups", name: "milestones_result_group_id_fkey"
  add_foreign_key "outcome_analyses", "outcomes", name: "outcome_analyses_outcome_id_fkey"
  add_foreign_key "outcome_analysis_groups", "outcome_analyses", name: "outcome_analysis_group_id_fkey"
  add_foreign_key "outcome_analysis_groups", "result_groups", name: "outcome_analysis_group_group_id_fkey"
  add_foreign_key "outcome_counts", "outcomes", name: "outcome_count_id_fkey"
  add_foreign_key "outcome_counts", "result_groups", name: "outcome_count_group_id_fkey"
  add_foreign_key "outcome_measurements", "outcomes", name: "outcome_measurement_id_fkey"
  add_foreign_key "outcome_measurements", "result_groups", name: "outcome_measurement_group_id_fkey"
  add_foreign_key "overall_officials", "studies", column: "nct_id", primary_key: "nct_id", name: "overall_officials_nct_id_fkey"
  add_foreign_key "participant_flows", "studies", column: "nct_id", primary_key: "nct_id", name: "part_flow_id_fkey"
  add_foreign_key "reported_events", "result_groups", name: "reported_events_result_group_id_fkey"
  add_foreign_key "responsible_parties", "studies", column: "nct_id", primary_key: "nct_id", name: "responsible_parties_nct_id_fkey"
  add_foreign_key "result_agreements", "studies", column: "nct_id", primary_key: "nct_id", name: "result_agreements_nct_id_fkey"
  add_foreign_key "result_contacts", "studies", column: "nct_id", primary_key: "nct_id", name: "result_contacts_nct_id_fkey"
  add_foreign_key "result_groups", "studies", column: "nct_id", primary_key: "nct_id", name: "result_groups_nct_id_fkey"
  add_foreign_key "sponsors", "studies", column: "nct_id", primary_key: "nct_id", name: "sponsors_nct_id_fkey"
  add_foreign_key "study_references", "studies", column: "nct_id", primary_key: "nct_id", name: "study_references_nct_id_fkey"
  add_foreign_key "use_case_attachments", "use_cases", name: "use_case_attach_use_case_id_fkey"
end
