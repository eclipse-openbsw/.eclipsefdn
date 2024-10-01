local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-openbsw') {
  settings+: {
    description: "",
    name: "Eclipse OpenBSW",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('openbsw') {
      private: true,
      has_discussions: true,
      description: "OpenBSW: A Code-first Software Platform for Automotive Microcontrollers",
      delete_branch_on_merge: true,
      has_issues: true,
      allow_merge_commit: false,
      default_branch: "main"
    },
  ],
}
