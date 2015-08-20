Return-Path: <Govindraj.Raja@imgtec.com>
From: Govindraj Raja <govindraj.raja@imgtec.com>
To: <linux-mips@linux-mips.org>, <linux-clk@vger.kernel.org>, Stephen Boyd
	<sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
CC: Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee
	<cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, "Andrew
 Bresticker" <abrestic@chromium.org>, James Hartley
	<James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan
	<James.Hogan@imgtec.com>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Govindraj Raja
	<govindraj.raja@imgtec.com>
Subject: [PATCH v5 0/4] clk: pistachio: Fixes for pll calculations.
Date: Thu, 20 Aug 2015 14:45:51 +0100
Message-ID: <1440078355-8828-1-git-send-email-govindraj.raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Patch 1/4 to 3/4 are pll calculation fixes for clock settings.

Patch 4/4: Is a reword and repost based on earlier thread:
http://patchwork.linux-mips.org/patch/10108/

Series Based on 4.2-rc7
Tested with Pistachio Bring-up-Board.

Changes from v4:
----------------
Fixes comments from Andrew and added Andrew's
reviewed by.

http://patchwork.linux-mips.org/patch/11014/
http://patchwork.linux-mips.org/patch/11016/


Changes from v3:
---------------
Fixes comments to bring back the poll rate table with
unsigned long int as discussed in below thread.

http://patchwork.linux-mips.org/patch/10900/

Changes from v2:
---------------
Fixes comments from Sergei as dicussed in below thread:
http://patchwork.linux-mips.org/patch/10903/

Changes from v1:
---------------
Fix comments from Andrew.
Topics:

* http://patchwork.linux-mips.org/patch/10888/
  (Remove long conversion for pll_rate_table variables)
	
* http://patchwork.linux-mips.org/patch/10889/
  (reword pll to PLL)

* http://patchwork.linux-mips.org/patch/10891/
  (squash 4/6 to 3/6)

* http://patchwork.linux-mips.org/patch/10892/
  (squash 5/6 to 3/6) 

* http://patchwork.linux-mips.org/patch/10893/
  (Add missing signed-off)


Damien.Horsley (1):
  clk: pistachio: correct critical clock list

Zdenko Pulitika (3):
  clk: pistachio: Fix 32bit integer overflows
  clk: pistachio: Fix override of clk-pll settings from boot loader
  clk: pistachio: Fix PLL rate calculation in integer mode

 drivers/clk/pistachio/clk-pistachio.c | 19 ++++++---
 drivers/clk/pistachio/clk-pll.c       | 77 +++++++++++++++++++++++++++--------
 drivers/clk/pistachio/clk.h           | 14 +++----
 3 files changed, 80 insertions(+), 30 deletions(-)

-- 
1.9.1
