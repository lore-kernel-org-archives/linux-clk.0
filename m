Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE96A3E92A9;
	Sun, 13 Sep 2026 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303968; cv=none; b=jj0D7LxS7aXhnbkDeYWbFP0QuEtNV1dd+xBCbQ8YR+tNwprzRqly2Ondio7qhfLFk/4Q1MSYuFApKR6Xwb/5NJLt/ZTj+sybXrVNALG3LWhvzQx3BPgg51p9vTNqsuy9OcBQHErKsFRP244yiIOG9jOQTYbEZquyGd/iCjn0OjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303968; c=relaxed/simple;
	bh=i2tbbFBMP9GoLJ/GNZ9/7nTTtJYV2xBE+ugiYvpnO/I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KxyS+wQcpx22jJCFnXwu3Txk3WlyuVHWl4eGeYNzkmpYs0YeF9KwI5ut3vCGA+EMGJFeKT9cHXKnQkg7SITxzmYkhhXBqZgBDceYF9TBIMZlBHSGCDnZd4U3+inEw1bDczpotTdzj4JGlzbZC4qEd8Kp04gqD7wHmuLZTei2bNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=MNDL4t/w; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="MNDL4t/w"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a402;
	Sun, 13 Sep 2026 20:52:41 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] clk: x86: fch: validate registrations and manage their lifetime
Date: Sun, 13 Sep 2026 20:52:39 +0800
Message-Id: <20260913125239.110113-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad3b50503a1kunmd647239d251235
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGElCVkpLGExCGh8eSU4aGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=MNDL4t/waOSdFkKuZqFT1wa+0m8ysXZENruWt+H/RmgeI2Vjf8ZbYrpW74LKT9abU59V4MLdHs9YCm+Ej2K6t/S5ZzgJ2uH5KRe7G+yrjdEsmUJgLFdUe6F//n+Xw9sydoiUk/eGp6LRQQpfKbK/EZjaMvMSSN/ni4IZqqD7tnY=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=NHb7UUJbISYSi3I8xvOh3OsDtG2Zo+qNybIwL7QyvVU=;
	h=date:mime-version:subject:message-id:from;

Fixed-rate and mux registration can fail before clk_set_parent()
evaluates their clk members. Check each registration and the later
parent/clkdev operations. Use managed clock registration so every new
error exit unwinds only successfully registered clocks in reverse order.
Keep the hardware-clock array local and drop the manual remove callback
to avoid unregistering managed clocks twice.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 421bf6a1f061 ("clk: x86: Add ST oscout platform clock")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/clk/x86/clk-fch.c | 109 ++++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 47 deletions(-)

diff --git a/drivers/clk/x86/clk-fch.c b/drivers/clk/x86/clk-fch.c
index cf5cd3ad4647..b66ede14fc22 100644
--- a/drivers/clk/x86/clk-fch.c
+++ b/drivers/clk/x86/clk-fch.c
@@ -35,7 +35,6 @@
 #define AMD_CPU_ID_ST                  0x1576
 
 static const char * const clk_oscout1_parents[] = { "clk48MHz", "clk25MHz" };
-static struct clk_hw *hws[ST_MAX_CLKS];
 
 static const struct pci_device_id fch_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_ST) },
@@ -44,8 +43,10 @@ static const struct pci_device_id fch_pci_ids[] = {
 
 static int fch_clk_probe(struct platform_device *pdev)
 {
+	struct clk_hw *hws[ST_MAX_CLKS];
 	struct fch_clk_data *fch_data;
 	struct pci_dev *rdev;
+	int ret;
 
 	fch_data = dev_get_platdata(&pdev->dev);
 	if (!fch_data || !fch_data->base)
@@ -58,55 +59,70 @@ static int fch_clk_probe(struct platform_device *pdev)
 	}
 
 	if (pci_match_id(fch_pci_ids, rdev)) {
-		hws[ST_CLK_48M] = clk_hw_register_fixed_rate(NULL, "clk48MHz",
-			NULL, 0, 48000000);
-		hws[ST_CLK_25M] = clk_hw_register_fixed_rate(NULL, "clk25MHz",
-			NULL, 0, 25000000);
-
-		hws[ST_CLK_MUX] = clk_hw_register_mux(NULL, "oscout1_mux",
-			clk_oscout1_parents, ARRAY_SIZE(clk_oscout1_parents),
-			0, fch_data->base + CLKDRVSTR2, OSCOUT1CLK25MHZ, 3, 0,
-			NULL);
-
-		clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
-
-		hws[ST_CLK_GATE] = clk_hw_register_gate(NULL, "oscout1",
-			"oscout1_mux", 0, fch_data->base + MISCCLKCNTL1,
-			OSCCLKENB, CLK_GATE_SET_TO_DISABLE, NULL);
-
-		devm_clk_hw_register_clkdev(&pdev->dev, hws[ST_CLK_GATE],
-					    fch_data->name, NULL);
+		hws[ST_CLK_48M] = devm_clk_hw_register_fixed_rate(&pdev->dev, "clk48MHz",
+								  NULL, 0, 48000000);
+		if (IS_ERR(hws[ST_CLK_48M])) {
+			ret = PTR_ERR(hws[ST_CLK_48M]);
+			goto out_put;
+		}
+		hws[ST_CLK_25M] = devm_clk_hw_register_fixed_rate(&pdev->dev, "clk25MHz",
+								  NULL, 0, 25000000);
+		if (IS_ERR(hws[ST_CLK_25M])) {
+			ret = PTR_ERR(hws[ST_CLK_25M]);
+			goto out_put;
+		}
+
+		hws[ST_CLK_MUX] =
+			devm_clk_hw_register_mux(&pdev->dev, "oscout1_mux",
+						 clk_oscout1_parents,
+						 ARRAY_SIZE(clk_oscout1_parents),
+						 0, fch_data->base + CLKDRVSTR2, OSCOUT1CLK25MHZ, 3,
+						 0,
+						 NULL);
+		if (IS_ERR(hws[ST_CLK_MUX])) {
+			ret = PTR_ERR(hws[ST_CLK_MUX]);
+			goto out_put;
+		}
+
+		ret = clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
+		if (ret)
+			goto out_put;
+
+		hws[ST_CLK_GATE] =
+			devm_clk_hw_register_gate(&pdev->dev, "oscout1",
+						  "oscout1_mux", 0, fch_data->base + MISCCLKCNTL1,
+						  OSCCLKENB, CLK_GATE_SET_TO_DISABLE, NULL);
+		if (IS_ERR(hws[ST_CLK_GATE])) {
+			ret = PTR_ERR(hws[ST_CLK_GATE]);
+			goto out_put;
+		}
+
+		ret = devm_clk_hw_register_clkdev(&pdev->dev, hws[ST_CLK_GATE],
+						  fch_data->name, NULL);
 	} else {
-		hws[CLK_48M_FIXED] = clk_hw_register_fixed_rate(NULL, "clk48MHz",
-			NULL, 0, 48000000);
-
-		hws[CLK_GATE_FIXED] = clk_hw_register_gate(NULL, "oscout1",
-			"clk48MHz", 0, fch_data->base + MISCCLKCNTL1,
-			OSCCLKENB, 0, NULL);
-
-		devm_clk_hw_register_clkdev(&pdev->dev, hws[CLK_GATE_FIXED],
-					    fch_data->name, NULL);
+		hws[CLK_48M_FIXED] = devm_clk_hw_register_fixed_rate(&pdev->dev, "clk48MHz",
+								     NULL, 0, 48000000);
+		if (IS_ERR(hws[CLK_48M_FIXED])) {
+			ret = PTR_ERR(hws[CLK_48M_FIXED]);
+			goto out_put;
+		}
+
+		hws[CLK_GATE_FIXED] =
+			devm_clk_hw_register_gate(&pdev->dev, "oscout1",
+						  "clk48MHz", 0, fch_data->base + MISCCLKCNTL1,
+						  OSCCLKENB, 0, NULL);
+		if (IS_ERR(hws[CLK_GATE_FIXED])) {
+			ret = PTR_ERR(hws[CLK_GATE_FIXED]);
+			goto out_put;
+		}
+
+		ret = devm_clk_hw_register_clkdev(&pdev->dev, hws[CLK_GATE_FIXED],
+						  fch_data->name, NULL);
 	}
 
+out_put:
 	pci_dev_put(rdev);
-	return 0;
-}
-
-static void fch_clk_remove(struct platform_device *pdev)
-{
-	int i, clks;
-	struct pci_dev *rdev;
-
-	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
-	if (!rdev)
-		return;
-
-	clks = pci_match_id(fch_pci_ids, rdev) ? CLK_MAX_FIXED : ST_MAX_CLKS;
-
-	for (i = 0; i < clks; i++)
-		clk_hw_unregister(hws[i]);
-
-	pci_dev_put(rdev);
+	return ret;
 }
 
 static struct platform_driver fch_clk_driver = {
@@ -115,6 +131,5 @@ static struct platform_driver fch_clk_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = fch_clk_probe,
-	.remove = fch_clk_remove,
 };
 builtin_platform_driver(fch_clk_driver);
