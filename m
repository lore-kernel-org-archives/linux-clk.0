Return-Path: <Jian.Hu@amlogic.com>
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<narmstrong@baylibre.com>
CC: Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo
 Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yixun Lan
	<yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Bo.yang
	<bo.yang@amlogic.com>, Xingyu.chen <xingyu.chen@amlogic.com>, "Qianggui,song"
	<qianggui.song@amlogic.com>, Sunny.luo <sunny.luo@amlogic.com>,
	<linux-clk@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RESEND PATCH v2 0/2] clk: meson-g12a: Add EE clock controller driver
Date: Mon, 16 Jul 2018 16:11:45 +0800
Message-ID: <1531728707-192230-1-git-send-email-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-Path: jian.hu@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

Add a Clock driver for the Everything-Else part of
the Amlogic Meson-G12A SoC.

Changes since v1 at[1]
-fix typo of 'Everything'.
-change the word ‘AmLogic’ to 'Amlogic'
-squash patch 1 and 2.
-delete usless message of "Trying obsolete regs".
-delete the empty line in include/dt-bindings/clock/g12a-clkc.h.
-rebase on top of the "next/drivers" branch, and add g12a clock patch.
-add CLK_MUX_ROUND_CLOSEST for g12a_sd_emmc_b_clk0_sel and
 g12a_sd_emmc_c_clk0_sel.

I have forgetten adding the PATCH version tag, so resend it 

[1]https://lkml.kernel.org/r/1531133549-25806-2-git-send-email-jian.hu@amlogic.com

Jian Hu (2):
  dt-bindings: clk: meson-g12a: Add G12A EE Clock Bindings
  clk: meson-g12a: Add EE Clock controller driver

 .../bindings/clock/amlogic,gxbb-clkc.txt           |   1 +
 drivers/clk/meson/Kconfig                          |  10 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/g12a.c                           | 994 +++++++++++++++++++++
 drivers/clk/meson/g12a.h                           | 122 +++
 include/dt-bindings/clock/g12a-clkc.h              |  92 ++
 6 files changed, 1220 insertions(+)
 create mode 100644 drivers/clk/meson/g12a.c
 create mode 100644 drivers/clk/meson/g12a.h
 create mode 100644 include/dt-bindings/clock/g12a-clkc.h

-- 
1.9.1
