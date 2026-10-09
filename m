Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2F2473C68
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529669; cv=none; b=bHROzfnPpnXIghzP1Jla17Z7G076IUphJuOUAmormuT+hFNu8DAjq+L7+ff+SuItF9f9P37n1WmBRTf6NIDB9xDlZc5Sd0QzyX6u0dSBMozWiVOU1Y8G5eItRYkmPX+l9UvncA/K5c3F1cWZh/2uBPwxtPT4Mh6SvOI/wt0dkYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529669; c=relaxed/simple;
	bh=bfo/wMXS8Sq9s+eS6QMWg+YQ7MUmVwvDGopoTJGqgOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7AgLO9VbT8JXacpjt5N2gNn/drb/M0oQHU0Cvxe1FXwdUbdEiMBaboEhmA6lr80xQBDiKBWJzp81CtUXGiw4ut+n/r49GKJC2+cHUCmN+urQOnXqcUIkc1jNf1QCYc2zshnogCxe1fthrKjUOUfc9xlSpVzk2qEf8GN5kfy4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkVEnC/i; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkVEnC/i"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a020e65269so28108175e9.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 00:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529666; x=1792134466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=qkVEnC/iKQkO9oyK7vDlM/eSBUvp35+IMa8FAdLBgsARaquTA4PiiA9H3Pq+6dbkwW
         XARfxlMNWolHMvDlA68VktVPUCogFMF9/xmaVkrRLH3+IRUZGFpPBfhI5gWDEbzOiH/h
         mj+FYyyrSv36K2a1jTastCqrC1zkwoEQvD9gs7AfXLAnhesIxeoYebSs3zJTHehic+lF
         qKPEs6lUowtJ45gIelYOzqj2cOhF9strUDaF27dUzhBm+7Ph2DJq+PqppoeYCCdQ+Ept
         T9l3SiSTO1o9sXAr/eN7UkI7Uv773Zdf+lvxj2BVVvPm+uCQIJc0ni6tfnkvLpn8qF21
         0yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529666; x=1792134466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=A9+7gmso1Pgq7xPNsJAbvOP1fh3g4459q/LELgaTH0iYhlVhKA+37VCjgEM0IR1myY
         3LqlfhOVaXS1mmUk830Qo4ZIb9IvTGi5PSGbgbwlrc2mzbZyVv8vBx+LAJRqgC/XU9xV
         IQIVOLGfrPiwNI5K8xHwmwZ8c1lM/O7PesyWot2D4SBNjPY+TS4uV1pPN3coDCwkpEmu
         TeXDRyr3GHS3u6yiDjF2ftUdEJtVFWmnH+DDqt7Inw7momBx2oUSIbZdxk/PR7brBtcp
         XMLf1bQcEE9ebYXRhozKkdkz5kWYUKWiQ6cRqV2wuGcGExLUfawd+QfvExvCG9Oh5o8F
         Mrsg==
X-Forwarded-Encrypted: i=1; AKwUvBw2cb3/9TNagEAma/oskOtEyNUsy9CRJ0vW2lfIj2J2WE3KaxzfjNn8lzNt21ADNBwmGnVTV4s+af4=@vger.kernel.org
X-Gm-Message-State: AFuF++nJF6XO0pDdoHLXkJRjRoLufaYTdE1HZ/SCcXXUgMRNuEy2sk+n
	VGlATdY+7nWjplY9PDsneKtTSCxlCys4M8F76cjrB2Jf5Ex8+oC8IOKk
X-Gm-Gg: AYBFou2GBvWiVZ56f5RLtPKeHCPCuC0pj8BvBxVHiPB7UoZ+EAvlOkXa1bDUUqYzhFp
	apBtZH9F8N4mBnzGFX3sf7QIsOWezsKg64nqlk0qQgUsisxfdj4xNSWKl4bMfTDCX7OeEzDpEjb
	dxkGxCXh9sGAgPhYZI3XlSfftvzM5mZH5guzh4cDgURW/106qyuoN+lA4UgsDSU/VuurLVtBLHq
	mqBHIBpNGDJNXVYSK1A9StcvBKeUewaWN48xaz4Sa8wGaQC3xD+0xmgXrhE9HztpkRGuJL495uU
	gRvAeXhXaBrVtXteOKN00tgkePqJfojYCIaQVnOM+IDKcJ2eYjdedNPttSp1Pil92NkfzVoWISs
	vtafHzxdUToyHGzJ388gHc5F08ulbEz0P++fc1z0JeJK976pgkzU4Zpr0hUIYXMBESuguVy1Hkt
	/iRCOoaHi51ysQJz379PnFEkhVJwFOZ020T9Kx/MQ6+lFpegRvPVOPeR1bOWE7f3soGWo1E7Y5x
	xyH7dcNtPy3BhAKPK6l6cJVc6m1GHHi3EDHv6ZxVcp4DcSwIuu7ZzapwOBno58z2gVnjPcR5A3O
	msbGP/lBIInVwQ==
X-Received: by 2002:a05:600c:4e45:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a18e4d8c30mr16589385e9.28.1791529665690;
        Fri, 09 Oct 2026 00:07:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-233-52-5.retail.telecomitalia.it. [95.233.52.5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18ca4621fsm26176815e9.3.2026.10.09.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:07:43 -0700 (PDT)
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
Subject: [PATCH v7 2/3] clk: en7523: generalize register clocks function
Date: Fri,  9 Oct 2026 09:07:22 +0200
Message-ID: <20261009070725.13196-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009070725.13196-1-ansuelsmth@gmail.com>
References: <20261009070725.13196-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..ec66a504d4c5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -745,12 +746,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1226,6 +1230,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

