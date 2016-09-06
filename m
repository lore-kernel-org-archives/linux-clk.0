Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: shawn.guo@linaro.org,
	jason.liu@linaro.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v3 0/2] Add ZX296718 clock driver
Date: Tue,  6 Sep 2016 14:02:40 +0800
Message-Id: <1473141762-4775-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Changes vs version 2:
  - Use platform driver to initilize instead of CLK_OF_DECLARE.

Jun Nie (2):
  clk: zx: reform pll config info to ease code extension
  clk: zx: register ZX296718 clocks

 .../devicetree/bindings/clock/zx296718-clk.txt     |  35 +
 drivers/clk/zte/Makefile                           |   1 +
 drivers/clk/zte/clk-zx296718.c                     | 924 +++++++++++++++++++++
 drivers/clk/zte/clk.c                              |  21 +-
 drivers/clk/zte/clk.h                              | 129 +++
 include/dt-bindings/clock/zx296718-clock.h         | 164 ++++
 6 files changed, 1265 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/zx296718-clk.txt
 create mode 100644 drivers/clk/zte/clk-zx296718.c
 create mode 100644 include/dt-bindings/clock/zx296718-clock.h

-- 
1.9.1
