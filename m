Return-Path: <clabbe.montjoie@gmail.com>
Return-Path: <clabbe.montjoie@gmail.com>
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: palmas: fix a possible NULL dereference
Date: Wed, 25 Nov 2015 13:52:02 +0100
Message-Id: <1448455923-28670-2-git-send-email-clabbe.montjoie@gmail.com>
In-Reply-To: <1448455923-28670-1-git-send-email-clabbe.montjoie@gmail.com>
References: <1448455923-28670-1-git-send-email-clabbe.montjoie@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

of_match_device could return NULL, and so cause a NULL pointer
dereference later.
Even if the probability of this case is very low, fixing it made
static analyzers happy.

Solving this with of_device_get_match_data made also code simplier.

Reported-by: coverity (CID 1324137)
Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/clk/clk-palmas.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index c55e774..9c0b8e6 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -241,13 +241,13 @@ static int palmas_clks_probe(struct platform_device *pdev)
 	struct palmas *palmas = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node;
 	const struct palmas_clks_of_match_data *match_data;
-	const struct of_device_id *match;
 	struct palmas_clock_info *cinfo;
 	struct clk *clk;
 	int ret;
 
-	match = of_match_device(palmas_clks_of_match, &pdev->dev);
-	match_data = match->data;
+	match_data = of_device_get_match_data(&pdev->dev);
+	if (!match_data)
+		return 1;
 
 	cinfo = devm_kzalloc(&pdev->dev, sizeof(*cinfo), GFP_KERNEL);
 	if (!cinfo)
-- 
2.4.10
