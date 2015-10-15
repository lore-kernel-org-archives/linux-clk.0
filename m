Return-Path: <wenyou.yang@atmel.com>
From: Wenyou Yang <wenyou.yang@atmel.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni
	<alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard
	<plagnioj@jcrosoft.com>
CC: Russell King <linux@arm.linux.org.uk>, Stephen Boyd
	<sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 0/2] ARM: at91/pm: add ULP1 support
Date: Thu, 15 Oct 2015 11:41:05 +0800
Message-ID: <1444880467-18598-1-git-send-email-wenyou.yang@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: wenyou.yang@atmel.com
List-ID: <linux-clk.vger.kernel.org>

This patch series is to add the ultra Low-power mode 1(ULP1) mode
support.

The ULP1 mode is introduced by SAMA5D2. In ULP1 mode, the system can
achieve the lowest power consumption, and it can be woken up more
quickly, about 30uS.


Wenyou Yang (2):
  ARM: at91/pm: move enter sleep code to a procedure
  ARM: at91/pm: add ultra Low-power mode 1(ULP1) support

 arch/arm/mach-at91/pm.c         |   29 +++++
 arch/arm/mach-at91/pm.h         |    7 ++
 arch/arm/mach-at91/pm_suspend.S |  239 +++++++++++++++++++++++++++++----------
 include/linux/clk/at91_pmc.h    |   36 ++++++
 4 files changed, 249 insertions(+), 62 deletions(-)

-- 
1.7.9.5
