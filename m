Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E25349B3
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904752; cv=none; b=Iyrj07+0YeJnA/oKY6gudoLssG6dOi+3dycrarjzJ/O2NFPtiT3Bw+XqVRMP/Yo72Bryq0EityMm5Por2oPoJUK7YJRPUAOGRPImnN4x0pbIsvUo5MPGKdEeFbXAgmoGeJCQQz116oU9IJfPQP30AltySh905nar7iIuhGSqVEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904752; c=relaxed/simple;
	bh=uvr/aNm7qTviBqDZOiXgdASosjAnwdP7ntJtolZ7TnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcLDDPRGlmE32hnxBcIbwERtCOAUhKhc11ZYLa20wTcVx/KK3pP2Z2j2rBCrqF3Md5oJOpdbbBp1h6kNgFHGI9HV6lS+eEv+LI7kct5KsJgi0WR8KTah1FAG5Brf7hTawyv70rjgt0UVXAOr56sPauIgaS7NrE5Rx4q6VoKgLFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sH/15U5K; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sH/15U5K"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1388155a91.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904751; x=1792509551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=;
        b=sH/15U5K6l+FZSdvGzFM2Jnsny9Pk2dh5pBUXJax93GYMJjRIEIO5skDNAQAH3BKNI
         i2tlcCmNQzaS2j3Y5lOt+ioyv6hYvxk8qbef0ukqj9kKtGAlKgIlBTlUlaHEjhaCytT8
         60fraB2qULAXV1jw/bDcVrZRNYvU22AGx8Que3+h1bUYN8kYUvB6Lnue8cs7FSfwDgzX
         VTRAbg2TbMMWgmJmiqYnnkM9p+uH6hpDC/KdfUtsb/iJn1rHvcim7cKYEGy4WfPGWkFO
         sJINDOt/xo4PmqumU1hhrXMY8V2A2Y3e0tyjiEIoPzu+hvTAYZRvW9m/C7hHTQfARCgE
         g/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904751; x=1792509551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=;
        b=uBhmFWObpZ2quMEVAAsgeWfjtfj/xq/yKYfwxF3hVphXrw1YWbCrXov+Alfjrsn0EQ
         /ToI/RUAsmBW0ay5nYTsZy6MeTqRd66JicKvm8+RUCYA4HunuiCIDTJxs/PUDOFenuC5
         dtK1h2cNuFcOPWwfgOGiXmm0tCSe2DhELi08Ra0iNUgcMcXvfSJIT/9/7pNLNT/Zy22w
         TycOhu6539ZHlNq+emM00iCLP3HMI16DwENPlTJdmTH7MDSY57PzDU9fupWmHUqT2UOK
         7v11Gy9XT2YXX1jKhmPh9QotbvJMTSp2DPnme/zY2Crhoy4KqTpua8Qb0Q2AsphNAEqA
         oSQQ==
X-Forwarded-Encrypted: i=1; AKwUvByf3qEyjm2RmmFGjMGYmmxnyC+yr3UHstL9lfUex8dEsm4LlmMtGoI+pMoe2vXaswbtvWgaU0To3J8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcNPl0hcHnNHs5az5XTGhz7J3YKJloHDUg7L3rrT3DQdlwuP5D
	3Pca+ywqlfWg4HAuReKHZFtyF9eFVs64VPVpgr05XMeYcUDGPZJqCr7g
X-Gm-Gg: AYBFou0hlaNPtHpDiBUMUqE9RNPVuirqRR2SufItmyVU+Mupcp2UyEnpEvBNvqoXAfw
	cUT9KdM1k2Y/31d3ysQHr3Jx+rLWLGhtabQVaoeORD02SauTB0tT6h2PUMsv42QkEKnlVC785DM
	U0KXG81n+yJUcxUKHqsQIWWvBHNMTMtX8kPc5mmfYlAI1qrIxBdcB8Vq2TskE0jclsNnvTEUeAE
	ZQGDhAiC8I+Yswl2c5ALJPGi6RzbatQXn809C+yOAcuYLriiTjjDh9Mw5soHL+oT2rqGE6T2Xwx
	AED+U1IHI4qd8oEBMzgCw2HplfFBhZxnyod2cFDm/Yn6To8MkwlOfUudpmFQ1DuSyuvtODxkzW5
	kcVNwZlNfO8c6kB4U4CTMaUmSzQFOFzC6MVSrdyiNTAi0KbgN+oy+i4T0X9L29bmMvHDsQmdgG3
	JP1xuicb0LWrSyvPYVIXL6zfuV8OFNsTwv97D1B/5jpFO25WB4TZRGai841Z2rOE4isXTHnaqQB
	f3PkvvR6/25lWNCYAmzLW+jtymswg==
X-Received: by 2002:a17:90b:1d4f:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ab3a79d9f8mr10541804a91.45.1791904750446;
        Tue, 13 Oct 2026 08:19:10 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:09 -0700 (PDT)
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
Subject: [PATCH v2 13/35] clk: mediatek: Add PLL support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:12 +0900
Message-ID: <20261013151734.3177690-14-akkun11.open@gmail.com>
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to
support PLLs. This reduces boilerplate code in apmixedsys drivers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
No changes in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 19 ++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h |  3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 004098a839b2..e06cd40d995a 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -20,6 +20,7 @@
 #include "clk-gate.h"
 #include "clk-mux.h"
 #include "clk-cpumux.h"
+#include "clk-pll.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -486,7 +487,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	/* Composite and divider clocks needs us to pass iomem pointer */
-	if (mcd->composite_clks || mcd->divider_clks) {
+	if (mcd->composite_clks || mcd->divider_clks || mcd->plls) {
 		if (!mcd->shared_io)
 			base = devm_platform_ioremap_resource(pdev, 0);
 		else
@@ -514,7 +515,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
-	num_clks += mcd->num_cpumuxes;
+	num_clks += mcd->num_cpumuxes + mcd->num_plls;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -522,11 +523,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		goto free_base;
 	}
 
+	if (mcd->plls) {
+		r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
+					  mcd->num_plls, clk_data);
+		if (r)
+			goto free_data;
+	}
+
 	if (mcd->fixed_clks) {
 		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
 						mcd->num_fixed_clks, clk_data);
 		if (r)
-			goto free_data;
+			goto unregister_plls;
 	}
 
 	if (mcd->factor_clks) {
@@ -630,6 +638,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
+unregister_plls:
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
@@ -668,6 +679,8 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
 	mtk_free_clk_data(clk_data);
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 02fab4b166f2..b6504b3e77ed 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -23,6 +23,7 @@
 #define MTK_WAIT_HWV_DONE_US	30
 
 struct platform_device;
+struct mtk_pll_data;
 
 /*
  * We need the clock IDs to start from zero but to maintain devicetree
@@ -254,6 +255,8 @@ struct mtk_clk_desc {
 	size_t num_mux_clks;
 	const struct mtk_composite *cpumuxes;
 	size_t num_cpumuxes;
+	const struct mtk_pll_data *plls;
+	size_t num_plls;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.56.0

