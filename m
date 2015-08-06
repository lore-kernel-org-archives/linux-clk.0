Return-Path: <Govindraj.Raja@imgtec.com>
From: Govindraj Raja <govindraj.raja@imgtec.com>
To: <linux-mips@linux-mips.org>, <linux-clk@vger.kernel.org>, Mike Turquette
	<mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "Michael
 Turquette" <mturquette@baylibre.com>
CC: Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee
	<cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, "Andrew
 Bresticker" <abrestic@chromium.org>, James Hartley
	<James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan
	<James.Hogan@imgtec.com>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
	Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH 0/6] clk: pistachio: Fixes for pll calculations.
Date: Thu, 6 Aug 2015 14:43:28 +0100
Message-ID: <1438868614-7672-1-git-send-email-govindraj.raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Patch 1/6 to 5/6 are pll calculation fixes for clock settings.

Patch 6/6: Is a reword and repost based on earlier thread:
http://patchwork.linux-mips.org/patch/10108/

Series Based on 4.2-rc5
Tested with Pistachio Bring-up-Board.

Damien.Horsley (1):
  clk: pistachio: correct critical clock list

Zdenko Pulitika (5):
  clk: pistachio: Fix 32bit integer overflows
  clk: pistachio: Fix override of clk-pll settings from boot loader
  clk: pistachio: Fix pll rate calculation in integer mode
  clk: pistachio: Set operating mode in .set_rate
  pistachio: pll: Fix vco calculation in .set_rate (fractional)

 drivers/clk/pistachio/clk-pistachio.c | 19 ++++++---
 drivers/clk/pistachio/clk-pll.c       | 75 ++++++++++++++++++++++++++---------
 drivers/clk/pistachio/clk.h           | 18 +++++----
 3 files changed, 82 insertions(+), 30 deletions(-)

-- 
1.9.1
