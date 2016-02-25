Return-Path: <lars.persson@axis.com>
From: Lars Persson <lars.persson@axis.com>
To: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	robh+dt@kernel.org,
	pawel.moll@arm.com,
	mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org,
	linux-kernel@vger.kernel.org,
	Lars Persson <larper@axis.com>
Subject: [PATCH v4 0/2] clk: Add Artpec-6 SoC support
Date: Thu, 25 Feb 2016 15:58:13 +0100
Message-Id: <cover.1456411894.git.larper@axis.com>
List-ID: <linux-clk.vger.kernel.org>

Add clock support for the Artpec-6 SoC port. The ARM parts are in the series
"arm: Add Artpec-6 SoC" and it goes through the arm-soc tree.

Changes since v3:
- The binding was corrected to handle two fractional divider clocks as input to
  the clock controller.
- Updated clk-artpec6.c to handle a distinct fractional divider input for each
  i2s clock mux.

Changes since v2:
- Moved axis,artpec6-clkctrl.h to the first patch with the DT bindings.

Changes since v1:

- The driver now provides all clocks from the main clock controller block
  through one DT node.
- Added a header file for the clock indexes.
- Refer to clock-bindings.txt in the bindings document.

A platform driver was not possible because the clocks are needed earlier in the
kernel startup.

Lars Persson (2):
  clk: add device tree binding for Artpec-6 clock controller
  clk: add artpec-6 clock controller

 .../devicetree/bindings/clock/artpec6.txt          |  41 +++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/axis/Makefile                          |   1 +
 drivers/clk/axis/clk-artpec6.c                     | 189 +++++++++++++++++++++
 include/dt-bindings/clock/axis,artpec6-clkctrl.h   |  38 +++++
 5 files changed, 270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
 create mode 100644 drivers/clk/axis/Makefile
 create mode 100644 drivers/clk/axis/clk-artpec6.c
 create mode 100644 include/dt-bindings/clock/axis,artpec6-clkctrl.h

-- 
2.1.4
