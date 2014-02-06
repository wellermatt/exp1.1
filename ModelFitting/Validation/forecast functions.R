




<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>cv.ts/R/forecast functions.R at master · zachmayer/cv.ts · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <meta property="fb:app_id" content="1401488693436528"/>

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="zachmayer/cv.ts" name="twitter:title" /><meta content="cv.ts - Cross-validate time series forecasts" name="twitter:description" /><meta content="https://2.gravatar.com/avatar/5bc3aeec09464c41078ccafacfa7832b?d=https%3A%2F%2Fidenticons.github.com%2Fb5604c3ad39e3e079ee38eb511495af8.png&amp;r=x&amp;s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://2.gravatar.com/avatar/5bc3aeec09464c41078ccafacfa7832b?d=https%3A%2F%2Fidenticons.github.com%2Fb5604c3ad39e3e079ee38eb511495af8.png&amp;r=x&amp;s=400" property="og:image" /><meta content="zachmayer/cv.ts" property="og:title" /><meta content="https://github.com/zachmayer/cv.ts" property="og:url" /><meta content="cv.ts - Cross-validate time series forecasts" property="og:description" />

    <meta name="hostname" content="github-fe123-cp1-prd.iad.github.net">
    <meta name="ruby" content="ruby 2.1.0p0-github-tcmalloc (87d8860372) [x86_64-linux]">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035/">
    <link rel="xhr-socket" href="/_sockets" />
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="5772B6A5:53AC:2D47524:52F3CB5E" name="octolytics-dimension-request_id" />
    

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="4Ei3nJzw5awDb15JDB5kg9DE3ycg+K0cHrtxKLu/WD0=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-c8eaece92b2ba4da8cdfd619fae679b5161d6b98.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-7f0d7b48b3c00afffc09e3e222de589a9adf9afa.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://github.global.ssl.fastly.net/assets/frameworks-e8d62aa911c75d1d60662859d52c3cf1232675e6.js" type="text/javascript"></script>
      <script async="async" defer="defer" src="https://github.global.ssl.fastly.net/assets/github-6b7bd560c0991d6b250d7e58de8a56752605497f.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="78251706371336786228143a8932e87f">

        <link data-pjax-transient rel='permalink' href='/zachmayer/cv.ts/blob/fb7f624d6b2a63e3a67e5194686025c72d42ec64/R/forecast%20functions.R'>

  <meta name="description" content="cv.ts - Cross-validate time series forecasts" />

  <meta content="581590" name="octolytics-dimension-user_id" /><meta content="zachmayer" name="octolytics-dimension-user_login" /><meta content="4624811" name="octolytics-dimension-repository_id" /><meta content="zachmayer/cv.ts" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="4624811" name="octolytics-dimension-repository_network_root_id" /><meta content="zachmayer/cv.ts" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/zachmayer/cv.ts/commits/master.atom" rel="alternate" title="Recent Commits to cv.ts:master" type="application/atom+xml" />

  </head>


  <body class="logged_out  env-production windows vis-public page-blob">
    <div class="wrapper">
      
      
      
      


      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions">
        <a class="button primary" href="/join">Sign up</a>
      <a class="button signin" href="/login?return_to=%2Fzachmayer%2Fcv.ts%2Fblob%2Fmaster%2FR%2Fforecast%2520functions.R">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">

      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="https://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey=" s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    
      data-repo="zachmayer/cv.ts"
      data-branch="master"
      data-sha="fd1f56d0e2b7c70ff40206247fd03c55e90ae0f6"
  >

    <input type="hidden" name="nwo" value="zachmayer/cv.ts" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
    </div>

  </div>
</div>


      


          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">


  <li>
    <a href="/login?return_to=%2Fzachmayer%2Fcv.ts"
    class="minibutton with-count js-toggler-target star-button tooltipped upwards"
    title="You must be signed in to use this feature" rel="nofollow">
    <span class="octicon octicon-star"></span>Star
  </a>

    <a class="social-count js-social-count" href="/zachmayer/cv.ts/stargazers">
      6
    </a>

  </li>

    <li>
      <a href="/login?return_to=%2Fzachmayer%2Fcv.ts"
        class="minibutton with-count js-toggler-target fork-button tooltipped upwards"
        title="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/zachmayer/cv.ts/network" class="social-count">
        0
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/zachmayer" class="url fn" itemprop="url" rel="author"><span itemprop="title">zachmayer</span></a>
          </span>
          <span class="repohead-name-divider">/</span>
          <strong><a href="/zachmayer/cv.ts" class="js-current-repository js-repo-home-link">cv.ts</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      

      <div class="repository-with-sidebar repo-container new-discussion-timeline js-new-discussion-timeline  ">
        <div class="repository-sidebar">
            

<div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders">
  <div class="sunken-menu-contents">
    <ul class="sunken-menu-group">
      <li class="tooltipped leftwards" title="Code">
        <a href="/zachmayer/cv.ts" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /zachmayer/cv.ts">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" title="Issues">
          <a href="/zachmayer/cv.ts/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /zachmayer/cv.ts/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" title="Pull Requests">
        <a href="/zachmayer/cv.ts/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /zachmayer/cv.ts/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


    </ul>
    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">

      <li class="tooltipped leftwards" title="Pulse">
        <a href="/zachmayer/cv.ts/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="pulse /zachmayer/cv.ts/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Graphs">
        <a href="/zachmayer/cv.ts/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_graphs repo_contributors /zachmayer/cv.ts/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Network">
        <a href="/zachmayer/cv.ts/network" aria-label="Network" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-selected-links="repo_network /zachmayer/cv.ts/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


  </div>
</div>

              <div class="only-with-full-nav">
                

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/zachmayer/cv.ts.git" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/zachmayer/cv.ts.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/zachmayer/cv.ts" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/zachmayer/cv.ts" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <span class="octicon help tooltipped upwards" title="Get help on which URL is right for you.">
    <a href="https://help.github.com/articles/which-remote-url-should-i-use">
    <span class="octicon octicon-question"></span>
    </a>
  </span>
</p>


  <a href="http://windows.github.com" class="minibutton sidebar-button">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>

                <a href="/zachmayer/cv.ts/archive/master.zip"
                   class="minibutton sidebar-button"
                   title="Download this repository as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:1647aecf53590c6553fa0a76cfd02f33 -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/zachmayer/cv.ts/find/master" data-pjax data-hotkey="t" class="js-show-file-finder" style="display:none">Show File Finder</a>

<div class="file-navigation">
  

<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    role="button" aria-label="Switch branches or tags" tabindex="0">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/zachmayer/cv.ts/blob/master/R/forecast%20functions.R"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/zachmayer/cv.ts" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">cv.ts</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/zachmayer/cv.ts/tree/master/R" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">R</span></a></span><span class="separator"> / </span><strong class="final-path">forecast functions.R</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="R/forecast functions.R" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  <div class="commit file-history-tease">
    <img alt="Zach Mayer" class="main-avatar" height="24" src="https://2.gravatar.com/avatar/5bc3aeec09464c41078ccafacfa7832b?d=https%3A%2F%2Fidenticons.github.com%2Fb5604c3ad39e3e079ee38eb511495af8.png&amp;r=x&amp;s=140" width="24" />
    <span class="author"><a href="/zachmayer" rel="author">zachmayer</a></span>
    <time class="js-relative-date" data-title-format="YYYY-MM-DD HH:mm:ss" datetime="2013-11-04T13:03:33-08:00" title="2013-11-04 13:03:33">November 04, 2013</time>
    <div class="commit-title">
        <a href="/zachmayer/cv.ts/commit/fb7f624d6b2a63e3a67e5194686025c72d42ec64" class="message" data-pjax="true" title="Added seasonal naive forecasts">Added seasonal naive forecasts</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="Zach Mayer" height="24" src="https://2.gravatar.com/avatar/5bc3aeec09464c41078ccafacfa7832b?d=https%3A%2F%2Fidenticons.github.com%2Fb5604c3ad39e3e079ee38eb511495af8.png&amp;r=x&amp;s=140" width="24" />
            <a href="/zachmayer">zachmayer</a>
          </li>
      </ul>
    </div>
  </div>

<div id="files" class="bubble">
  <div class="file">
    <div class="meta">
      <div class="info">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
          <span>107 lines (91 sloc)</span>
        <span>2.851 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
            <a class="minibutton tooltipped leftwards"
               href="http://windows.github.com" title="Open this file in GitHub for Windows">
                <span class="octicon octicon-device-desktop"></span> Open
            </a>
              <a class="minibutton disabled tooltipped leftwards" href="#"
                 title="You must be signed in to make or propose changes">Edit</a>
          <a href="/zachmayer/cv.ts/raw/master/R/forecast%20functions.R" class="button minibutton " id="raw-url">Raw</a>
            <a href="/zachmayer/cv.ts/blame/master/R/forecast%20functions.R" class="button minibutton js-update-url-with-hash">Blame</a>
          <a href="/zachmayer/cv.ts/commits/master/R/forecast%20functions.R" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
          <a class="minibutton danger disabled empty-icon tooltipped leftwards" href="#"
             title="You must be signed in to make or propose changes">
          Delete
        </a>
      </div><!-- /.actions -->
    </div>
        <div class="blob-wrapper data type-r js-blob-data">
        <table class="file-code file-diff tab-size-8">
          <tr class="file-code-line">
            <td class="blob-line-nums">
              <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>

            </td>
            <td class="blob-line-code"><div class="code-body highlight"><pre><div class='line' id='LC1'><br/></div><div class='line' id='LC2'>meanForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC3'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC4'>&nbsp;&nbsp;meanf<span class="p">(</span>x<span class="p">,</span> h<span class="p">,</span> <span class="kc">...</span><span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC5'><span class="p">})</span></div><div class='line' id='LC6'><br/></div><div class='line' id='LC7'>naiveForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC8'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC9'>&nbsp;&nbsp;naive<span class="p">(</span>x<span class="p">,</span> h<span class="p">,</span> <span class="kc">...</span><span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC10'><span class="p">})</span></div><div class='line' id='LC11'><br/></div><div class='line' id='LC12'>snaiveForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC13'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC14'>&nbsp;&nbsp;snaive<span class="p">(</span>x<span class="p">,</span> h<span class="p">,</span> <span class="kc">...</span><span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC15'><span class="p">})</span></div><div class='line' id='LC16'><br/></div><div class='line' id='LC17'>rwForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC18'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC19'>&nbsp;&nbsp;rwf<span class="p">(</span>x<span class="p">,</span> h<span class="p">,</span> <span class="kc">...</span><span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC20'><span class="p">})</span></div><div class='line' id='LC21'><br/></div><div class='line' id='LC22'>thetaForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC23'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC24'>&nbsp;&nbsp;out <span class="o">&lt;-</span> thetaf<span class="p">(</span>x<span class="p">,</span> h<span class="p">,</span> <span class="kc">...</span><span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC25'>&nbsp;&nbsp;<span class="kr">return</span><span class="p">(</span>out<span class="p">)</span></div><div class='line' id='LC26'><span class="p">})</span></div><div class='line' id='LC27'><br/></div><div class='line' id='LC28'>lmForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span>xreg<span class="o">=</span><span class="kc">NULL</span><span class="p">,</span>newxreg<span class="o">=</span><span class="kc">NULL</span><span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC29'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC30'>&nbsp;&nbsp;x <span class="o">&lt;-</span> data.frame<span class="p">(</span>x<span class="p">)</span></div><div class='line' id='LC31'>&nbsp;&nbsp;colnames<span class="p">(</span>x<span class="p">)</span> <span class="o">&lt;-</span> <span class="s">&#39;x&#39;</span></div><div class='line' id='LC32'>&nbsp;&nbsp;<span class="kr">if</span> <span class="p">(</span>is.null<span class="p">(</span>xreg<span class="p">)</span> <span class="o">&amp;</span> is.null<span class="p">(</span>newxreg<span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;&nbsp;fit <span class="o">&lt;-</span> tslm<span class="p">(</span>x <span class="o">~</span> trend <span class="o">+</span> season<span class="p">,</span> data<span class="o">=</span>x<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">return</span><span class="p">(</span>forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean<span class="p">)</span></div><div class='line' id='LC35'>&nbsp;&nbsp;<span class="p">}</span> <span class="kr">else</span> <span class="kr">if</span> <span class="p">((</span><span class="o">!</span>is.null<span class="p">(</span>xreg<span class="p">))</span> <span class="o">&amp;</span> <span class="o">!</span><span class="p">(</span>is.null<span class="p">(</span>newxreg<span class="p">)))</span> <span class="p">{</span></div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;newnames <span class="o">&lt;-</span> c<span class="p">(</span><span class="s">&#39;x&#39;</span><span class="p">,</span>colnames<span class="p">(</span>xreg<span class="p">))</span></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;x <span class="o">&lt;-</span> cbind<span class="p">(</span>x<span class="p">,</span>xreg<span class="p">)</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;colnames<span class="p">(</span>x<span class="p">)</span> <span class="o">&lt;-</span> newnames</div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;fmla <span class="o">&lt;-</span> as.formula<span class="p">(</span>paste<span class="p">(</span><span class="s">&quot;x ~ trend + season +&quot;</span><span class="p">,</span> paste<span class="p">(</span>colnames<span class="p">(</span>xreg<span class="p">),</span> collapse<span class="o">=</span> <span class="s">&quot;+&quot;</span><span class="p">)))</span></div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;fit <span class="o">&lt;-</span> tslm<span class="p">(</span>fmla<span class="p">,</span> data<span class="o">=</span>x<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">return</span><span class="p">(</span>forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">,</span> newdata<span class="o">=</span>newxreg<span class="p">)</span><span class="o">$</span>mean<span class="p">)</span></div><div class='line' id='LC42'>&nbsp;&nbsp;<span class="p">}</span> <span class="kr">else</span> <span class="p">{</span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;stop<span class="p">(</span><span class="s">&#39;xreg and newxreg must both be NULL or both be provided&#39;</span><span class="p">)</span></div><div class='line' id='LC44'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC45'><span class="p">})</span></div><div class='line' id='LC46'><br/></div><div class='line' id='LC47'>stsForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC48'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC49'>&nbsp;&nbsp;fit <span class="o">&lt;-</span> StructTS<span class="p">(</span>x<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC50'>&nbsp;&nbsp;forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC51'><span class="p">})</span></div><div class='line' id='LC52'><br/></div><div class='line' id='LC53'>stl.Forecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span> h<span class="p">,</span> method<span class="o">=</span><span class="s">&#39;ets&#39;</span><span class="p">,</span> <span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC54'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC55'>&nbsp;&nbsp;stlf<span class="p">(</span>x<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> method<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">,</span> <span class="kc">...</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC56'><span class="p">})</span></div><div class='line' id='LC57'><br/></div><div class='line' id='LC58'>arimaForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span>xreg<span class="o">=</span><span class="kc">NULL</span><span class="p">,</span>newxreg<span class="o">=</span><span class="kc">NULL</span><span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC59'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC60'>&nbsp;&nbsp;fit <span class="o">&lt;-</span> Arima<span class="p">(</span>x<span class="p">,</span> xreg<span class="o">=</span>xreg<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC61'>&nbsp;&nbsp;forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">,</span> xreg<span class="o">=</span>newxreg<span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC62'><span class="p">})</span></div><div class='line' id='LC63'><br/></div><div class='line' id='LC64'>auto.arimaForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span>xreg<span class="o">=</span><span class="kc">NULL</span><span class="p">,</span>newxreg<span class="o">=</span><span class="kc">NULL</span><span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC65'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC66'>&nbsp;&nbsp;fit <span class="o">&lt;-</span> auto.arima<span class="p">(</span>x<span class="p">,</span> xreg<span class="o">=</span>xreg<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC67'>&nbsp;&nbsp;forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">,</span> xreg<span class="o">=</span>newxreg<span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC68'><span class="p">})</span></div><div class='line' id='LC69'><br/></div><div class='line' id='LC70'>etsForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC71'>&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC72'>&nbsp;&nbsp;fit <span class="o">&lt;-</span> ets<span class="p">(</span>x<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC73'>&nbsp;&nbsp;forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC74'><span class="p">})</span></div><div class='line' id='LC75'><br/></div><div class='line' id='LC76'>batsForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC77'>&nbsp;&nbsp;require<span class="p">(</span><span class="s">&#39;forecast&#39;</span><span class="p">)</span></div><div class='line' id='LC78'>&nbsp;&nbsp;fit <span class="o">&lt;-</span> bats<span class="p">(</span>x<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC79'>&nbsp;&nbsp;forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC80'><span class="p">})</span></div><div class='line' id='LC81'><br/></div><div class='line' id='LC82'>tbatsForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC83'>&nbsp;&nbsp;require<span class="p">(</span><span class="s">&#39;forecast&#39;</span><span class="p">)</span></div><div class='line' id='LC84'>&nbsp;&nbsp;fit <span class="o">&lt;-</span> tbats<span class="p">(</span>x<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC85'>&nbsp;&nbsp;forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC86'><span class="p">})</span></div><div class='line' id='LC87'><br/></div><div class='line' id='LC88'>nnetarForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC89'>&nbsp;&nbsp;require<span class="p">(</span><span class="s">&#39;forecast&#39;</span><span class="p">)</span></div><div class='line' id='LC90'>&nbsp;&nbsp;fit <span class="o">&lt;-</span> nnetar<span class="p">(</span>x<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC91'>&nbsp;&nbsp;forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC92'><span class="p">})</span></div><div class='line' id='LC93'><br/></div><div class='line' id='LC94'>caretForecast <span class="o">&lt;-</span> cmpfun<span class="p">(</span><span class="kr">function</span><span class="p">(</span>x<span class="p">,</span> h<span class="p">,</span> xreg<span class="p">,</span> newxreg<span class="o">=</span><span class="kc">NULL</span><span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC95'>&nbsp;&nbsp;require<span class="p">(</span>caret<span class="p">)</span></div><div class='line' id='LC96'>&nbsp;&nbsp;myData <span class="o">&lt;-</span> data.frame<span class="p">(</span>x<span class="o">=</span>as.numeric<span class="p">(</span>x<span class="p">),</span> xreg<span class="p">)</span></div><div class='line' id='LC97'>&nbsp;&nbsp;fit <span class="o">&lt;-</span> train<span class="p">(</span>x<span class="o">~</span>.<span class="p">,</span> data<span class="o">=</span>myData<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC98'>&nbsp;&nbsp;predict<span class="p">(</span>fit<span class="p">,</span> newdata<span class="o">=</span>newxreg<span class="p">)</span></div><div class='line' id='LC99'><span class="p">})</span></div><div class='line' id='LC100'><br/></div><div class='line' id='LC101'><span class="c1">#Define time-series cv indexes for caretForecast</span></div><div class='line' id='LC102'>createTSfolds <span class="o">&lt;-</span> <span class="kr">function</span><span class="p">(</span>y<span class="p">,</span> Min <span class="o">=</span> max<span class="p">(</span><span class="m">2</span><span class="o">/</span><span class="m">3</span><span class="o">*</span>length<span class="p">(</span>y<span class="p">),</span> <span class="m">3</span><span class="p">),</span> k <span class="o">=</span> <span class="kc">NA</span><span class="p">){</span></div><div class='line' id='LC103'>&nbsp;&nbsp;out <span class="o">=</span> plyr<span class="o">:::</span>llply<span class="p">(</span>Min<span class="o">:</span><span class="p">(</span>length<span class="p">(</span>y<span class="p">)</span> <span class="o">-</span> <span class="m">1</span><span class="p">),</span> seq<span class="p">)</span></div><div class='line' id='LC104'>&nbsp;&nbsp;<span class="kr">if</span> <span class="p">(</span><span class="o">!</span>is.na<span class="p">(</span>k<span class="p">))</span> <span class="p">{</span>out <span class="o">=</span> out<span class="p">[</span>seq<span class="p">(</span><span class="m">1</span><span class="p">,</span> length<span class="p">(</span>out<span class="p">),</span> k<span class="p">)]}</span></div><div class='line' id='LC105'>&nbsp;&nbsp;names<span class="p">(</span>out<span class="p">)</span> <span class="o">&lt;-</span> paste<span class="p">(</span><span class="s">&quot;Fold&quot;</span><span class="p">,</span> gsub<span class="p">(</span><span class="s">&quot; &quot;</span><span class="p">,</span> <span class="s">&quot;0&quot;</span><span class="p">,</span> format<span class="p">(</span>seq<span class="p">(</span>along <span class="o">=</span> out<span class="p">))),</span> sep <span class="o">=</span> <span class="s">&quot;&quot;</span><span class="p">)</span></div><div class='line' id='LC106'>&nbsp;&nbsp;<span class="kr">return</span><span class="p">(</span>out<span class="p">)</span></div><div class='line' id='LC107'><span class="p">}</span></div></pre></div></td>
          </tr>
        </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.02139s from github-fe123-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/zachmayer/cv.ts/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close js-ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

  </body>
</html>

