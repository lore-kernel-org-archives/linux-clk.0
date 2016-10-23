Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2 3/5] clk: pxa: b bit of clkcfg means fast bus
Date: Sun, 23 Oct 2016 14:19:28 +0200
Message-Id: <1477225170-19019-4-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

The meaning of this bit was inverted :
 - when set to 0, system bus clock is half of the CPU run clock
 - when set to 1, system bus clock is the CPU run clock

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/clk/pxa/clk-pxa27x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index 3930053543a3..3b36e8d0f81e 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -291,9 +291,9 @@ static unsigned long clk_pxa27x_system_bus_get_rate(struct clk_hw *hw,
 	if (osc_forced)
 		return parent_rate;
 	if (b)
-		return parent_rate / 2;
-	else
 		return parent_rate;
+	else
+		return parent_rate / 2;
 }
 
 static u8 clk_pxa27x_system_bus_get_parent(struct clk_hw *hw)
-- 
2.1.4
