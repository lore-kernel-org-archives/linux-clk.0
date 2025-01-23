Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681851BC4E;
	Thu, 23 Jan 2025 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737656367; cv=none; b=ZTUiwRYkI/eqIcHqMoqKmxNnvDbbG5N/cX8y4GtS3Kr+M2EcDm4n3snkfFX3+raup0vHgaTDnTulGzFTFaGoAXR1m8Yep2xGvKAzMEjW7v8vybqJ4K9KebvdDJluQmTwF17/yVRQmYiSxjHFpk5Z50H/6W3dWvFVAGH9hyfZfqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737656367; c=relaxed/simple;
	bh=h0PZIyvKyo5FSgd27LZM19qMYAT35hddubrJVWlLBoU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JWk0BhtItw1uh3LCgTkco8IRBM8yQRur0YA2ERk+R8fZ+E6wetHuJDSmVhRfsqZ9kdbU81l09NT1g0m3aeyMjzopPvNcTvgCTINZOwQEnoTDL88gEDMp7p8xB1m4DXfDxef0dltcOFp2YIh+yfWlfqHPZnkisJiW0KV+1/ZRmlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UIwoQbBB; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UIwoQbBB"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NIJEwQ1219135
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 23 Jan 2025 12:19:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737656354;
	bh=4av+8cgjAiZNOfHQIwugRwkrm7JLS5G+a8WUKEYz2PU=;
	h=From:To:CC:Subject:Date;
	b=UIwoQbBBBVYUtNEEjNyQA6JPdgJiH5+wZ/2E9tytiC9H7bhgd1QfVdl99c4/uDvtJ
	 7eyNm63q4oTtku0V+LAVw5BkUL8mBpPhvHCc+12c34ciQAsU2R4MaQkZ1OMib0xDCR
	 vix1OCBelK8n1kfTHEw3/q2Se5uvsn0LpKX295h4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NIJEuv048832;
	Thu, 23 Jan 2025 12:19:14 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 12:19:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 12:19:14 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NIJE8q041686;
	Thu, 23 Jan 2025 12:19:14 -0600
From: Andrew Davis <afd@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH] clk: keystone: syscon-clk: Do not use syscon helper to build regmap
Date: Thu, 23 Jan 2025 12:19:13 -0600
Message-ID: <20250123181913.597304-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The syscon helper device_node_to_regmap() is used to fetch a regmap
registered to a device node. It also currently creates this regmap
if the node did not already have a regmap associated with it. This
should only be used on "syscon" nodes. This driver is not such a
device and instead uses device_node_to_regmap() on its own node as
a hacky way to create a regmap for itself.

This will not work going forward and so we should create our regmap
the normal way by defining our regmap_config, fetching our memory
resource, then using the normal regmap_init_mmio() function.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/clk/keystone/syscon-clk.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index 935d9a2d8c2b3..073c2ebcdf6af 100644
--- a/drivers/clk/keystone/syscon-clk.c
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -105,6 +105,12 @@ static struct clk_hw
 	return &priv->hw;
 }
 
+static const struct regmap_config ti_syscon_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
 static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 {
 	const struct ti_syscon_gate_clk_data *data, *p;
@@ -113,12 +119,18 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 	int num_clks, num_parents, i;
 	const char *parent_name;
 	struct regmap *regmap;
+	void __iomem *base;
 
 	data = device_get_match_data(dev);
 	if (!data)
 		return -EINVAL;
 
-	regmap = device_node_to_regmap(dev->of_node);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "failed to get base memory resource\n");
+
+	regmap = regmap_init_mmio(dev, base, &ti_syscon_regmap_cfg);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "failed to get regmap\n");
-- 
2.39.2

