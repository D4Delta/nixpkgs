{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "reviewdog";
  version = "0.13.1";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-IBAJePrqliriOkZRWLAU7hllpGr4DVs8rzD2yyOXZzM=";
  };

  vendorSha256 = "sha256-6TBurIWct6k4X+0lZ9FYgTc+DQgTpEIS7HUr0V7n++I=";

  doCheck = false;

  subPackages = [ "cmd/reviewdog" ];

  ldflags = [ "-s" "-w" "-X github.com/reviewdog/reviewdog/commands.Version=${version}" ];

  meta = with lib; {
    description = "Automated code review tool integrated with any code analysis tools regardless of programming language";
    homepage = "https://github.com/reviewdog/reviewdog";
    changelog = "https://github.com/reviewdog/reviewdog/raw/v${version}/CHANGELOG.md";
    maintainers = [ maintainers.marsam ];
    license = licenses.mit;
  };
}
