Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681579;
	b=PRB5F7wUSHjTaXwcrZbZGlSEeE7MMHKlF21/q0g67/TMvgaUfhnsLaazT4PDsfhNxqGv
	 MKii6BpHCzSeoZ5nkYanh49wqIPZHNfMaD0o1ECQNwbwK/ft0qZgXLuBJZ21cmubdBhzS
	 Rf8vEFMZDkCRXNwSAEOew7O7eAnEzbWwsxpqyDnO6diU95mEpWP0Dh7FPFtVM7x4Ds3R/
	 yOUiEpwmL2QYNNnRw8wZbuNxOISP7A1gOlHpWxZlU0+tUz/OTrfDgv6OyyRRohkOk/RgR
	 ODOm1I76PiYa8Dc1DX3f35QjAffGYHiQN46IZvi6cAkZ/32HjdRnpTBs7F9kdri63rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681579;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=cZp7leX/EvS1RHP9nxX9IjWiqgwrvVJVZ99VhvC/wPE=;
	b=ggZ4jAjUbEPbfvfzP1uZnmmDWLBS0ILG+QzlAZEcdO4Y30Mr+r20bMTfbhlhgIOLJB8G
	 f+qF8rq7Qvit0GwDdYZV7WISNGvWYmsDiaSohkAyObP6IoQNuZQ9r/rHY7UG8Jy2Ag1gH
	 wy2Xru/2IrvhA6n6s7nejxidmJksCjs4EQ93svaWAEAVB+v1NvBFPR1IEaPSP8458cNG1
	 8RBFFmWsJlL6Z9R98PiFzJ9szAOpgSKtGVxiCbSnZUBZgloUNppLeSYuYotS/vnKv+zAd
	 W0brXiR8PfU5L73oiXjPPRjlz5377Q17eo8ZhdzW4BciFOEbA91aqpRzxqvy7kNV7Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UHDMOu3K;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B92606A334;
	Thu, 26 Nov 2026 08:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B92606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UHDMOu3K
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 56172690b;
	Thu, 26 Nov 2026 16:26:14 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: angelogioacchino.delregno@collabora.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	msp@baylibre.com,
	fparent@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind
Date: Thu, 26 Nov 2026 16:26:13 +0800
Message-ID: <20261126-a35bb25eb5-u14-4@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa216f65f7d03a1kunmd29da7933c29fb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0hLVk8eT0pKQ0kfGhoZT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=UHDMOu3K15gcGmHyt2/Uo+BLlwtuflI7V18WwWQRwgCH6CeGQCt7MI0KzjQsWDysnjAYWSq+4Y7VTL1jtOXR9AiNwjdmvD3zURqQmgFVt682S9xqbCrLg7KEQWbanC3dsGYJxDsemPDlnzJzNVOiYPV5XwyPliOgTjp4bub0eDw=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=cZp7leX/EvS1RHP9nxX9IjWiqgwrvVJVZ99VhvC/wPE=;
	h=date:mime-version:subject:message-id:from;

The apmixedsys driver leaves the OF provider and clocks registered
on unbind. The clock table is device-managed, so the provider can
retain a pointer to released storage.

Remove the provider and unregister the PLLs during removal.

This issue was found by our static analysis tool under development.

Fixes: f419069ad864 ("clk: mediatek: mt8516: Move apmixedsys clock driver to its own file")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
index 2a6206cae2f0..abb2a626628c 100644
--- a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
@@ -95,6 +95,8 @@ static int clk_mt8516_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
@@ -103,6 +105,14 @@ static int clk_mt8516_apmixed_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void clk_mt8516_apmixed_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
 static const struct of_device_id of_match_clk_mt8516_apmixed[] = {
 	{ .compatible = "mediatek,mt8516-apmixedsys" },
 	{ /* sentinel */ }
@@ -111,6 +121,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8516_apmixed);
 
 static struct platform_driver clk_mt8516_apmixed_drv = {
 	.probe = clk_mt8516_apmixed_probe,
+	.remove = clk_mt8516_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8516-apmixed",
 		.of_match_table = of_match_clk_mt8516_apmixed,
-- 
2.43.0

