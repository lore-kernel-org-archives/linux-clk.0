Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>,
	Tero Kristo <t-kristo@ti.com>, Maxime Ripard
	<maxime.ripard@free-electrons.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?=
	<emilio@elopez.com.ar>, Peter Griffin <peter.griffin@linaro.org>, "Gabriel
 FERNANDEZ" <gabriel.fernandez@st.com>, Santosh Shilimkar
	<ssantosh@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/6] clk: make use of of_clk_parent_fill helper function
Date: Wed, 10 Jun 2015 16:49:19 -0500
Message-ID: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Hello,

This patch series makes use of the new of_clk_parent_fill() helper function.
This patch series is not intended for v4.2, as I think it's a bit late, but
I just wanted to make sure people have time to test it. The series is based
on git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git#clk-next.

Thank,

Dinh Nguyen (6):
  clk: at91: make use of of_clk_parent_fill helper function
  clk: qoriq: make use of of_clk_parent_fill helper function
  clk: keystone: make use of of_clk_parent_fill helper function
  clk: st: make use of of_clk_parent_fill helper function
  clk: sunxi: make use of of_clk_parent_fill helper function
  clk: ti: make use of of_clk_parent_fill helper function

 drivers/clk/at91/clk-main.c         |  7 +------
 drivers/clk/at91/clk-master.c       |  7 +------
 drivers/clk/at91/clk-programmable.c |  7 +------
 drivers/clk/at91/clk-slow.c         | 14 ++------------
 drivers/clk/at91/clk-smd.c          |  7 +------
 drivers/clk/at91/clk-usb.c          |  7 +------
 drivers/clk/clk-qoriq.c             |  5 ++---
 drivers/clk/keystone/pll.c          |  3 +--
 drivers/clk/st/clk-flexgen.c        |  6 ++----
 drivers/clk/st/clkgen-mux.c         |  7 ++-----
 drivers/clk/sunxi/clk-a20-gmac.c    |  3 +--
 drivers/clk/sunxi/clk-factors.c     |  4 +---
 drivers/clk/sunxi/clk-sun6i-ar100.c |  3 +--
 drivers/clk/sunxi/clk-sunxi.c       | 10 ++--------
 drivers/clk/ti/apll.c               |  4 +---
 drivers/clk/ti/composite.c          |  4 +---
 drivers/clk/ti/dpll.c               |  4 +---
 drivers/clk/ti/fapll.c              |  3 +--
 drivers/clk/ti/mux.c                |  4 +---
 19 files changed, 24 insertions(+), 85 deletions(-)
---
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "Emilio López" <emilio@elopez.com.ar>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>

-- 
2.2.1
