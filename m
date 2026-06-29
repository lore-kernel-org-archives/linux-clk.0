Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1F2E7185
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743055; cv=none; b=KLzHSzcjw3t3cNEW5opy+71OXqRDfFop0Vvc4vkbBoPMDNfxQL5fhy0G4Dprx2sDBKkWOkHp1oVL8zK+wWuy1Glh3Chyn/Bany8S4v/+Zvx+wK5U4b/ZwOhrfckXs7G+Ipx5dXzgJUCclJgp5K+8HuTRejWQ4E69jBct46Bjqm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743055; c=relaxed/simple;
	bh=nkdey6N0dtLwNgVGQFnGByxIUg93+UcfWsr6NLV+l7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZYRtfF5WsN7nX3G9ccD+FmL/K/Fx1XP5pvB14SLyXfTz/Ha2/2J9IZhUyppgSQ6sB330AYHOH3sgOu38vrYHXOssWd7XfhSkTldhZ+AKNkNeejrLobc1kWWCb9PHwlerH1UZ+NxqZIi7MeHErNjFG55SvFEqx3nKlarK3vbkcXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obtRxDMf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obtRxDMf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso1485257a91.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743053; x=1783347853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geRPSWvxvMn9jDj9k0oxQ8NVSaQtfwxbqr6vTa84l6I=;
        b=obtRxDMfA6crad2UvGm8+lEoWS3M7xOZVLqSYmSWK1Bt3OWpm+NbjxPtOPP55h9pNx
         m2cHUe5aVqBMHBCJyFpbqJ+BZkd8ZS4HZb9u1mE6bhgNBj2o7ovc66BxzLsnYLiXKj4I
         J7CW/hNOFalkTHPHu6EWYqTNWkeFFY/TBgGzhaCwh+6EpDx3FiYBLVmtETq9/N7St4x0
         j4JTkHFIZ0K3slGnxT40koxs1wvJIJyCp1lmQY1TffGVP2fJkDUkWe9LyXhngZ3umDr8
         mgIF7kpaJmZ+xVL3lVMaQiK1+wScqJ1XM3P6eCc/ZnF6OacQRcbZl2ECq6kt+e6TpDkP
         ygUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743053; x=1783347853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geRPSWvxvMn9jDj9k0oxQ8NVSaQtfwxbqr6vTa84l6I=;
        b=VcHZZkrlTHUWos85Prk0bkKXA6UzqIGMY/HYxzHoP8pHCXF1PXg7vzkXgK5MuEeWVO
         2uyAIrJluw0p1pjTalp+vd5kmx0C6cQx19ogJwXlG4Nz/fHUAI4eRbdNEimqRBt6CAHW
         9O0WVbA2nblyE+xKb03kAvnPrL3Ksh3XrhqRwttCAZ81SOl6QwKF0PpMimYsNl5n7hUT
         gxx96PF4tKmmmHP/zPDlRoenHlN+dqVnQdLZMincoq6L0zHDe3FJKnJMjYPWsg1TeGeY
         jLEedG3AMrqyDbRREk+NQ6EgeLEeVN5aAcgjv4tmsMYIk+0nb0L2ztSUe9vpqXVQ2oVi
         UJzg==
X-Forwarded-Encrypted: i=1; AHgh+Rrqipb8UD9GkO+xALApRCNTaxZyQCN+QFWhrz3GwILa+KfYtT98phhDJn1Dhp342L3iH3w7mFBdJ4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoAmArnlwuipz9tehcvIzfKKRAN8bS4ctce5niPAOBke/WcFBJ
	DDcQCb1KeqSYDqUCjbokwKXcQOijx8LFYLaHzRoxHubFWkrCbzs2QXdt
X-Gm-Gg: AfdE7ck7qPt71A/8v5W0fOAEYvo5PhQIqLk677KEpjAKUulT39kHzS2SqI3sZK2MHVi
	4gkNHolTAcZW0pVeRKz76Yda6CIMh/Ky6EJY6ZaNi4BTke2DECiCRBhgLQumIuQtNDzduj9nOWF
	Ut8cNgj91e2iKhGahk1qdRaAbCh57j8CDxPaFz0B27qOILEae+H+ZEOZ6amB6D/dh412BTxVf52
	dZzCFfImX15bkWcTsdegU2oyHhNVticSGdDfD7F4CjFzxAUZaFG9+vLBhuNODNO2g1ODdt2ZkyE
	t+i5hhVQf7+SXtFgxut99MSnouBZlLJS7Qs1xduBbxhvtqR6V8LQOEUWjy8dAH26XtInZJNC/v3
	NhGklaO1+tqyrMOwfGiYE5HexJuIMg+LeXGzsRfb9/ShQeKoJy+CP2rJHGTkg7mzPbZmWZEpEIH
	55qpg+cr2keiAOVXnKlEMMunJAQu14axqTFqpvMSZTv/R9
X-Received: by 2002:a17:90b:510f:b0:380:540:d49a with SMTP id 98e67ed59e1d1-3800540eb15mr3073658a91.7.1782743053280;
        Mon, 29 Jun 2026 07:24:13 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fd2bd0e49sm3919763a91.0.2026.06.29.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:24:12 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] clk: mediatek: fix memory leak on module removal
Date: Mon, 29 Jun 2026 23:23:40 +0900
Message-ID: <20260629142348.273766-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some MediaTek clock drivers do not call platform_set_drvdata() during
probe(), but their remove() callback calls platform_get_drvdata(). This
results in platform_get_drvdata() returning NULL, which leads to calling
mtk_free_clk_data(NULL) -> kfree(NULL).
Therefore, the actual clk_data is never released, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 1 +
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 1 +
 10 files changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..24522fc24019 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_plls:
diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..b607592a7c37 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..12146bb3b726 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,7 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..28faeb2e657a 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,7 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_composites:
diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..a9fc2e5536b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,7 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..b44baf521d2f 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,7 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..41e5cfbcbb76 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,7 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_plls:
diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..fe36d2eac3da 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..b923b73c64f6 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,7 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_clk_hw:
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..446c55b77777 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
 	return r;
 
 unregister_gates:
-- 
2.54.0

