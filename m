Return-Path: <kernel@martin.sperl.org>
From: kernel@martin.sperl.org
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: [PATCH 0/2] clk: bcm2835 expose current settings and registers
Date: Mon, 29 Feb 2016 14:20:14 +0000
Message-Id: <1456755616-2472-1-git-send-email-kernel@martin.sperl.org>
List-ID: <linux-clk.vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Expose the raw clock registers and also the current clock settings
(divider, parent, mash divider) via debugfs.

Martin Sperl (2):
  clk: bcm2835: expose raw clock-registers via debugfs
  clk: bcm2835: expose current divider, parent and mash via debugfs

 drivers/clk/bcm/clk-bcm2835.c |  211 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 211 insertions(+)

--
1.7.10.4
