Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0FA42BC2D
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766749; cv=none; b=kC5K9ZPaVbHn9J0H4Nz9qzRD2+9Tc/FdUA1s5pvaqrBHLVzntwvU0WQjUsxdTRGA3KITBhxFsvEirFOby07ayoLZ9UD1WcIvOwps1D0mlmnKdZTTFrX26mM/IJH3g77xo5fJFzoZwMy7LNjIIvKNqCS1kaCydqJXgDrwK9KjtzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766749; c=relaxed/simple;
	bh=36nhEK+XUWu4cXSvoZoTcXr0d9SkWYU9//2aFuA+2gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+QRMuomPN3NZJ1MYwVuzzqWT0dnMvxck91sbwcXMaxhZEKSmrMdXKJvKUfGIbi8HeM/4KyBmome0GVQI+Gu7VylWhcAFuDrA2qY8b7g1znNgiAc7m3TfSema1t8jTf74a++Jjo5Pzqi8s4UaqeKUYVyoy41tEoQHyGcFCDNviM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu9uq0Qc; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu9uq0Qc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so3845952a91.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766747; x=1786371547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBdhWQzJRHYryE9WZhMb9eq0tPTuw8+xNI5NcLDCCxE=;
        b=Cu9uq0Qc+FszB2bOH19bzP+1x8umthmn1+bky+x7pag4Gl1yk1urOnZLMsFXAwDzwL
         aTgQFpCm/72e4f5fPgsHjose8/Ne+rRBmQCqE1vF7nGrhG8sDNQEYAFJmiMGBSaZgs37
         ADriOCxrcFmSbZ3DIU0MzFjT5SPBsUC/qztZppLMVQm7BMvLv+/xZ15K2v61VryuoWrF
         YVP4S3lmtbR41/AeQlMKef6+IYNy/aPyGyiVPczKlD5eOEPLvDEiknXbzwn0tKTqWbVz
         EOngLqbM7k22REd2eyqjsuiLIV++ZMqa5dJPJtf74UFPEPDd50xjb6u3TBbzVK3a04Lg
         W+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766747; x=1786371547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBdhWQzJRHYryE9WZhMb9eq0tPTuw8+xNI5NcLDCCxE=;
        b=UKdhkUIEUjVKnLt67t1BaXESJA2AzYOIWBzsKzP3WmvhjWk7GDRrQSw0SzAn98C9G6
         j2+s77IxLnF8dLzYei8Yfj+0c6pPR1FLdZETFDCq+n/4eCOQPZbBWyr2kj2iIDhrjNpP
         u0RzvwbSPTPx/fmwao8YkNxzqRUcK5HfoJbX3gNbV5sehT1zsNeNsYMqxiY8nj45VaAT
         1ge0/lJ7F7YVNUwRH7F1zl9NP5/do6KoyNGJckPnQ53Kz7z7yO7SumNBIqH3a33OeAns
         7L6oDadGjCEX632bHv+ePt7SYTA1FOO8gjvUr40rl08NqPuvIjYhVcJ9kOplVV0ZlIJR
         pBpg==
X-Forwarded-Encrypted: i=1; AHgh+RpCU+aOkqpRmYoWsVsRefGAJrwifS+/qpwhKWhMO6qP5HJUrxgp6H76DJQlFbu8Jy4ituBirTePhEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOJp03AWKXk7NaNQB6Q3N9q6yVVmgQn8/chxTsRq2XjJMmgln
	4d0oL6inMnSe1EIVC4KoWJMgP4BTOb2X9OTeu2KXfWqeZvfAySlMSs0x
X-Gm-Gg: AR+sD136iR2rCAc7eJZPO/XbX1WgMXAZsALjRWVVPK76yzHnBqT2q+2CcRUi45zHWeL
	pj50sW2dEnUS6x6M7Md8I11w8GZbPftwF44J/auFaaBYaPwUh/N9eTbETodpU0+BJ2LgymHsIA9
	6h0iAr6L9tnFrMZ3TXCXPa8luCx7ruPlh2Z0L4mx54ue7wUi4MWnHWClBHkBOWdE1kz2+mSgDFw
	otHO0uyLJfEZPUCflezogdsiH0XSNaqR0cmjpLFI+Hyn/APTkq963oJB3MszA3t6+E2iT2lw+19
	hcu52jztu1G8HQcBcJWUP77Q5uwcSs6Q56ZMdhhBAGr8cqDES40fkes/Oou4kdEzOfY0TDyqHcC
	ZFVD75aqCGbvAZL20zcsexl8jvrJce07a3Zv3WiiV7OCnDh402QGjwuS9/3+PXY97UrLLAIVldc
	7Ar245HfgOgaWbefgF5J7Oo2EeWwdgnTYuLHT5iRhzmcJWdEM/BqJmEq2I5xvJKrKSXZGme61cO
	zwVS2UDThk3A3E/WUpc
X-Received: by 2002:a17:90b:2ecf:b0:38f:e6cf:4d6a with SMTP id 98e67ed59e1d1-38fe6cf4e03mr949891a91.41.1785766747241;
        Mon, 03 Aug 2026 07:19:07 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:06 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 22/32] clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:49 +0900
Message-ID: <20260803141659.559129-23-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT7988 apmixed driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 39 ++++++-----------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 24f4e7b87a31..f7bb00e7d17a 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -71,47 +71,26 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0x0318, 0, 0x0314),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
-	{ .compatible = "mediatek,mt7988-apmixedsys" },
+	{ .compatible = "mediatek,mt7988-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
-static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7988_apmixed_drv = {
-	.probe = clk_mt7988_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7988-apmixed",
 		.of_match_table = of_match_clk_mt7988_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7988_apmixed_drv);
+module_platform_driver(clk_mt7988_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7988 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0

