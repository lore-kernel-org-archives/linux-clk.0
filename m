Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723085;
	b=I3srscomqZw+rntE0bEc8n0S5vxVXs0F64vRmuxMObavRRiYmUeobhoK+aIFh9+A/qbh
	 kyfcsGSP0NHCJsPn6YMI2FWNQqHtp1wr/M8Uv9xX/G6o1oC3QcdeLonlokISVAt4SJ5K0
	 ywdYmVK2ichpC9OdjZP+cZIX1EkFuVr7cRuwzQhEjFjQgclNwcJG44tr9D6X2zLF/6pZj
	 E2TmIJQgq+VeIx2BGPbPDg4Bv95t44t47QEH4tmAygidXPGpVNDP9aLDYeJw09lfkWEXr
	 UKQr+y2P/jmK5nEtcR0LDOcOewmVTNHzYrKQJns06COHqykpiikxrVgJeCooDLTf2PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
	b=s1lMATPJyrRQE29R56/z7Hn58/4/RWdhGn5SaNMsgz6LpEU9SUqEC2TrQL19JcHJyZcG
	 H6uHhmHrsbvtUX1k9VuXf0JDBUFT90UySAcxfsvC0L4I16NhCFNeYpPnzgYivLRvKeOec
	 MKgwAbPCaTr2ff7KpodLfFAiiGNXNkxujXxP8z8FidTtJlyBSphKcYNmNUMRE4HMuTxQh
	 vFNqmL3QbjNfe6Nj1Ifu3kIV2rv0ZGBNAAP0v1ckVAM+ehgepz8+nL0JSnwDzy+IU+EZ+
	 XnwWs9w0sG44aocXajxWFMNqUF74PcLYM37Wgh2woYhOfHOlCoAAjHud0XGIqYOyRGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmW+6zp6;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66942606A890
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66942606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmW+6zp6
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so26900105e9.2
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 22:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723084; x=1795327884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=cmW+6zp6Xlgj7izVi43T2QLLWs2jvIaPcQUPoRlSRkHod2Hmkj7I8GGdIIqaFzdhOj
         joQvuzWrVSE1V+VHc0M/sRQrh07V/dbdLY61bkG16VaaqEwGt7i6bWvdjX9TClsE2zJ3
         m2bG5HcGk9z+H5FtEnpdZgiVtoPukWHjrvmv9bq/m+tCCCWxz3Iix7zVn4mF3sJRFejy
         afo9TsJlp6gf6DQahAZBoLLxXLIL+cO8E0NWGkyWYliib0MU8oMApBluqOnijy/hhvUl
         3kpFDip1bzDGViHejpON6vvBeFc1SGA4LLbGj4H1Mf+gLBoCRX4+LdvpMq7bfpqlR4M4
         xfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723084; x=1795327884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=cwSjn4VxkBugCBs6+ngXcyEjP3oaIxJ/J1DRiPvSpyx2uyKhjUkM2uRDkNiEoVkJIl
         XluweUrsS+xUPd30T29J0XJ+EdDzgsplw2ebuSHIu2FaiBciiQtYMLCqe1puiOB7mX5x
         p+fHZSc96ZfBqGYdmfFhs2gY53PwxOZ5d913f2YjphJdVbFIdsUgDCjFzlDpvPYyeLK/
         4ROFbP9AcnJfYCYuvERMddWRvMcrVgJwHjK0hroPHu41PrdaViD6+c1zjfhOfIOPjk1M
         f06GkO9Wqos65TSZLLckfyj7KsHaG65o9md9wo7zk3kPETaHPwvkZN9m1sWCK2WV45QD
         WI0Q==
X-Forwarded-Encrypted: i=1; AL+hErF63nCJ6nTKMEcNI3WSUWjZhR9AFKk1QGoYj2puTPWP+YhQEtGxk/VjvViByPn+YN3Nn2dIqWwVZxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tpZy4Vqo4Qrv6kPa8dVFV0i7HArZtq6sjwxJLqRskGebyl0gT
	pFaPOxPd9sPErXJzRWC6mBQilpZgjLXgsq5EDpSuMpUtX1ce7y4elStN
X-Gm-Gg: AYBFou3O1ISNQWhtz/5a2xPAhKfqbNQy/53/CrK31eFZGRyxhlEXsehr7loZAyfq40R
	ExP7D2LNCHVIwp7Er+z0OG3MbpL8LHXJE46DkqpBwksDCqB0pze27I8b4xO+3QOIZ9bkR9/hXmK
	u/lwj9vjXEY9ixTUMxqdF1rxYEm3lspn23picl1ZuVJyT0f2jri714oof97eX1thppCu7OWM30I
	LOeq9zairhPxzZQhQOsyMwIvm7uGINCNBLfIPSf4Uz7L7o0AFZ+0zQ4qrPx39C8r7lhi3UL2jZw
	tcniueT+Pz9g+POcBUjuGhECqsvbCuKrujQvkDlhmgztE/AKRAo49WMciAe4wFwoIGhzjrxqN5D
	JUx1BQ89ijof1caBJlmzIxCUlPAG4X32htuBEKh/77HbS3ddpK46KVUMoIjtAONQSKVwWYOrszu
	u76ia1L9PYjpoB3FO/D6zYF/ajKXn3CFlPbNEHgqpHLzTEe5OB7ZUbLKAUffK7Ip03lw9xjkS0X
	VKIvuUfDKHBM24QVWYsD3coBE5Zi6CXWMPeaGELsrzgfC0Fpl6AywD9aqCXvlHfRM+OzVmhBeQ8
	IH6W3Y+O+DDy1zafWBL7xsOzDFfx7J5XEGyGF2o4hatiuBpx5/RNdFkH+73anYWkWE3uOhDDR5q
	6ik1DPiqrYfj2l46ZiY+UhBXqlzPKVkAqMokOwS+YoFDZ0UZazXomfaFk9LNsAM1dN4V+g6lyX9
	UrT1oL/zvQgwugh8rFZDuJd/QuAjYykwD7PTSdwOC8N7W1sfKqJDniqrGnqBC9gqpPSn12nlzmL
	jjK3SRmbjc8LQ==
X-Received: by 2002:a05:600c:4f90:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4bb55a47680mr145173255e9.7.1794723083470;
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sun, 15 Nov 2026 07:10:56 +0100
Message-ID: <20261115061102.229680-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

The DE33 clock driver presets the plane mapping, which is not something
that a clock driver should do. Remove that and export the mapping
registers through a regmap instead, so the DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 43 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 6ec6c0dc4c26..f17570efafaa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -283,6 +284,36 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static const struct regmap_range sun8i_de2_ccu_regmap_accessible_ranges[] = {
+	regmap_reg_range(SUN50I_DE33_CHN2CORE_REG, SUN50I_DE33_PORT12CHN_REG),
+};
+
+static const struct regmap_access_table sun8i_de2_ccu_regmap_accessible_table = {
+	.yes_ranges = sun8i_de2_ccu_regmap_accessible_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sun8i_de2_ccu_regmap_accessible_ranges),
+};
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= SUN50I_DE33_PORT12CHN_REG,
+
+	/* other devices have no business accessing other registers */
+	.wr_table	= &sun8i_de2_ccu_regmap_accessible_table,
+	.rd_table	= &sun8i_de2_ccu_regmap_accessible_table,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -336,13 +367,19 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.43.0

