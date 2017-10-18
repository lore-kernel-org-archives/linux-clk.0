Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <hermit.wangheming@hisilicon.com>, <shawn.guo@linaro.org>,
        <project-aspen-dev@linaro.org>,
        Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 0/3] add more clock definitions for hi3798cv200-poplar board
Date: Wed, 18 Oct 2017 07:00:26 -0400
Message-ID: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Add more clock definitions for hi3798cv200-poplar board.

Younian Wang (1):
  clk: hisilicon: correct ir clock rate for hi3798cv200 SoC

tianshuliang (2):
  clk: hisilicon: add hisi phase clock support
  clk: hisilicon: add emmc sample and drive clock for hi3798cv200 SoC

 drivers/clk/hisilicon/Makefile          |   2 +-
 drivers/clk/hisilicon/clk-hisi-phase.c  | 117 ++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk.c             |  45 ++++++++++++
 drivers/clk/hisilicon/clk.h             |  22 ++++++
 drivers/clk/hisilicon/crg-hi3798cv200.c |  27 +++++++-
 5 files changed, 210 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/hisilicon/clk-hisi-phase.c

-- 
2.7.4
