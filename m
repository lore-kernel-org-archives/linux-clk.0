Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAE9421247
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766717; cv=none; b=eEAJ4y5WBI6Tl49r7889K3relG842iXqu/fMQIkCIjiEeJ+IF5JTf/+BbNo0htF1SQznp04YZ/JhKkX1pCbJ8BX4453gjhvibzo2sSPT8Ub5qEW9kUGru9tmS+Qf3FjNKjwWjqezQwZDGjui3jCEcb4hsDfjCiBfPZ/xE4UlSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766717; c=relaxed/simple;
	bh=iS56/w5zwgTuZe6g4za285IBHTIuTkz5F54AoTpLuP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKEz7Zzs+wdEl+XUXMFLUYrmBDgLFqEnn4DZMEbrTvauhEN0QwcMccqrMHMNbi9Ww0UMdUu7bghdnFAVn5mJcnc020Lzec0ZGYwuXXjxHlx3UoN7R6rKaTgHUOv2Kic68IDHLq8Zey4bh4wpfZkGq1KFL9ONoqOq7elvEV1npzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3xaqMm/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3xaqMm/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2377357a91.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766715; x=1786371515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K3Yx6VzHM8GIbCrqX9zZGoEb/ITQ0QyQysBjSMYncA=;
        b=q3xaqMm/r8PYl7lEUcTMjjSZp9kCMSMfYiXOUplLVhVFmr4ZAtPSboLZnqoAJBPMCc
         4PIDfpRYXHywQdYq+hIhCTtnGt8p8DAG+5jnRSmENaaV+we8k2UGLANq65+lTZtgBXV0
         vdwwBnmE3z03+exDMEofi1TwC0ZcR/1tQEzWrkN9slrlv20UNwKjwFlJRagd7xEQaRgm
         ZYfa6SBM4csEceuGHB5ov4pq0UxQmd9iIUlInyek0EdBf791BxmAKfjXzjnKwzEd5LGT
         64sfhVgfgdLhhwCmT78cNRJAfQNwZfcPFD9xNLc4rJy7WRCtsiCl/dg3SThkMV6pYcqx
         1nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766715; x=1786371515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K3Yx6VzHM8GIbCrqX9zZGoEb/ITQ0QyQysBjSMYncA=;
        b=fFSiL7ZkKh3/6vxxHmQ1x08DiyirZPRMHLBTBMMFB+l213R0iSNrluhxnZ8yqG20Xi
         8QEZft5xJpfuU8uJUEan2wwWObX730gTr5VwXIwEHWAukoIXoQk5Xjfe6ikETgWJEwRI
         xrML0/iBlOLItWnkkOC0CehFG2yqRIIdQfTYn7mBZLScvSQ/jD9W3Tsz/nTe4k90ucrk
         SWewz/P5u/CCJuTeVLQCvEHT8hEVVAx1iQzeNFPtEN1hb58HG8RiDX3CQUT1m5OWUK8s
         eL293NgJ42ChM52J5WTrn2fD2PfQ0dTzzrkcRWXSjqD4TZCVNgL9SCJTwa/F3yOkLReH
         Lp9w==
X-Forwarded-Encrypted: i=1; AHgh+RqPhkb+X6ZIxQDy5x53JgX7lV8RelsvFYqYniuQUJy6IzdToN4bz8drRH9FS2fA/HMJUgQ5Ra7hxNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy/wkWXIIbhJeqnypAsxHOtrB+StHJBDw4gBH4/XKKNMIBFaj3
	z+g6zpgdVFApYFfkW8cTI8HaSfcKeNc+uK+odEk1ths2gNtLZvi4E+u7
X-Gm-Gg: AR+sD12by04SNKDbvyawmy0tKckReMsNVMhgQOVQEAGCDDSlZfL4XdoiX3BKawX1Ihy
	VJoYIKwjgOatLq4R6CJBbtSlLx/cA5SAp5VyzgpFHD9vh5Zg8ZZtidE58MdOIySAmQ4UQv5/hQ7
	G3SpPx+PiqkhtWrWgMlfNOwFykph52HyfV8j0qm86z/9jEwDx88K6BTistSkTpbO80Q3V4zQfyt
	pufvNz2SEFuv14lgvCvm6sQiRwWvuwc3l3EhD+XK+DuTLe2H08NcT1Jq0QYdiNAKFG20aSlcXBO
	ix9jPjkZuRkwBdwFuOPWh5Zy5eFMmn3HbwSp1qxdo58StBI9hkBRQpNS9ZirV09V3B9ODMehtpA
	zNrPabigY0FgiHCUZ8SxtXmD29r12DysesAXWLKI6ACNBrnKyeriwcGUpMqdCw/6KdNER/KFriY
	8kkHLD+zXdFXrHdIUWHEBJNoB2GTlftAecO78zMPb3bcp+fwdwIuirOZDqmjy/++ErLo56q7+ya
	UEA3/da3kapg9hGMBV/
X-Received: by 2002:a17:90b:280a:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-38fbc4542edmr8751782a91.13.1785766715117;
        Mon, 03 Aug 2026 07:18:35 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:34 -0700 (PDT)
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
Subject: [PATCH 15/32] clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:42 +0900
Message-ID: <20260803141659.559129-16-akkun11.open@gmail.com>
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

The MT6735 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 48 +++-----------------
 1 file changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a209..94cb0bee8bb4 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -77,54 +77,20 @@ static const struct mtk_pll_data apmixedsys_plls[] = {
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
-	if (ret)
-		dev_err(&pdev->dev,
-			"Failed to register clock provider: %d\n", ret);
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
2.55.0

