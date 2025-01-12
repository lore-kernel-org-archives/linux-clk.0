Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514A11B4F1A;
	Sun, 12 Jan 2025 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689228; cv=none; b=c/4y6y1b7VYXo8zH1RPlADXYGelJVHukIoKjUMUhHYhYiKoittXMJpek0f/Edd9sMLLf5Rc4i43BcG0ahlujhUalMHZkHvp97ESgvdpmH+kE4gPJbw0+mwnNrNa6VhFiTdYF51wjnvDQkCUK9oQ7JOzbCblG14V9TbtzJcjVHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689228; c=relaxed/simple;
	bh=4nokxWWJY5ve/7W60N6Ia7EO10/TIMgZKx9cUVoS9Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yr5WKTlSXkcbtEuHRQeCthVVClWcnsMgzLjjc9M+1+PKZdvjMMFJIz7x+DJYpY9RRBpi0xMySCpSwBdpvC+1FjQHxmPLFIhRQoc+5yM7R7wX0zK5SDlZ7WGq4PabIFL0JAZrZCrPDibiWboRy9xrEkn5wnLVsmdZRzndEuKzILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apE525LZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apE525LZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so616043566b.2;
        Sun, 12 Jan 2025 05:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736689224; x=1737294024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lK39FCcn7LGTYm2sUP7UEjK+3FHE1v1EW7tCRSIYh30=;
        b=apE525LZqDs64eR1pfUq/RNabnmQJQgc7oCH1mnYXA9KiVh54gVc1bh7hZddMFFLlB
         tq/qq6xNMFscAeQV9MWbY4cNsgDeqaSet2+5JNBPP38n9DdqwQLWJEXHXXfnB90HpBsV
         VJ7vLoDAt1TH2pb5P3hy2y7dXEx6LQ2DmUczTlVpCPYjG8d8T0H31WRD8yNnos4up+z2
         4lW2A3iOHJBlC34C9DvSRW9vDfF+LEycqOKvrWMBggEO5mrSa48n20KLyuiqs+Ww1gvp
         X27jpGs7plRqD/O/xzIncaOXcMyimrOHxcBVnSnDblnej5MJNcV97KpcmzYmzz4Q1sqC
         xFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689224; x=1737294024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lK39FCcn7LGTYm2sUP7UEjK+3FHE1v1EW7tCRSIYh30=;
        b=sg7fpnsxY0hvcVqXLYmq9X54vhJ90VA5qIRLoAt1lAQptdq+Oa1G1/FsHV3upnGGcP
         mytLUyidSquEJqSBFYs5DFLB9zgCskR2I/FS9Ema7gv0qSoGX5s758FZqSoUwH+6GbOP
         X8SnOOq5m5mmjVY3S9HyCOk9DvfGpvjwytQm+AYEI7jcddhegiiUHWc4xtKj8Cig4DFg
         OQjgBJsVl/zfM3tKin9Z66cLNioetGTlGB4DMlGRN01lfsBv4DgwGCbN/u5qXh08s0+j
         c3D1EtHIykZ40NHB5CbKfoJ3aL/3JnWdkqqV5mNf9azcDBFEpXK8AjoKzWe1+11LK4al
         FirA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Suhm1MSkQsE1RfSEK6singivMdYmZ6863OUzYsAhlxf1M3TwG89fBREcRQEQylWhr2O/VKp+V91d@vger.kernel.org, AJvYcCU9J/0d/xTzkZRon3M4u9qbt0eb82ifHpARq3W9pqlJZH19pgWpmkuzG1zhfQSGBIaTszx/csV1yndqCvnU@vger.kernel.org, AJvYcCX9N9RE3bF/jykkn6SxglA7uPYApIKXO8u2UQl74hKXwicUbGJLyy4aT5jlH7F7pRXclBSnaFZvJ4eA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ClynTeqTtbQQoJv2b00sYbFArxds/+3OY+YhGM/DW0vNdMK9
	1gn5RNmKvYMTP3ywbgKOOo/Hy4V5/0NicnXATOb+GAwdQniIy/YVREZmqQ==
X-Gm-Gg: ASbGncsB55qGQOsD+ScjVIN3IZspXTDEEk+mqmckElbrj3m2Hi2WzmfPuKsh9kG7lL5
	7HigCB+yayLvVuoot9jEcFqNOL2zSzs2COqM3BhDH2xk96y0JZcpojRgKZLrfLe+nsv+X+1Wkg/
	8HtY7hK0dHJXQIYo17QaoPbqJnbGJyiaHyxXXLbaRZMUBpL5TKHp5iMrvsyIm+816N++e+59l+q
	diqzz7/FJBWn0+8sjdsA+iyqIvsTc0LZdtu6SdvL093T1lAhlhAj8qCJsdK0E+kXr1O0N0=
X-Google-Smtp-Source: AGHT+IGNvJwW7ulcz0qMHXQ7WMKx9fbVO8zZPokeif8bwYuwgb6twX31607bNJfXFpvU50l+Ji04og==
X-Received: by 2002:a17:907:3f95:b0:aa6:730c:acd with SMTP id a640c23a62f3a-ab2ab6a8f3fmr1622366466b.16.1736689224242;
        Sun, 12 Jan 2025 05:40:24 -0800 (PST)
Received: from localhost.localdomain ([109.52.222.172])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c90d9a46sm379421266b.54.2025.01.12.05.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:40:23 -0800 (PST)
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
Subject: [PATCH v5 1/4] clk: en7523: Rework clock handling for different clock numbers
Date: Sun, 12 Jan 2025 14:39:37 +0100
Message-ID: <20250112133953.10404-1-ansuelsmth@gmail.com>
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
Changes v5:
- Set clk_data->num before accessing hws to follow counted_by
Changes v4:
- Move to patch 1 (improve bisectability)
Changes v3:
- Rework num_clocks for en7523
Changes v2:
- Add this patch

 drivers/clk/clk-en7523.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 495c0d607c7d..3a4b7ed40af4 100644
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
@@ -702,13 +699,15 @@ static int en7523_clk_probe(struct platform_device *pdev)
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
+	clk_data->num = soc_data->num_clocks;
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
 		return r;
@@ -717,6 +716,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
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

