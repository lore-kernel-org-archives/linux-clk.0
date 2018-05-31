Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v4.18-rc1
Date: Thu, 31 May 2018 10:45:31 +0200
Message-Id: <20180531084531.25421-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Michael, Stephen,

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.18-clk

for you to fetch changes up to 5d797111afe12e488e08432fd9b372fae2cc7e93:

  clk: tegra: Add quirk for getting CDEV1/2 clocks on Tegra20 (2018-05-18 12:35:28 +0200)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v4.18-rc1

Contains a proper implementation of the CDEV1/2 clocks on Tegra20.

----------------------------------------------------------------
Dmitry Osipenko (3):
      clk: tegra20: Add DEV1/DEV2 OSC dividers
      clk: tegra20: Correct parents of CDEV1/2 clocks
      clk: tegra: Add quirk for getting CDEV1/2 clocks on Tegra20

 drivers/clk/tegra/clk-tegra114.c |  2 +-
 drivers/clk/tegra/clk-tegra124.c |  2 +-
 drivers/clk/tegra/clk-tegra20.c  | 52 ++++++++++++++++++++++++++++++++++++----
 drivers/clk/tegra/clk-tegra210.c |  2 +-
 drivers/clk/tegra/clk-tegra30.c  |  2 +-
 drivers/clk/tegra/clk.c          |  5 ++--
 drivers/clk/tegra/clk.h          |  2 +-
 7 files changed, 55 insertions(+), 12 deletions(-)
