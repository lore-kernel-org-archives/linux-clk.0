Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296478;
	b=II10kUZKCIXmsX/R6bSqrnJnnJfDKBseh53sC7SNJjp5tUmDUyZL7BmYlgz10IurSTa7
	 C13JqAZd1PypXt4UGP5pexvFmY4OuIwZGsZk8yLK/Bg/fiOhXAIgrkfN8Hl1jdSF53dK0
	 YkdGRfBrbxJm5eYSlNPlYkL8N1QR2R0I3VFIbDEv+J39wyLVwUoQbixXR8LpmeUuH3gne
	 8AzsN8jfQJMt5sLPqbePAhsj6Qp6q9UWovhS+3sDzlL/i3IIgAS/e+V2ustSbGVLSltEX
	 TgUSd0Zy1XLjbZsvfYZcJEHCOMNRG2O9VPDHKvaCDNdfviIuetN1jILyltogRQcdB7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
	b=ZE+S4iQKFPU788g3EK7k1eQscptGq4jwbujTyEssH5/ovgKXdUlAKXR200mgDK0dvEO4
	 PMQalJRuErySaa0t6X0NQbOE4/Mj63x4bbX7rdipscAoFEMUQkqYpa4oPZKAWhJIr6kCX
	 lFi5hjJpNPqyWbhZyyIV6NavAPQyM88ZXe6i9/vopDfQ/ublgQjAq8P15T4a+e9S8RxGl
	 5mUyzrxSyS8cDBMCBFfZtTRvpHC9F48ZLFd9L1MSUY1xzTDZLn/yu3yvN6BFm1MLfzO7j
	 XkGOaAaRTTw4vaLbf05OSvefijNFURDWAsyFwXTS06HGFi22ZQAIEueUPkpslTqT/oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nonx36a2;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5040A606A683
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5040A606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nonx36a2
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1419004f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296477; x=1795901277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
        b=nonx36a2kJkSZ/d2j99qtnq4WttabVYR+UVNQrzvyryNGQFgwdRGKa8MGAxZn5jgdQ
         dHHipM1Yf6cd3311zu+fAFOKf1l3AkEkSPbaZOsmYKy/hEbPFGkfPReX0Rk/H+V3xfas
         q6GVpNBIDMoKqZu1wBI49uidCS7QV6y+tLf7gy6K7XRj//XM/byOdZsxFvOJFRQoU1t2
         jgZEWa7J+Dvdb4OYHSKZrXHFw7o6jjl7R5b0HHv5TlmrRUzEOM000Tfn2cP5OWSB2CMA
         yEyE7yOXBHNbhrdzdpcxmfPDPvChKcwenzAcvT4uugYs5ilQbdQGaCKUmrqi8BPujV0K
         EqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296477; x=1795901277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
        b=N6Y/rMUu6E0vTe1pjorQVc0IO5su5jDH4cLoniGokybILWtmnuAecYAjWXyfNBf1ko
         Yk699gDgnaHXeGpafL605c74fQ28Owmq3MOAdMlXqo83zOBIXBprNIiaHJokssnDBjNe
         /ZlSD0Whcy7wOerDVaxz3Ji4siQlr0rmtAzNiMBGY7/wF3SxQE5od+BNA0dBM+x1YLIj
         V+Kvr9IMfcXkXwwlWYCEBFs917bwxomCDHFvRngODucv15A8FND/Wav9GK3Qpc4TXhcz
         5Ak894jbzybELutND5DbgacGtjgXSwn6JuWaT9Z3t1tbp1Xn8rjhwLoDJE1zbXL1MzGv
         bjQg==
X-Forwarded-Encrypted: i=1; AL+hErFEgAMK4F3Grnif0bMN5ZBFd13bORxWrl7fN3aDtbklBnxnEbsR8XH4DvMRWDp2zf9e089z4VNyFqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ryL/Fumzdph/i14S6lvOqJcNYLej3Rg35wFVIh4afWLuZmGMU
	v/8V1hCSxgW0U4sxwyy5aZt6OTTNnv5KLRAh4fgdRisjx4EQ32RCU65Q
X-Gm-Gg: AZFdTZffFvd86A0IMuN6oytNnDf8Na8+p+UimVgFPhYqkbS7LXPcsFMCEHmtMGwhuuC
	f0oKANxY8ry8QopYjtFhyobtBkdMzNP72F6NndkrNK9MrI+1LnUmwgm0DQ0Irr7tB8V74SQKz3M
	EFEJwbO5V40pqNdkhXyF9AJA4LEakOvFekgoZSziCw7JWMfy2KUIjcLWIUF/ulJIGq03R+47SLZ
	2mvl6IPaqJ/scVZewOyjwc6aQK8lLF8f6Un+c8tVHVf5OtRTxfzanBXFqj68sv1oc9bMrCdFriT
	xZASiqBZC4jbAQPrJSPMiZcjkOQKlwloOn2yYjZdsqTK+OnMW+ZDMuaTzgznbDqfWqpEiCMFEuF
	PssKLT8xc1V+A2po2epsJPl1zWUWv0bC+3ITQJbwQs+pYrYvHHLFwcJdbfK71LBuFYZKPZktu1h
	ZMEjwuYKjHykCUzedLihIhChzX2wUYAFnxjZuQDxlxLTywb1kULo4Vw6JiH6P4L5LgECGuDmHJm
	gq5XrT4x4NA24B5daGqS5Ni8GBhH7p4E7fGo14vOWuGjONCk2ZTsfcU60Q6tdwXMDcNfpNq43aF
	JgGS7UbGxV5OBZks2XxvGZk3JfpYJCgDyPFFlDqIckNaSrUWrEvNobdJW/ceBt1UzQEYUYtV+O7
	6D26O2Ro7QLPdIHzlYH84zojZmzhTIWNlTDevxSfejignl46dO8o=
X-Received: by 2002:a05:600c:83ca:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb888176eamr157316605e9.29.1795296476783;
        Sat, 21 Nov 2026 13:27:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:56 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v15 4/5] clk: en7523: generalize register clocks function
Date: Sat, 21 Nov 2026 22:27:34 +0100
Message-ID: <20261121212738.170775-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Rework the .num_clocks value to declare the number of base clocks and
increase internally if PCIe OPs is_enabled is defined.

EN751221 is updated to address the new num_clocks meaning.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 12a43562929b..a4a75b8063a5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -799,12 +800,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1245,7 +1249,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
 	struct en_clk_priv *priv;
-	int r;
+	int num_clocks, r;
 
 	soc_data = device_get_match_data(&pdev->dev);
 
@@ -1255,14 +1259,18 @@ static int en7523_clk_probe(struct platform_device *pdev)
 
 	spin_lock_init(&priv->lock);
 
-	clk_data = devm_kzalloc_flex(&pdev->dev, *clk_data, hws,
-				     soc_data->num_clocks);
+	num_clocks = soc_data->num_clocks;
+	/* Num clocks are incremented by 1 if PCIe clock is supported */
+	if (soc_data->pcie_ops.is_enabled)
+		num_clocks++;
+
+	clk_data = devm_kzalloc_flex(&pdev->dev, *clk_data, hws, num_clocks);
 	if (!clk_data)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, priv);
 
-	clk_data->num = soc_data->num_clocks;
+	clk_data->num = num_clocks;
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
 		return r;
@@ -1271,7 +1279,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
-	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
+	.num_clocks = ARRAY_SIZE(en7523_base_clks),
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
@@ -1282,8 +1290,8 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
-	/* We increment num_clocks by 1 to account for additional PCIe clock */
-	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
+	.base_clks = en7581_base_clks,
+	.num_clocks = ARRAY_SIZE(en7581_base_clks),
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
 		.enable = en7581_pci_enable,
@@ -1293,7 +1301,8 @@ static const struct en_clk_soc_data en7581_data = {
 };
 
 static const struct en_clk_soc_data en751221_data = {
-	.num_clocks = EN751221_MAX_CLKS,
+	/* Decrease of one as PCIe is incremented internally with PCIe OPs */
+	.num_clocks = EN751221_MAX_CLKS - 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
-- 
2.55.0

