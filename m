Return-Path: <ykaneko0929@gmail.com>
Return-Path: <ykaneko0929@gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFC 0/2] clk: renesas: r8a7795: improve z clock rate
Date: Mon,  8 Aug 2016 02:58:10 +0900
Message-Id: <1470592692-3486-1-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

These patches improve the calculated value of Z clock.

This series is based on the clk-next branch.

Dien Pham (2):
  clk: renesas: r8a7795: Improve the calculated value of Clock.
  clk: renesas: r8a7795: Do rounding for calculated frequency value

 drivers/clk/renesas/clk-rcar-gen2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
1.9.1
