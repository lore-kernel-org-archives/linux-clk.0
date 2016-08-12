Return-Path: <keguang.zhang@gmail.com>
Return-Path: <keguang.zhang@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
To: linux-clk@vger.kernel.org,
	linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Keguang Zhang <keguang.zhang@spreadtrum.com>
Subject: [PATCH 0/3] Refactor Loongson1 clock
Date: Fri, 12 Aug 2016 18:51:45 +0800
Message-Id: <1470999108-9851-1-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Keguang Zhang <keguang.zhang@spreadtrum.com>

This patchset is to refactor Loongson1 clock,
and update Loongson1B clocks.

This applies on top of clk-next.

Thanks!

Kelvin Cheung (3):
  clk: Loongson1: Refactor Loongson1 clock
  clk: Loongson1: Update clocks of Loongson1B
  clk: Loongson1: Make use of GENMASK

 drivers/clk/Makefile                               |  2 +-
 drivers/clk/loongson1/Makefile                     |  2 +
 .../clk/{clk-ls1x.c => loongson1/clk-loongson1b.c} | 71 ++++++----------------
 drivers/clk/loongson1/clk.c                        | 52 ++++++++++++++++
 drivers/clk/loongson1/clk.h                        | 21 +++++++
 5 files changed, 93 insertions(+), 55 deletions(-)
 create mode 100644 drivers/clk/loongson1/Makefile
 rename drivers/clk/{clk-ls1x.c => loongson1/clk-loongson1b.c} (68%)
 create mode 100644 drivers/clk/loongson1/clk.c
 create mode 100644 drivers/clk/loongson1/clk.h

-- 
1.9.1
