Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	Linux-MIPS <linux-mips@linux-mips.org>
Subject: [PATCH] MIPS: Alchemy: Include clk.h
Date: Mon, 13 Jul 2015 13:30:50 -0700
Message-Id: <1436819450-16440-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Manuel Lauss <manuel.lauss@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Linux-MIPS <linux-mips@linux-mips.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack so this can go through the clk tree. We're removing
the include of clk.h in clk-provider.h so that the consumer
and provider APIs are clearly split.

 arch/mips/alchemy/common/clock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index 6e46abe0dac6..5168c4dca1ca 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -35,6 +35,7 @@
 
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/slab.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
