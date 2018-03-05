Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add eMMC phase clock support for Hi3798CV200
Date: Mon,  5 Mar 2018 15:01:30 +0800
Message-Id: <1520233292-14704-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

The series adds a phase clock type for eMMC support on Hi3798CV200 SoC.
It has a few updates on the first version posted by Jiancheng [1] as
below.

Changes for v2:
 - Rebase to v4.16-rc.
 - Use SPDX-License-Identifier.
 - Coding-style fixes and indentation improvements.
 - Make hisi_phase_clock resource managed, so that unregister function
   calls for this clock can be completely saved.
 - Name phase clock fields degrees vs. regvals to make them more
   explicit.
 - Add .get_phase function support.

[1] https://lkml.org/lkml/2017/10/17/1207

tianshuliang (2):
  clk: hisilicon: add hisi phase clock support
  clk: hi3798cv200: add emmc sample and drive clock

 drivers/clk/hisilicon/Makefile          |   2 +-
 drivers/clk/hisilicon/clk-hisi-phase.c  | 121 ++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk.c             |  24 +++++++
 drivers/clk/hisilicon/clk.h             |  19 +++++
 drivers/clk/hisilicon/crg-hi3798cv200.c |  20 ++++++
 5 files changed, 185 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/hisilicon/clk-hisi-phase.c

-- 
1.9.1
