Return-Path: <kevin.smith@elecsyscorp.com>
From: Kevin Smith <kevin.smith@elecsyscorp.com>
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC: Kevin Smith <kevin.smith@elecsyscorp.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Gregory
 CLEMENT" <gregory.clement@free-electrons.com>, Thomas Petazzoni
	<thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 1/2] clk: mvebu: Remove corediv clock from Armada XP
Date: Wed, 10 Feb 2016 23:40:17 +0000
Message-ID: <1455147596-16078-1-git-send-email-kevin.smith@elecsyscorp.com>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
In-Reply-To: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

There is no corediv clock on Armada XP, so this is unnecessary.

Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/clk/mvebu/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
index 2769625..e1bc567 100644
--- a/drivers/clk/mvebu/Kconfig
+++ b/drivers/clk/mvebu/Kconfig
@@ -29,7 +29,6 @@ config ARMADA_XP_CLK
 	bool
 	select MVEBU_CLK_COMMON
 	select MVEBU_CLK_CPU
-	select MVEBU_CLK_COREDIV
=20
 config DOVE_CLK
 	bool
--=20
2.4.6
