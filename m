Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 0/3] clk: Add MDM9615 Clock Controllers driver and bindings
Date: Thu, 11 Aug 2016 14:48:02 +0200
Message-Id: <1470919685-11260-1-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

In order to support the Qualcomm MDM9615 in the Sierra Wireless WP8548
Modules, add the MDM9615 Clock Controllers drivers and bindings.

This patchset is part of a global SoC + Module + Board support for the
Sierra Wireless mangOH Board support with the WP8548 module.

Changes since v1 at http://lkml.kernel.org/r/1466157875-14428-1-git-send-email-narmstrong@baylibre.com :
 - Switch to use DT cxo_board instead of workaround for cxo source
 - re-order patches to add dt-bindings includes before driver
 - Fix config naming to use MDM

Neil Armstrong (3):
  dt-bindings: Add MDM9615 DT bindings include files for GCC and LCC
  clk: mdm9615: Add support for MDM9615 Clock Controllers
  dt-bindings: clock: Update bindings for MDM9615 GCC and LCC

 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 .../devicetree/bindings/clock/qcom,lcc.txt         |    1 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/gcc-mdm9615.c                     | 1727 ++++++++++++++++++++
 drivers/clk/qcom/lcc-mdm9615.c                     |  580 +++++++
 include/dt-bindings/clock/qcom,gcc-mdm9615.h       |  327 ++++
 include/dt-bindings/clock/qcom,lcc-mdm9615.h       |   52 +
 include/dt-bindings/reset/qcom,gcc-mdm9615.h       |  136 ++
 9 files changed, 2843 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-mdm9615.c
 create mode 100644 drivers/clk/qcom/lcc-mdm9615.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-mdm9615.h
 create mode 100644 include/dt-bindings/clock/qcom,lcc-mdm9615.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-mdm9615.h

-- 
1.9.1
