Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E209C53C3C5
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904828; cv=none; b=bB7mkLuV3D9E2UVUk6ixPhGfVS3Oymt5i82pLOpOLHpBcaWkzRp91n7Le8nDfqYyVBJLkU8JRufgPMvkipeG74sqUScNJ7Xm6vUhXAZEr/aAaMpycnSfDTV1yVtaAe72LDRJaCFY9MXLtADR/l6tXbSuCJdYI2vdIoeNAYP0lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904828; c=relaxed/simple;
	bh=STkxUI2RN+ZbwY70yQ32iz1xrpQOQXGahLRP2DqchUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emoOQWcdq77GTrvsqut/6UURqXxxU/Iaj0jl2OoChYPPrspne/qHA7DXzpeO2t9BxF7Wk1hxwT39gkfCZ/fCylXbcM5akn8lDxTQKKtqJwNYdNNZXfqbHaCGq+rOm9beR2LFArhuCUqSMZfpvrB/qxnemjtpUZrz++a6/S2cbAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJoL4xc+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJoL4xc+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1615568a12.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904825; x=1792509625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8YZz6YHs+YnhWOB98iSQEya+TM/J9HiEFdEjzFss5E=;
        b=eJoL4xc+Lt6NWTOf7kCwe4KlSltXw6XW7+pd7kPcEshMZGiDAmSTgVXc6V31lPQ4AW
         Xg004/FOFQGcMizeavWdvYkxcs5a4AsM2aYW6J5s0Q0gVusoYNm9ilOTffPuC4FSQA+9
         WxkdIg3CHIceuSUP5fe6+J/uJt/FyxxXYwvsaFEp66XSMSavKUhjPNOUKDbMqnas5Uvr
         SIsKV9TVSnSttRuk2Mu5rM0NTuOzAGi7cw9Xoqyja/kjPIDtHAx8D/JIFuxp90/ol8GM
         ABTc9AUnpPd2qGpVsmt0pGRRlgMyJFJ+CH8XfkX7gfT6QZwr1McNdfgEbi8C48FSUS3b
         dElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904825; x=1792509625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8YZz6YHs+YnhWOB98iSQEya+TM/J9HiEFdEjzFss5E=;
        b=pOKCPoc/XCgxG/zHQCK+kv2lujOT2kjn/JgfDyn8snRVJrocBbjrGmcR2fecKvRX/3
         P/nhtZcZl6vDZ7/jQ2IcxG8F8//4k/enb7Nvf5Hu5MAAXZOUuI8KBigGDp5K3bORumuD
         eSJZyAOglZueidpiPi5JSLIMiM4kskvQqWnlCM0Zk6avi3f34ShzGWyni/chv0EqhIx/
         LGbKY4zack/p4lNjwrDFWOv0wrkeSKRpESr6LkwSMeuIiGBfKBuFq77G7QC7Pdyf/ulW
         5WQ18Ro5e3lOyjM9hVeRCXyRyhlkRGglU8TM6ufhhjzgKkH569j8ofh36KqLcDGheGRT
         wr5g==
X-Forwarded-Encrypted: i=1; AKwUvBws+H9ivGks5swH6ycbm/D+Yt9JcnogDUsqdvgrABt7X5VGKQ585JefkRTjQY2HOh05wXdyj9beFGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOit+Xfc5d2+wA4gFDJu0TB8iBj0JW0JGdElSwHlWT2jvgWIQd
	oUL21Gtk7s80nfHp+mXZuRbJmeqLwU3F48pmr3HOiHAbpQAEfwwGXl+J
X-Gm-Gg: AYBFou1ULV/yjmEj3LR5baCzFipYTqKNx484S64xa91pRm6pes4jgh15PZ5ZGwWQmM3
	pmQXVd4Rz99x8QX5Lz/S8jKaa6o7qmLFJFZsMLeX4dN6CXkn8hnz5SD7KBRi4j2z5jhJsT5NfcA
	Z5NEdefNZgBHWuyHNa4pwYOpjCuZwqUdk9LGQQ8hXn+0QNbCEMG1vux3rgHOGUEI9cz09onsuZe
	u1ASGD/kLhJDQQ/Wt9/Z8ydJVoQJgzRv8RDjLSHcvG8EkmQeBWtjmDZa6KL5Zdng6tsn8jwKqod
	Tkr+VWSI8zcIm233iplar9HVfiW0Q5ZmHWzk1c2p1pyD6e+UKVzkXDLFZDH1RVWKKeaks+iXsVO
	xBQXbqxblXdtkrxMrD/5dKGuyk6nqUNGLU1rfg8RlDNUKvdqI6IzDfTdFvaBYE4aqwIul4MPEqT
	7pMAQPHT71+X/16lXU3Ou1gZ2t3zJlG62eKxwjSrlO8rDS5Jd+kWuPOtIM2gZCeRVIkHn4JwSLC
	SEj9iTRA/J4+V3lBrsZWVMgnqmaNy1FnBT4uGY=
X-Received: by 2002:a05:6a21:4ea5:b0:3e0:c2ce:3f71 with SMTP id adf61e73a8af0-3e16be71fe1mr9198126637.37.1791904825086;
        Tue, 13 Oct 2026 08:20:25 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:24 -0700 (PDT)
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
Subject: [PATCH v2 25/35] clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:24 +0900
Message-ID: <20261013151734.3177690-26-akkun11.open@gmail.com>
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

The MT7988 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading
and ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
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
2.56.0

