Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE410FD;
	Sun,  5 Jan 2025 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736088172; cv=none; b=jB34KBFcOk4Lwhgd37lS8a3MYQNTvcbPwfxEzlFppS7/Bw8PUXBYPNMetvXyxhHZoWid2sntHCHiz+x+6ooihSs5WHHJfupfd9KvofaCNWZIHqQYQCvo0T/1X7E7LGUR1CnMAjg17zwT0SBS2BikZ7XPiQrIGd+m+nneqmiVESs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736088172; c=relaxed/simple;
	bh=6BGnUDDq1mySwnhl+zlQlCFd6dSbJTRu98xY1jtLjlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eu4Mjl5195/9TUL3I8jhhkXVkWYDqxZDGmmDJCw3gX/VAhHcDwsss3N36hGZWRGxAceqsNxIyQ1WW1IU476Rd3ULnkQHBHleZSrTdQ+5c7OgH4ntipJjeaTuJSEZP2NHDks5TM6Q+IAlQ1LcDQuFYsN0MaGwfFpIJwk58sbSwj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikJIvnrb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikJIvnrb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4363ae65100so140684135e9.0;
        Sun, 05 Jan 2025 06:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736088169; x=1736692969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RaZP63LlODlhkgW/Sv7eVVJog+or5Lh7FndxDbg2/4=;
        b=ikJIvnrbLsvyb+EDnvGXVO3ykPGiT5k49IV1GFx9pzBIb0KsBoS7V18fpVeWhbIpyg
         6PAMvkgCo1xDVgFFHovxc4LxgHVQHqBKMQdaDiEph43iVsR7uqigXXvs4Hdr1mPJFUfR
         GR6kphAH24nuZS6ht/ZXvkynHLyD1sdWU7+bNHVmmBBzpt2FHeHQwyswsYgXRpT88v4g
         xKt7KEe2+fGKNbeOtrREGat1KgUmJ/uHCIh3YoXWni0octd7sZIYhxA+Jarr+6qsDZs0
         695Zog5tEVzm7OPi5E+D3auPdqW77Fru8uZYj0dqQuSi+XlXoyCnjbp9EDF0EI2k5kZ1
         hPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736088169; x=1736692969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RaZP63LlODlhkgW/Sv7eVVJog+or5Lh7FndxDbg2/4=;
        b=REs64rmwlc96ax+DJ7HPfzpb2apB8GRmk7M9o76rRuXzpnNGf1WJJRSvUMyhURk2+s
         ZV8BsQocwYvJVTFXi38dymFU0lCa1ph06Ep8bNjHv8cYveugolmcEvaVciIHakebdn9+
         n/VCFfsWU1QG5vJcnsb4XKHV16CHsqzTHWwNyunjaiwFF0Xo9k6w8L8U6mKG+5OAZNT8
         2AZUY3YA43QWZNkCkJeM7mRg0f+5crgA7o+BO0sC3nPJwiWWrSFbtu0IR2P/RcI/b7Vn
         aKCTRzET9eOIAAaYI2E8LFAExuFiSp1xHhvTs/zQ/DGIoBavevWCn8cbsR3tB86ZoMMI
         aLeA==
X-Forwarded-Encrypted: i=1; AJvYcCUKhxIU6i9cQ3tcMCxDq89QX3atYTK9KEm9/62c688tBMMssv5kLeRmxTwxVJ8g3euBfh8u2NR79S21IGZr@vger.kernel.org, AJvYcCV+bn4VBLGkmY9hNzgatQv5YrQHvup79ceM8Ge3szxnoadkPEZRXXaHbNzOQNqS2904n2wLOmi8AKGt@vger.kernel.org, AJvYcCXkJzgygskuXd2InYlozi/XyK4N5n2zn6FxpqOxFINw0EXYX/DBmJ0jeEIKZ9gGYdqMMtneoND/jo0i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt9TXnDffpM1Jsp1T3x3eiQ2UiIR36T8D8JTC4Odcyc/mcyYE+
	AgfP33kHydCz4u50WqbWwGivNjSPIlS/fAXCA93Po24QUG1l+O4xXOFliw==
X-Gm-Gg: ASbGncszOyWQUwXZRBwbtXEBFYs7CM3yRhGmSjOeMMQJ5EzwIAqf4L8S5vTt0ooqmUr
	gypj1PNOcmRtteO+ghK82q7L2WRDoJvadTLtIgWZEukvNOkjcclFtCa+HCgy2ys3jlW7oeQS6ES
	8AaCjnCKTE26gJjltJAM+RudQn/bxU+etzmUU4V62f/dspt5CqPpahvR6bfSNlh5QuLUC2gKiCd
	AEGdQe7laNKgedKABx3yGRtAnddhpqZ2kYzRJippU7x92UCCdbPoa6Z4bryBrikhGJHKu4ATgnc
	fGwyAzIfaPSxF5dDLVO9Eti7vUI3DXXE5NRiTM0RnA==
X-Google-Smtp-Source: AGHT+IE+dhS2d4IYp6eELhBgd8bcIPj8a5GN+Vx2v3+BUVCMYBYs90X6s/8TnQ3cvbS1s4C3vKOphw==
X-Received: by 2002:a05:6000:1568:b0:385:dc45:ea22 with SMTP id ffacd0b85a97d-38a223f835dmr44160371f8f.39.1736088169177;
        Sun, 05 Jan 2025 06:42:49 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm537419415e9.10.2025.01.05.06.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 06:42:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 1/4] clk: en7523: Rework clock handling for different clock numbers
Date: Sun,  5 Jan 2025 15:41:58 +0100
Message-ID: <20250105144219.22663-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha EN7581 SoC have additional clock compared to EN7523 but current
driver permits to only support up to EN7523 clock numbers.

To handle this, rework the clock handling and permit to declare the
clocks number in match_data and alloca clk_data based on the compatible
match_data.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v4:
- Move to patch 1 (improve bisectability)
Changes v3:
- Rework num_clocks for en7523
Changes v2:
- Add this patch

 drivers/clk/clk-en7523.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 495c0d607c7d..596847446b14 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -75,6 +75,7 @@ struct en_rst_data {
 };
 
 struct en_clk_soc_data {
+	u32 num_clocks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -504,8 +505,6 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	u32 rate;
 	int i;
 
-	clk_data->num = EN7523_NUM_CLOCKS;
-
 	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7523_base_clks[i];
 		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
@@ -587,8 +586,6 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 
 	hw = en7523_register_pcie_clk(dev, base);
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
-
-	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -702,21 +699,24 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	int r;
 
+	soc_data = device_get_match_data(&pdev->dev);
+
 	clk_data = devm_kzalloc(&pdev->dev,
-				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
+				struct_size(clk_data, hws, soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	soc_data = device_get_match_data(&pdev->dev);
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
 		return r;
 
+	clk_data->num = soc_data->num_clocks;
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
@@ -726,6 +726,8 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	/* We increment num_clocks by 1 to account for additional PCIe clock */
+	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
 		.enable = en7581_pci_enable,
-- 
2.45.2

