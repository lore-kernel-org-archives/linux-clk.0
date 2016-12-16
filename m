Return-Path: <shawnguo@kernel.org>
From: Shawn Guo <shawnguo@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jun Nie <jun.nie@linaro.org>,
	Baoyou Xie <xie.baoyou@zte.com.cn>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/3] Add audio clocks support for ZTE ZX296718
Date: Fri, 16 Dec 2016 15:26:44 +0800
Message-Id: <1481873207-22929-1-git-send-email-shawnguo@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

From: Shawn Guo <shawn.guo@linaro.org>

It adds missing audio related clocks for ZTE SoC ZX296718.  With these
clocks added, we can get HDMI audio work through SPDIF interface.

Changes for v2:
 - Add a patch to clean up existing driver code.
 - Clean up unused divider configuration lookup table.
 - Use uintptr_t instead of u64 to cast 'reg_base' for summation.
 - Instead of panic, give an error message and return error code when
   of_clk_add_hw_provider() call fails.
 - Drop unnecessary ulong type cast.
 - Use pr_debug instead of pr_info to avoid noisy messages

Jun Nie (1):
  clk: zte: add audio clocks for zx296718

Shawn Guo (2):
  clk: zx296718: do not panic on failure
  dt-bindings: zx296718-clk: add compatible for audio clock controller

 .../devicetree/bindings/clock/zx296718-clk.txt     |   3 +
 drivers/clk/zte/clk-zx296718.c                     | 154 +++++++++++++++++++--
 drivers/clk/zte/clk.c                              | 127 +++++++++++++++++
 drivers/clk/zte/clk.h                              |  21 +++
 4 files changed, 296 insertions(+), 9 deletions(-)

-- 
1.9.1
