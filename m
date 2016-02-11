Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: lee.jones@linaro.org,
	sboyd@codeaurora.org,
	maxime.ripard@free-electrons.com,
	maxime.coquelin@st.com,
	geert@linux-m68k.org,
	heiko@sntech.de,
	andre.przywara@arm.com,
	rklein@nvidia.com,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v42 0/6] critical clocks and handoff clocks
Date: Thu, 11 Feb 2016 13:19:08 -0800
Message-Id: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This series combines Lee's critical clock patches[0] plus some small
fixes and changes with a repost of my handoff clock patches[1]. Both
features are enabled by setting new flags on static clock data within
clock provider drivers.

In addition, there is a new function for setting the CLK_IS_CRITICAL
flag based on the presence of the clock-critical Device Tree property.
This DT property is not a part of the common-clock binding and must be
enabled on a per-binding basis (including adding that property to the
machine-specific binding description). Likewise the new function,
of_clk_detect_critical() must be called by either the clock provider
driver's probe or OF_CLK_DECLARE setup function.

[0] https://lkml.org/lkml/2016/1/18/272
[1] http://www.gossamer-threads.com/lists/linux/kernel/2234337

Lee Jones (3):
  clk: Allow clocks to be marked as CRITICAL
  clk: WARN_ON about to disable a critical clock
  clk: Provide OF helper to mark clocks as CRITICAL

Michael Turquette (3):
  clk: per-user clk prepare & enable ref counts
  clk: clk_put WARNs if user has not disabled clk
  clk: introduce CLK_ENABLE_HAND_OFF flag

 drivers/clk/clk.c            | 127 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/clk-provider.h |  12 +++-
 2 files changed, 134 insertions(+), 5 deletions(-)

-- 
2.1.4
