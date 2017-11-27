Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sh2.amlogic.com ([58.32.228.45]:6125 "EHLO
        mail-sh2.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751418AbdK0Jsm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Nov 2017 04:48:42 -0500
From: Yixun Lan <yixun.lan@amlogic.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Carlo Caione <carlo@caione.org>,
        Yixun Lan <yixun.lan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] add clk controller driver for Meson-AXG SoC
Date: Mon, 27 Nov 2017 17:48:42 +0800
Message-ID: <20171127094844.16742-1-yixun.lan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add driver for the clk controller which found in Meson AXG SoC

  Note, we deliberately create a seperate source file for the Meson AXG
series, instead of sharing code with previous GXBB/GXL - the file axg.c
It would help us maintaining the code more easily.

Changes since v1 [1]:
 - rework register definion, use '(offset << 2)' to better match
   the description from data sheet
 - drop "#include dt-bindings/clock/gxbb-aoclkc.h" from dts
 - rebase code to v4.15-rc1

[1] 
  http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005239.html
  http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005240.html
  http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005241.html


Qiufang Dai (2):
  clk: meson-axg: add clock controller drivers
  arm64: dts: meson-axg: add clock DT info for Meson AXG SoC

 arch/arm64/Kconfig.platforms               |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi |  15 +
 drivers/clk/meson/Kconfig                  |   8 +
 drivers/clk/meson/Makefile                 |   1 +
 drivers/clk/meson/axg.c                    | 948 +++++++++++++++++++++++++++++
 drivers/clk/meson/axg.h                    | 126 ++++
 include/dt-bindings/clock/axg-clkc.h       |  72 +++
 7 files changed, 1171 insertions(+)
 create mode 100644 drivers/clk/meson/axg.c
 create mode 100644 drivers/clk/meson/axg.h
 create mode 100644 include/dt-bindings/clock/axg-clkc.h

-- 
2.15.0

