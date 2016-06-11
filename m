Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:62829 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751883AbcFKR4F (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Sat, 11 Jun 2016 13:56:05 -0400
Message-Id: <cover.1465666788.git.moinejf@free.fr>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Sat, 11 Jun 2016 19:39:48 +0200
Subject: [PATCH v2 0/3] clk: sunxi-ng: Add the A83T clocks
To: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch series adds the clocks of the sunxi A83T in the "modern"
clock framework proposed by Maxime Ripard.
It applies on the V2 of his patch series.

It is currently being tested on a Banana Pi M3 with the legacy u-boot.
- working:
	mmc0
	mmc2 (eMMC) but slow clock
	ths
	uart0
	usb0
- not working:
	mmc1 (wifi/bt)
	video (machine freeze on reading/writing the DE I/O memory)
- not yet tested
	audio
	prcm

Jean-Francois Moine (3):
  clk: sunxi-ng: Add N-D-M-P-factor clock support
  clk: sunxi-ng: Add the A83T clocks and resets
  dt: sun8i: Define the clocks of the A83T

 arch/arm/boot/dts/sun8i-a83t.dtsi      |  18 +-
 drivers/clk/sunxi-ng/Makefile          |   3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c  | 675 +++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h      |   1 +
 drivers/clk/sunxi-ng/ccu_ndmp.c        | 239 ++++++++++++
 drivers/clk/sunxi-ng/ccu_ndmp.h        |  96 +++++
 include/dt-bindings/clock/sun8i-a83t.h | 150 ++++++++
 include/dt-bindings/reset/sun8i-a83t.h |  94 +++++
 8 files changed, 1270 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_ndmp.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_ndmp.h
 create mode 100644 include/dt-bindings/clock/sun8i-a83t.h
 create mode 100644 include/dt-bindings/reset/sun8i-a83t.h

-- 
2.8.4

