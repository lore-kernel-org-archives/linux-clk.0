Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6602530C34C
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758658383; cv=none; b=YqIfzMGe9h2Y+FuWI4eWr96OqytjarxWudeBytGu1J3LiHD+BfRA2dO56c2HAHYc4+aZIfqmcR9bN/ALz6qHfN7ASdZKB31++nGqkrYCFwq9yL8KXP6tG4Y9SFuMRpCVkwARHM7f7RXNNAz9mNniSOxOHmTprtXd/KhDLKZYM10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758658383; c=relaxed/simple;
	bh=gQpZKL9PYN00DxqOhZ2zLTrFv9ZJsPxReul3Hvo1omc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcyDboz3cOoCkAhnP6HH0eniBWo7qbwigxeFkU8vVUQL3li03KpS7ZhC8jK+tV5BE6/6kLh2JszjzlvK5NusZKAOI6rd/BW+hdr7WPtUiZr8YHIc3rRLzGoINZh9H6P/5PVIzSk30StxI4adUvFSr0xmpwz3XFyFOBCTWgIpIlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k78OxRq0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k78OxRq0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee12807d97so5249130f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658380; x=1759263180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aly97HE4DbfA98BoW1r98QzzxmSOsTSspnaWMcDHFeI=;
        b=k78OxRq0jDjdH/jSVoQ42tnSX4MziM/58G72QrK0KirNaygnUtcjxwaxFTP/bVEeHh
         V+hY5F8ghWi63phHNSGNo7fD0h4ynudLvkLnFTWbX80O07+c5QaGGoNke2Bw3cxVUPIh
         7qY+BVY8bd7wDncwtpd3JthZzFF6cKuCfaaIfjt7RL1r+M4s7mG5eBKQ/gUoN4KAmuBt
         xIOccVcifUXrDATGNVbJFl/OIc1kdVxALyVsfW//Yuf/YDhPpNBoGomOgC5m/DxiHz2u
         DkiSVUn++xV2q48Q685kX8Asv1h7pcDXDM4O2Q/9/go9hJhRzTa1ZaH6JQrRuBvn/ckY
         c71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658380; x=1759263180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aly97HE4DbfA98BoW1r98QzzxmSOsTSspnaWMcDHFeI=;
        b=elDg7kuFMFS4gJVUOPjbSapf0L404Du3fqg9E97rXRYWUBALM8nfo2LBTwpv0Jf4nH
         GjBD30oiy1o4QRnsvjvSAV+XrrB1nGUAmexrs/A+fgx+FnpClSfmH1ZtOyh8lB8UCpjy
         Mt1nrKv7puV3qjj3zEipnJpTd5x0Q8teKScToh00BWf0Jf8t9v5gjTS/xklxJaAlNP9T
         H5d+ewkrhkRa8wpkFBngnj4gae8QdSvc5AxHGSVt29o3Ie3nJUcFtt01qCxB/Ga14BPC
         LJ8CHTc2ZZhiJBiOLJEKnwoiBeURbpRcPGKr68b+AM6TWLCJa8hrQH/RHa3je2kI2opo
         YWrA==
X-Forwarded-Encrypted: i=1; AJvYcCU/AmF/YvNkaEEUxgxl7PNd3tjLnriRPT0rmkAwWnfI+8XLhb6elmqS0fONmwtwlQh5yRkdSfvf2m8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpzvxOLnbq75+RXh+pKo00WtE9640geh+KrFWLIhM3hxqB6+OF
	y+Ah2CTmN3yDtn/VtpRJf+Q0dClq5yg19joRMPDmSgWK/5VIfHEd04Gp
X-Gm-Gg: ASbGncs8+LAiatOgfoW7xVCvJPMQ161ECgVHNPKZ3m9TJq3Brw2wIo+bhqmwe91//Os
	fz2jVoypH+ppvUl6xCbRElMeZaT94H8jqncYFdTyYW4tOYlrdNpzhMBzVtnx3iJtG58JUWFt7Ua
	eO7Vdf6xrCfbpPmhzy8CSGDvFjEhTfqLhd59nF7/q21wlWSQD5NFjsD2k1gpwj8Dk0L4ezOG+lu
	Zhjton7CQ6MvrH6EuIjnXJsJYXZljZ4tZt7/Yi4g9VgltlbK2BMvdWYuty1lec3NgnhoHDjYLnZ
	pU4VHrMVqeTU2zfk6L1M7usAbJddhQnQP2CjQdgafNmLn0GgozoC6r62LlP2N/Nx0YGOfUGgnao
	BQgmbxy8lI/cNOfCTLmd7J4sLqmV1krCbK5NB07NLnJ4Ia3j7ljDZD8vg96UUMgP3slq7Sto=
X-Google-Smtp-Source: AGHT+IFbHn8VL6NabBiNOJDmra87r8MK+4nqnknbe3Uap+qkSdJFvH4B0H/cqDTPX4N5G1MGJJWP8Q==
X-Received: by 2002:a5d:5889:0:b0:3ec:d78d:8fde with SMTP id ffacd0b85a97d-405cb7bbd49mr3615361f8f.44.1758658379499;
        Tue, 23 Sep 2025 13:12:59 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm24889690f8f.12.2025.09.23.13.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:12:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 4/4] PCI: mediatek: add support for Airoha AN7583 SoC
Date: Tue, 23 Sep 2025 22:12:32 +0200
Message-ID: <20250923201244.952-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923201244.952-1-ansuelsmth@gmail.com>
References: <20250923201244.952-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the second PCIe line present on Airoha AN7583 SoC.

This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
also require workaround for the reset signals.

Introduce a new bool to skip having to reset signals and also introduce
some additional logic to configure the PBUS registers required for
Airoha SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 85 +++++++++++++++++++-------
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 24cc30a2ab6c..640d1f1a6478 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -147,6 +147,7 @@ struct mtk_pcie_port;
  * @need_fix_class_id: whether this host's class ID needed to be fixed or not
  * @need_fix_device_id: whether this host's device ID needed to be fixed or not
  * @no_msi: Bridge has no MSI support, and relies on an external block
+ * @skip_pcie_rstb: Skip calling RSTB bits on PCIe probe
  * @device_id: device ID which this host need to be fixed
  * @ops: pointer to configuration access functions
  * @startup: pointer to controller setting functions
@@ -156,6 +157,7 @@ struct mtk_pcie_soc {
 	bool need_fix_class_id;
 	bool need_fix_device_id;
 	bool no_msi;
+	bool skip_pcie_rstb;
 	unsigned int device_id;
 	struct pci_ops *ops;
 	int (*startup)(struct mtk_pcie_port *port);
@@ -679,28 +681,30 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
 	}
 
-	/* Assert all reset signals */
-	writel(0, port->base + PCIE_RST_CTRL);
-
-	/*
-	 * Enable PCIe link down reset, if link status changed from link up to
-	 * link down, this will reset MAC control registers and configuration
-	 * space.
-	 */
-	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
-
-	/*
-	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
-	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
-	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
-	 */
-	msleep(100);
-
-	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
-	val = readl(port->base + PCIE_RST_CTRL);
-	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
-	       PCIE_MAC_SRSTB | PCIE_CRSTB;
-	writel(val, port->base + PCIE_RST_CTRL);
+	if (!soc->skip_pcie_rstb) {
+		/* Assert all reset signals */
+		writel(0, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Enable PCIe link down reset, if link status changed from link up to
+		 * link down, this will reset MAC control registers and configuration
+		 * space.
+		 */
+		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
+		 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
+		 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
+		 */
+		msleep(100);
+
+		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
+		val = readl(port->base + PCIE_RST_CTRL);
+		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
+		       PCIE_MAC_SRSTB | PCIE_CRSTB;
+		writel(val, port->base + PCIE_RST_CTRL);
+	}
 
 	/* Set up vendor ID and class code */
 	if (soc->need_fix_class_id) {
@@ -1105,6 +1109,33 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		goto put_resources;
 
+	if (device_is_compatible(dev, "airoha,an7583-pcie")) {
+		struct resource_entry *entry;
+		struct regmap *pbus_regmap;
+		resource_size_t addr;
+		u32 args[2], size;
+
+		/*
+		 * Configure PBus base address and base address mask to allow the
+		 * hw to detect if a given address is accessible on PCIe controller.
+		 */
+		pbus_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+								   "mediatek,pbus-csr",
+								   ARRAY_SIZE(args),
+								   args);
+		if (IS_ERR(pbus_regmap))
+			return PTR_ERR(pbus_regmap);
+
+		entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+		if (!entry)
+			return -ENODEV;
+
+		addr = entry->res->start - entry->offset;
+		regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
+		size = lower_32_bits(resource_size(entry->res));
+		regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
+	}
+
 	return 0;
 
 put_resources:
@@ -1205,6 +1236,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
 	.setup_irq = mtk_pcie_setup_irq,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_an7583 = {
+	.skip_pcie_rstb = true,
+	.need_fix_class_id = true,
+	.need_fix_device_id = false,
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_v2,
+	.setup_irq = mtk_pcie_setup_irq,
+};
+
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.need_fix_class_id = true,
 	.need_fix_device_id = true,
@@ -1215,6 +1255,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
+	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.51.0

