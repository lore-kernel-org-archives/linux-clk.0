Return-Path: <clabbe.montjoie@gmail.com>
Return-Path: <clabbe.montjoie@gmail.com>
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: palmas: constify the palmas_clks_of_match_data structure
Date: Wed, 25 Nov 2015 13:52:01 +0100
Message-Id: <1448455923-28670-1-git-send-email-clabbe.montjoie@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

The palmas_clks_of_match_data structures are never modified.
This patch constify them.

Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/clk/clk-palmas.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 8e3039f..c55e774 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -44,7 +44,7 @@ struct palmas_clock_info {
 	struct clk *clk;
 	struct clk_hw hw;
 	struct palmas *palmas;
-	struct palmas_clk32k_desc *clk_desc;
+	const struct palmas_clk32k_desc *clk_desc;
 	int ext_control_pin;
 };
 
@@ -125,10 +125,10 @@ static struct clk_ops palmas_clks_ops = {
 
 struct palmas_clks_of_match_data {
 	struct clk_init_data init;
-	struct palmas_clk32k_desc desc;
+	const struct palmas_clk32k_desc desc;
 };
 
-static struct palmas_clks_of_match_data palmas_of_clk32kg = {
+static const struct palmas_clks_of_match_data palmas_of_clk32kg = {
 	.init = {
 		.name = "clk32kg",
 		.ops = &palmas_clks_ops,
@@ -144,7 +144,7 @@ static struct palmas_clks_of_match_data palmas_of_clk32kg = {
 	},
 };
 
-static struct palmas_clks_of_match_data palmas_of_clk32kgaudio = {
+static const struct palmas_clks_of_match_data palmas_of_clk32kgaudio = {
 	.init = {
 		.name = "clk32kgaudio",
 		.ops = &palmas_clks_ops,
@@ -240,14 +240,14 @@ static int palmas_clks_probe(struct platform_device *pdev)
 {
 	struct palmas *palmas = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node;
-	struct palmas_clks_of_match_data *match_data;
+	const struct palmas_clks_of_match_data *match_data;
 	const struct of_device_id *match;
 	struct palmas_clock_info *cinfo;
 	struct clk *clk;
 	int ret;
 
 	match = of_match_device(palmas_clks_of_match, &pdev->dev);
-	match_data = (struct palmas_clks_of_match_data *)match->data;
+	match_data = match->data;
 
 	cinfo = devm_kzalloc(&pdev->dev, sizeof(*cinfo), GFP_KERNEL);
 	if (!cinfo)
-- 
2.4.10
