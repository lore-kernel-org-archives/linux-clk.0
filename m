Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Kevin Hilman <khilman@kernel.org>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Bailon <abailon@baylibre.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH v2 0/3] normalize clk API for older platforms
Date: Fri, 21 Jul 2017 17:22:45 +0200
Message-Id: <20170721152250.3310552-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

Based on the earlier feedback so far, I have split out the patch
per platform, improved the davinci implementation, dropped both
ep93xx (which has a proper implementation coming) and mmp (which
is dead code anyway), and decided to do the sa1100 implementation
differnently (without warning).

       Arnd

Arnd Bergmann (3):
  ARM: davinci: normalize clk API
  ARM: sa1100: normalize clk API
  ARM: w90x900: normalize clk API

 arch/arm/mach-davinci/clock.c |  9 +++++++++
 arch/arm/mach-sa1100/clock.c  | 25 +++++++++++++++++++++++++
 arch/arm/mach-w90x900/clock.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

-- 
2.9.0
