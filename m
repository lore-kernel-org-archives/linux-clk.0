Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67BF535FA0
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904759; cv=none; b=ZIo2KJIOR6vCPrjDOov7HDxjdOpBkL+uYn5TU2EWpCHNv6AgHnBPCAb7c407gFlXOnu/Vn1KpT2RT3+KfpJuDdgWHpQdOG1NF/7HE7WVvKAJKrW6L4K9QQZhg2/uqFd8EMCQH6ziKEuRgD1Rcy8DgNwe1wsY5vhz1NQ5N8dNQiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904759; c=relaxed/simple;
	bh=74VHLSgwRzNKKyzn4xtt5CJpDC+AOHiXpkoywV8LdL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEV7QRnU7h/jF//f/bVPKoDiXAxLiBK/MFVxfhMyqznvbDVFREH3NFytHhm0GLny7pRZ6nRukwp4BoHjJSeQCpXZAE2V6raDAyoKd82CJX9xRO+NyTvepi3a+lWBb1Eg0FXFvL2lPhXR0JKpfIaJC22aLQVJM/K7stGOIXqcVwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+AHiyHK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+AHiyHK"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1449010a12.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904758; x=1792509558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=;
        b=Z+AHiyHKK2m3bW0twaTi6bwgeZ5nZojGRvq8mQbuVtxVsJBytZh52YfPtPqcOBE8Bh
         /QfpAbcPw1bUgzPmFcn3foc56qyqSkWFfDe1t2gPW1SzNDms6xskUjZkXDc18skyYtWD
         Dkyc7NDWQCyYAcqooUmQaJwSI8R0jRGMCbtNBAli4IFikKwToKViMa3scC6reFWSitVE
         pb137j4dl0cD7vwgtzhOfFbXNgIl9KmUJCaJBqevmA11irKlDl5T3jmb8IJfHFWF2Wej
         5WWvsRqIkK+8kk207tIwh2wO8Sx7hcC7NVed42ExqixkOa5M6gslSEeuU85epsBmtUqV
         ++Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904758; x=1792509558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=;
        b=M67DvlyPkTZ/rIE2hV0obfti85nvMCK0Z3w5zYC9klxDZw8DcaMpZHawG376YVAkgA
         sne+BSwTY9aKxX3EfTVbccl56xhj2SnpOHDPwb0rUmhOpnxLt898EhtO74v5THhlVH+7
         zM1yq/fgVnFwaUHqAzNcolBdDIewiO/U3j6axVQssyIEbmjcx2T2OmZVJCUdu+ESZr+W
         lbooNvHk4xyufux5P7bTmMxRSvHlWLy95xT29HiCrL5VFF03R0EqjbPHDVVbFqbZDbi5
         DHBYCjps5XAVQX5hNxvD/VOvnsGZN3ZIbeaqjUG63m3VR3AVPTlbOAJJi6D/dSCmU9Hm
         2y0w==
X-Forwarded-Encrypted: i=1; AKwUvByVWBGmgwneiWbaRLBfmAp+TTImYVdSKnlNe50/xm0LbeH5qIwdImNE8+A01nV1JvlNQrQR7epYpWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2J4JINYmlpXa0fEJTXxNrJ77QoKV/BbxQhVyfP7aOteJEQY/w
	VijD/Xa0Gv95D1NkY79rbf+UYkHiuTcOZ8TuVMavE/i6QRYx/N+D1osZ
X-Gm-Gg: AYBFou2L+GjvGpWOc1ZV2WdaOWc+E6rWXlK27ssKi7/YTqAh/GlZ591zClFmoJ+4RIq
	gbXN8NvxYkcVnP77r5j6xIkzEmax1MpP/vL13ydtZbsbHC7Mm7EL+4rhYB6Rns6bGqCn5jG1qHU
	aZwmJwaXZss4UXsUORhW+ZyCO8c+daa/a/4zo+St6hgcb3WirACX8Rfhhxy5PHvAtzFfSkTby5r
	99+GPh0Hr+lk+T1doGHqG7xg05LEA28Ky73vFUNWI5T8vtV8smLhjQhX7ZCTfeasMFoYMPQKud8
	KQAMT30t77Coejyh6YceZt9zFg8xEGMi6fbJrumubyXvB1/g20O7nfVr6SapCAH1C5pW1AR0c4K
	oUVPLLeOLvwpd4mqPx7N2go5Uu4p4nH8+jRhPewULfN7YfWTy5Jv4pica0/RTlyAxTvCROdWGlF
	0W3D7/WD7gq4dqebAd3BR5HD+CD8FBx6jzUot1VggxBvY+6L3tZ4BOSypS7Ks8p82DGaxMMmrUX
	cI1ENWn+yxvgSGGcd7AXROc/XVNEjqg5NpLkd0=
X-Received: by 2002:a05:6a21:8216:b0:3de:b120:bb88 with SMTP id adf61e73a8af0-3e16bb71260mr12893094637.2.1791904758027;
        Tue, 13 Oct 2026 08:19:18 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:15 -0700 (PDT)
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
Subject: [PATCH v2 14/35] clk: mediatek: Add child-device population to probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:13 +0900
Message-ID: <20261013151734.3177690-15-akkun11.open@gmail.com>
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

MediaTek audio clock drivers call devm_of_platform_populate() after
mtk_clk_simple_probe(). Extend __mtk_clk_simple_probe() to run
of_platform_populate() when the new 'populate_children' flag is set,
reducing boilerplate.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Use non "devm_" helper (based on Chen-Yu Tsai's review)
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index e06cd40d995a..1172e76516c0 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -603,7 +604,16 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		r = mtk_register_reset_controller_with_dev(&pdev->dev,
 							   mcd->rst_desc);
 		if (r)
-			goto unregister_clks;
+			goto unregister_provider;
+	}
+
+	if (mcd->populate_children) {
+		r = of_platform_populate(pdev->dev.of_node, NULL, NULL,
+					 &pdev->dev);
+		if (r) {
+			of_platform_depopulate(&pdev->dev);
+			goto unregister_provider;
+		}
 	}
 
 	if (mcd->need_runtime_pm)
@@ -611,6 +621,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 
 	return 0;
 
+unregister_provider:
+	of_clk_del_provider(node);
+	platform_set_drvdata(pdev, NULL);
 unregister_clks:
 	if (mcd->clks)
 		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
@@ -658,6 +671,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
 	const struct mtk_clk_desc *mcd = device_get_match_data(&pdev->dev);
 
+	if (mcd->populate_children)
+		of_platform_depopulate(&pdev->dev);
+
 	of_clk_del_provider(node);
 	if (mcd->clks)
 		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index b6504b3e77ed..11939e3e0b38 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -265,6 +265,7 @@ struct mtk_clk_desc {
 	unsigned int mfg_clk_idx;
 
 	bool need_runtime_pm;
+	bool populate_children;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.56.0

