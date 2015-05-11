Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: mturquette@linaro.org,
	sboyd@codeaurora.org,
	sebastian.hesselbarth@gmail.com,
	mwelling@ieee.org,
	moinejf@free.fr
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH 0/2] clk: si5351: Multisynth 6-7 fixes
Date: Mon, 11 May 2015 10:44:19 +0200
Message-Id: <1431333859-7224-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

The second synthesis stage in the Si5351 clock generator consists of six
*fractional* multisynth dividers (MS0 .. MS5) and two *even-integer* 
dividers (MS6 and MS7). The current si5351 driver implementation does
not handle MS6 and MS7 correctly, this leads to wrong rates on output 6 
and 7. This patch series fixes that.

Patch 1 fixes the divider calculation for multisynth 6 and 7.

Patch 2 fixes the divider re-calculation for multisynth 6 and 7.

Info: Base on branch 'clk-fixes'.

Sergej Sawazki (2):
  clk: si5351: fix .round_rate for multisynth 6-7
  clk: si5351: fix .recalc_rate for multisynth 6-7

 drivers/clk/clk-si5351.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
1.9.1
