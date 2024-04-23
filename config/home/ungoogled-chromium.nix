{config, pkgs, ...}:

{
  programs.chromium = {
    package = pkgs.ungoogled-chromium;
    enable = true;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } #UBlock Origin
      { id = "nomnklagbgmgghhjidfhnoelnjfndfpd"; } #Canvas Blocker
      { id = "hhinaapppaileiechjoiifaancjggfjm"; } #Web Scrobbler
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } #Dark Reader
      { id = "chphlpgkkbolifaimnlloiipkdnihall"; } #OneTab
      { id = "hkligngkgcpcolhcnkgccglchdafcnao"; } #Web Archives
      { id = "fpnmgdkabkmnadcjpehmlllkndpkmiak"; } #Wayback Machine
      { id = "mohaicophfnifehkkkdbcejkflmgfkof"; } #Nitter Redirect
      {
        # << LibRedirect >>
	id = "oladmjdebphlnjjcnomfhhbfdldiimaf";
        updateUrl = "https://raw.githubusercontent.com/libredirect/browser_extension/master/src/updates/updates.xml";
      }
      {
        # << Chromium Web Store >>
	id = "ocaahdebbfolfmndjeplogmgcagdmblk";
	updateUrl = "https://raw.githubusercontent.com/NeverDecaf/chromium-web-store/master/updates.xml";
      }
      { id = "nblkbiljcjfemkfjnhoobnojjgjdmknf"; } #PronounDB
      { id = "hlkenndednhfkekhgcdicdfddnkalmdm"; } #Cookie-Editor
      { id = "doojmbjmlfjjnbmnoijecmcbfeoakpjm"; } #NoScript
    ];
  };
}
