Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9665349CA
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904781; cv=none; b=lMAUZrp85wp32XaIWDPY2hWGq8xyiWNAN2t+xCQEDREUsu0Pmk6sTfy9tp031Vfu8e0x34LUpcHYtuQBUR6o0XGp4nxzHqr3e71oJCH3HHWBr37SwMk1l+eP2M2tpmz7oZBuI2Q20Q1D30rURZAcK7Hl0I5r+Bcw9+jY3Jqm2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904781; c=relaxed/simple;
	bh=qWMzOymjfe/v/oKsvjvW6zYhwwoHTXUue4DLA7c6Q1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTT3HCbUaPZmfwlhBktSqjyRzzxYTrcmUup5vJtLqBbvATPY9XYgRtFnvDcPSKHDOp/k9IPC3nrBk01L3/Zpgua544yKZCgBDg4VbPoeIzv7Vx9KjnbYrkEjpxBvkgXbeUyMG8UV8z+N/Pnt9SC8X9g5NlVVVrLOKxNmccYJrU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmUM/C6i; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmUM/C6i"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so1124439a12.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904779; x=1792509579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iS9g8Y0A4CpO36TxjO7PQlqVvMbO+A/66QBST/Ft5vU=;
        b=EmUM/C6iM5JgVU1TdTHOYJqpHtcctkZFsP/hN+/01bAaSxZffvVsKlG9TYypLqJlJ5
         4m0WX0Wxp8N5JTir99BjbAUlMniKQ1eYY25vTW55spuvss1y13yjBvuPqNUym8BIvo15
         xOmJTe1IWsS3vDPfj6jmugKc3h5eZ3F5u0Gmn+sZ7LaBoTwxQzx0tYSyU3/juU7Rdadq
         4IqkyJLYzwkdjhWsVmn9tWoVq32jEYGcbcOPemWSFyxnZ4VlsZKxOD6E8avMVSzz9x14
         88smj5zrYdaPIkjFgTvZQmQfdbV9ESIetK1kdQkxjtrxRsZBWebZWdIFDPbPzATq1K/h
         8ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904779; x=1792509579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iS9g8Y0A4CpO36TxjO7PQlqVvMbO+A/66QBST/Ft5vU=;
        b=Yj5nT3izhg1sdv07/bmXVhbYQ4vA0KoVFBMki6TmXVVLrHM1MpfNahSyep/ydQwA0c
         9nvCX4ToJVryUKg+qqRpSCOw0y41yybbLTCYF4GCTdtI2Uybb1u1W5tZhYdDTp+Djh6P
         OsfTEPVd5Iox0X6d2XSjslp6AMETB5mKsqAYFXjB+9K7AdXskuETQhCpOnODyb158pQH
         wTQFFv6IEImvKBM9pbMQpWtrMKSFbh4xJ9RGs9qeIVWhYDyqk2Iuho27QGZhn0U5AqLa
         u8eoIT43vdCi0vI6w9jtwuf8vlI3UfxaIR66VsKMeSGXnG4Z0pEduBjSekxM6rPGhCYN
         sjQw==
X-Forwarded-Encrypted: i=1; AKwUvBz0QDKyxIDTPJ22GLbaK2jBD+L3Nd7OHX+iD6coyd9GKyf9aCKt71Uq5xR4gu7QXlyEEoXnjxsvQz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFSvvS0byHIgxpZgN5heWfFQ6djMh2Iaquq62gYRp5XVs5P6Br
	godp9AELNOpyHxFHFc2JeoUnJLDjEgN+CQHNPdi/8dEc+uB4WEqNY/a0
X-Gm-Gg: AYBFou0b9XryRTHetlBERkEIq800tH7jPx9PVKd8Iysywwy6sM23PNfaD2K7sLYXdcJ
	W2xxIA5w5Im/BR26LejlhuQwVPq2CaCiT8ktdncFPnuBeK+OQc2nc9Xj1s0Ij96JelJf3hvWg8G
	+I7r1AghaPzSuwX12J5XT8YGiAjmuIR29v7YRVY1Al5B0jTjL28pvi8A3OaHc1o5MCQbWdFwUDD
	PbYtLCP9mDl0c8KZrxUnILtXBtX4fgLYTWZhQchX2SMXEX+TMUT8qRBOy/ykk3D7OItKlAqFrhm
	ST1lcXPXcCFhBsmaAz/ILmG0Znr5ouwIHN71+0EzFPTIq8IAtUPKJ5QHdoqczS/jT2kOjiW2yVT
	p9IaiRKLGfq/ziFFcxGJm7cl6Hb0RjXJttynWFjeQlaUgUsrHdBYSFcHKtmzfe2Ru77rEqmwAlF
	T7euSghdOweCcWPbUXoeiYBhcBhyVhikuM54FA2vZyIX5mQIPHgwoSUqg3t4ZaE/O8mJ2b0Zd6v
	iMWCeSMv9zEAlqRPEV6ZrtDpM0i4plD5kWNV5E=
X-Received: by 2002:a05:6a20:c78a:b0:3e1:2881:1c0e with SMTP id adf61e73a8af0-3e16bb06293mr10849435637.2.1791904779265;
        Tue, 13 Oct 2026 08:19:39 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:38 -0700 (PDT)
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
Subject: [PATCH v2 17/35] clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:16 +0900
Message-ID: <20261013151734.3177690-18-akkun11.open@gmail.com>
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

The MT2712 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 50 +++-----------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 087cf574bcdc..1e06f87e71d0 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -109,56 +109,20 @@ static const struct mtk_pll_data plls[] = {
 	    0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
 };
 
-static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		dev_err(&pdev->dev, "Cannot register clock provider: %d\n", r);
-		goto unregister_plls;
-	}
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt2712_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
-	{ .compatible = "mediatek,mt2712-apmixedsys" },
+	{ .compatible = "mediatek,mt2712-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_apmixed);
 
 static struct platform_driver clk_mt2712_apmixed_drv = {
-	.probe = clk_mt2712_apmixed_probe,
-	.remove = clk_mt2712_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-apmixed",
 		.of_match_table = of_match_clk_mt2712_apmixed,
-- 
2.56.0

