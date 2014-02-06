




<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>cv.ts/R/cv.ts.R at master · zachmayer/cv.ts · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <meta property="fb:app_id" content="1401488693436528"/>

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="zachmayer/cv.ts" name="twitter:title" /><meta content="cv.ts - Cross-validate time series forecasts" name="twitter:description" /><meta content="https://1.gravatar.com/avatar/5bc3aeec09464c41078ccafacfa7832b?d=https%3A%2F%2Fidenticons.github.com%2Fb5604c3ad39e3e079ee38eb511495af8.png&amp;r=x&amp;s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://1.gravatar.com/avatar/5bc3aeec09464c41078ccafacfa7832b?d=https%3A%2F%2Fidenticons.github.com%2Fb5604c3ad39e3e079ee38eb511495af8.png&amp;r=x&amp;s=400" property="og:image" /><meta content="zachmayer/cv.ts" property="og:title" /><meta content="https://github.com/zachmayer/cv.ts" property="og:url" /><meta content="cv.ts - Cross-validate time series forecasts" property="og:description" />

    <meta name="hostname" content="github-fe124-cp1-prd.iad.github.net">
    <meta name="ruby" content="ruby 2.1.0p0-github-tcmalloc (87d8860372) [x86_64-linux]">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035/">
    <link rel="xhr-socket" href="/_sockets" />
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="5772B6A5:53AE:3C99498:52F3CB14" name="octolytics-dimension-request_id" />
    

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="4Ei3nJzw5awDb15JDB5kg9DE3ycg+K0cHrtxKLu/WD0=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-c8eaece92b2ba4da8cdfd619fae679b5161d6b98.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-7f0d7b48b3c00afffc09e3e222de589a9adf9afa.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://github.global.ssl.fastly.net/assets/frameworks-e8d62aa911c75d1d60662859d52c3cf1232675e6.js" type="text/javascript"></script>
      <script async="async" defer="defer" src="https://github.global.ssl.fastly.net/assets/github-6b7bd560c0991d6b250d7e58de8a56752605497f.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="78251706371336786228143a8932e87f">

        <link data-pjax-transient rel='permalink' href='/zachmayer/cv.ts/blob/fb7f624d6b2a63e3a67e5194686025c72d42ec64/R/cv.ts.R'>

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
      <a class="button signin" href="/login?return_to=%2Fzachmayer%2Fcv.ts%2Fblob%2Fmaster%2FR%2Fcv.ts.R">Sign in</a>
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
          


<!-- blob contrib key: blob_contributors:v21:5f503349440f0b702f0f53ead42561e2 -->

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
              <a href="/zachmayer/cv.ts/blob/master/R/cv.ts.R"
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
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/zachmayer/cv.ts" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">cv.ts</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/zachmayer/cv.ts/tree/master/R" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">R</span></a></span><span class="separator"> / </span><strong class="final-path">cv.ts.R</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="R/cv.ts.R" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  <div class="commit file-history-tease">
    <img alt="Zach Mayer" class="main-avatar" height="24" src="https://2.gravatar.com/avatar/5bc3aeec09464c41078ccafacfa7832b?d=https%3A%2F%2Fidenticons.github.com%2Fb5604c3ad39e3e079ee38eb511495af8.png&amp;r=x&amp;s=140" width="24" />
    <span class="author"><a href="/zachmayer" rel="author">zachmayer</a></span>
    <time class="js-relative-date" data-title-format="YYYY-MM-DD HH:mm:ss" datetime="2013-06-25T13:19:09-07:00" title="2013-06-25 13:19:09">June 25, 2013</time>
    <div class="commit-title">
        <a href="/zachmayer/cv.ts/commit/05882412566467432f9f1fe9dfce1dac2b7cf351" class="message" data-pjax="true" title="Updated to work with the new version of forecast

Should add a requirement for forecast 4.05">Updated to work with the new version of forecast</a>
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
          <span>236 lines (194 sloc)</span>
        <span>6.857 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
            <a class="minibutton tooltipped leftwards"
               href="http://windows.github.com" title="Open this file in GitHub for Windows">
                <span class="octicon octicon-device-desktop"></span> Open
            </a>
              <a class="minibutton disabled tooltipped leftwards" href="#"
                 title="You must be signed in to make or propose changes">Edit</a>
          <a href="/zachmayer/cv.ts/raw/master/R/cv.ts.R" class="button minibutton " id="raw-url">Raw</a>
            <a href="/zachmayer/cv.ts/blame/master/R/cv.ts.R" class="button minibutton js-update-url-with-hash">Blame</a>
          <a href="/zachmayer/cv.ts/commits/master/R/cv.ts.R" class="button minibutton " rel="nofollow">History</a>
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
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>
<span id="L121" rel="#L121">121</span>
<span id="L122" rel="#L122">122</span>
<span id="L123" rel="#L123">123</span>
<span id="L124" rel="#L124">124</span>
<span id="L125" rel="#L125">125</span>
<span id="L126" rel="#L126">126</span>
<span id="L127" rel="#L127">127</span>
<span id="L128" rel="#L128">128</span>
<span id="L129" rel="#L129">129</span>
<span id="L130" rel="#L130">130</span>
<span id="L131" rel="#L131">131</span>
<span id="L132" rel="#L132">132</span>
<span id="L133" rel="#L133">133</span>
<span id="L134" rel="#L134">134</span>
<span id="L135" rel="#L135">135</span>
<span id="L136" rel="#L136">136</span>
<span id="L137" rel="#L137">137</span>
<span id="L138" rel="#L138">138</span>
<span id="L139" rel="#L139">139</span>
<span id="L140" rel="#L140">140</span>
<span id="L141" rel="#L141">141</span>
<span id="L142" rel="#L142">142</span>
<span id="L143" rel="#L143">143</span>
<span id="L144" rel="#L144">144</span>
<span id="L145" rel="#L145">145</span>
<span id="L146" rel="#L146">146</span>
<span id="L147" rel="#L147">147</span>
<span id="L148" rel="#L148">148</span>
<span id="L149" rel="#L149">149</span>
<span id="L150" rel="#L150">150</span>
<span id="L151" rel="#L151">151</span>
<span id="L152" rel="#L152">152</span>
<span id="L153" rel="#L153">153</span>
<span id="L154" rel="#L154">154</span>
<span id="L155" rel="#L155">155</span>
<span id="L156" rel="#L156">156</span>
<span id="L157" rel="#L157">157</span>
<span id="L158" rel="#L158">158</span>
<span id="L159" rel="#L159">159</span>
<span id="L160" rel="#L160">160</span>
<span id="L161" rel="#L161">161</span>
<span id="L162" rel="#L162">162</span>
<span id="L163" rel="#L163">163</span>
<span id="L164" rel="#L164">164</span>
<span id="L165" rel="#L165">165</span>
<span id="L166" rel="#L166">166</span>
<span id="L167" rel="#L167">167</span>
<span id="L168" rel="#L168">168</span>
<span id="L169" rel="#L169">169</span>
<span id="L170" rel="#L170">170</span>
<span id="L171" rel="#L171">171</span>
<span id="L172" rel="#L172">172</span>
<span id="L173" rel="#L173">173</span>
<span id="L174" rel="#L174">174</span>
<span id="L175" rel="#L175">175</span>
<span id="L176" rel="#L176">176</span>
<span id="L177" rel="#L177">177</span>
<span id="L178" rel="#L178">178</span>
<span id="L179" rel="#L179">179</span>
<span id="L180" rel="#L180">180</span>
<span id="L181" rel="#L181">181</span>
<span id="L182" rel="#L182">182</span>
<span id="L183" rel="#L183">183</span>
<span id="L184" rel="#L184">184</span>
<span id="L185" rel="#L185">185</span>
<span id="L186" rel="#L186">186</span>
<span id="L187" rel="#L187">187</span>
<span id="L188" rel="#L188">188</span>
<span id="L189" rel="#L189">189</span>
<span id="L190" rel="#L190">190</span>
<span id="L191" rel="#L191">191</span>
<span id="L192" rel="#L192">192</span>
<span id="L193" rel="#L193">193</span>
<span id="L194" rel="#L194">194</span>
<span id="L195" rel="#L195">195</span>
<span id="L196" rel="#L196">196</span>
<span id="L197" rel="#L197">197</span>
<span id="L198" rel="#L198">198</span>
<span id="L199" rel="#L199">199</span>
<span id="L200" rel="#L200">200</span>
<span id="L201" rel="#L201">201</span>
<span id="L202" rel="#L202">202</span>
<span id="L203" rel="#L203">203</span>
<span id="L204" rel="#L204">204</span>
<span id="L205" rel="#L205">205</span>
<span id="L206" rel="#L206">206</span>
<span id="L207" rel="#L207">207</span>
<span id="L208" rel="#L208">208</span>
<span id="L209" rel="#L209">209</span>
<span id="L210" rel="#L210">210</span>
<span id="L211" rel="#L211">211</span>
<span id="L212" rel="#L212">212</span>
<span id="L213" rel="#L213">213</span>
<span id="L214" rel="#L214">214</span>
<span id="L215" rel="#L215">215</span>
<span id="L216" rel="#L216">216</span>
<span id="L217" rel="#L217">217</span>
<span id="L218" rel="#L218">218</span>
<span id="L219" rel="#L219">219</span>
<span id="L220" rel="#L220">220</span>
<span id="L221" rel="#L221">221</span>
<span id="L222" rel="#L222">222</span>
<span id="L223" rel="#L223">223</span>
<span id="L224" rel="#L224">224</span>
<span id="L225" rel="#L225">225</span>
<span id="L226" rel="#L226">226</span>
<span id="L227" rel="#L227">227</span>
<span id="L228" rel="#L228">228</span>
<span id="L229" rel="#L229">229</span>
<span id="L230" rel="#L230">230</span>
<span id="L231" rel="#L231">231</span>
<span id="L232" rel="#L232">232</span>
<span id="L233" rel="#L233">233</span>
<span id="L234" rel="#L234">234</span>
<span id="L235" rel="#L235">235</span>

            </td>
            <td class="blob-line-code"><div class="code-body highlight"><pre><div class='line' id='LC1'><span class="c1">#Fix progress bar when using parallel backend?</span></div><div class='line' id='LC2'><span class="c1">#Add Garch, bats, tbats, fourrier, wavelets, and farima functions</span></div><div class='line' id='LC3'><span class="c1">#Fix RMSE calculation over all horizons</span></div><div class='line' id='LC4'><span class="c1">#Create tuning grids for forecast functions</span></div><div class='line' id='LC5'><span class="c1">#Add BoxCox.lambda method to tsControl</span></div><div class='line' id='LC6'><br/></div><div class='line' id='LC7'><span class="c1">#best.ts: Return an object (for the best tune) with:</span></div><div class='line' id='LC8'><span class="c1">#	1. Data frame of parameters+error metric at selected horizon</span></div><div class='line' id='LC9'><span class="c1">#	2. Cross validated stats at each horizon+overall average for final model</span></div><div class='line' id='LC10'><span class="c1">#		2a. Additional row &quot;best&quot;, where best model at each step (and horizon)</span></div><div class='line' id='LC11'><span class="c1">#			is used for the next</span></div><div class='line' id='LC12'><span class="c1">#	3. Data frame of best parameters at each point, selected by error metric at selected horizon</span></div><div class='line' id='LC13'><span class="c1">#	4. Best parameters for final model</span></div><div class='line' id='LC14'><span class="c1">#	5. Final model prediction data frame</span></div><div class='line' id='LC15'><span class="c1">#	6. Each step best model prediction data frame</span></div><div class='line' id='LC16'><span class="c1">#	7. Actuals data frame</span></div><div class='line' id='LC17'><br/></div><div class='line' id='LC18'><span class="c1">#Load Packages</span></div><div class='line' id='LC19'>stopifnot<span class="p">(</span>require<span class="p">(</span>compiler<span class="p">))</span></div><div class='line' id='LC20'><br/></div><div class='line' id='LC21'><span class="c1">#Test if an object exists</span></div><div class='line' id='LC22'>testObject <span class="o">&lt;-</span> <span class="kr">function</span><span class="p">(</span>object<span class="p">){</span> </div><div class='line' id='LC23'>&nbsp;&nbsp;exists<span class="p">(</span>as.character<span class="p">(</span>substitute<span class="p">(</span>object<span class="p">)))</span></div><div class='line' id='LC24'><span class="p">}</span></div><div class='line' id='LC25'><br/></div><div class='line' id='LC26'><span class="c1">#Default summary function</span></div><div class='line' id='LC27'>tsSummary <span class="o">&lt;-</span> <span class="kr">function</span><span class="p">(</span>P<span class="p">,</span>A<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC28'>data.frame<span class="p">((</span>as.data.frame<span class="p">(</span>accuracy<span class="p">(</span>P<span class="p">,</span>A<span class="p">))))</span></div><div class='line' id='LC29'><span class="p">}</span></div><div class='line' id='LC30'><br/></div><div class='line' id='LC31'><span class="c1">#Default Cross-validation control</span></div><div class='line' id='LC32'>tseriesControl <span class="o">&lt;-</span> <span class="kr">function</span><span class="p">(</span>stepSize<span class="o">=</span><span class="m">1</span><span class="p">,</span> maxHorizon<span class="o">=</span><span class="m">1</span><span class="p">,</span> minObs<span class="o">=</span><span class="m">12</span><span class="p">,</span> fixedWindow<span class="o">=</span><span class="kc">TRUE</span><span class="p">,</span></div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;summaryFunc<span class="o">=</span>tsSummary<span class="p">,</span> preProcess<span class="o">=</span><span class="kc">FALSE</span><span class="p">,</span> ppMethod<span class="o">=</span><span class="s">&#39;guerrero&#39;</span><span class="p">){</span></div><div class='line' id='LC34'>&nbsp;&nbsp;list<span class="p">(</span>stepSize<span class="o">=</span>stepSize<span class="p">,</span> </div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;maxHorizon<span class="o">=</span>maxHorizon<span class="p">,</span> </div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;minObs<span class="o">=</span>minObs<span class="p">,</span> </div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fixedWindow<span class="o">=</span>fixedWindow<span class="p">,</span> </div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;summaryFunc<span class="o">=</span>summaryFunc<span class="p">,</span> </div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;preProcess<span class="o">=</span>preProcess<span class="p">,</span> </div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ppMethod<span class="o">=</span>ppMethod<span class="p">)</span></div><div class='line' id='LC41'><span class="p">}</span></div><div class='line' id='LC42'><br/></div><div class='line' id='LC43'><span class="c1">#Function to cross-validate a time series.</span></div><div class='line' id='LC44'>cv.ts <span class="o">&lt;-</span> <span class="kr">function</span><span class="p">(</span>x<span class="p">,</span> FUN<span class="p">,</span> tsControl<span class="o">=</span>tseriesControl<span class="p">(),</span> xreg<span class="o">=</span><span class="kc">NULL</span><span class="p">,</span> progress<span class="o">=</span><span class="kc">TRUE</span><span class="p">,</span> <span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC45'><br/></div><div class='line' id='LC46'>	<span class="c1">#Load required packages</span></div><div class='line' id='LC47'>	stopifnot<span class="p">(</span>is.ts<span class="p">(</span>x<span class="p">))</span></div><div class='line' id='LC48'>	stopifnot<span class="p">(</span>is.data.frame<span class="p">(</span>xreg<span class="p">)</span> <span class="o">|</span> is.matrix<span class="p">(</span>xreg<span class="p">)</span> <span class="o">|</span> is.null<span class="p">(</span>xreg<span class="p">))</span></div><div class='line' id='LC49'>	stopifnot<span class="p">(</span>require<span class="p">(</span>forecast<span class="p">))</span></div><div class='line' id='LC50'>	stopifnot<span class="p">(</span>require<span class="p">(</span>foreach<span class="p">))</span></div><div class='line' id='LC51'>	stopifnot<span class="p">(</span>require<span class="p">(</span>plyr<span class="p">))</span></div><div class='line' id='LC52'><br/></div><div class='line' id='LC53'>	<span class="c1">#Load parameters from the tsControl list</span></div><div class='line' id='LC54'>	stepSize <span class="o">&lt;-</span> tsControl<span class="o">$</span>stepSize</div><div class='line' id='LC55'>	maxHorizon <span class="o">&lt;-</span> tsControl<span class="o">$</span>maxHorizon</div><div class='line' id='LC56'>	minObs <span class="o">&lt;-</span> tsControl<span class="o">$</span>minObs</div><div class='line' id='LC57'>	fixedWindow <span class="o">&lt;-</span> tsControl<span class="o">$</span>fixedWindow</div><div class='line' id='LC58'>	summaryFunc <span class="o">&lt;-</span> tsControl<span class="o">$</span>summaryFunc</div><div class='line' id='LC59'>	preProcess <span class="o">&lt;-</span> tsControl<span class="o">$</span>preProcess</div><div class='line' id='LC60'>	ppMethod <span class="o">&lt;-</span> tsControl<span class="o">$</span>ppMethod</div><div class='line' id='LC61'><br/></div><div class='line' id='LC62'>	<span class="c1">#Make sure xreg object is long enough for last set of forecasts</span></div><div class='line' id='LC63'>	<span class="kr">if</span> <span class="p">(</span><span class="o">!</span> is.null<span class="p">(</span>xreg<span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC64'>		xreg <span class="o">&lt;-</span> as.matrix<span class="p">(</span>xreg<span class="p">)</span></div><div class='line' id='LC65'><br/></div><div class='line' id='LC66'>		<span class="kr">if</span> <span class="p">(</span>nrow<span class="p">(</span>xreg<span class="p">)</span><span class="o">&lt;</span>length<span class="p">(</span>x<span class="p">)</span><span class="o">+</span>maxHorizon<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC67'>			warning<span class="p">(</span><span class="s">&#39;xreg object too short to forecast beyond the length of the time series.</span></div><div class='line' id='LC68'><span class="s">					Appending NA values to xreg&#39;</span><span class="p">)</span></div><div class='line' id='LC69'>			nRows <span class="o">&lt;-</span> <span class="p">(</span>length<span class="p">(</span>x<span class="p">)</span><span class="o">+</span>maxHorizon<span class="p">)</span><span class="o">-</span>nrow<span class="p">(</span>xreg<span class="p">)</span></div><div class='line' id='LC70'>			nCols <span class="o">&lt;-</span> dim<span class="p">(</span>xreg<span class="p">)[</span><span class="m">2</span><span class="p">]</span></div><div class='line' id='LC71'>			addRows <span class="o">&lt;-</span> matrix<span class="p">(</span>rep<span class="p">(</span><span class="kc">NA</span><span class="p">,</span>nCols<span class="o">*</span>nRows<span class="p">),</span>nrow<span class="o">=</span>nRows<span class="p">,</span> ncol<span class="o">=</span>nCols<span class="p">)</span></div><div class='line' id='LC72'>			colnames<span class="p">(</span>addRows<span class="p">)</span> <span class="o">&lt;-</span> colnames<span class="p">(</span>xreg<span class="p">)</span></div><div class='line' id='LC73'>			xreg <span class="o">&lt;-</span> rbind<span class="p">(</span>xreg<span class="p">,</span>addRows<span class="p">)</span></div><div class='line' id='LC74'>		<span class="p">}</span></div><div class='line' id='LC75'><br/></div><div class='line' id='LC76'>	<span class="p">}</span></div><div class='line' id='LC77'><br/></div><div class='line' id='LC78'>	<span class="c1">#Define additional parameters</span></div><div class='line' id='LC79'>	freq <span class="o">&lt;-</span> frequency<span class="p">(</span>x<span class="p">)</span></div><div class='line' id='LC80'>	n <span class="o">&lt;-</span> length<span class="p">(</span>x<span class="p">)</span></div><div class='line' id='LC81'>	st <span class="o">&lt;-</span> tsp<span class="p">(</span>x<span class="p">)[</span><span class="m">1</span><span class="p">]</span><span class="o">+</span><span class="p">(</span>minObs<span class="m">-2</span><span class="p">)</span><span class="o">/</span>freq</div><div class='line' id='LC82'><br/></div><div class='line' id='LC83'>	<span class="c1">#Create a matrix of actual values.</span></div><div class='line' id='LC84'>	<span class="c1">#X is the point in time, Y is the forecast horizon</span></div><div class='line' id='LC85'>	<span class="c1">#http://stackoverflow.com/questions/8140577/creating-a-matrix-of-future-values-for-a-time-series</span></div><div class='line' id='LC86'>	formatActuals <span class="o">&lt;-</span> <span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>maxHorizon<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC87'>		actuals <span class="o">&lt;-</span> outer<span class="p">(</span>seq_along<span class="p">(</span>x<span class="p">),</span> seq_len<span class="p">(</span>maxHorizon<span class="p">),</span> FUN<span class="o">=</span><span class="s">&quot;+&quot;</span><span class="p">)</span></div><div class='line' id='LC88'>		actuals <span class="o">&lt;-</span> apply<span class="p">(</span>actuals<span class="p">,</span><span class="m">2</span><span class="p">,</span><span class="kr">function</span><span class="p">(</span>a<span class="p">)</span> x<span class="p">[</span>a<span class="p">])</span></div><div class='line' id='LC89'>		actuals</div><div class='line' id='LC90'>	<span class="p">}</span></div><div class='line' id='LC91'><br/></div><div class='line' id='LC92'>	actuals <span class="o">&lt;-</span> formatActuals<span class="p">(</span>x<span class="p">,</span>maxHorizon<span class="p">)</span></div><div class='line' id='LC93'>	actuals <span class="o">&lt;-</span> actuals<span class="p">[</span>minObs<span class="o">:</span><span class="p">(</span>length<span class="p">(</span>x<span class="p">)</span><span class="m">-1</span><span class="p">),,</span>drop<span class="o">=</span><span class="kc">FALSE</span><span class="p">]</span></div><div class='line' id='LC94'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC95'>	<span class="c1">#Create a list of training windows</span></div><div class='line' id='LC96'>	<span class="c1">#Each entry of this list will be the same length, if fixed=TRUE</span></div><div class='line' id='LC97'>	steps <span class="o">&lt;-</span> seq<span class="p">(</span><span class="m">1</span><span class="p">,(</span>n<span class="o">-</span>minObs<span class="p">),</span>by<span class="o">=</span>stepSize<span class="p">)</span></div><div class='line' id='LC98'><br/></div><div class='line' id='LC99'>	<span class="c1">#Set progressbar</span></div><div class='line' id='LC100'>	combine <span class="o">&lt;-</span> rbind</div><div class='line' id='LC101'>	<span class="kr">if</span> <span class="p">(</span>progress<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC102'>	  f <span class="o">&lt;-</span> <span class="kr">function</span><span class="p">(){</span></div><div class='line' id='LC103'>	    pb <span class="o">&lt;-</span> txtProgressBar<span class="p">(</span><span class="m">1</span><span class="p">,</span>length<span class="p">(</span>steps<span class="p">)</span><span class="m">-1</span><span class="p">,</span>style<span class="o">=</span><span class="m">3</span><span class="p">)</span></div><div class='line' id='LC104'>	    count <span class="o">&lt;-</span> <span class="m">0</span></div><div class='line' id='LC105'>	    <span class="kr">function</span><span class="p">(</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC106'>	      count <span class="o">&lt;&lt;-</span> count <span class="o">+</span> length<span class="p">(</span>list<span class="p">(</span><span class="kc">...</span><span class="p">))</span> <span class="o">-</span> <span class="m">1</span></div><div class='line' id='LC107'>	      setTxtProgressBar<span class="p">(</span>pb<span class="p">,</span>count<span class="p">)</span></div><div class='line' id='LC108'>	      Sys.sleep<span class="p">(</span><span class="m">0.01</span><span class="p">)</span></div><div class='line' id='LC109'>	      flush.console<span class="p">()</span></div><div class='line' id='LC110'>	      rbind<span class="p">(</span><span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC111'>	    <span class="p">}</span></div><div class='line' id='LC112'>	  <span class="p">}</span></div><div class='line' id='LC113'>	  combine <span class="o">&lt;-</span> f<span class="p">()</span></div><div class='line' id='LC114'>	<span class="p">}</span></div><div class='line' id='LC115'>&nbsp;&nbsp;</div><div class='line' id='LC116'>	<span class="c1">#At each point in time, calculate &#39;maxHorizon&#39; forecasts ahead</span></div><div class='line' id='LC117'>	forecasts <span class="o">&lt;-</span> foreach<span class="p">(</span>i<span class="o">=</span>steps<span class="p">,</span> .combine<span class="o">=</span>combine<span class="p">,</span> .multicombine<span class="o">=</span><span class="kc">FALSE</span><span class="p">,</span></div><div class='line' id='LC118'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.packages<span class="o">=</span>c<span class="p">(</span><span class="s">&#39;forecast&#39;</span><span class="p">),</span> .export<span class="o">=</span>c<span class="p">(</span><span class="s">&#39;testObject&#39;</span><span class="p">,</span> <span class="s">&#39;tsSummary&#39;</span><span class="p">,</span> <span class="s">&#39;tseriesControl&#39;</span><span class="p">))</span> <span class="o">%dopar%</span> <span class="p">{</span></div><div class='line' id='LC119'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC120'>		<span class="kr">if</span> <span class="p">(</span>is.null<span class="p">(</span>xreg<span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC121'>			<span class="kr">if</span> <span class="p">(</span>fixedWindow<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC122'>				xshort <span class="o">&lt;-</span> window<span class="p">(</span>x<span class="p">,</span> start<span class="o">=</span>st<span class="o">+</span><span class="p">(</span>i<span class="o">-</span>minObs<span class="m">+1</span><span class="p">)</span><span class="o">/</span>freq<span class="p">,</span> end<span class="o">=</span>st<span class="o">+</span>i<span class="o">/</span>freq<span class="p">)</span></div><div class='line' id='LC123'><br/></div><div class='line' id='LC124'>			<span class="p">}</span> <span class="kr">else</span> <span class="p">{</span> </div><div class='line' id='LC125'>				xshort <span class="o">&lt;-</span> window<span class="p">(</span>x<span class="p">,</span> end<span class="o">=</span>st <span class="o">+</span> i<span class="o">/</span>freq<span class="p">)</span></div><div class='line' id='LC126'>			<span class="p">}</span></div><div class='line' id='LC127'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC128'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">if</span> <span class="p">(</span>preProcess<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC129'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">if</span> <span class="p">(</span>testObject<span class="p">(</span>lambda<span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC130'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stop<span class="p">(</span><span class="s">&quot;Don&#39;t specify a lambda parameter when preProcess==TRUE&quot;</span><span class="p">)</span></div><div class='line' id='LC131'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC132'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stepLambda <span class="o">&lt;-</span> BoxCox.lambda<span class="p">(</span>xshort<span class="p">,</span> method<span class="o">=</span>ppMethod<span class="p">)</span></div><div class='line' id='LC133'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xshort <span class="o">&lt;-</span> BoxCox<span class="p">(</span>xshort<span class="p">,</span> stepLambda<span class="p">)</span></div><div class='line' id='LC134'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC135'><br/></div><div class='line' id='LC136'>			out <span class="o">&lt;-</span> FUN<span class="p">(</span>xshort<span class="p">,</span> h<span class="o">=</span>maxHorizon<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC137'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC138'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">if</span> <span class="p">(</span>preProcess<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC139'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;out <span class="o">&lt;-</span> InvBoxCox<span class="p">(</span>out<span class="p">,</span> stepLambda<span class="p">)</span></div><div class='line' id='LC140'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC141'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC142'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">return</span><span class="p">(</span>out<span class="p">)</span></div><div class='line' id='LC143'><br/></div><div class='line' id='LC144'>		<span class="p">}</span> <span class="kr">else</span> <span class="kr">if</span> <span class="p">(</span><span class="o">!</span> is.null<span class="p">(</span>xreg<span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC145'>			<span class="kr">if</span> <span class="p">(</span>fixedWindow<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC146'>				xshort <span class="o">&lt;-</span> window<span class="p">(</span>x<span class="p">,</span> start<span class="o">=</span>st<span class="o">+</span><span class="p">(</span>i<span class="o">-</span>minObs<span class="m">+1</span><span class="p">)</span><span class="o">/</span>freq<span class="p">,</span> end<span class="o">=</span>st<span class="o">+</span>i<span class="o">/</span>freq<span class="p">)</span></div><div class='line' id='LC147'>				xregshort <span class="o">&lt;-</span> xreg<span class="p">[((</span>i<span class="p">)</span><span class="o">:</span><span class="p">(</span>i<span class="o">+</span>minObs<span class="m">-1</span><span class="p">)),,</span>drop<span class="o">=</span><span class="kc">FALSE</span><span class="p">]</span></div><div class='line' id='LC148'>			<span class="p">}</span> <span class="kr">else</span> <span class="p">{</span> </div><div class='line' id='LC149'>				xshort <span class="o">&lt;-</span> window<span class="p">(</span>x<span class="p">,</span> end<span class="o">=</span>st <span class="o">+</span> i<span class="o">/</span>freq<span class="p">)</span></div><div class='line' id='LC150'>				xregshort <span class="o">&lt;-</span> xreg<span class="p">[(</span><span class="m">1</span><span class="o">:</span><span class="p">(</span>i<span class="o">+</span>minObs<span class="m">-1</span><span class="p">)),,</span>drop<span class="o">=</span><span class="kc">FALSE</span><span class="p">]</span></div><div class='line' id='LC151'>			<span class="p">}</span></div><div class='line' id='LC152'>			newxreg <span class="o">&lt;-</span> xreg<span class="p">[(</span>i<span class="o">+</span>minObs<span class="p">)</span><span class="o">:</span><span class="p">(</span>i<span class="o">+</span>minObs<span class="m">-1</span><span class="o">+</span>maxHorizon<span class="p">),,</span>drop<span class="o">=</span><span class="kc">FALSE</span><span class="p">]</span></div><div class='line' id='LC153'>&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC154'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">if</span> <span class="p">(</span>preProcess<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC155'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">if</span> <span class="p">(</span>testObject<span class="p">(</span>lambda<span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC156'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stop<span class="p">(</span><span class="s">&quot;Don&#39;t specify a lambda parameter when preProcess==TRUE&quot;</span><span class="p">)</span></div><div class='line' id='LC157'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC158'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stepLambda <span class="o">&lt;-</span> BoxCox.lambda<span class="p">(</span>xshort<span class="p">,</span> method<span class="o">=</span>ppMethod<span class="p">)</span></div><div class='line' id='LC159'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xshort <span class="o">&lt;-</span> BoxCox<span class="p">(</span>xshort<span class="p">,</span> stepLambda<span class="p">)</span></div><div class='line' id='LC160'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC161'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC162'>			out <span class="o">&lt;-</span> FUN<span class="p">(</span>xshort<span class="p">,</span> h<span class="o">=</span>maxHorizon<span class="p">,</span> </div><div class='line' id='LC163'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xreg<span class="o">=</span>xregshort<span class="p">,</span> newxreg<span class="o">=</span>newxreg<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC164'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC165'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">if</span> <span class="p">(</span>preProcess<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC166'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;out <span class="o">&lt;-</span> InvBoxCox<span class="p">(</span>out<span class="p">,</span> stepLambda<span class="p">)</span></div><div class='line' id='LC167'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC168'><br/></div><div class='line' id='LC169'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">return</span><span class="p">(</span>out<span class="p">)</span></div><div class='line' id='LC170'>		<span class="p">}</span></div><div class='line' id='LC171'>&nbsp;</div><div class='line' id='LC172'>	<span class="p">}</span></div><div class='line' id='LC173'><br/></div><div class='line' id='LC174'>	<span class="c1">#Extract the actuals we actually want to use</span></div><div class='line' id='LC175'>	actuals <span class="o">&lt;-</span> actuals<span class="p">[</span>steps<span class="p">,,</span>drop<span class="o">=</span><span class="kc">FALSE</span><span class="p">]</span></div><div class='line' id='LC176'><br/></div><div class='line' id='LC177'>	<span class="c1">#Accuracy at each horizon</span></div><div class='line' id='LC178'>	out <span class="o">&lt;-</span> data.frame<span class="p">(</span></div><div class='line' id='LC179'>					ldply<span class="p">(</span><span class="m">1</span><span class="o">:</span>maxHorizon<span class="p">,</span> </div><div class='line' id='LC180'>						<span class="kr">function</span><span class="p">(</span>horizon<span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC181'>							P <span class="o">&lt;-</span> forecasts<span class="p">[,</span>horizon<span class="p">,</span>drop<span class="o">=</span><span class="kc">FALSE</span><span class="p">]</span></div><div class='line' id='LC182'>							A <span class="o">&lt;-</span> na.omit<span class="p">(</span>actuals<span class="p">[,</span>horizon<span class="p">,</span>drop<span class="o">=</span><span class="kc">FALSE</span><span class="p">])</span></div><div class='line' id='LC183'>							P <span class="o">&lt;-</span> P<span class="p">[</span><span class="m">1</span><span class="o">:</span>length<span class="p">(</span>A<span class="p">)]</span></div><div class='line' id='LC184'>							P <span class="o">&lt;-</span> na.omit<span class="p">(</span>P<span class="p">)</span></div><div class='line' id='LC185'>							A <span class="o">&lt;-</span> A<span class="p">[</span><span class="m">1</span><span class="o">:</span>length<span class="p">(</span>P<span class="p">)]</span></div><div class='line' id='LC186'>							summaryFunc<span class="p">(</span>P<span class="p">,</span>A<span class="p">)</span></div><div class='line' id='LC187'>						<span class="p">}</span></div><div class='line' id='LC188'>					<span class="p">)</span></div><div class='line' id='LC189'>				<span class="p">)</span></div><div class='line' id='LC190'><br/></div><div class='line' id='LC191'>	<span class="c1">#Add average accuracy, across all horizons</span></div><div class='line' id='LC192'>	overall <span class="o">&lt;-</span> colMeans<span class="p">(</span>out<span class="p">)</span></div><div class='line' id='LC193'>	out <span class="o">&lt;-</span> rbind<span class="p">(</span>out<span class="p">,</span>overall<span class="p">)</span></div><div class='line' id='LC194'>&nbsp;&nbsp;results <span class="o">&lt;-</span> data.frame<span class="p">(</span>horizon<span class="o">=</span>c<span class="p">(</span><span class="m">1</span><span class="o">:</span>maxHorizon<span class="p">,</span><span class="s">&#39;All&#39;</span><span class="p">),</span>out<span class="p">)</span></div><div class='line' id='LC195'><br/></div><div class='line' id='LC196'>	<span class="c1">#Add a column for which horizon and output</span></div><div class='line' id='LC197'>	<span class="kr">return</span><span class="p">(</span>list<span class="p">(</span>actuals<span class="o">=</span>actuals<span class="p">,</span> forecasts<span class="o">=</span>forecasts<span class="p">,</span> results<span class="o">=</span>results<span class="p">))</span></div><div class='line' id='LC198'><span class="p">}</span></div><div class='line' id='LC199'><br/></div><div class='line' id='LC200'><br/></div><div class='line' id='LC201'><br/></div><div class='line' id='LC202'><span class="c1">###########################</span></div><div class='line' id='LC203'><span class="c1">#Functions for testing</span></div><div class='line' id='LC204'><span class="c1">###########################</span></div><div class='line' id='LC205'><br/></div><div class='line' id='LC206'><span class="kr">if</span> <span class="p">(</span><span class="kc">FALSE</span><span class="p">){</span></div><div class='line' id='LC207'>&nbsp;&nbsp;arimaForecast2 <span class="o">&lt;-</span> <span class="kr">function</span><span class="p">(</span>x<span class="p">,</span>h<span class="p">,</span>params<span class="p">,</span><span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC208'>&nbsp;&nbsp;&nbsp;&nbsp;require<span class="p">(</span>forecast<span class="p">)</span></div><div class='line' id='LC209'>&nbsp;&nbsp;&nbsp;&nbsp;order<span class="o">=</span>c<span class="p">(</span>params<span class="o">$</span>p<span class="p">,</span>params<span class="o">$</span>d<span class="p">,</span>params<span class="o">$</span>q<span class="p">)</span></div><div class='line' id='LC210'>&nbsp;&nbsp;&nbsp;&nbsp;Drift<span class="o">=</span>params<span class="o">$</span>Drift</div><div class='line' id='LC211'>&nbsp;&nbsp;&nbsp;&nbsp;fit <span class="o">&lt;-</span> Arima<span class="p">(</span>x<span class="p">,</span> order<span class="o">=</span>order<span class="p">,</span> include.drift<span class="o">=</span>Drift<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC212'>&nbsp;&nbsp;&nbsp;&nbsp;forecast<span class="p">(</span>fit<span class="p">,</span> h<span class="o">=</span>h<span class="p">,</span> level<span class="o">=</span><span class="m">99</span><span class="p">)</span><span class="o">$</span>mean</div><div class='line' id='LC213'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC214'>&nbsp;&nbsp;</div><div class='line' id='LC215'>&nbsp;&nbsp;best.ts <span class="o">&lt;-</span>  <span class="kr">function</span><span class="p">(</span>x<span class="p">,</span> FUN<span class="p">,</span> atHorizon<span class="p">,</span> metric<span class="p">,</span> tuneGrid<span class="p">,</span> tsControl<span class="o">=</span>tseriesControl<span class="p">(),</span> <span class="kc">...</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC216'>&nbsp;&nbsp;&nbsp;&nbsp;out <span class="o">&lt;-</span> tuneGrid</div><div class='line' id='LC217'>&nbsp;&nbsp;&nbsp;&nbsp;out<span class="p">[,</span>metric<span class="p">]</span> <span class="o">&lt;-</span> <span class="kc">NA</span></div><div class='line' id='LC218'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC219'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kr">for</span> <span class="p">(</span>row <span class="kr">in</span> <span class="m">1</span><span class="o">:</span>nrow<span class="p">(</span>tuneGrid<span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC220'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;params <span class="o">&lt;-</span> tuneGrid<span class="p">[</span>row<span class="p">,]</span></div><div class='line' id='LC221'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tryCatch<span class="p">({</span></div><div class='line' id='LC222'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result <span class="o">&lt;-</span> cv.ts<span class="p">(</span>x<span class="p">,</span> FUN<span class="p">,</span> tsControl<span class="p">,</span> params<span class="o">=</span>params<span class="p">,</span> <span class="kc">...</span><span class="p">)</span></div><div class='line' id='LC223'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;out<span class="p">[</span>row<span class="p">,</span>metric<span class="p">]</span> <span class="o">&lt;-</span> result<span class="o">$</span>results<span class="p">[</span>atHorizon<span class="p">,</span> metric<span class="p">]</span></div><div class='line' id='LC224'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">},</span> error <span class="o">=</span> <span class="kr">function</span><span class="p">(</span>e<span class="p">)</span> <span class="kc">NA</span><span class="p">)</span></div><div class='line' id='LC225'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC226'>&nbsp;&nbsp;&nbsp;&nbsp;out</div><div class='line' id='LC227'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC228'>&nbsp;&nbsp;</div><div class='line' id='LC229'>&nbsp;&nbsp;<span class="c1">#model &lt;- best.ts(a10, arimaForecast2, </span></div><div class='line' id='LC230'>&nbsp;&nbsp;<span class="c1">#                 atHorizon=1, </span></div><div class='line' id='LC231'>&nbsp;&nbsp;<span class="c1">#                 metric=&#39;MAPE&#39;, </span></div><div class='line' id='LC232'>&nbsp;&nbsp;<span class="c1">#                 tuneGrid=expand.grid(p=0:5, d=0:1, q=0:5, Drift=FALSE))</span></div><div class='line' id='LC233'>&nbsp;&nbsp;<span class="c1">#model</span></div><div class='line' id='LC234'><span class="p">}</span></div><div class='line' id='LC235'><br/></div></pre></div></td>
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
      <li>&copy; 2014 <span title="0.06077s from github-fe124-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
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

