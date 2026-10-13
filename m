Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA545208BC
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904746; cv=none; b=OiiO2lLtNW+lVXUe2pD6JOJTQ2BQiJxmV+5CHo/h4QoF3uIuiKvBWK27T9/ZzC8k4/FNvW8iuVhufFST6BJrZ9NXP2y2YpOPTbpGf92CpEmWvpGiDWQ28hjQRawXmHhZMxlz0Sb/zHSZZdqBI3ukdf3Xi/VfFiSJQs6thT4WeAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904746; c=relaxed/simple;
	bh=/KwDlVeusGGxSdrsgZ2Wla7DqEQyrxKB13jqubXMBuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnsD0MqsmXm88cRILPbdMW1B8JjPICmO2Jw8KwGWnoS0PgdT0JROA3R2ytbAWsBFR4+xX0/fJRZkIcmvcJglqSsUhDBbJAoBSXHbzjzIhTQoo3l/+3udEEzRy8DdUd9FD5VCwDB5ur1ENTluNshthvk0uJL5iJrVBW6NonIiumE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1l8UGaT; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1l8UGaT"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso1238744a12.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904745; x=1792509545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=;
        b=U1l8UGaTuiw6tkGPZunS/b+8zfZ8VCepfrZkHpG964Qi7PIrn0jv+ACcKmpCyUi0m5
         69ptvi1w7IZjeV4VfgG7rJZyF75/ZrbsIf2P1ZUzNR+2kGwlvs5ozrHsz7LYBdZIZOeT
         WkQmHx0Eog5vEAGvWgmrW7wqpytVKarD4mYolDP2Mm4KWF3tlY25gFaNwpVS456EzecA
         YbDs1qBDFbt3No3P4/NtmgY1GPpGNSUq1+R5z2cRJ4IWB2OXoW8ajz6mWeUH8YO/fqrm
         VDUK79o7dqUuswee1blWwA5jqGIIPJ6ZembnQevSpbA15RcmxrLEUhMmWAFPE4C0xf8/
         qkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904745; x=1792509545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=;
        b=xZwsgc/OPFzzHonWOKOFV10JFQ0+ayW+LR8cJ4ca0+EQ4PTegr3MA/Ah9zl1nxWKF9
         UldgcryuhFDeyPI5z2XfleED/u+Z6kPWimhQVHNJt0O7KAFRFRM+g8NYTmSz2WlECmuM
         5NEEUExiDFFw2IlPO4GXxJmjWbNcCTlEO3ErU83AzMGZm04nbq7uxi7Ba13w5NlLICSP
         XOONF5G+4XJs+0o7gTs4CyPuRrZ55Zj2rM8tEKlo7LnBoDNBm8rAPhnyHf718aO5+Nq3
         n5W573ZIBB48lCJZVCulbY4qcjKfMeVQfyGlmc//8zsYCUQgj8ke3LEiYxlbfv6jSZKB
         BpEw==
X-Forwarded-Encrypted: i=1; AKwUvBw89nqFd1PBYbycAob5nkIB163ymdle3KldFTVQrhTglrrXIQmFULXKICQLsUGg6Uzey0Gd/YcMDYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo+g0wBaKaI5PV4bTTFKQOqb5JWyt98wTEYGUDYqoNnLmvNz0K
	TdSWmQhdAv6DX2G7yoi0W4a/vAXwmyw2fsJE+1IhRVgL23/I7kOQRpQI
X-Gm-Gg: AYBFou2QoUeZjVhYMucL9C/o3UPKYu9W0su6K5zkdDuEXthN7ImhOsdApAKn0jc9fuv
	nANoaYjIyHaBrPvj1iUCrupF1aQIWscay0A4xExbHWONfIzddUPzro2iGH3NhV1vUrSI6WXects
	xUNfDzy5Icj30GdJlbwKSwxpz0NuEoBSHHAuq8UuiW7a7yw3bfT/QhblNCsC2xK4WFlwwAElEeQ
	L/RBpCuPVBeJAYkwIPoMKM1QqaMIyPOIpXfNTrv4Y2Z5N1Z3MdTWW5R8c7bHSdgpHmasjWIEVNt
	owq5gNv2FlKCbQGQXQbshz7qcQbJAsuuXvtKPeBxpq6ZfnZjEtCvSrOpOXRq/Zn007mUzW6U3yx
	/gKYt5IWZCKcOUUvqHxG5RO0410lbrjOYOip097htkHWZowrRwjvYc47J1oxXp0Vtox6gP59T6b
	MNtxu9/HXayHnRUW/eyWIcBsHdzLNr6ylY951K1m4y9p1rR762ejxRE0QJCxjv/3z0tVrrb6sCo
	Wdz6rSyy1ci7uairzIWZdULtUFP
X-Received: by 2002:a05:6a20:1455:b0:3e0:e349:f672 with SMTP id adf61e73a8af0-3e16bf5d17dmr6698639637.82.1791904744725;
        Tue, 13 Oct 2026 08:19:04 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:04 -0700 (PDT)
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
Subject: [PATCH v2 12/35] clk: mediatek: Add cpumux support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:11 +0900
Message-ID: <20261013151734.3177690-13-akkun11.open@gmail.com>
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
support cpumux clocks. This reduces boilerplate code in drivers for
SoCs that require cpumux registration, such as mt6795-infracfg.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
No changes in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 11741cc6ccc7..004098a839b2 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -19,6 +19,7 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 #include "clk-mux.h"
+#include "clk-cpumux.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -513,6 +514,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
+	num_clks += mcd->num_cpumuxes;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -542,6 +544,13 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_factors;
 	}
 
+	if (mcd->cpumuxes) {
+		r = mtk_clk_register_cpumuxes(&pdev->dev, node, mcd->cpumuxes,
+					      mcd->num_cpumuxes, clk_data);
+		if (r)
+			goto unregister_muxes;
+	}
+
 	if (mcd->composite_clks) {
 		/* We don't check composite_lock because it's optional */
 		r = mtk_clk_register_composites(&pdev->dev,
@@ -549,7 +558,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 						mcd->num_composite_clks,
 						base, mcd->clk_lock, clk_data);
 		if (r)
-			goto unregister_muxes;
+			goto unregister_cpumuxes;
 	}
 
 	if (mcd->divider_clks) {
@@ -605,6 +614,10 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+unregister_cpumuxes:
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 unregister_muxes:
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
@@ -643,6 +656,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
 					 mcd->num_mux_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..02fab4b166f2 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -252,6 +252,8 @@ struct mtk_clk_desc {
 	size_t num_factor_clks;
 	const struct mtk_mux *mux_clks;
 	size_t num_mux_clks;
+	const struct mtk_composite *cpumuxes;
+	size_t num_cpumuxes;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.56.0

