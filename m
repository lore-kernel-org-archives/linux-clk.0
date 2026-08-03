Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06D40BCD8
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766694; cv=none; b=EgDW7Bpae2vfgTaGt/DRBQUoIcpBAesG2Zqg+SM1OZMPv9EWPf9Si0gQrnZ8vaDboWsNwVQUdN6EfX6SWrkNZTZ/xTFiQgrd0gnXuksGhTIBMEgyVrXusS+w2xeTRi0O+gCRolXIj27Dm6/zwiBdE1dxB+9cydhwKhrfV7e8Gl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766694; c=relaxed/simple;
	bh=gIBjErd2e3siZ9t2gE19tfKuREF4r0RpkffEpLk6rgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEFSsxRxWQQ3z9Pm65ue4cvov6WIVuqQU9E0nrrjHV57jVM/dzpPJUDPSRUdcSo62J15KX3gypTht57L/ZfXLUuUdzQZJGkbAuktuwU3fpU+3BV0QuXKcE6gypRQ6+YZlzXvEYseyjwHaH7+XSlfH5x0ZUWeAisMZ+3SkfDfHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWHvvAAx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWHvvAAx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caea3f742bso34951335ad.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766692; x=1786371492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35MPZYKLCACvIdbhYzSIWcM8WhL87zoy/9oei4fzDb4=;
        b=VWHvvAAxlQDBz06vpf9NMcaigKC64zqfYL4A/BqzoLJrhGI2wOiB68k15Sbm5a8Ikt
         PZ/0XTq+fKYsn6OpHOfm6gE8E0g6c+yr7raBAtm2VpQO5hvTHWyXAfo61O2Kva7dws6H
         jRK6N2aV7cU4tSvw1iILbMFgZuO+jHDfTcMEgnAFMMh9C91foQ9CQeirDsdutBlRXksH
         guatefXMU1LTMD8Zthxh3SorDY4fOwBa8v13gPHmKPsAUMzhuQeAzRkZ/dbZbiWsm8ef
         Nec8NK7Ho62Si8zJF9yZ5XndiPPytcyzHxLstN1GKZb7iS0ibktfMjWNZHzOmEo3436o
         yl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766692; x=1786371492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35MPZYKLCACvIdbhYzSIWcM8WhL87zoy/9oei4fzDb4=;
        b=TK3h1VjSjzcqgai3Dgp9XSDjYbnuvMHuDqdC5dNopDGUXWm7cG3uefH+FjrocOK4w1
         waXyYVRup/JLSFlC23DIrCHaVK8eGrQ3A2+09JDAHg6a2eedWWxP+PgSO4mwbjbvlBUT
         iDzDe1M6tZnwo2FtIOn84LNKb1F0LJ1QzMszVEaGagxpPhjT4aEMOkZBrCT12H5a1GxI
         RhKOOj/J7Ejcz+us2LMmj6yi6jJlERrAkI01AIM49GHeO1AReHpUti5HjSNbb05Zrd3y
         iaV4mHg403rUC8H0o45dmaNHlGVmOpq95J2x0cxGMbU51D33KpuG6FuDhIA78Bs2vbYn
         /3GA==
X-Forwarded-Encrypted: i=1; AHgh+RoaGh34kMiQtLvsGNPpUnVStWHRTOaU0ke9cdTZlIh7g5t8kdGTJgTzd4yyhwnUmdMvVp5s+ArbT6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTqhquTYgljppoRJuIL9zCaEWVF7RHDpKckNha2h7TjxbyKERI
	mfUXMNKv3nsdhPmrjQXoFKEUGHCVcdUosQVIX5+pnXg6CLIXDd3D9NO0
X-Gm-Gg: AR+sD13lFaZtz3TIvFUEnWZEq/+0zBmJJfK5riiRuZbe88K44S3D9Bk70OYqXGOjo6O
	IZlhO2Dpw81hbtgPzjwBcYSWNS5XS9w3N8Qa2EEjjDPSkPmycIdS6cnZ7zY3EJvrf5Z4qSB7qQ2
	+1ITpUa1+a7ZmyHBGVhW1Ih2etqsP/mmqUgeUb90fsJBfItdLQKJAHHcaPsScJoljUHVYD2+V87
	lcq+hMDtqyQrfoN7pVIv87jq+oZQ55lakfxE51BlkZ3jtz+1tjhIGrEnVCfLiGCn/x6gnVmT/XA
	658IJwq2HrlKMSl1cdH5Hh3TARgDfhAK/H0BuKroDHZnR7ibPWnpA2ghk5WqrQGof/fKdiRGx/r
	rw1qObBgxX/eKhntk5Mqy1vaACzzbGBoq8Mj1rXKxDgmRUeRQZjEMq6wh4GKlpSnXrx82H1ah+s
	x+l3T5J2lWrbxb/Liqz/BpLjSRCJkeP8CKc2Gki9f26IAFYblZKqYCh9dFcpNeUsrdpDkDj+JjV
	S7bjlOjnxaDzTN4AfJMDg==
X-Received: by 2002:a17:90b:3e8d:b0:387:e0cb:c8da with SMTP id 98e67ed59e1d1-38fbc57a3b2mr8948527a91.35.1785766692243;
        Mon, 03 Aug 2026 07:18:12 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:11 -0700 (PDT)
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
Subject: [PATCH 10/32] clk: mediatek: Add PLL support to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:37 +0900
Message-ID: <20260803141659.559129-11-akkun11.open@gmail.com>
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to
support PLLs. This reduces boilerplate code in apmixedsys drivers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 19 ++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h |  3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8148c21e6099..c3369a04cdec 100644
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
2.55.0

