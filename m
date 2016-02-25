Return-Path: <ramesh.shanmugasundaram@bp.renesas.com>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: geert+renesas@glider.be,
	laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chris.paterson2@renesas.com,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 0/3] CAN & CAN FD clk support for r8a7795 SoC
Date: Thu, 25 Feb 2016 17:05:23 +0000
Message-Id: <1456419926-8732-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
List-ID: <linux-clk.vger.kernel.org>

This patch set adds CAN & CAN FD clk support for r8a7795 SoC.

This set is based on linux-next repo(tag: next-20160225).

Ramesh Shanmugasundaram (3):
  clk: shmobile: r8a7795: Add CAN peripheral clock
  clk: shmobile: r8a7795: Add CANFD clock
  clk: shmobile: r8a7795: Add CAN FD peripheral clock

 drivers/clk/shmobile/r8a7795-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1
