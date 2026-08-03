Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF55427FB7
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766741; cv=none; b=OJQHeX5q0GzT8o9xuMRwan8OZUSOGMuwH5o9bJ0T/aNRcgGyr+f7khlajLOK3YqgELw4XxzxjWfD6Hm2qFGtklWHzq3iB4/dlSwZj5lCl6QwVLU3oO4UdA5ppD8cc5OHdpS5BF4Qo4R6ISO0pLy2bV6HNTxEOvuj12FG5TwuMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766741; c=relaxed/simple;
	bh=TfeXiYj8llhfrsV1efKFeIRRIiNS2pbhNesZ8nprYFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFx2Cp/dpp6vIQBjOivU0bf1/m8/kY98jQc9gB5U8jlG98mb6XeDTocP5j6jXnijiC1B3DsuGRpzm4NIgJloR0Pa/t21DkjMhfp8FQ2dh0hOSLCvMV0kNFvtOwHSAf/y71lfWMto3ZeqG3xZZpnJUmFnSSDmyMtpzCFu/P4CC5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeeRQRna; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeeRQRna"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cee9b74ee1so26656295ad.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766738; x=1786371538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=;
        b=PeeRQRnahyguEvnI/QWPZ203dv9CEG6EFhSRGjI0V8697ptWuwRnclM8OZscNyUyDO
         AXHdQG6h3ctVFuKnmVeQWEL6sr050Qx2ijVXe9uqpEm5N+P2azdZ+e38cougv3MTvwf4
         yHJg0lgn13rNPQ14P939R7LlbJVZSLdgDintnJ3kB5HpUAe9KAjDxaYIR46rSlLF6awd
         8QHidZpiRBxBf7fQW5qqHlAtc6OzTpe9BWX2tzSA3nwyEosxarlagk9uHYQw1oPc0Jd3
         uMzXrIbLPK8sUqhBvQiUDhfR9Sx+lnCO0AJMog3wrGON+Py02caN8z0NZrVHhuMeVr/P
         A0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766738; x=1786371538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=;
        b=CkmrtQznk9PZ2V9E6FJdjomI9H+HSNKKPOXMBVgSWVKPG7yygZhaeGEEHdEKovd39o
         imKazawunlopY3Hq+UBGEOH/ex66toPvDK9YxF1guPbsWb7DacR0zNY8/jb/sz1A/ANh
         d+mHZaDAyQExUaP0ehllDnRemCK6jH30IIGuXK+kgFbwsWQw3SZhrTyarmGNu4VKj79M
         HUoBz+vOZkcdV1OdcbkTZGsE3GQxsNrd9rYHsA6ZoaIfl855/WC4LrHsjExKdZNl1x3r
         tbGdtSgbz2+tbkWxcA1d4Uwe5lXAbT8i+J8E1ySzgr+lPu0Hi2SMSU5ZwG4gtBrAYFJG
         ShXA==
X-Forwarded-Encrypted: i=1; AHgh+Roc7LW+i8IIGmRnB4DgvxVDMTG5yBbQYIRRWg6N828GWP0avHWNRfFPwIIiVDCIEBOz4/Itms0gMDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTzd32ip+fEa1OAF9cCF1Zjl7JB7xQ8FUF6V1clu7ZH2PMJZa
	2PQJLom9nmbG0kqo7eQRqE/xlfJJZ+2ZVdi2k63Kmba+1EqrZd/1Icbh
X-Gm-Gg: AR+sD10LnZX7M/zNXK7/ff4xwuyGqouue7beFDAfPZlFnDXvgjz6wuxQON1r+MTB8ul
	pnH8iVzkDzfcCKFDQDdU3UYwCFKIa74UUJkmDzRB+6FHjsGirJcNEHCiSoNIQvncRJFNHAwedYx
	Y1ptCc8CAf9qn8mnYbCB6FHt6FdFeD1irUlNs8YgAlFE+v4TvK+AGp2++CcWeyncyWDwAcR9+Og
	LFeMLNIokjib8mPV0jGN7JygzKU64HsB3NbTg9BudqbvT4EC1vef6B6kplHdc3JW0Ax4ktL8jEu
	l1XlacVt+H2DxKz0sHznHh/+BtTwVsnrUu88Xrne1pMIUYHhjaddeFQFbS0U5n7CF7MyBEhOzFB
	XJVRD2Y2N8B/YeoDo+K/9Y2EYUX0magK72cJjxaXcJdSEEd7u+0G1iKlrjy6JVfzDIwSUacfLxq
	AvUf0lGbxRbrDs6Snf9L5QliooeAgf6DGH+teyW4y8P9jstalGLQwguQJiO3DOdRHMWa0MODlDw
	SeeX1N4Yv8mYQgInCv6
X-Received: by 2002:a17:90b:3851:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38fbc52da42mr9027280a91.38.1785766738150;
        Mon, 03 Aug 2026 07:18:58 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:57 -0700 (PDT)
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
Subject: [PATCH 20/32] clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:47 +0900
Message-ID: <20260803141659.559129-21-akkun11.open@gmail.com>
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

The MT7981 apmixed driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
This change also makes it possible to build the driver as a module.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/Kconfig              |  2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c | 37 ++++++-----------------
 2 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index f5460ce3ffba..6449b77d56ed 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -427,7 +427,7 @@ config COMMON_CLK_MT7629_HIFSYS
 	  to PCI-E and USB.
 
 config COMMON_CLK_MT7981
-	bool "Clock driver for MediaTek MT7981"
+	tristate "Clock driver for MediaTek MT7981"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
diff --git a/drivers/clk/mediatek/clk-mt7981-apmixed.c b/drivers/clk/mediatek/clk-mt7981-apmixed.c
index 851d0bc7840a..810395aff253 100644
--- a/drivers/clk/mediatek/clk-mt7981-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7981-apmixed.c
@@ -59,45 +59,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027C, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7981_apmixed[] = {
-	{ .compatible = "mediatek,mt7981-apmixedsys", },
+	{ .compatible = "mediatek,mt7981-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_apmixed);
 
-static int clk_mt7981_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7981_apmixed_drv = {
-	.probe = clk_mt7981_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7981-apmixed",
 		.of_match_table = of_match_clk_mt7981_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7981_apmixed_drv);
+module_platform_driver(clk_mt7981_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7981 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0

