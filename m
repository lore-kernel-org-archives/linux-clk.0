Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D5B3BB4F;
	Wed, 15 Nov 2023 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9yf6wNG"
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB397FA;
	Wed, 15 Nov 2023 09:08:35 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40790b0a224so54749485e9.0;
        Wed, 15 Nov 2023 09:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700068114; x=1700672914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXTjoyVMIW/yRQ2Q8optVuxtgEkz3DRech+NYfXUR9A=;
        b=X9yf6wNGkmojtLEpdo5rzBFKkHyjtJhu2injD5kPyDhRfxlg7Xyri1p7qc/eX84M8r
         RGS80FJqp995y21a35nem0T5XoP79cd28sef7wX9+S9dstssM5uPg9Y4yvWUxbewmT/9
         dgXWU1Bq3qfiopF3AbsY4JUxThC20b7oF46CRscnVBQK+Kv+TxYq+OvK/xudKKJVA4AX
         GAPzySZhaM/WG2Qgm12rKAWAgOTfpGx2bOsz9cyE6d5u7z68pf5Xj0E+gypm+pcRRvvJ
         pjnOFDCc/Cgyj4b6OJIg+lqpWOrGiY1iAZL4lCTbieRxXLrVL2066ZEGTw1rGkso42j7
         sefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700068114; x=1700672914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXTjoyVMIW/yRQ2Q8optVuxtgEkz3DRech+NYfXUR9A=;
        b=JR6i6xrPcOXVnOKvTBY4xunvqlEL+6O5mZar82l8wnXdh2EzSQyQVtIl+4USmYeHP+
         t72M8OSVjuc5sZhF1yQfVCn5CLmlQLAgOwppMxaf2mk7PW10hmQoUUr3EzATgJ6Jel+D
         1fh9jNY1lMwYhjO4/4eCjiS2mjuDExReU5Ou2e8ivmbreVEbFl4SUGMx9mT56TOEIa9N
         Gr3Q1bGZBI6zKhFq0ZBFsNxcjRi4d4UcVLBiynoOGesn0TQOBmikwCEmL+00rQ/P0TYv
         oEJ5vZd/It25VSp1S3O0+KDiWN4qvF/Iz0XuFvlSxGRt1ABzt8gKksv2b2pHeN9WMyHo
         L3og==
X-Gm-Message-State: AOJu0YyweBmgdW1BtE+VUqO6rL9oR/PQ22+JE32DCJkrFsq7Hhx3XM3m
	cJIJDh/mHShMzY9OrlhUYs7ir3giTr8=
X-Google-Smtp-Source: AGHT+IFljFo2x86LrUGVvlArWoH2Dzg1FID8H1eKmivUz22BVETYCNx6O9wJom4ahLITEq9gblxjmg==
X-Received: by 2002:a5d:64ee:0:b0:32f:7fe4:45f2 with SMTP id g14-20020a5d64ee000000b0032f7fe445f2mr13012008wri.4.1700068113882;
        Wed, 15 Nov 2023 09:08:33 -0800 (PST)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id o1-20020adfeac1000000b0032dab20e773sm11077833wrn.69.2023.11.15.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 09:08:32 -0800 (PST)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH v2 1/2] clk: mediatek: mt8173-infracfg: Handle unallocated infracfg when module
Date: Wed, 15 Nov 2023 20:06:24 +0300
Message-ID: <20231115170825.908640-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8173 infracfg clock driver does initialization in two steps, via a
CLK_OF_DECLARE_DRIVER declaration. However its early init function
doesn't get to run when it's built as a module, presumably since it's
not loaded by the time it would have been called by of_clk_init(). This
causes its second-step probe() to return -ENOMEM when trying to register
clocks, as the necessary clock_data struct isn't initialized by the
first step.

MT2701 and MT6797 clock drivers also use this mechanism, but they try to
allocate the necessary clock_data structure if missing in the second
step. Mimic that for the MT8173 infracfg clock as well to make it work
as a module.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v2:
- Rewrite patch subject for consistency

v1: https://lore.kernel.org/lkml/20231108213734.140707-1-alpernebiyasak@gmail.com/

 drivers/clk/mediatek/clk-mt8173-infracfg.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index 2f2f074e231a..ecc8b0063ea5 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -98,7 +98,17 @@ CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
 static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
-	int r;
+	int r, i;
+
+	if (!infra_clk_data) {
+		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
+		if (!infra_clk_data)
+			return -ENOMEM;
+	} else {
+		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
+			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
+				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
+	}
 
 	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
 				   ARRAY_SIZE(infra_gates), infra_clk_data);

base-commit: bc962b35b139dd52319e6fc0f4bab00593bf38c9
-- 
2.42.0

