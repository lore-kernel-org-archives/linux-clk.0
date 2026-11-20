Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217761;
	b=XqfV9zWVxvrtGQvWXWXcTIMJsH/jvp3WtN/DQYVxhEqTeIEyCERB9Lc7kO8ZmUh0mnPn
	 LC8JZgDBfYk0wQDofwgIpj0hE77ZGfZ9wSpA0Pq2ABfQcedi/wTOESUt3vdl74ihq1/5X
	 1vusFxr9dcinQKnpCTSb9riPAWCjUWurGZ4Y+1fvbjCgglnkrBcy26Oy0z48C2vLNT1qb
	 4n3jFwKM7ZWcUyJp4PiccX673jhpKdDzGPV0qUav1v3VFSMTYwjiXgCO2GjSYr6LuI5bJ
	 xzdBG0doJNtZmHMvx53j8gNYwwhK0Bnlw0GTIq9j6kDKOOuvU6rQ9FGywQNR5cR9r8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
	b=vdpPwXXh0PMrFvvmp8DOWFU3XoZ5KKEnEWm7d5Pjgx4n3Ax5vQgkXJmtqT694GrOPiBO
	 +kpKQDDqHSZ0E236P9axeqFH2605DoeuzGgzTf0R5r1r5cODjaZYGQ/OG4pYQ1mQY8TIB
	 Xk81qLAss6nWm/zifgUc8pU+0y6buR5kpfW+AOXzaLLZd0hvm9UvKXENnP+Avr1s4Qjxk
	 ikb2B25+GJPF3+bFjhINq+coY8O5bMLudozYgYe46od+Byzn19c3Yd2rCJ8VqFM4gnSTS
	 InwQh0f0D+7imoHv2M+MxPNtrsicoM9mxWuyvBl64NN7kMJFkfNyierU5dU/AZ/CmVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRF+4gQq;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5032606A6A8
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 23:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5032606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRF+4gQq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso16245535e9.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 15:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217755; x=1795822555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
        b=VRF+4gQq/DsUfw6+IRpgZ4aSpvTB9u6m+rhUmV0VTSRgpAthsI4uITtP3SJgvEwa9N
         YFdjn5C7MOR+Ma7vvWPTbPwCoTbAawVEhStzZ1+XtDir9LJAxXiYJP9kGF0Bb2lTo6fv
         Di2cyTe5GqRtGYylu5W9rzm05QgbWjT9+CO/Icn22BVWpV2wc/ZZI5QzE39XpfcrXAWK
         81Fx/oARUanrR9L22Vl5KZKAcjN0rKKmS5hEdT+U3mm856RWd/ejwU35WeP1AaQ88QVP
         G6ob1IUFwT/oyOkWe05FfAsm9+ipN3dL2x8p0Y75ag1x3rcSDsvJpsHhh4ar1Dtuz1me
         +ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217755; x=1795822555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
        b=1jic/13b1FsqemG/9Xt8A3Va6COhBkJTuLAVtZzLKtlqomimRo7L1KtOux46OCId6I
         cRtv2fzH+hyHSa3AyfE2orC8Q05wpoHeugcy+9owFsXI2GidyMo2MsyLV5DBzVFJznuF
         xxKDVwmR3rMpCg83+hr075lbSpof6e8K3qGuqqKvtqzol+X5+82+aDIntjfcBwroTR8m
         BH7P0SpKi0OqLwYaDERWff902pEXIZhtcIm1brRCIGzYnAWyBnpABLbUs81NIQP90FTB
         NvUQVFRaN7PndLQvcpoUNPTqow39eYJUO85Q3yq44apluCQnX7DT6rbMwVZ/OkQ7d9Ml
         fV/Q==
X-Forwarded-Encrypted: i=1; AL+hErEN0jhV65DRJAuPKdDTjXmeolLN2ltdu7pok9iCg2SVJH0vNLcNIxnLQAD1PN7h+ZobDNChwjKXarQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PqysfWULxlOvQAIs9pzeJd+DUbgxkpN8tZq2C3Kd41gYjOqX0
	wKQpVzheia6cZNEF2LEj8lkhLZIxqWXpveixqz50DjDss0sjinS1MlBL
X-Gm-Gg: AYBFou2cFcWqgoMRglFr35OWlRCeWXD4o9fDgaepRUTZ/dtXZomNOLqduMhOxX72fKE
	0HvfOeOVvdrC93cGlO9lhCsX4OA2PAhB668QYoH4f84A4VNwW5JtqyPqS8kBq7UgiQ0XXGLlZWg
	35G/Dp255SP2UBPe/yEthrP7vBVibf282a9MTCAn5koLIDrZTs2LS+bZBSNzzk5/oCtqYAy7Yss
	psYfxOlG6e0NpQ0gPaW4njifdlTNMM/wAjJanmvfQvQ3toPiWVE0j7kAgGuNSrfOSCz9hV/Bg1+
	mxI/dP4Sxq0jv9eEmKGa5Q7+2tAE1eG2DKfa6nhSdm9+BQuPUbUfdR0BbZHvOzcCGDN2wy2rEBd
	0I7Djbu4O7wZ845muLZOYYsfy+lu02hqfpJEmdD5rldMg60L6yKjHDC4UYPSOakJJDtK4oSb3WU
	GbnCnC5EVLDNAxbdjLJloPsNR6m0vqD5nqk2OiSZ4ellnU+gRyXGkZW1nMAUea4zg3uM1u8ZAjd
	QbWCCKAG/se7STCTtRjqGMRkW+PE5UmxOumey/gG1fo8tUGirMZ4q7mvg5Y7sp5ksf6YH36khUj
	NxYwrZ9ohyMLwXPmC6gz0ajClK6iVsi9NtN0Qxi84WnkSnSTii5z+BeEgiOyWWvgI7jrMj8Ocje
	KIVEizGk/u8T8R7B+1TY86NyWnDVpuBqhqDAGcU6gQvFzh1HOI166
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr103587615e9.18.1795217755114;
        Fri, 20 Nov 2026 15:35:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:54 -0800 (PST)
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
Subject: [PATCH v14 4/5] clk: en7523: generalize register clocks function
Date: Sat, 21 Nov 2026 00:35:32 +0100
Message-ID: <20261120233535.164885-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
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

