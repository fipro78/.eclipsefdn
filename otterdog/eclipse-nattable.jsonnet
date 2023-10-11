local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-nattable') {
  settings+: {
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse Nebula NatTable",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/nattable/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('nattable') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "High performance SWT data grid",
      homepage: "https://eclipse.dev/nattable/",
      topics+: [
        "eclipse-rcp",
        "java",
        "swt"
      ],
      web_commit_signoff_required: false,
      has_discussions: true,
    },
    orgs.newRepo('nattable-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
  ],
}
