Return-Path: <Jian.Hu@amlogic.com>
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<narmstrong@baylibre.com>
CC: Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo
 Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <yixun.lan@amlogic.com>, Qiufang
 Dai <qiufang.dai@amlogic.com>, Bo.yang <bo.yang@amlogic.com>, Xingyu.chen
	<xingyu.chen@amlogic.com>, "Qianggui,song" <qianggui.song@amlogic.com>,
	Sunny.luo <sunny.luo@amlogic.com>, <linux-clk@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/3] clk: meson-g12a: Add EE clock controller driver
Date: Mon, 9 Jul 2018 19:12:44 +0800
Message-ID: <1531134767-29927-1-git-send-email-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: jian.hu@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

Add a Clock driver for the Everyting-Else part of
the Amlogic Meson-G12A SoC.

Jian Hu (3):
  dt-bindings: clk: g12a: New binding for Meson-G12A SoC
  dt-bindings: clk: meson-g12a: Add G12A EE Clock Bindings
  clk: meson-g12a: Add EE Clock controller driver

 .../bindings/clock/amlogic,gxbb-clkc.txt           |   1 +
 drivers/clk/meson/Kconfig                          |  10 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/g12a.c                           | 992 +++++++++++++++++++++
 drivers/clk/meson/g12a.h                           | 123 +++
 include/dt-bindings/clock/g12a-clkc.h              |  93 ++
 6 files changed, 1220 insertions(+)
 create mode 100644 drivers/clk/meson/g12a.c
 create mode 100644 drivers/clk/meson/g12a.h
 create mode 100644 include/dt-bindings/clock/g12a-clkc.h

-- 
1.9.1
