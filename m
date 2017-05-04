Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com,
	narmstrong@baylibre.com,
	linux-clk@vger.kernel.org
Cc: khilman@baylibre.com,
	carlo@caione.org,
	sboyd@codeaurora.org,
	mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/1] clk: meson: meson8b: mark clk81 as critical
Date: Thu,  4 May 2017 20:32:01 +0200
Message-Id: <20170504183201.13175-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20170504183201.13175-1-martin.blumenstingl@googlemail.com>
References: <20170504183201.13175-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

Disabling clk81 results in an immediate freeze of the whole system. This
can happen "accidentally" when the last child-clock of clk81 is disabled
(in this case the common clock framework also disables clk81, even if it
was only enabled indirectly before).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index e9985503165c..bfd1690724de 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -399,7 +399,7 @@ struct clk_gate meson8b_clk81 = {
 		.ops = &clk_gate_ops,
 		.parent_names = (const char *[]){ "mpeg_clk_div" },
 		.num_parents = 1,
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED | CLK_IS_CRITICAL),
 	},
 };
 
-- 
2.12.2
