Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Dong Aisheng <aisheng.dong@freescale.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@baylibre.com>, <shawn.guo@linaro.org>,
	<b29396@freescale.com>, <linux-arm-kernel@lists.infradead.org>,
	<Ranjani.Vaidyanathan@freescale.com>, <b20596@freescale.com>,
	<r64343@freescale.com>, <b20788@freescale.com>
Subject: [PATCH 0/4] clk: imx7d: switch to clk api with CLK_OPS_PARENT_ON enabled
Date: Tue, 28 Jul 2015 21:33:07 +0800
Message-ID: <1438090391-30329-1-git-send-email-aisheng.dong@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

After clk core supports mx7d type clocks, we don't have to enable all clock
by default anymore, this patch series remove the enable all clocks code and
only enable set of minimum required clocks instead.

This patch series depends on:
[PATCH V3 0/5] clk: support clocks which requires parent clock on during operation
http://www.spinics.net/lists/arm-kernel/msg435136.html

Dong Aisheng (4):
  clk: imx: move imx_clk_gate_x into one place
  clk: imx: add clk api for supporting clk_OPS_PARENT_ON clocks
  clk: imx7d: using api with flag CLK_OPS_PARENT_ON
  clk: imx7d: only enable minimum required clocks

 drivers/clk/imx/clk-imx7d.c | 730 ++++++++++++++++++++++----------------------
 drivers/clk/imx/clk.h       |  62 +++-
 2 files changed, 413 insertions(+), 379 deletions(-)

-- 
1.9.1

