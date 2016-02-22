Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH 8/9] usb: dwc3: Remove impossible check for of_clk_get_parent_count() < 0
Date: Mon, 22 Feb 2016 12:54:46 -0800
Message-Id: <1456174487-28397-9-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The check for < 0 is impossible now that
of_clk_get_parent_count() returns an unsigned int. Simplify the
code and update the types.

Cc: Felipe Balbi <balbi@ti.com>
Cc: <linux-usb@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack so this can go through clk tree along with patch 1.

 drivers/usb/dwc3/dwc3-of-simple.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 9c9f74155066..974335377d9f 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -42,6 +42,7 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	struct device_node	*np = dev->of_node;
 
+	unsigned int		count;
 	int			ret;
 	int			i;
 
@@ -49,11 +50,11 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	if (!simple)
 		return -ENOMEM;
 
-	ret = of_clk_get_parent_count(np);
-	if (ret < 0)
-		return ret;
+	count = of_clk_get_parent_count(np);
+	if (!count)
+		return -ENOENT;
 
-	simple->num_clocks = ret;
+	simple->num_clocks = count;
 
 	simple->clks = devm_kcalloc(dev, simple->num_clocks,
 			sizeof(struct clk *), GFP_KERNEL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
