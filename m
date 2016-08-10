Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH] MAINTAINERS: Add linux-clk patchwork URL
Date: Wed, 10 Aug 2016 15:35:53 -0700
Message-Id: <20160810223553.22345-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The common clk framework has a patchwork associated with it.
Update the maintainers file to reflect this.

Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bb1d00098c..5436d3addce9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3150,6 +3150,7 @@ COMMON CLK FRAMEWORK
 M:	Michael Turquette <mturquette@baylibre.com>
 M:	Stephen Boyd <sboyd@codeaurora.org>
 L:	linux-clk@vger.kernel.org
+Q:	http://patchwork.kernel.org/project/linux-clk/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
