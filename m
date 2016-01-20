Return-Path: <lho@apm.com>
Return-Path: <lho@apm.com>
From: Loc Ho <lho@apm.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	patches@apm.com,
	Loc Ho <lho@apm.com>
Subject: [PATCH v2 0/3] clk: xgene: Add SoC and PMD PLL clocks with v2 hardware
Date: Tue, 19 Jan 2016 19:27:40 -0700
Message-Id: <1453256863-15092-1-git-send-email-lho@apm.com>
List-ID: <linux-clk.vger.kernel.org>

Add APM X-Gene SoC and PCP PLL clocks support for v2 hardware.

v2:
* Move the detection of the HW version to compatible string
* Update APM X-Gene clock node binding documentation for v2 hardware
* Update Merlin DT clock node to reflect v2 SoC/PCP PLL hardware
* Fix some minor coding indentation issue with existent code

--
Loc Ho (3):
  Documentation: Update APM X-Gene clock binding for v2 hardware
  clk: xgene: Add SoC and PMD PLL clocks with v2 hardware
  arm64: Update the Merlin DT PCP PLL clock node for v2 hardware

 Documentation/devicetree/bindings/clock/xgene.txt |    2 +
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi        |    2 +-
 drivers/clk/clk-xgene.c                           |  103 +++++++++++++--------
 3 files changed, 69 insertions(+), 38 deletions(-)
