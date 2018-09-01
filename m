Return-Path: <sboyd@kernel.org>
From: sboyd@kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.19-rc1
Date: Fri, 31 Aug 2018 19:29:07 -0700
Message-Id: <20180901022907.195811-1-sboyd@kernel.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

From: Stephen Boyd <sboyd@kernel.org>

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to bded6c03e398dc6e862dc8301fb9a60175740653:

  clk: x86: Set default parent to 48Mhz (2018-08-30 14:47:41 -0700)

----------------------------------------------------------------
Two small fixes, one for the x86 Stoney SoC to get a more accurate clk
frequency and the other to fix a bad allocation in the Nuvoton NPCM7XX
driver.

----------------------------------------------------------------
Akshu Agrawal (1):
      clk: x86: Set default parent to 48Mhz

Gustavo A. R. Silva (1):
      clk: npcm7xx: fix memory allocation

 drivers/clk/clk-npcm7xx.c | 4 ++--
 drivers/clk/x86/clk-st.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
Sent by a computer through tubes
