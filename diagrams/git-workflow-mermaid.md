```mermaid



%%{
  init: {
    'theme': 'forest',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%


%%{init:{'themeCSS':'.messageLine0:nth-of-type(2) { stroke: red; };.messageText:nth-of-type(1) { fill: green; font-size: 30px !important;}; g:nth-of-type(3) rect.actor { stroke:blue;fill: pink; }; g:nth-of-type(5) .note { stroke:blue;fill: crimson; };#arrowhead path {stroke: blue; fill:red;};'}}%%



sequenceDiagram
    Stash -> WorkingArea:x002

    WorkingArea ->> Index/StagingArea: add


    Index/StagingArea->>LocalRepo: commit


    Index/StagingArea--x WorkingArea: I am good thanks!
    Index/StagingArea-x LocalRepo: I am good thanks!
    Note right of LocalRepo: Index/StagingArea thinks a long<br/>long time, so long<br/>that the text does<br/>not fit on a row.

    Index/StagingArea-->WorkingArea: Checking with Local Repo...
    %%WorkingArea->LocalRepo: Yes... Local Repo, how are you?

    LocalRepo ->> RemoteRepo: push
    LocalRepo ->> WorkingArea: init
    LocalRepo ->> WorkingArea: restore
    LocalRepo ->> WorkingArea: checkout ??

    RemoteRepo ->> LocalRepo: fetch
    RemoteRepo ->> WorkingArea: pull
    LocalRepo ->> WorkingArea: merge/rebase branchname ??

    WorkingArea -> Index/StagingArea: diff
    Index/StagingArea -> LocalRepo: diff --staged
    WorkingArea -> LocalRepo: diff HEAD (WRK & STG against LREPO)

    Stash ->> RemoteRepo: *TODO* git rm
    Stash ->> RemoteRepo: *TODO* git grep
    Stash ->> RemoteRepo: *TODO* git stash
    Stash ->> RemoteRepo: *TODO* git reset --hard


