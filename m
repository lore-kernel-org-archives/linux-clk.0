Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: lee.jones@linaro.org,
	sboyd@codeaurora.org,
	maxime.ripard@free-electrons.com,
	maxime.coquelin@st.com,
	geert@linux-m68k.org,
	heiko@sntech.de,
	andre.przywara@arm.com,
	rklein@nvidia.com,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v42 2/6] clk: WARN_ON about to disable a critical clock
Date: Thu, 11 Feb 2016 13:19:10 -0800
Message-Id: <1455225554-13267-3-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

From: Lee Jones <lee.jones@linaro.org>

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/clk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 993f775..39f9527 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -575,6 +575,9 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (WARN_ON(core->prepare_count == 0))
 		return;
 
+	if (WARN_ON(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL))
+		return;
+
 	if (--core->prepare_count > 0)
 		return;
 
@@ -680,6 +683,9 @@ static void clk_core_disable(struct clk_core *core)
 	if (WARN_ON(core->enable_count == 0))
 		return;
 
+	if (WARN_ON(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL))
+		return;
+
 	if (--core->enable_count > 0)
 		return;
 
-- 
2.1.4
