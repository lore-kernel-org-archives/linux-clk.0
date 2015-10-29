Return-Path: <wenyou.yang@atmel.com>
From: Wenyou Yang <wenyou.yang@atmel.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni
	<alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard
	<plagnioj@jcrosoft.com>
CC: Russell King <linux@arm.linux.org.uk>, Stephen Boyd
	<sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Kumar
 Gala" <galak@codeaurora.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Wenyou Yang
	<wenyou.yang@atmel.com>
Subject: [RFC PATCH 0/2] ARM: at91/pm: init fast startup signal to the PMC
Date: Thu, 29 Oct 2015 13:55:45 +0800
Message-ID: <1446098147-32487-1-git-send-email-wenyou.yang@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: wenyou.yang@atmel.com
List-ID: <linux-clk.vger.kernel.org>

This patch is to initialize the fast startup signal to the PMC.

The patch is based on patch set:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/376493.html


Wenyou Yang (2):
  ARM: at91: pm: init fast startup trigger signals to PMC
  ARM: at91/dt: sama5d2_xplained: add pmc_fast_restart node

 arch/arm/boot/dts/at91-sama5d2_xplained.dts |    8 ++++
 arch/arm/mach-at91/pm.c                     |   60 +++++++++++++++++++++++++++
 include/linux/clk/at91_pmc.h                |   32 ++++++++++++++
 3 files changed, 100 insertions(+)

-- 
1.7.9.5
