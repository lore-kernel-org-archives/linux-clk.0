Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	project-aspen-dev@linaro.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/5] Small updates on hi3798cv200 clock driver
Date: Wed, 24 Jan 2018 19:48:22 +0800
Message-Id: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

This series makes a few small updates on hisilicon hi3798cv200 clock
driver.  I will stage them on a branch if reviewing goes well, and then
send you a pull reqeust at some point of 4.17 development cycle.

Sounds good to you?

Shawn

Jianguo Sun (1):
  clk: hi3798cv200: add COMBPHY0 clock support

Shawn Guo (3):
  clk: hi3798cv200: fix unregister call sequence in error path
  clk: hi3798cv200: add support for HISTB_USB2_OTG_UTMI_CLK
  clk: hi3798cv200: fix define indentation

Younian Wang (1):
  clk: hi3798cv200: correct IR clock parent

 drivers/clk/hisilicon/crg-hi3798cv200.c | 80 ++++++++++++++++++---------------
 include/dt-bindings/clock/histb-clock.h | 55 ++++++++++++-----------
 2 files changed, 72 insertions(+), 63 deletions(-)

-- 
1.9.1
