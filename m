Return-Path: <keguang.zhang@gmail.com>
Return-Path: <keguang.zhang@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
To: linux-clk@vger.kernel.org,
	linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH V1 0/3] Refactor Loongson1 clock
Date: Mon, 19 Sep 2016 12:38:53 +0800
Message-Id: <1474259936-9657-1-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patchset is to refactor Loongson1 clock,
and update Loongson1B clocks.

This applies on top of clk-next.

Thanks!

Changelog:
v1:
   Rebase the patch on clk: ls1x: Migrate to clk_hw based OF
   and registration APIs.

Kelvin Cheung (3):
  clk: Loongson1: Refactor Loongson1 clock
  clk: Loongson1: Update clocks of Loongson1B
  clk: Loongson1: Make use of GENMASK

 drivers/clk/Makefile                               |  2 +-
 drivers/clk/loongson1/Makefile                     |  2 +
 .../clk/{clk-ls1x.c => loongson1/clk-loongson1b.c} | 74 +++++-----------------
 drivers/clk/loongson1/clk.c                        | 43 +++++++++++++
 drivers/clk/loongson1/clk.h                        | 19 ++++++
 5 files changed, 82 insertions(+), 58 deletions(-)
 create mode 100644 drivers/clk/loongson1/Makefile
 rename drivers/clk/{clk-ls1x.c => loongson1/clk-loongson1b.c} (67%)
 create mode 100644 drivers/clk/loongson1/clk.c
 create mode 100644 drivers/clk/loongson1/clk.h

-- 
1.9.1
