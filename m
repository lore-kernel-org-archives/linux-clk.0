Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Emilio Lopez <emilio@elopez.com.ar>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 0/4] ARM: sun8i: Fix A23 and A33 clock gates indices 
Date: Fri, 11 Sep 2015 15:26:33 +0200
Message-Id: <1441977997-29041-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi everyone,

Here is a patch set that adds the missing clocks for the message box
in the A33 and A23 SoCs.

In order to support that properly, the addition of a new clock driver
for the A33 has been needed, and we split the gates definition that
was previously shared to each DTSI.

Let me know what you think,
Maxime

Maxime Ripard (4):
  clk: sunxi: Add A33 gates support
  ARM: sun8i: Add the A33 AHB1 gates clock driver
  ARM: sun8i: Move A23 AHB1 gates out of common DTSI
  ARM: sun8i: A23: Add missing msgbox gate

 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 25 -------------------------
 arch/arm/boot/dts/sun8i-a23.dtsi     | 25 +++++++++++++++++++++++++
 arch/arm/boot/dts/sun8i-a33.dtsi     | 27 +++++++++++++++++++++++++++
 drivers/clk/sunxi/clk-simple-gates.c |  2 ++
 4 files changed, 54 insertions(+), 25 deletions(-)

-- 
2.5.1

