Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: shawn.guo@linaro.org,
	jason.liu@linaro.org,
	wan.zhijun@zte.com.cn,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2 0/3] Add ZTE zx296702 audio and gpio clock
Date: Thu, 23 Jul 2015 15:02:50 +0800
Message-Id: <1437634973-27347-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add ZTE zx296702 audio clock and GPIO clock

Changes to v1:
- Fix minor format issue in clk driver.
- Rename clk-pll.c to clk.c.
- Add a patch to constify parent names in clock init data.

Jun Nie (3):
  clk: zx: Add audio div clock method for zx296702
  clk: zx: Add audio and GPIO clock for zx296702
  clk: zx: Constify parent names in clock init data

 drivers/clk/zte/Makefile                   |   2 +-
 drivers/clk/zte/clk-pll.c                  | 172 ----------------
 drivers/clk/zte/clk-zx296702.c             | 126 ++++++++++--
 drivers/clk/zte/clk.c                      | 309 +++++++++++++++++++++++++++++
 drivers/clk/zte/clk.h                      |   9 +
 include/dt-bindings/clock/zx296702-clock.h |  17 +-
 6 files changed, 441 insertions(+), 194 deletions(-)
 delete mode 100644 drivers/clk/zte/clk-pll.c
 create mode 100644 drivers/clk/zte/clk.c

-- 
1.9.1
