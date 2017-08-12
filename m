Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:53799 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750848AbdHLMoK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 12 Aug 2017 08:44:10 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v4 0/3] Allwinner R40 CCU driver
Date: Sat, 12 Aug 2017 20:43:49 +0800
Message-Id: <20170812124352.24148-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner R40 has a CCU like other CCUs after A31, however as it contains
many peripherals (especially SATA), the CCU is complicated.

This patchset adds support for it.

Patch 1 is from Priit's A10/A20 CCU patchset, which is needed for
pll-periph0-sata (like the pll-periph-sata on A10/A20).

Patch 2 adds postdiv support for NKM type clock, which is needed for
pll-sata (with a postdiv of 6).

Patch 3 is the main patch, which adds the support for R40 CCU.

Icenowy Zheng (2):
  clk: sunxi-ng: nkm: add support for fixed post-divider
  clk: sunxi-ng: support R40 SoC

Priit Laes (1):
  clk: sunxi-ng: div: Add support for fixed post-divider

 drivers/clk/sunxi-ng/Kconfig              |    5 +
 drivers/clk/sunxi-ng/Makefile             |    1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c      | 1240 +++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h      |   69 ++
 drivers/clk/sunxi-ng/ccu_div.c            |   22 +-
 drivers/clk/sunxi-ng/ccu_div.h            |    3 +-
 drivers/clk/sunxi-ng/ccu_nkm.c            |   22 +-
 drivers/clk/sunxi-ng/ccu_nkm.h            |    2 +
 include/dt-bindings/clock/sun8i-r40-ccu.h |  187 +++++
 include/dt-bindings/reset/sun8i-r40-ccu.h |  130 +++
 10 files changed, 1674 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.h
 create mode 100644 include/dt-bindings/clock/sun8i-r40-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-r40-ccu.h

-- 
2.13.0

