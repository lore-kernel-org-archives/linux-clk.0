Return-Path: <chris.paterson2@renesas.com>
From: Chris Paterson <chris.paterson2@renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	ramesh.shanmugasundaram@bp.renesas.com,
	Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 0/3] clk: renesas: r8a7796: Add CAN/CAN FD support
Date: Tue, 22 Nov 2016 13:45:59 +0000
Message-Id: <1479822362-4749-1-git-send-email-chris.paterson2@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

This patch series adds clk support for CAN and CAN FD to the r8a7796.

Based on renesas-drivers-2016-11-15-v4.9-rc5.

Chris Paterson (3):
  clk: renesas: r8a7796: Add CAN peripheral clock
  clk: renesas: r8a7796: Add CANFD clock
  clk: renesas: r8a7796: Add CAN FD peripheral clock

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1
