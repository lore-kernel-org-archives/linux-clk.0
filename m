Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16F5318ED2;
	Tue,  1 Sep 2026 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275653; cv=pass; b=KSrDUGWx43eo/NmhLW0TOHCcKn9c45AhMsMxmIWQhrbnfNkjZUhbeoIq+COd+63wRiDDgUpnKttdaJfqv5ULNo5IubYfRnGcJ/UURKDHnKzQAYK3fWiRwLx0JKvgXE+Xuhb+OKi+0/i/7C+MJ/FvRgzKXS0hB42tAXJakVKB+Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275653; c=relaxed/simple;
	bh=s8fpgB6mGTW2u6v1eFnoj3zvyS58TCzLHN50SL6usnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jTHHVPT/ZWn3C0sUwjxfod0tYbzpwDgdV7vyHzi2+A4ps45J5iZNBSdYN1lHw7c7b1MpspfvTwtir+LQLj6ynv/EeLmH3y0gsdE10BJlo1oXhqwR3BMzKQNrnuciRG+l2g+lZsJYtv/dTwTXCB9rX0QDPrSOK9sHx2zuAElHN1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=chKxVftu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="chKxVftu"
ARC-Seal: i=1; a=rsa-sha256; t=1788275633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m/qx46OP64iE/WYWWYpfub2V9+XK3vB6IhrbFCj80sZUmqzHOXwkmJjrfdp/XtDKm0C/6EpYUzDKtfli8xdLONAVbZg1VC+Ayxhq23yBnlalS32tdnCHKtL0LWRtzq1pW64FB3bri/mt7vgitgHufzSFLjGGAlrVJ2vqUJo5igw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275633; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d6u/kmbF2kdDxG9ePtu8S4fZO3W//sG9GxBaHKxPVZI=; 
	b=aWZobQb+NHpJ9qBjXxhTKuKaxML2AKspn1+YHYfyzDzVX6snYrspPQsWE18PoOZdfG4SGXOhH9Wme4RyprFDUBMksgRxYPVRtQ/U2eXjEPHGr+Q/3vL9RZT3d0zod2ktHkuQQt5yfNcG/dfyVKbD0Y1oUF0acmB9H6BYSM6Tcuk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275633;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=d6u/kmbF2kdDxG9ePtu8S4fZO3W//sG9GxBaHKxPVZI=;
	b=chKxVftuxavbRYqN+fM6/DwnnHfX3Ma5Ci+WoAfdph6SL5weVJ613JIXODzYU4Oa
	zDR0ocwYb7DAJAMP3hVodrHEq1/4OQV22okjUq54oLhJr7boFUZ5M0w6q8nOEXRXYHU
	MdXkeU+DUmtUxuUihoNFSsRHpxSCedd0PxaKgyO8=
Received: by mx.zohomail.com with SMTPS id 1788275632318628.167775850034;
	Tue, 1 Sep 2026 08:13:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 01 Sep 2026 17:13:34 +0200
Subject: [PATCH 1/2] clk: rockchip: Remove dead code from softrst driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rockchip-reset-refactor-v1-1-936576523b21@collabora.com>
References: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
In-Reply-To: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

Every Rockchip SoC supported by mainline uses the HIWORD_MASK mechanism
for fine-grained atomic register updates to the reset controller
registers. This means the reset assert/deassert ops contain an
unnecessary branch for code that is never used, and the driver struct
contains a spinlock that is also unused.

Remove this code, adjust the function signature that passes flags, and
fix up all users, since the only downstream SoC that would make use of
this code path is 14+ years old. If someone wants to add support to it,
it should use separate ops.

FIELD_PREP_WM16 can't be used for the reg writes here because the mask
is non-constant.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/rockchip/clk-px30.c    |  3 +--
 drivers/clk/rockchip/clk-rk3036.c  |  3 +--
 drivers/clk/rockchip/clk-rk3128.c  |  3 +--
 drivers/clk/rockchip/clk-rk3188.c  |  3 +--
 drivers/clk/rockchip/clk-rk3228.c  |  3 +--
 drivers/clk/rockchip/clk-rk3288.c  |  3 +--
 drivers/clk/rockchip/clk-rk3308.c  |  3 +--
 drivers/clk/rockchip/clk-rk3328.c  |  3 +--
 drivers/clk/rockchip/clk-rk3368.c  |  3 +--
 drivers/clk/rockchip/clk-rk3399.c  |  6 ++---
 drivers/clk/rockchip/clk-rk3568.c  |  6 ++---
 drivers/clk/rockchip/clk-rv1108.c  |  3 +--
 drivers/clk/rockchip/clk-rv1126.c  |  6 ++---
 drivers/clk/rockchip/clk.h         | 10 +++-----
 drivers/clk/rockchip/rst-rk3506.c  |  3 +--
 drivers/clk/rockchip/rst-rk3528.c  |  3 +--
 drivers/clk/rockchip/rst-rk3562.c  |  3 +--
 drivers/clk/rockchip/rst-rk3576.c  |  3 +--
 drivers/clk/rockchip/rst-rk3588.c  |  3 +--
 drivers/clk/rockchip/rst-rv1126b.c |  4 +--
 drivers/clk/rockchip/softrst.c     | 52 ++++++++------------------------------
 21 files changed, 37 insertions(+), 92 deletions(-)

diff --git a/drivers/clk/rockchip/clk-px30.c b/drivers/clk/rockchip/clk-px30.c
index caf7c0e6e479..1ce76bc149f8 100644
--- a/drivers/clk/rockchip/clk-px30.c
+++ b/drivers/clk/rockchip/clk-px30.c
@@ -1034,8 +1034,7 @@ static void __init px30_clk_init(struct device_node *np)
 	rockchip_clk_protect_critical(px30_cru_critical_clocks,
 				      ARRAY_SIZE(px30_cru_critical_clocks));
 
-	rockchip_register_softrst(np, 12, reg_base + PX30_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 12, reg_base + PX30_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, PX30_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index df9330958c83..4794d7d2fc25 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -479,8 +479,7 @@ static void __init rk3036_clk_init(struct device_node *np)
 			&rk3036_cpuclk_data, rk3036_cpuclk_rates,
 			ARRAY_SIZE(rk3036_cpuclk_rates));
 
-	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK2928_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index 7c3d92af12df..3b6f6f1f0473 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -603,8 +603,7 @@ static struct rockchip_clk_provider *__init rk3128_common_clk_init(struct device
 			&rk3128_cpuclk_data, rk3128_cpuclk_rates,
 			ARRAY_SIZE(rk3128_cpuclk_rates));
 
-	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK2928_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 318c8ddc8a76..9481ed7cdc21 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -782,8 +782,7 @@ static struct rockchip_clk_provider *__init rk3188_common_clk_init(struct device
 	rockchip_clk_register_branches(ctx, common_clk_branches,
 				  ARRAY_SIZE(common_clk_branches));
 
-	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK2928_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index ed602c27b624..a63f363058b6 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -714,8 +714,7 @@ static void __init rk3228_clk_init(struct device_node *np)
 			&rk3228_cpuclk_data, rk3228_cpuclk_rates,
 			ARRAY_SIZE(rk3228_cpuclk_rates));
 
-	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK3228_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 9cf3e1e43b78..4365ce8465a1 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -975,8 +975,7 @@ static void __init rk3288_common_init(struct device_node *np,
 			ARRAY_SIZE(rk3288_cpuclk_rates));
 
 	rockchip_register_softrst(np, 12,
-				  rk3288_cru_base + RK3288_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+				  rk3288_cru_base + RK3288_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK3288_GLB_SRST_FST,
 					   rk3288_clk_shutdown);
diff --git a/drivers/clk/rockchip/clk-rk3308.c b/drivers/clk/rockchip/clk-rk3308.c
index 95a9512a41a3..976da61e156b 100644
--- a/drivers/clk/rockchip/clk-rk3308.c
+++ b/drivers/clk/rockchip/clk-rk3308.c
@@ -948,8 +948,7 @@ static void __init rk3308_clk_init(struct device_node *np)
 				     &rk3308_cpuclk_data, rk3308_cpuclk_rates,
 				     ARRAY_SIZE(rk3308_cpuclk_rates));
 
-	rockchip_register_softrst(np, 10, reg_base + RK3308_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 10, reg_base + RK3308_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK3308_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index cd5f65b6cdf5..d15014feb878 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -912,8 +912,7 @@ static void __init rk3328_clk_init(struct device_node *np)
 				     &rk3328_cpuclk_data, rk3328_cpuclk_rates,
 				     ARRAY_SIZE(rk3328_cpuclk_rates));
 
-	rockchip_register_softrst(np, 12, reg_base + RK3328_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 12, reg_base + RK3328_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK3328_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 95e6996adbae..77ba625d7bcd 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -902,8 +902,7 @@ static void __init rk3368_clk_init(struct device_node *np)
 			&rk3368_cpuclkl_data, rk3368_cpuclkl_rates,
 			ARRAY_SIZE(rk3368_cpuclkl_rates));
 
-	rockchip_register_softrst(np, 15, reg_base + RK3368_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 15, reg_base + RK3368_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK3368_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index c2b243d7a5e2..42d2a48040f7 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -1568,8 +1568,7 @@ static void __init rk3399_clk_init(struct device_node *np)
 	rockchip_clk_protect_critical(rk3399_cru_critical_clocks,
 				      ARRAY_SIZE(rk3399_cru_critical_clocks));
 
-	rockchip_register_softrst(np, 21, reg_base + RK3399_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 21, reg_base + RK3399_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK3399_GLB_SRST_FST, NULL);
 
@@ -1607,8 +1606,7 @@ static void __init rk3399_pmu_clk_init(struct device_node *np)
 	rockchip_clk_protect_critical(rk3399_pmucru_critical_clocks,
 				  ARRAY_SIZE(rk3399_pmucru_critical_clocks));
 
-	rockchip_register_softrst(np, 2, reg_base + RK3399_PMU_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 2, reg_base + RK3399_PMU_SOFTRST_CON(0));
 
 	rockchip_clk_of_add_provider(np, ctx);
 }
diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index d571c4b0c35f..3871c139b5dd 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1644,8 +1644,7 @@ static void __init rk3568_pmu_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rk3568_clk_pmu_branches,
 				       ARRAY_SIZE(rk3568_clk_pmu_branches));
 
-	rockchip_register_softrst(np, 1, reg_base + RK3568_PMU_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 1, reg_base + RK3568_PMU_SOFTRST_CON(0));
 
 	rockchip_clk_protect_critical(rk3568_pmucru_critical_clocks,
 				      ARRAY_SIZE(rk3568_pmucru_critical_clocks));
@@ -1688,8 +1687,7 @@ static void __init rk3568_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rk3568_clk_branches,
 				       ARRAY_SIZE(rk3568_clk_branches));
 
-	rockchip_register_softrst(np, 30, reg_base + RK3568_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 30, reg_base + RK3568_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RK3568_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rv1108.c b/drivers/clk/rockchip/clk-rv1108.c
index 5f49af3c970a..71ad247b7028 100644
--- a/drivers/clk/rockchip/clk-rv1108.c
+++ b/drivers/clk/rockchip/clk-rv1108.c
@@ -813,8 +813,7 @@ static void __init rv1108_clk_init(struct device_node *np)
 			&rv1108_cpuclk_data, rv1108_cpuclk_rates,
 			ARRAY_SIZE(rv1108_cpuclk_rates));
 
-	rockchip_register_softrst(np, 13, reg_base + RV1108_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 13, reg_base + RV1108_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RV1108_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk-rv1126.c b/drivers/clk/rockchip/clk-rv1126.c
index 15e7bfe84506..f35bc9670c27 100644
--- a/drivers/clk/rockchip/clk-rv1126.c
+++ b/drivers/clk/rockchip/clk-rv1126.c
@@ -1102,8 +1102,7 @@ static void __init rv1126_pmu_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rv1126_clk_pmu_branches,
 				       ARRAY_SIZE(rv1126_clk_pmu_branches));
 
-	rockchip_register_softrst(np, 2, reg_base + RV1126_PMU_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 2, reg_base + RV1126_PMU_SOFTRST_CON(0));
 
 	rockchip_clk_of_add_provider(np, ctx);
 }
@@ -1138,8 +1137,7 @@ static void __init rv1126_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rv1126_clk_branches,
 				       ARRAY_SIZE(rv1126_clk_branches));
 
-	rockchip_register_softrst(np, 15, reg_base + RV1126_SOFTRST_CON(0),
-				  ROCKCHIP_SOFTRST_HIWORD_MASK);
+	rockchip_register_softrst(np, 15, reg_base + RV1126_SOFTRST_CON(0));
 
 	rockchip_register_restart_notifier(ctx, RV1126_GLB_SRST_FST, NULL);
 
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 72b36bba3152..4da264f5f0c8 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -1358,8 +1358,6 @@ void rockchip_clk_protect_critical(const char *const clocks[], int nclocks);
 void rockchip_register_restart_notifier(struct rockchip_clk_provider *ctx,
 					unsigned int reg, void (*cb)(void));
 
-#define ROCKCHIP_SOFTRST_HIWORD_MASK	BIT(0)
-
 struct clk *rockchip_clk_register_halfdiv(const char *name,
 					  const char *const *parent_names,
 					  u8 num_parents, void __iomem *base,
@@ -1375,21 +1373,21 @@ struct clk *rockchip_clk_register_halfdiv(const char *name,
 void rockchip_register_softrst_lut(struct device_node *np,
 				   const int *lookup_table,
 				   unsigned int num_regs,
-				   void __iomem *base, u8 flags);
+				   void __iomem *base);
 #else
 static inline void rockchip_register_softrst_lut(struct device_node *np,
 				   const int *lookup_table,
 				   unsigned int num_regs,
-				   void __iomem *base, u8 flags)
+				   void __iomem *base)
 {
 }
 #endif
 
 static inline void rockchip_register_softrst(struct device_node *np,
 					     unsigned int num_regs,
-					     void __iomem *base, u8 flags)
+					     void __iomem *base)
 {
-	return rockchip_register_softrst_lut(np, NULL, num_regs, base, flags);
+	return rockchip_register_softrst_lut(np, NULL, num_regs, base);
 }
 
 void rv1126b_rst_init(struct device_node *np, void __iomem *reg_base);
diff --git a/drivers/clk/rockchip/rst-rk3506.c b/drivers/clk/rockchip/rst-rk3506.c
index c3abde60f3c6..74b66870f4a7 100644
--- a/drivers/clk/rockchip/rst-rk3506.c
+++ b/drivers/clk/rockchip/rst-rk3506.c
@@ -221,6 +221,5 @@ void rk3506_rst_init(struct device_node *np, void __iomem *reg_base)
 	rockchip_register_softrst_lut(np,
 				      rk3506_register_offset,
 				      ARRAY_SIZE(rk3506_register_offset),
-				      reg_base + RK3506_SOFTRST_CON(0),
-				      ROCKCHIP_SOFTRST_HIWORD_MASK);
+				      reg_base + RK3506_SOFTRST_CON(0));
 }
diff --git a/drivers/clk/rockchip/rst-rk3528.c b/drivers/clk/rockchip/rst-rk3528.c
index b24f2c367929..0434f69059f9 100644
--- a/drivers/clk/rockchip/rst-rk3528.c
+++ b/drivers/clk/rockchip/rst-rk3528.c
@@ -301,6 +301,5 @@ void rk3528_rst_init(struct device_node *np, void __iomem *reg_base)
 	rockchip_register_softrst_lut(np,
 				      rk3528_register_offset,
 				      ARRAY_SIZE(rk3528_register_offset),
-				      reg_base + RK3528_SOFTRST_CON(0),
-				      ROCKCHIP_SOFTRST_HIWORD_MASK);
+				      reg_base + RK3528_SOFTRST_CON(0));
 }
diff --git a/drivers/clk/rockchip/rst-rk3562.c b/drivers/clk/rockchip/rst-rk3562.c
index a3854eaef3be..1de4907bf794 100644
--- a/drivers/clk/rockchip/rst-rk3562.c
+++ b/drivers/clk/rockchip/rst-rk3562.c
@@ -424,6 +424,5 @@ void rk3562_rst_init(struct device_node *np, void __iomem *reg_base)
 	rockchip_register_softrst_lut(np,
 				      rk3562_register_offset,
 				      ARRAY_SIZE(rk3562_register_offset),
-				      reg_base + RK3562_SOFTRST_CON(0),
-				      ROCKCHIP_SOFTRST_HIWORD_MASK);
+				      reg_base + RK3562_SOFTRST_CON(0));
 }
diff --git a/drivers/clk/rockchip/rst-rk3576.c b/drivers/clk/rockchip/rst-rk3576.c
index 15cbb9bc0a41..19b28d4bf2e0 100644
--- a/drivers/clk/rockchip/rst-rk3576.c
+++ b/drivers/clk/rockchip/rst-rk3576.c
@@ -646,6 +646,5 @@ void rk3576_rst_init(struct device_node *np, void __iomem *reg_base)
 	rockchip_register_softrst_lut(np,
 				      rk3576_register_offset,
 				      ARRAY_SIZE(rk3576_register_offset),
-				      reg_base + RK3576_SOFTRST_CON(0),
-				      ROCKCHIP_SOFTRST_HIWORD_MASK);
+				      reg_base + RK3576_SOFTRST_CON(0));
 }
diff --git a/drivers/clk/rockchip/rst-rk3588.c b/drivers/clk/rockchip/rst-rk3588.c
index c4ebc01f1c9c..cbc84e47902d 100644
--- a/drivers/clk/rockchip/rst-rk3588.c
+++ b/drivers/clk/rockchip/rst-rk3588.c
@@ -853,6 +853,5 @@ void rk3588_rst_init(struct device_node *np, void __iomem *reg_base)
 	rockchip_register_softrst_lut(np,
 				      rk3588_register_offset,
 				      ARRAY_SIZE(rk3588_register_offset),
-				      reg_base + RK3588_SOFTRST_CON(0),
-				      ROCKCHIP_SOFTRST_HIWORD_MASK);
+				      reg_base + RK3588_SOFTRST_CON(0));
 }
diff --git a/drivers/clk/rockchip/rst-rv1126b.c b/drivers/clk/rockchip/rst-rv1126b.c
index c75b0d885ca2..9ec3246306cc 100644
--- a/drivers/clk/rockchip/rst-rv1126b.c
+++ b/drivers/clk/rockchip/rst-rv1126b.c
@@ -438,6 +438,6 @@ void rv1126b_rst_init(struct device_node *np, void __iomem *reg_base)
 	rockchip_register_softrst_lut(np,
 				      rv1126b_register_offset,
 				      ARRAY_SIZE(rv1126b_register_offset),
-				      reg_base + RV1126B_SOFTRST_CON(0),
-				      ROCKCHIP_SOFTRST_HIWORD_MASK);
+				      reg_base + RV1126B_SOFTRST_CON(0));
+
 }
diff --git a/drivers/clk/rockchip/softrst.c b/drivers/clk/rockchip/softrst.c
index 115f317a99a2..c59589b02963 100644
--- a/drivers/clk/rockchip/softrst.c
+++ b/drivers/clk/rockchip/softrst.c
@@ -7,7 +7,6 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/reset-controller.h>
-#include <linux/spinlock.h>
 #include "clk.h"
 
 struct rockchip_softrst {
@@ -15,11 +14,10 @@ struct rockchip_softrst {
 	const int			*lut;
 	void __iomem			*reg_base;
 	int				num_regs;
-	int				num_per_reg;
-	u8				flags;
-	spinlock_t			lock;
 };
 
+#define NUM_PER_REG	16
+
 static int rockchip_softrst_assert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
@@ -31,23 +29,10 @@ static int rockchip_softrst_assert(struct reset_controller_dev *rcdev,
 	if (softrst->lut)
 		id = softrst->lut[id];
 
-	bank = id / softrst->num_per_reg;
-	offset = id % softrst->num_per_reg;
-
-	if (softrst->flags & ROCKCHIP_SOFTRST_HIWORD_MASK) {
-		writel(BIT(offset) | (BIT(offset) << 16),
-		       softrst->reg_base + (bank * 4));
-	} else {
-		unsigned long flags;
-		u32 reg;
-
-		spin_lock_irqsave(&softrst->lock, flags);
+	bank = id / NUM_PER_REG;
+	offset = id % NUM_PER_REG;
 
-		reg = readl(softrst->reg_base + (bank * 4));
-		writel(reg | BIT(offset), softrst->reg_base + (bank * 4));
-
-		spin_unlock_irqrestore(&softrst->lock, flags);
-	}
+	writel(BIT(offset) | BIT(offset) << 16, softrst->reg_base + (bank * 4));
 
 	return 0;
 }
@@ -63,22 +48,10 @@ static int rockchip_softrst_deassert(struct reset_controller_dev *rcdev,
 	if (softrst->lut)
 		id = softrst->lut[id];
 
-	bank = id / softrst->num_per_reg;
-	offset = id % softrst->num_per_reg;
+	bank = id / NUM_PER_REG;
+	offset = id % NUM_PER_REG;
 
-	if (softrst->flags & ROCKCHIP_SOFTRST_HIWORD_MASK) {
-		writel((BIT(offset) << 16), softrst->reg_base + (bank * 4));
-	} else {
-		unsigned long flags;
-		u32 reg;
-
-		spin_lock_irqsave(&softrst->lock, flags);
-
-		reg = readl(softrst->reg_base + (bank * 4));
-		writel(reg & ~BIT(offset), softrst->reg_base + (bank * 4));
-
-		spin_unlock_irqrestore(&softrst->lock, flags);
-	}
+	writel(BIT(offset) << 16, softrst->reg_base + (bank * 4));
 
 	return 0;
 }
@@ -91,7 +64,7 @@ static const struct reset_control_ops rockchip_softrst_ops = {
 void rockchip_register_softrst_lut(struct device_node *np,
 				   const int *lookup_table,
 				   unsigned int num_regs,
-				   void __iomem *base, u8 flags)
+				   void __iomem *base)
 {
 	struct rockchip_softrst *softrst;
 	int ret;
@@ -100,20 +73,15 @@ void rockchip_register_softrst_lut(struct device_node *np,
 	if (!softrst)
 		return;
 
-	spin_lock_init(&softrst->lock);
-
 	softrst->reg_base = base;
 	softrst->lut = lookup_table;
-	softrst->flags = flags;
 	softrst->num_regs = num_regs;
-	softrst->num_per_reg = (flags & ROCKCHIP_SOFTRST_HIWORD_MASK) ? 16
-								      : 32;
 
 	softrst->rcdev.owner = THIS_MODULE;
 	if (lookup_table)
 		softrst->rcdev.nr_resets = num_regs;
 	else
-		softrst->rcdev.nr_resets = num_regs * softrst->num_per_reg;
+		softrst->rcdev.nr_resets = num_regs * NUM_PER_REG;
 	softrst->rcdev.ops = &rockchip_softrst_ops;
 	softrst->rcdev.of_node = np;
 	ret = reset_controller_register(&softrst->rcdev);

-- 
2.55.0

