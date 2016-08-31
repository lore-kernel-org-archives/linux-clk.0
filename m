Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add section for Renesas clock drivers
Date: Wed, 31 Aug 2016 11:49:30 +0200
Message-Id: <1472636970-29817-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add a section for Renesas clock drivers, as found on Renesas ARM SoCs,
and list myself as the maintainer.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e220af2344e6233b..cabe74e526d4d305 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9963,6 +9963,12 @@ F:	drivers/rpmsg/
 F:	Documentation/rpmsg.txt
 F:	include/linux/rpmsg.h
 
+RENESAS CLOCK DRIVERS
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	drivers/clk/renesas/
+
 RENESAS ETHERNET DRIVERS
 R:	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
 L:	netdev@vger.kernel.org
-- 
1.9.1
