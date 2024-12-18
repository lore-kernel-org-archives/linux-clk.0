Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453FF158208;
	Wed, 18 Dec 2024 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513145; cv=none; b=L+mjufsiV32nWF7jhBH3+qzKOnAjGZ7f5N8hH1i0g2WjJQ5V1MSz+YIuJ7W2pU5uK5mDGz9MrzVXDQPGp+xCDvMKxvskKaFD/v/9RCaMGhzPDhwLOk2n+2AVLcAarQmhCvDKpg+FeLHaZpfhtPIPuULKuk6j8BJagPvfOA2dLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513145; c=relaxed/simple;
	bh=/75dPf6uGSSrgiDcrPKNOmiVliYl0rPebptpBTghadQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpkCc7org2aXPMpAm8WDPJeVTStNwmLMxTDGsoNf4pFd3H05Sj/yz+yndEwne/KBJrLVt0nFReMhupQ54X0DqYdyafLGH5qV1YXpkDJCz2KIrissGG61fQpUzowrqtyzaigp6J7C8mGmNqJYj8oQy/FCpxFES1O0k8cA+3RhpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuVjP1ac; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuVjP1ac"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f796586so68185235e9.3;
        Wed, 18 Dec 2024 01:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734513141; x=1735117941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0TJACVm3ghvo/WIh15FL8/8nTmIzo5zJ50Iu4h1Uj4=;
        b=AuVjP1ac0n7QDv9VFISxLumCBen7pR2v2DYgILTP7Al/WM8h6Uwt7bVpU/8XTwU+EV
         Kz6L7jKoBvl6cLjmYXJNK8dUI1JO/9ZLCmZ61e1H63+RDAS1CCDrXrxs4PwmIDsSvBVm
         1C8ZDaOteMHjUwXhggYOwEKuBytjJtBQx1lC2QD1ltQCDgQGwyHJiADj9p2V3Y5KqJp2
         W1lXsx6Tbd876WUNNTcVS6couDqYKP6Y2teFr6weWyuxABe09T4TR8PS7BccgB/d4cpN
         pzqosG6jnkpdb9lTIkqrtxsTfySshJqKaNn9TBdIObJ7PAEKI1aq/t6Ca2oESVidJ7ej
         ri2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734513141; x=1735117941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0TJACVm3ghvo/WIh15FL8/8nTmIzo5zJ50Iu4h1Uj4=;
        b=Fi3CMOqpDIHt897l/s/BA7t5s/Z3PDI767g4JC+hPJVPFnDvnHSEPr/lFgD3vFsZV/
         DUV0HkwZXopc4DgS70YfLGdshvgLPfVfNK6TAw0tyRswUwkGTAyk7C+4nykz5cOk+wEg
         lK1OkgBar6V0ARddBRtbPOxS5bsiwzzxPSfjh4S5yMpvCMxEg9gHjHjD+CxWgAPqE0mp
         0a/3mh2E6r9GuJ2/rZg2YWRj1RNnpClUxxQglXcl3iHygmceYnsDVxiAbivHSc9ssvDb
         FmNCm+4c4YY3u4X1o1CGIDj3CFBNvOyfLJ3B4+sC41eJBKBo3Xgbe3snNFn7f0eh3f5m
         GgCw==
X-Forwarded-Encrypted: i=1; AJvYcCU1vdlPY7TPJ/Ywr66ebipumW0Y/Imcf4heeWY6t1tKPGog0t9OnGSCdaR9PwplhdoRDg8xnzyIWW6v@vger.kernel.org, AJvYcCVrjNEWKricjeX7mLh6zIeUmpRQ1WF/gMyykXjxzxa6pCjYsuyLzF7Nxz+hNXHmwAuDGDkp4dOcc6Y9@vger.kernel.org, AJvYcCWcbgdwqazrBPyh28pEKJRYwK7h30Gdb0cj4rnhgF0ez14JRW3dOXBKjJrCyz5knEyzODQ3rX1qReYPC7Gc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9saQjBk20FcXWhfLjP4v0HxyZ/PUufYQl5rTlZq0MIxCcdSNS
	JCQ6z+NInPLWDz7oowBywSWF5jw/kiAq6JobPxUv22PPKOJRqO89
X-Gm-Gg: ASbGnctAydyOQdte3ocLjs49hS+LQG4b4LMNR8LtiA4Xi9E865e/ovOrVf8FkRB+X+i
	uk6gWaY7NDD0a4+47s+iU7Epahr30TNr3WMK4loY23ohAFAOf2VprXeBRRPCa85YjvcsjnC4Kau
	HWechYjgZ/n5zjOsKjZtGYeTazdeHJ/JlP55FEXQMf73+oZpGbthxQ1LQrOPR85xqgtH9qw72BY
	ooCeqbD+OdE9pC1N2gG/T/93sROYRstXAQqINFdjwFG27Npgp2mntAfwdfVABcWGZ62vkZTVMFH
	SBqftzEzZOfFdOm+imonTo3Kz1YjPzTlqZ1n4o7S1Jg=
X-Google-Smtp-Source: AGHT+IGngMjAWdogfPSR0vZWpyYzSZ77tP3LolbAOv02XHQqWDQH9ZpQUNkECPFroqRI1B7v8NA2mw==
X-Received: by 2002:a05:600c:4fd1:b0:434:a706:c0fb with SMTP id 5b1f17b1804b1-4365535c40dmr20494205e9.10.1734513141354;
        Wed, 18 Dec 2024 01:12:21 -0800 (PST)
Received: from localhost.localdomain (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c8012034sm13325339f8f.22.2024.12.18.01.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:12:21 -0800 (PST)
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
Subject: [PATCH v2 2/3] clk: en7523: Rework clock handling for different clock numbers
Date: Wed, 18 Dec 2024 10:11:34 +0100
Message-ID: <20241218091153.30088-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218091153.30088-1-ansuelsmth@gmail.com>
References: <20241218091153.30088-1-ansuelsmth@gmail.com>
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
Changes v2:
- Add this patch

 drivers/clk/clk-en7523.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 495c0d607c7d..d77d3d459b40 100644
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
+	.num_clocks = EN7523_NUM_CLOCKS,
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

