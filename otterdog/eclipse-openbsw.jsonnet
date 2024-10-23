local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-openbsw') {
  settings+: {
    description: "",
    name: "Eclipse OpenBSW",
    web_commit_signoff_required: false,
    members_can_fork_private_repositories: true,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      has_discussions: true,
    },
    orgs.newRepo('openbsw') {
      private: false,
      has_discussions: true,
      homepage: "https://eclipse-openbsw.github.io/openbsw",
      description: "OpenBSW: A Code-first Software Platform for Automotive Microcontrollers",
      delete_branch_on_merge: true,
      has_issues: true,
      allow_merge_commit: false,
      default_branch: "main",
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
    },
  ],
}
