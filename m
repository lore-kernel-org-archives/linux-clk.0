Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3B535FB8
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904787; cv=none; b=C6KIAXXb/bvoQZvIRcWNlMcZ0N5//WXz7Q+CZCLSXiY5/wbVBytxQ5I62ePbNowUlW56K13unYf/qYZUyDJVBqBy8QjBjYRvllYVymyO5uEVhO3nvirCKMWFac5B59rSzdFGdSbbiU1H44Pow2bkRyFxHEu785tV6r8BDTr+Lok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904787; c=relaxed/simple;
	bh=WE1d8Y7DfvTZQ1qxRVnLV6YXeMhqi+UhDEzFESXMeOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJf2c7eMaNuRPNLXFIFNLYhWYxLaqLpc/+uYhY/abuMydQzteeoQNdoyLCONmFdyQFhXZEJoyNAdDY6gmyQty23Yt0rPFM42eDtNG9Q8PHhRUkEjDRXIRZX9hsXHqJUGdhGJM0O8Ogq0rVLVKUd1sy/HEKtqUT7LnxCrhYLqAdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/K1x2MR; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/K1x2MR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1368719a12.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904786; x=1792509586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7A24ejUwY/Lw/k8ikBjY86/NzDpJfzki628g7H+OFKI=;
        b=Z/K1x2MRy/GVVNJJlMOJIDSysGEAr40qV9v2pRTJApJtaoT7ukRCP6yoxzIqcZ6zp1
         PZgR9eUxxds6sA0avVP/jHwatb5QGn+wbsIHQit/N4VucnkfU15k2iOj5BkhD/Rfqnb5
         lz91KnZOQLaDAgxtdXaR6Nxi77WgpLIEZvZNrj5T5SuGZZt0EaYOiuV7B6uF65Qhfx6v
         9hAFXcMIFzDgqB6CmN2TBIo0q0/7B4ZDx7apZ1H7d7mhkNHB+XJ9HrcglvuqZ1VSz6EF
         eL6+5mllyoJKiys/PkykvakyIRTCSLcKUtTMfcEEdlJ8a0Bfdbk2i5xTcj+B5qbatuA4
         JmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904786; x=1792509586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7A24ejUwY/Lw/k8ikBjY86/NzDpJfzki628g7H+OFKI=;
        b=aYnoBQVds+NkcE6sX2HzyQWQKlYLqC/EbjPHqp5or1TjaWdJgs68P1HVbVRXtcv56g
         wrMaU/Fn/hfGvLYGqY4R3GEAXPygGoZcdLPboAaFlAOm3f98Af4TGmFx1y+NUSouOY2S
         wYo1xtEYrNAPyDixNJdpRtJ0+zSlvyf6dRnejOjREWP9pAPLSpANcmAjYH/1UhU61n7A
         PCXib56Vce82SyhX0ueFws5vTfTKLjV9ySi1pPQlpUJpsRaTprhamg0T0p3MEmW8U97Y
         hxxD98ci9ZBjbp3ckHt0K1iA2cAgblP78U2QmOB6wHl3XygZOj03hFBXlJcCO0ksTurY
         /gxA==
X-Forwarded-Encrypted: i=1; AKwUvBxDEcZdLtmWFQ/RVeJ/DfsXDiiT1gX8sEhq3oK8wBS/DgH49EFnzeKJB+WMCS6OWbYgAOinVuOSD2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBQjMsnUyLpDhqhS8rvDkfesKoAD0ZOFYjrXstp5dcuj18TYo8
	RH1XnS5t4Ke/GQ1m+vzBVUGDnkFsfr9EzaI8smv7M4bSymg8ffR13HH9ckV4XQ==
X-Gm-Gg: AYBFou1H+0AmSnNr0oKXaoMoiEML/DMeSLeQnpV65uC6bxh81Ualn8Eu6E8+frBc4ts
	OvFCG504VJmLdokxtaPsS6zBSEbdTUsxOb6S8MmrgazRpRr6iNzSGvKBice3HWkgXmuN0ZEbGf8
	B1NziZzA9KtXDAEIMa+HcZx2/p5bkp1gPyzFS1nk+pCZjOlRst+TmV+bV0iTqu5Rd+tr4K7jqqE
	tcpLRgyePL0GiYakdsz4Lmfs+iqX4SXJQlDrB3wVsgvQgq+45EBb5oOxGm5nmKcFJvYzaN0X3bm
	A56RcLXwHHEO6/N3pErQ1SkYxgSh/OpOseYqGsHQ3pRA2gJMfjJ52DyB9sZ820iQ6ZEKrVW2JqN
	5t0tbsmcoiTGdc313m5JsaTMJnoXSf78XN6Lw4h7ZLRFNW7MyKldTeHaDcOWT0ZOJjHQZ1A/Jjm
	5TzDFoyaqj8imZKeVBzRSGCLqyr4DSn+DVr3ib4A1T2gTO6RWyiEeBQV1xZCf03n/aG4GCSBINL
	pxmWMFN6mkrzlywNUyigzGteLUy
X-Received: by 2002:a05:6a20:a120:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3e16bf77bd0mr11175399637.24.1791904786043;
        Tue, 13 Oct 2026 08:19:46 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:44 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 18/35] clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:17 +0900
Message-ID: <20261013151734.3177690-19-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6735 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
- Diff changed by 935ad6242c47
  ("clk: mediatek: mt6735: Unregister PLLs on probe failure")
---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 51 +++-----------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index b6eb6a581c31..94cb0bee8bb4 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -77,57 +77,20 @@ static const struct mtk_pll_data apmixedsys_plls[] = {
 	PLL(CLK_APMIXED_APLL2, "apll2", APLL2_CON0, APLL2_PWR_CON0, 0x00000001, 0, APLL2_CON0, 4, APLL2_CON2, AP_PLL_CON_5, 1, APLL2_CON1, 31, 0)
 };
 
-static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct clk_hw_onecell_data *clk_data;
-	int ret;
-
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(&pdev->dev, ARRAY_SIZE(apmixedsys_plls));
-	if (!clk_data)
-		return -ENOMEM;
-	platform_set_drvdata(pdev, clk_data);
-
-	ret = mtk_clk_register_plls(&pdev->dev, apmixedsys_plls,
-				    ARRAY_SIZE(apmixedsys_plls), clk_data);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register PLLs: %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
-					  clk_data);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Failed to register clock provider: %d\n", ret);
-		mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
-					clk_data);
-	}
-
-	return ret;
-}
-
-static void clk_mt6735_apmixed_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls), clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = apmixedsys_plls,
+	.num_plls = ARRAY_SIZE(apmixedsys_plls),
+};
 
 static const struct of_device_id of_match_mt6735_apmixedsys[] = {
-	{ .compatible = "mediatek,mt6735-apmixedsys" },
+	{ .compatible = "mediatek,mt6735-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_mt6735_apmixedsys);
 
 static struct platform_driver clk_mt6735_apmixedsys = {
-	.probe = clk_mt6735_apmixed_probe,
-	.remove = clk_mt6735_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6735-apmixedsys",
 		.of_match_table = of_match_mt6735_apmixedsys,
-- 
2.56.0

