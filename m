Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A681C5678DF
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962944; cv=none; b=QvxvzukHqI4UfaNljK6jPOBndvUtawJ5GkH6g1yPj6aUCamb7PW5qg75rL5asgtYOr1zmtw4EeHuNqwadjyBti8YB+jUza60jS4RQt6/EhK1zCprF8lL2YQApvyNVuJGE8sI1pqyxuKdmtBXAb5TABJRHM8xKmO6K4mgVtr5ffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962944; c=relaxed/simple;
	bh=MMJ6WoUH0bJSC62+CibBdbIZ4f1vNyReAZIMSZnTvV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHXG9pvMHusvpW+NznzLy32kRprbqmbcFDO1wC7vJHKAqGXj0SHsmk89EVir5QKIYNycQbgDRBEuF5Z5CXdv4SQ+WU+5kHC2k8OLvuBoAO1aJuJF8SjnH79o2SY6PvfTpx3vguyZPPKDWtd++7fLsMb40ogI8rlezOCwVg9qVf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=fR83BPZo; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="fR83BPZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962855;
	bh=QnO1nc1K0d982KAo+kP7NIOhiY2NMQFMv1F53E+MIcs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=fR83BPZoK13Q+pbc/2sBxJezcJAO7FTiAKaCqHXPMzZvMPz6qllVB+dwAvReUNzvN
	 xrnDaUaaooAxcspRBXEDq1t7oses2MW3UEsdu9G7pbJwxJj/bJAIggb59Uxq+m/NcF
	 XgjKS9tGG/PNUeHUv9ibYkAVNCISLsQSKDNNZ0t8=
X-QQ-mid: esmtpsz10t1788962853tf408563b
X-QQ-Originating-IP: WNIxRnk1s6XuJVI+VNdzWT8eq256IVsHu2C8KgoeCE4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13866533234236857726
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 09 Sep 2026 22:07:05 +0800
Subject: [PATCH 5/5] clk: spacemit: safely synchronize PLL parameters
 during init
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-spacemit-pll-init-v1-5-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
In-Reply-To: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=30962;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=MMJ6WoUH0bJSC62+CibBdbIZ4f1vNyReAZIMSZnTvV8=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLM3iqRVk9xdYJFFXsUVa8f9r+h9H8m7df/LD6s8rDP
 PYi71bJjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgImsnszwv2bOxoAshc0/P840
 YZdLa9DIrWjLe1HYzuFyc9b/jS01uxgZ5sikTGLdvcfny8rb3urvV1rEaXBHT75ZyF4stPfSxfS
 t3AA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N+cl0OTdzeOa/daFopzottFxyONxzNO1YWat1eObJcN6stD1i7TrP8Pl
	UDppYWDXCZzXdf95mwusrRYtTKreobXObweXYFptjQDeAEn/xBij5uKQM1iMfMABDZ405Kf
	pqnHDpJqu1yF9a12Chvqa5STl8fwoRx/qBJRBho2DRmfK/iYGBaiVN5wyDFMmQkXRg6FoPe
	TIUoNvSWTAYOcdss4K/alQuCDyNW9V4oENb4K1jOEcgWDU7lriNx9eNu9nDtfNEqGlNH6r5
	R6gwdOTrt9oi9lC/1QHLz48PdQ/n/kZMh8sK06xfqrh3aeKDy77AAD+bDPsCKPlhHz7Jw7W
	+JepWWPdpxk2uSh+5iePDh/q4vRfODEX5u6joPmh//SfdUKK9HTHunQ+nAxb5qKRS2BfsqS
	FnnFOhlKF8/wmkUDzte11ATtTlj5qspR47B+w3ECa9E7FAsXwX9+fi76C3sGdioUT9GsgBp
	diIQC+t5CsK9eEq11ABxaQs3oo3rXuF2wmEb/MdkCgEKKjxZB6NZmgjHhChHvMvdxY15gm8
	hPK0BPaXDkRvrdxfzxCb/yKyDSe23Lug6m0C5NojU96HKwZhh+LUrhczkIrVm1qjI8pv7K/
	QSUi7kn5Y9kgZOs4ELgdJe4rbD/teqZ+bB0oGF/+v/uWKpOIfUncgjZJ31yWH0+fsxq8/GB
	xGfCUcf3K9VamlaCua4t0QyOzWae0rCeHVyU7RpBbU/SwbonWtfqz+94zSBatDspuUUb6ob
	Yf0oGlWPLdTxPWHPJzWiGdXjp48BVR7Iglpv2i87FC2qMAJtZZwoHH8FRv4H5DDp5wi13XP
	+TikV1EBlIW5hUZ+1q7hkem0G092hmdcqA3GgBNctbSzNAybgJQU5AUE1AXrMrjtKEXKabN
	eXhOA+Fg1MTdJPWFxd07PHoJ+DPQkGVC16kuuA0bLVm9tOunh4W4+8PdvlzvwSoog/3e1W7
	yVI5bmjr7eAe5BxoxqVMLVTUjPQuZAZo5Kva1IjPrBg6Z1BKvRcFQ0JqFg57qFUjj+VIg2t
	TI6nWd7U+nw1oiVVNxAtThRuGIJlzvHCwHOBPpt8TRk0Atrt391Gv5ghbr28FKrmaHtw/xw
	+zyjGtVsMmfGs7MKnOyhPCqHA7WVLhbs8eYCfDQTvX4q+qsMhmSIRSgPmD9m7mheGWz7QBV
	ZRpKeI3z2fqZdh1WSEAyoWzVTNqIFsmc/dZW+HR1UyFcH9w=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Firmware PLL settings can be valid without matching a rate-table entry.
Falling back to the first entry during init can halt CPUs by disabling
their clock source.

Replace that fallback with opt-in parameter synchronization. Preserve
unlisted rates and PLLs without a sync descriptor, including PLL1. Leave
already matching parameters unchanged. For differing parameters, require
an entry that decodes to the same rate and no enabled outputs outside
the described CPU paths.

Park mapped CPU consumers on validated PLL1 branches no faster than
their current clock before stopping their PLL and programming the
matching entry. Re-enable previously enabled PLLs and wait for lock
before restoring CPU parents; leave initially disabled PLLs disabled.
Handle K1 PLL3 and K3 PLL3/4/5/8, parking sharing clusters first and
restoring them last. K3 CPU parking still depends on firmware cluster
initialization for FC completion.

After a programming or relock failure, attempt to restore the old PLL
parameters. Leave parked CPUs on PLL1 if PLL recovery fails, and keep
the fallback gates critical in case an FC handshake does not complete.

Keep synchronization in init, before CCF links the PLL to its children.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Fixes: 3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k1.c  |  52 ++++-
 drivers/clk/spacemit/ccu-k3.c  |  90 +++++++--
 drivers/clk/spacemit/ccu_pll.c | 447 +++++++++++++++++++++++++++++++----------
 drivers/clk/spacemit/ccu_pll.h |  43 +++-
 4 files changed, 485 insertions(+), 147 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 40cc96c4ee876..0085179f8d7a7 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -41,17 +41,47 @@ static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
 	CCU_PLL_RATE(3200000000UL, 0x0050dd67, 0x43eaaaab),
 };
 
-CCU_PLL_DEFINE(pll1, pll1_rate_tbl, APBS_PLL1_SWCR1, APBS_PLL1_SWCR3, MPMU_POSR, POSR_PLL1_LOCK,
-	       CLK_SET_RATE_GATE);
-CCU_PLL_DEFINE(pll2, pll2_rate_tbl, APBS_PLL2_SWCR1, APBS_PLL2_SWCR3, MPMU_POSR, POSR_PLL2_LOCK,
-	       CLK_SET_RATE_GATE);
-CCU_PLL_DEFINE(pll3, pll3_rate_tbl, APBS_PLL3_SWCR1, APBS_PLL3_SWCR3, MPMU_POSR, POSR_PLL3_LOCK,
-	       CLK_SET_RATE_GATE);
-
-CCU_FACTOR_GATE_DEFINE(pll1_d2, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(1), 2, 1);
+/* PLL1 supplies the fallback and must retain its firmware configuration. */
+CCU_PLL_SYNC_DEFINE(pll1, pll1_rate_tbl, APBS_PLL1_SWCR1, APBS_PLL1_SWCR2,
+		    APBS_PLL1_SWCR3, MPMU_POSR, POSR_PLL1_LOCK,
+		    CLK_SET_RATE_GATE, NULL);
+
+static const struct ccu_pll_sync pll2_sync = {
+	.safe_pll = &pll1,
+};
+
+static const struct ccu_pll_cpu_mux pll3_cpu_muxes[] = {
+	{ APMU_CPU_C1_CLK_CTRL, GENMASK(2, 0), 5 },
+	{ APMU_CPU_C1_CLK_CTRL, GENMASK(2, 0), 7 },
+	{ APMU_CPU_C0_CLK_CTRL, GENMASK(2, 0), 5 },
+	{ APMU_CPU_C0_CLK_CTRL, GENMASK(2, 0), 7 },
+};
+
+static const struct ccu_pll_sync pll3_sync = {
+	.safe_pll = &pll1,
+	.apmu_compatible = "spacemit,k1-syscon-apmu",
+	.muxes = pll3_cpu_muxes,
+	.num_muxes = ARRAY_SIZE(pll3_cpu_muxes),
+	.cpu_outputs = GENMASK(2, 0),
+	.safe_sel = 4,
+	.slow_sel = 3,
+	.reg_safe_gate = MPMU_ACGR,
+};
+
+CCU_PLL_SYNC_DEFINE(pll2, pll2_rate_tbl, APBS_PLL2_SWCR1, APBS_PLL2_SWCR2,
+		    APBS_PLL2_SWCR3, MPMU_POSR, POSR_PLL2_LOCK,
+		    CLK_SET_RATE_GATE, &pll2_sync);
+CCU_PLL_SYNC_DEFINE(pll3, pll3_rate_tbl, APBS_PLL3_SWCR1, APBS_PLL3_SWCR2,
+		    APBS_PLL3_SWCR3, MPMU_POSR, POSR_PLL3_LOCK,
+		    CLK_SET_RATE_GATE, &pll3_sync);
+
+/* A failed CPU FC handshake must not lose either fallback clock. */
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d2, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(1), 2, 1,
+			     CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d3, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(2), 3, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1,
+			     CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
 CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
@@ -111,7 +141,7 @@ CCU_FACTOR_DEFINE(pll1_d3072_0p8, CCU_PARENT_HW(pll1_d384_6p4), 8, 1);
 CCU_GATE_DEFINE(pll1_d6_409p6, CCU_PARENT_HW(pll1_d6), MPMU_ACGR, BIT(0), 0);
 CCU_FACTOR_GATE_DEFINE(pll1_d12_204p8, CCU_PARENT_HW(pll1_d6), MPMU_ACGR, BIT(5), 2, 1);
 
-CCU_GATE_DEFINE(pll1_d5_491p52, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(21), 0);
+CCU_GATE_DEFINE(pll1_d5_491p52, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(21), CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d10_245p76, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(18), 2, 1);
 
 CCU_GATE_DEFINE(pll1_d4_614p4, CCU_PARENT_HW(pll1_d4), MPMU_ACGR, BIT(15), 0);
@@ -120,7 +150,7 @@ CCU_FACTOR_GATE_DEFINE(pll1_d78_31p5, CCU_PARENT_HW(pll1_d4), MPMU_ACGR, BIT(6),
 
 CCU_GATE_DEFINE(pll1_d3_819p2, CCU_PARENT_HW(pll1_d3), MPMU_ACGR, BIT(14), 0);
 
-CCU_GATE_DEFINE(pll1_d2_1228p8, CCU_PARENT_HW(pll1_d2), MPMU_ACGR, BIT(16), 0);
+CCU_GATE_DEFINE(pll1_d2_1228p8, CCU_PARENT_HW(pll1_d2), MPMU_ACGR, BIT(16), CLK_IS_CRITICAL);
 
 CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
 CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, 16, 13, 0, 13, 2, 0);
diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index 2f0bd74f7da4d..b01f2ce5d394f 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -55,25 +55,77 @@ static const struct ccu_pll_rate_tbl pll8_rate_tbl[] = {
 
 CCU_PLLA_DEFINE(pll1, pll1_rate_tbl, APBS_PLL1_SWCR1, APBS_PLL1_SWCR2, APBS_PLL1_SWCR3,
 		MPMU_POSR, POSR_PLL1_LOCK, CLK_SET_RATE_GATE);
-CCU_PLLA_DEFINE(pll2, pll2_rate_tbl, APBS_PLL2_SWCR1, APBS_PLL2_SWCR2, APBS_PLL2_SWCR3,
-		MPMU_POSR, POSR_PLL2_LOCK, CLK_SET_RATE_GATE);
-CCU_PLLA_DEFINE(pll3, pll3_rate_tbl, APBS_PLL3_SWCR1, APBS_PLL3_SWCR2, APBS_PLL3_SWCR3,
-		MPMU_POSR, POSR_PLL3_LOCK, CLK_SET_RATE_GATE);
-CCU_PLLA_DEFINE(pll4, pll4_rate_tbl, APBS_PLL4_SWCR1, APBS_PLL4_SWCR2, APBS_PLL4_SWCR3,
-		MPMU_POSR, POSR_PLL4_LOCK, CLK_SET_RATE_GATE);
-CCU_PLLA_DEFINE(pll5, pll5_rate_tbl, APBS_PLL5_SWCR1, APBS_PLL5_SWCR2, APBS_PLL5_SWCR3,
-		MPMU_POSR, POSR_PLL5_LOCK, CLK_SET_RATE_GATE);
-CCU_PLLA_DEFINE(pll6, pll6_rate_tbl, APBS_PLL6_SWCR1, APBS_PLL6_SWCR2, APBS_PLL6_SWCR3,
-		MPMU_POSR, POSR_PLL6_LOCK, CLK_SET_RATE_GATE);
-CCU_PLLA_DEFINE(pll7, pll7_rate_tbl, APBS_PLL7_SWCR1, APBS_PLL7_SWCR2, APBS_PLL7_SWCR3,
-		MPMU_POSR, POSR_PLL7_LOCK, CLK_SET_RATE_GATE);
-CCU_PLLA_DEFINE(pll8, pll8_rate_tbl, APBS_PLL8_SWCR1, APBS_PLL8_SWCR2, APBS_PLL8_SWCR3,
-		MPMU_POSR, POSR_PLL8_LOCK, CLK_SET_RATE_GATE);
-
-CCU_FACTOR_GATE_DEFINE(pll1_d2, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(1), 2, 1);
+
+/* PLLs without a managed CPU path require all output gates to be off. */
+static const struct ccu_pll_sync idle_pll_sync = {
+	.safe_pll = &pll1,
+};
+
+/* Park the secondary cluster first when it shares the primary cluster PLL. */
+static const struct ccu_pll_cpu_mux pll3_cpu_muxes[] = {
+	{ APMU_CPU_C1_CLK_CTRL, BIT(13) | GENMASK(2, 0), BIT(13) | 7 },
+	{ APMU_CPU_C0_CLK_CTRL, GENMASK(2, 0), 7 },
+};
+
+static const struct ccu_pll_cpu_mux pll4_cpu_muxes[] = {
+	{ APMU_CPU_C1_CLK_CTRL, BIT(13) | GENMASK(2, 0), 7 },
+};
+
+static const struct ccu_pll_cpu_mux pll5_cpu_muxes[] = {
+	{ APMU_CPU_C3_CLK_CTRL, BIT(13) | GENMASK(2, 0), BIT(13) | 7 },
+	{ APMU_CPU_C2_CLK_CTRL, GENMASK(2, 0), 7 },
+};
+
+static const struct ccu_pll_cpu_mux pll8_cpu_muxes[] = {
+	{ APMU_CPU_C3_CLK_CTRL, BIT(13) | GENMASK(2, 0), 7 },
+};
+
+#define K3_CPU_PLL_SYNC(_pll)							\
+static const struct ccu_pll_sync _pll##_sync = {				\
+	.safe_pll = &pll1,							\
+	.apmu_compatible = "spacemit,k3-syscon-apmu",				\
+	.muxes = _pll##_cpu_muxes,						\
+	.num_muxes = ARRAY_SIZE(_pll##_cpu_muxes),				\
+	.cpu_outputs = BIT(0),							\
+	.safe_sel = 5,								\
+	.slow_sel = 1,								\
+	.reg_safe_gate = MPMU_ACGR,						\
+}
+
+K3_CPU_PLL_SYNC(pll3);
+K3_CPU_PLL_SYNC(pll4);
+K3_CPU_PLL_SYNC(pll5);
+K3_CPU_PLL_SYNC(pll8);
+
+CCU_PLLA_SYNC_DEFINE(pll2, pll2_rate_tbl, APBS_PLL2_SWCR1, APBS_PLL2_SWCR2,
+		     APBS_PLL2_SWCR3, MPMU_POSR, POSR_PLL2_LOCK,
+		     CLK_SET_RATE_GATE, &idle_pll_sync);
+CCU_PLLA_SYNC_DEFINE(pll3, pll3_rate_tbl, APBS_PLL3_SWCR1, APBS_PLL3_SWCR2,
+		     APBS_PLL3_SWCR3, MPMU_POSR, POSR_PLL3_LOCK,
+		     CLK_SET_RATE_GATE, &pll3_sync);
+CCU_PLLA_SYNC_DEFINE(pll4, pll4_rate_tbl, APBS_PLL4_SWCR1, APBS_PLL4_SWCR2,
+		     APBS_PLL4_SWCR3, MPMU_POSR, POSR_PLL4_LOCK,
+		     CLK_SET_RATE_GATE, &pll4_sync);
+CCU_PLLA_SYNC_DEFINE(pll5, pll5_rate_tbl, APBS_PLL5_SWCR1, APBS_PLL5_SWCR2,
+		     APBS_PLL5_SWCR3, MPMU_POSR, POSR_PLL5_LOCK,
+		     CLK_SET_RATE_GATE, &pll5_sync);
+CCU_PLLA_SYNC_DEFINE(pll6, pll6_rate_tbl, APBS_PLL6_SWCR1, APBS_PLL6_SWCR2,
+		     APBS_PLL6_SWCR3, MPMU_POSR, POSR_PLL6_LOCK,
+		     CLK_SET_RATE_GATE, &idle_pll_sync);
+CCU_PLLA_SYNC_DEFINE(pll7, pll7_rate_tbl, APBS_PLL7_SWCR1, APBS_PLL7_SWCR2,
+		     APBS_PLL7_SWCR3, MPMU_POSR, POSR_PLL7_LOCK,
+		     CLK_SET_RATE_GATE, &idle_pll_sync);
+CCU_PLLA_SYNC_DEFINE(pll8, pll8_rate_tbl, APBS_PLL8_SWCR1, APBS_PLL8_SWCR2,
+		     APBS_PLL8_SWCR3, MPMU_POSR, POSR_PLL8_LOCK,
+		     CLK_SET_RATE_GATE, &pll8_sync);
+
+/* A failed CPU FC handshake must not lose either fallback clock. */
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d2, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(1), 2, 1,
+			     CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d3, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(2), 3, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1,
+			     CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
 CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
@@ -178,7 +230,7 @@ CCU_FACTOR_DEFINE(pll1_d3072_0p8, CCU_PARENT_HW(pll1_d384_6p4), 8, 1);
 CCU_GATE_DEFINE(pll1_d6_409p6, CCU_PARENT_HW(pll1_d6), MPMU_ACGR, BIT(0), 0);
 CCU_FACTOR_GATE_DEFINE(pll1_d12_204p8, CCU_PARENT_HW(pll1_d6), MPMU_ACGR, BIT(5), 2, 1);
 
-CCU_GATE_DEFINE(pll1_d5_491p52, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(21), 0);
+CCU_GATE_DEFINE(pll1_d5_491p52, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(21), CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d10_245p76, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(18), 2, 1);
 
 CCU_GATE_DEFINE(pll1_d4_614p4, CCU_PARENT_HW(pll1_d4), MPMU_ACGR, BIT(15), 0);
@@ -187,7 +239,7 @@ CCU_FACTOR_GATE_DEFINE(pll1_d78_31p5, CCU_PARENT_HW(pll1_d4), MPMU_ACGR, BIT(6),
 
 CCU_GATE_DEFINE(pll1_d3_819p2, CCU_PARENT_HW(pll1_d3), MPMU_ACGR, BIT(14), 0);
 
-CCU_GATE_DEFINE(pll1_d2_1228p8, CCU_PARENT_HW(pll1_d2), MPMU_ACGR, BIT(16), 0);
+CCU_GATE_DEFINE(pll1_d2_1228p8, CCU_PARENT_HW(pll1_d2), MPMU_ACGR, BIT(16), CLK_IS_CRITICAL);
 
 static const struct clk_parent_data apb_parents[] = {
 	CCU_PARENT_HW(pll1_d96_25p6),
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index 2573b8396cefa..3d8624c4ce5d1 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -8,6 +8,8 @@
 #include <linux/clk-provider.h>
 #include <linux/math.h>
 #include <linux/math64.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 
 #include "ccu_common.h"
@@ -34,6 +36,15 @@
 #define PLLA_SWCR3_PREDIV	GENMASK(21, 20)
 #define PLL_FRAC_BITS		22
 
+#define PLL_OUTPUT_GATES	GENMASK(7, 0)
+#define PLL_POWERDOWN_BYPASS	BIT(23)
+#define PLL_SAFE_OUTPUT_GATE	(BIT(1) | BIT(4))
+#define PLL_SAFE_MPMU_GATE	(BIT(16) | BIT(21))
+#define PLL_CPU_SEL		GENMASK(2, 0)
+#define PLL_CPU_FC		BIT(12)
+#define PLL_CPU_TIMEOUT_US	10000
+#define PLL_MAX_CPU_MUXES	4
+
 static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *pll,
 							       unsigned long rate)
 {
@@ -55,26 +66,6 @@ static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *p
 	return best_entry;
 }
 
-static const struct ccu_pll_rate_tbl *ccu_pll_lookup_matched_entry(struct ccu_pll *pll)
-{
-	struct ccu_pll_config *config = &pll->config;
-	u32 swcr1, swcr3;
-	int i;
-
-	swcr1 = ccu_read(&pll->common, swcr1);
-	swcr3 = ccu_read(&pll->common, swcr3);
-	swcr3 &= PLL_SWCR3_MASK;
-
-	for (i = 0; i < config->tbl_num; i++) {
-		const struct ccu_pll_rate_tbl *entry = &config->rate_tbl[i];
-
-		if (swcr1 == entry->swcr1 && swcr3 == entry->swcr3)
-			return entry;
-	}
-
-	return NULL;
-}
-
 static int ccu_pll_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
 {
 	struct ccu_common *common = &pll->common;
@@ -158,24 +149,6 @@ static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ccu_pll_update_param(pll, entry);
 }
 
-static int ccu_pll_get_params(struct ccu_pll *pll,
-			      struct ccu_pll_rate_tbl *params, bool plla)
-{
-	struct ccu_common *common = &pll->common;
-	int ret;
-
-	ret = regmap_read(common->regmap, common->reg_swcr1, &params->swcr1);
-	if (ret)
-		return ret;
-	params->swcr2 = 0;
-	if (plla) {
-		ret = regmap_read(common->regmap, common->reg_swcr2, &params->swcr2);
-		if (ret)
-			return ret;
-	}
-	return regmap_read(common->regmap, common->reg_swcr3, &params->swcr3);
-}
-
 static unsigned long ccu_pll_calc_rate(const struct ccu_pll_rate_tbl *params,
 				      unsigned long parent_rate)
 {
@@ -199,39 +172,6 @@ static unsigned long ccu_pll_calc_rate(const struct ccu_pll_rate_tbl *params,
 	return DIV_ROUND_CLOSEST_ULL(rate, BIT_ULL(PLL_FRAC_BITS));
 }
 
-static unsigned long ccu_plla_calc_rate(const struct ccu_pll_rate_tbl *params,
-				       unsigned long parent_rate)
-{
-	u32 swcr1 = params->swcr1, swcr2 = params->swcr2;
-	u32 swcr3 = params->swcr3, prediv, frac;
-	u64 divider, rate;
-
-	/* Decode the software-controlled mode described by the PLL calculator. */
-	if (!(swcr1 & PLLA_SWCR1_USER_MODE) ||
-	    (swcr1 & PLLA_SWCR1_REFSEL))
-		return 0;
-
-	prediv = FIELD_GET(PLLA_SWCR3_PREDIV, swcr3) + 1;
-	frac = FIELD_GET(PLLA_SWCR1_FRAC, swcr1) << 8;
-	frac |= FIELD_GET(PLLA_SWCR2_MASK, swcr2);
-	divider = (u64)FIELD_GET(PLLA_SWCR1_INT, swcr1) << PLL_FRAC_BITS;
-	divider += frac;
-
-	/* Fvco = Fref * Npre * (Nint + Nfrac), with an unsigned fraction. */
-	rate = (u64)parent_rate * prediv * divider;
-	return DIV_ROUND_CLOSEST_ULL(rate, BIT_ULL(PLL_FRAC_BITS));
-}
-
-static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
-					 unsigned long parent_rate)
-{
-	struct ccu_pll_rate_tbl params;
-
-	if (ccu_pll_get_params(hw_to_ccu_pll(hw), &params, false))
-		return 0;
-	return ccu_pll_calc_rate(&params, parent_rate);
-}
-
 static int ccu_pll_determine_rate(struct clk_hw *hw,
 				  struct clk_rate_request *req)
 {
@@ -246,42 +186,6 @@ static int ccu_pll_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int ccu_pll_init(struct clk_hw *hw)
-{
-	struct ccu_pll *pll = hw_to_ccu_pll(hw);
-
-	if (ccu_pll_lookup_matched_entry(pll))
-		return 0;
-
-	ccu_pll_disable(hw);
-	ccu_pll_update_param(pll, &pll->config.rate_tbl[0]);
-
-	return 0;
-}
-
-static const struct ccu_pll_rate_tbl *ccu_plla_lookup_matched_entry(struct ccu_pll *pll)
-{
-	struct ccu_pll_config *config = &pll->config;
-	const struct ccu_pll_rate_tbl *entry;
-	u32 i, swcr1, swcr2, swcr3;
-
-	swcr1 = ccu_read(&pll->common, swcr1);
-	swcr2 = ccu_read(&pll->common, swcr2);
-	swcr2 &= PLLA_SWCR2_MASK;
-	swcr3 = ccu_read(&pll->common, swcr3);
-
-	for (i = 0; i < config->tbl_num; i++) {
-		entry = &config->rate_tbl[i];
-
-		if (swcr1 == entry->swcr1 &&
-		    swcr2 == entry->swcr2 &&
-		    swcr3 == entry->swcr3)
-			return entry;
-	}
-
-	return NULL;
-}
-
 static int ccu_plla_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
 {
 	struct ccu_common *common = &pll->common;
@@ -356,6 +260,68 @@ static int ccu_plla_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ccu_plla_update_param(pll, entry);
 }
 
+static unsigned long ccu_plla_calc_rate(const struct ccu_pll_rate_tbl *params,
+				       unsigned long parent_rate)
+{
+	u32 swcr1 = params->swcr1, swcr2 = params->swcr2;
+	u32 swcr3 = params->swcr3, prediv, frac;
+	u64 divider, rate;
+
+	/* Decode the software-controlled mode described by the PLL calculator. */
+	if (!(swcr1 & PLLA_SWCR1_USER_MODE) ||
+	    (swcr1 & PLLA_SWCR1_REFSEL))
+		return 0;
+
+	prediv = FIELD_GET(PLLA_SWCR3_PREDIV, swcr3) + 1;
+	frac = FIELD_GET(PLLA_SWCR1_FRAC, swcr1) << 8;
+	frac |= FIELD_GET(PLLA_SWCR2_MASK, swcr2);
+	divider = (u64)FIELD_GET(PLLA_SWCR1_INT, swcr1) << PLL_FRAC_BITS;
+	divider += frac;
+
+	/* Fvco = Fref * Npre * (Nint + Nfrac), with an unsigned fraction. */
+	rate = (u64)parent_rate * prediv * divider;
+	return DIV_ROUND_CLOSEST_ULL(rate, BIT_ULL(PLL_FRAC_BITS));
+}
+
+static int ccu_pll_get_params(struct ccu_pll *pll,
+			      struct ccu_pll_rate_tbl *params, bool plla)
+{
+	struct ccu_common *common = &pll->common;
+	int ret;
+
+	ret = regmap_read(common->regmap, common->reg_swcr1, &params->swcr1);
+	if (ret)
+		return ret;
+	params->swcr2 = 0;
+	if (plla) {
+		ret = regmap_read(common->regmap, common->reg_swcr2, &params->swcr2);
+		if (ret)
+			return ret;
+	}
+	return regmap_read(common->regmap, common->reg_swcr3, &params->swcr3);
+}
+
+static bool ccu_pll_params_equal(const struct ccu_pll_rate_tbl *a,
+				 const struct ccu_pll_rate_tbl *b, bool plla)
+{
+	if (a->swcr1 != b->swcr1)
+		return false;
+	if (plla)
+		return a->swcr3 == b->swcr3 &&
+		       !((a->swcr2 ^ b->swcr2) & PLLA_SWCR2_MASK);
+	return !((a->swcr3 ^ b->swcr3) & PLL_SWCR3_MASK);
+}
+
+static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct ccu_pll_rate_tbl params;
+
+	if (ccu_pll_get_params(hw_to_ccu_pll(hw), &params, false))
+		return 0;
+	return ccu_pll_calc_rate(&params, parent_rate);
+}
+
 static unsigned long ccu_plla_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
 {
@@ -366,19 +332,278 @@ static unsigned long ccu_plla_recalc_rate(struct clk_hw *hw,
 	return ccu_plla_calc_rate(&params, parent_rate);
 }
 
-static int ccu_plla_init(struct clk_hw *hw)
+struct ccu_pll_park {
+	struct regmap *apmu;
+	u32 saved[PLL_MAX_CPU_MUXES];
+	u32 selected[PLL_MAX_CPU_MUXES];
+	unsigned long parked;
+};
+
+static int ccu_pll_select_cpu(struct regmap *regmap, u32 reg, u32 sel)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_update_bits(regmap, reg, PLL_CPU_SEL, sel);
+	if (ret)
+		return ret;
+	ret = regmap_update_bits(regmap, reg, PLL_CPU_FC, PLL_CPU_FC);
+	if (ret)
+		return ret;
+	ret = regmap_read_poll_timeout_atomic(regmap, reg, val,
+					     !(val & PLL_CPU_FC), PLL_DELAY_US,
+					     PLL_CPU_TIMEOUT_US);
+	if (ret)
+		return ret;
+	return (val & PLL_CPU_SEL) == sel ? 0 : -EIO;
+}
+
+static void ccu_pll_unpark(const struct ccu_pll_sync *sync,
+			   struct ccu_pll_park *park)
+{
+	int i;
+
+	/* Restore sharing-capable secondary clusters last. */
+	for (i = sync->num_muxes - 1; i >= 0; i--) {
+		if (!(park->parked & BIT(i)))
+			continue;
+		if (!ccu_pll_select_cpu(park->apmu, sync->muxes[i].reg,
+					park->saved[i] & PLL_CPU_SEL))
+			park->parked &= ~BIT(i);
+	}
+
+	/*
+	 * The fallback gates remain critical: after an FC timeout the selector
+	 * register alone cannot prove that the CPU has left the temporary path.
+	 */
+}
+
+static int ccu_pll_park_cpus(const struct ccu_pll_sync *sync,
+			     struct ccu_pll_park *park, bool plla,
+			     unsigned long rate, unsigned long parent_rate)
+{
+	struct ccu_pll *pll1 = sync->safe_pll;
+	struct ccu_common *safe = &pll1->common;
+	struct ccu_pll_rate_tbl params;
+	struct device_node *np;
+	unsigned long safe_rate;
+	u32 val;
+	u32 i;
+	int ret;
+	bool needed = false;
+
+	if (!sync->num_muxes)
+		return 0;
+	if (sync->num_muxes > PLL_MAX_CPU_MUXES)
+		return -EINVAL;
+	/* Like CCU probe, create the regmap before its clocks are registered. */
+	np = of_find_compatible_node(NULL, NULL, sync->apmu_compatible);
+	if (!np)
+		return -ENODEV;
+	park->apmu = device_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(park->apmu))
+		return PTR_ERR(park->apmu);
+
+	for (i = 0; i < sync->num_muxes; i++) {
+		const struct ccu_pll_cpu_mux *mux = &sync->muxes[i];
+
+		ret = regmap_read(park->apmu, mux->reg, &park->saved[i]);
+		if (ret)
+			return ret;
+		if (park->saved[i] & PLL_CPU_FC)
+			return -EBUSY;
+		/* K3 selector 4 is unmodeled; do not infer a live parent. */
+		if (plla && (park->saved[i] & PLL_CPU_SEL) == 4)
+			return -EINVAL;
+		needed |= (park->saved[i] & mux->mask) == mux->value;
+	}
+	if (!needed)
+		return 0;
+
+	/* PLL1 is never repaired here, nor used as a fallback if unrecognized. */
+	if (!safe->regmap || !safe->lock_regmap)
+		return -ENODEV;
+	if (!pll1->config.tbl_num)
+		return -EINVAL;
+	ret = ccu_pll_get_params(pll1, &params, plla);
+	if (ret)
+		return ret;
+	if (!ccu_pll_params_equal(&params, &pll1->config.rate_tbl[0], plla))
+		return -EINVAL;
+	ret = regmap_read(safe->lock_regmap, pll1->config.reg_lock, &val);
+	if (ret)
+		return ret;
+	if (!(val & pll1->config.mask_lock))
+		return -EBUSY;
+
+	safe_rate = plla ? ccu_plla_calc_rate(&params, parent_rate) :
+			   ccu_pll_calc_rate(&params, parent_rate);
+	for (i = 0; i < sync->num_muxes; i++) {
+		u32 old = park->saved[i], sel = old & PLL_CPU_SEL;
+		u32 div = ((old >> 3) & 7) + 1;
+		unsigned long cpu_rate, fast_rate, slow_rate;
+
+		if ((old & sync->muxes[i].mask) != sync->muxes[i].value)
+			continue;
+		if (plla) {
+			cpu_rate = rate;
+			fast_rate = safe_rate / 2;
+		} else {
+			cpu_rate = rate / (sel == 5 ? 3 : (old & BIT(13) ? 1 : 2));
+			cpu_rate /= div;
+			fast_rate = safe_rate / 2 / div;
+		}
+		slow_rate = safe_rate / 5 / div;
+		/* Never increase a CPU's rate without a corresponding voltage vote. */
+		if (fast_rate <= cpu_rate)
+			park->selected[i] = sync->safe_sel;
+		else if (slow_rate <= cpu_rate)
+			park->selected[i] = sync->slow_sel;
+		else
+			return -ERANGE;
+	}
+	/* Both candidate parents are derived from the always-on PLL1. */
+	ret = ccu_update(safe, swcr2, PLL_SAFE_OUTPUT_GATE, PLL_SAFE_OUTPUT_GATE);
+	if (ret)
+		return ret;
+	ret = regmap_update_bits(safe->lock_regmap, sync->reg_safe_gate,
+				 PLL_SAFE_MPMU_GATE, PLL_SAFE_MPMU_GATE);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < sync->num_muxes; i++) {
+		const struct ccu_pll_cpu_mux *mux = &sync->muxes[i];
+
+		if ((park->saved[i] & mux->mask) != mux->value)
+			continue;
+		park->parked |= BIT(i);
+		ret = ccu_pll_select_cpu(park->apmu, mux->reg, park->selected[i]);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int ccu_pll_stop(struct ccu_pll *pll, bool plla)
+{
+	struct ccu_common *common = &pll->common;
+	u32 val;
+	int ret;
+
+	ret = plla ? ccu_update(common, swcr2, PLLA_SWCR2_EN, 0) :
+		     ccu_update(common, swcr3, PLL_SWCR3_EN, 0);
+	if (ret)
+		return ret;
+	/* Hardware or firmware may override the software enable bit. */
+	return regmap_read_poll_timeout_atomic(common->lock_regmap,
+					      pll->config.reg_lock, val,
+					      !(val & pll->config.mask_lock),
+					      PLL_DELAY_US, PLL_TIMEOUT_US);
+}
+
+static int ccu_pll_sync_init(struct clk_hw *hw, bool plla)
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	const struct ccu_pll_sync *sync = pll->config.sync;
+	const struct ccu_pll_rate_tbl *entry = NULL;
+	unsigned long (*calc)(const struct ccu_pll_rate_tbl *params,
+			      unsigned long parent_rate);
+	int (*update)(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *params);
+	int (*enable)(struct clk_hw *hw);
+	struct ccu_pll_rate_tbl old;
+	struct ccu_pll_park park = {};
+	struct clk_hw *parent;
+	unsigned long parent_rate, rate;
+	u32 outputs, lock, i;
+	bool enabled;
+	int ret;
 
-	if (ccu_plla_lookup_matched_entry(pll))
+	/* Synchronization is opt-in; in particular PLL1 has no sync descriptor. */
+	if (!sync)
+		return 0;
+	parent = clk_hw_get_parent_by_index(hw, 0);
+	if (!parent)
+		return 0;
+	parent_rate = clk_hw_get_rate(parent);
+	calc = plla ? ccu_plla_calc_rate : ccu_pll_calc_rate;
+	update = plla ? ccu_plla_update_param : ccu_pll_update_param;
+	enable = plla ? ccu_plla_enable : ccu_pll_enable;
+	ret = ccu_pll_get_params(pll, &old, plla);
+	if (ret)
+		goto warn;
+	rate = calc(&old, parent_rate);
+	if (!rate)
 		return 0;
 
-	ccu_plla_disable(hw);
-	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
+	/* Compare encoded rates, including fractional-divider quantization. */
+	for (i = 0; i < pll->config.tbl_num; i++) {
+		if (rate == calc(&pll->config.rate_tbl[i], parent_rate)) {
+			entry = &pll->config.rate_tbl[i];
+			break;
+		}
+	}
+	if (!entry || ccu_pll_params_equal(&old, entry, plla))
+		return 0;
+	if ((plla ? old.swcr3 : old.swcr1) & PLL_POWERDOWN_BYPASS)
+		return 0;
+	ret = regmap_read(pll->common.regmap, pll->common.reg_swcr2, &outputs);
+	if (ret)
+		goto warn;
+	/* Do not interrupt peripheral users, including unregistered consumers. */
+	if (outputs & PLL_OUTPUT_GATES & ~sync->cpu_outputs)
+		return 0;
+	ret = regmap_read(pll->common.lock_regmap, pll->config.reg_lock, &lock);
+	if (ret)
+		goto warn;
+	enabled = plla ? old.swcr2 & PLLA_SWCR2_EN : old.swcr3 & PLL_SWCR3_EN;
+	if (enabled != !!(lock & pll->config.mask_lock))
+		return 0;
 
+	/*
+	 * .init runs under the CCF prepare lock, before this PLL is linked to
+	 * its children. Restore the hardware muxes before CCF adopts them.
+	 */
+	ret = ccu_pll_park_cpus(sync, &park, plla, rate, parent_rate);
+	if (ret)
+		goto unpark;
+	ret = ccu_pll_stop(pll, plla);
+	if (ret)
+		goto restart;
+	ret = update(pll, entry);
+	if (!ret && enabled)
+		ret = enable(hw);
+	if (!ret)
+		goto unpark;
+
+	/* Restore the old parameters before considering the original parents. */
+	if (ccu_pll_stop(pll, plla) || update(pll, &old))
+		goto warn;
+restart:
+	if (enabled && enable(hw))
+		goto warn;
+unpark:
+	ccu_pll_unpark(sync, &park);
+	if (park.parked)
+		ret = -ETIMEDOUT;
+warn:
+	if (ret)
+		pr_warn("%s: PLL synchronization failed: %d; retaining safe clocks\n",
+			clk_hw_get_name(hw), ret);
+	/* Failed synchronization must not unwind clocks needed to keep booting. */
 	return 0;
 }
 
+static int ccu_pll_init(struct clk_hw *hw)
+{
+	return ccu_pll_sync_init(hw, false);
+}
+
+static int ccu_plla_init(struct clk_hw *hw)
+{
+	return ccu_pll_sync_init(hw, true);
+}
+
 const struct clk_ops spacemit_ccu_pll_ops = {
 	.init		= ccu_pll_init,
 	.enable		= ccu_pll_enable,
diff --git a/drivers/clk/spacemit/ccu_pll.h b/drivers/clk/spacemit/ccu_pll.h
index e41db5c97c1a8..f77afafddba55 100644
--- a/drivers/clk/spacemit/ccu_pll.h
+++ b/drivers/clk/spacemit/ccu_pll.h
@@ -46,11 +46,31 @@ struct ccu_pll_rate_tbl {
 
 struct ccu_pll_config {
 	const struct ccu_pll_rate_tbl *rate_tbl;
+	const struct ccu_pll_sync *sync;
 	u32 tbl_num;
 	u32 reg_lock;
 	u32 mask_lock;
 };
 
+/* A CPU mux selection which consumes this PLL. */
+struct ccu_pll_cpu_mux {
+	u32 reg;
+	u32 mask;
+	u32 value;
+};
+
+/* Only CPU-exclusive outputs may remain gated on during synchronization. */
+struct ccu_pll_sync {
+	struct ccu_pll *safe_pll;
+	const char *apmu_compatible;
+	const struct ccu_pll_cpu_mux *muxes;
+	u32 num_muxes;
+	u32 cpu_outputs;
+	u32 safe_sel;
+	u32 slow_sel;
+	u32 reg_safe_gate;
+};
+
 #define CCU_PLL_RATE(_rate, _swcr1, _swcr3) \
 	{									\
 		.rate	= _rate,						\
@@ -71,12 +91,13 @@ struct ccu_pll {
 	struct ccu_pll_config	config;
 };
 
-#define CCU_PLL_CONFIG(_table, _reg_lock, _mask_lock) \
+#define CCU_PLL_CONFIG(_table, _reg_lock, _mask_lock, _sync)			\
 	{									\
 		.rate_tbl	= _table,					\
 		.tbl_num	= ARRAY_SIZE(_table),				\
 		.reg_lock	= (_reg_lock),					\
 		.mask_lock	= (_mask_lock),					\
+		.sync		= _sync,					\
 	}
 
 #define CCU_PLL_COMMON_HWINIT(_name, _ops, _flags)				\
@@ -89,9 +110,9 @@ struct ccu_pll {
 	})
 
 #define CCU_PLL_X_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2, _reg_swcr3,	\
-		       _reg_lock, _mask_lock, _ops, _flags)			\
+			 _reg_lock, _mask_lock, _ops, _flags, _sync)		\
 static struct ccu_pll _name = {							\
-	.config	= CCU_PLL_CONFIG(_table, _reg_lock, _mask_lock),		\
+	.config	= CCU_PLL_CONFIG(_table, _reg_lock, _mask_lock, _sync),		\
 	.common = {								\
 		.reg_swcr1	= _reg_swcr1,					\
 		.reg_swcr2	= _reg_swcr2,					\
@@ -103,12 +124,22 @@ static struct ccu_pll _name = {							\
 #define CCU_PLL_DEFINE(_name, _table, _reg_swcr1, _reg_swcr3, _reg_lock,	\
 		       _mask_lock, _flags)					\
 	CCU_PLL_X_DEFINE(_name, _table, _reg_swcr1, 0, _reg_swcr3,		\
-		       _reg_lock, _mask_lock, &spacemit_ccu_pll_ops, _flags)
+		       _reg_lock, _mask_lock, &spacemit_ccu_pll_ops, _flags, NULL)
+
+#define CCU_PLL_SYNC_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2,		\
+			    _reg_swcr3, _reg_lock, _mask_lock, _flags, _sync)	\
+	CCU_PLL_X_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2, _reg_swcr3,	\
+		       _reg_lock, _mask_lock, &spacemit_ccu_pll_ops, _flags, _sync)
 
 #define CCU_PLLA_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2, _reg_swcr3,	\
-		       _reg_lock, _mask_lock, _flags)				\
+			_reg_lock, _mask_lock, _flags)				\
+	CCU_PLL_X_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2, _reg_swcr3,	\
+		       _reg_lock, _mask_lock, &spacemit_ccu_plla_ops, _flags, NULL)
+
+#define CCU_PLLA_SYNC_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2,		\
+			     _reg_swcr3, _reg_lock, _mask_lock, _flags, _sync)	\
 	CCU_PLL_X_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2, _reg_swcr3,	\
-		       _reg_lock, _mask_lock, &spacemit_ccu_plla_ops, _flags)
+		       _reg_lock, _mask_lock, &spacemit_ccu_plla_ops, _flags, _sync)
 
 static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
 {

-- 
2.55.0

