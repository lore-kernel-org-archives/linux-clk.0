Return-Path: <lori.hikichi@broadcom.com>
Return-Path: <lori.hikichi@broadcom.com>
From: Lori Hikichi <lori.hikichi@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lori Hikichi <lori.hikichi@broadcom.com>
Subject: [PATCH v1 0/4] clk: iproc: Enable glitchless pll rate change
Date: Mon, 14 Aug 2017 12:00:37 -0700
Message-Id: <1502737241-2040-1-git-send-email-lori.hikichi@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

This patchset enables the ability for the iproc plls to do small rate changes
without glitching the clock.

Lori Hikichi (4):
  clk: iproc: Allow iproc pll to runtime calculate vco parameters
  clk: iproc: Fix error in the pll post divider rate calculation
  clk: iproc: Allow plls to do minor rate changes without reset
  clk: iproc: Minor tidy up of iproc pll data structures

 drivers/clk/bcm/clk-cygnus.c    |  25 +---
 drivers/clk/bcm/clk-iproc-pll.c | 260 ++++++++++++++++++++++++++++------------
 drivers/clk/bcm/clk-iproc.h     |   5 +
 3 files changed, 192 insertions(+), 98 deletions(-)

-- 
1.9.1
