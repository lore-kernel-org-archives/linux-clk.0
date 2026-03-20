Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8226239182B;
	Fri, 20 Mar 2026 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774002890; cv=none; b=f8GoOqmdLb3aP3vxAWmZE2T98PIjEYwK7iY098ifuolbmya9O4cWSL5uBS5WRcqjLcH6nde/G0R+8SlsMw3g/gKirWUjGYuLOzyUh6ozNAIVsm8xUtLSH5u/HHxniRjIVUghFXx8cGuoXVpFxOMpXzauvrsxUX4apE55SUIT9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774002890; c=relaxed/simple;
	bh=Sd3Ktqu8MkAChPFdcT9pDGRd2S5DOpCKyr9xKDj1q/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iORBGaeNKLGET8nxHtkVHGsjGlbYq9XV1k4DAFDV7VK0+xC63GntQ9VRN1ZoGrCh/mdKcobnCrkMjiJniYzdGAF06f5o4gzHGYbd7FEUpes7gpaUXO6q8gX6Pu38meM3UeFKNlqjpGxBHb/Ph4xK67qVURRDXeS0I3kl7gCZhRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=fail smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=E5BwmlZQ; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="E5BwmlZQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5ssZO+Y1y8lWV5m3fwzzaQIOncmBUgaUC7YTua42k3Y=; b=E5BwmlZQJvRPs22CdodPirHq5U
	Ei5RYFAIG8wH60ZiWAOrrPsZj8lMfgdL+ufIZvHHKZqv+0cI9xoIZr+hSX0iJe1NQouaUXnGxoIab
	GPBEPhvtc2jZluGxe/9sN9l3gkjcmST8WzgAdloGBSXJYdIw32m/pVMpXhnhwI8Eu22KMOVAfp6Hm
	8JYhHeXBsjsKyA4t4pEuOzv3CvysN59qXo+xSJnXaDbT3JitXAqTLghRhJmfpc7jFTmgraQH/cCm4
	fs/IuNYVaJSehkLCr8f7hlXarv4QsyK7s4KHOPR2na/tzkiqgQMyHzuH7KwUMLBsQpM4YlkroerIx
	7yGyWMbQ==;
Received: from [2a0d:52c0:500f:0:89f2:a47:418d:affd] (port=53820 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w3XBe-00000005JXw-0M7g;
	Fri, 20 Mar 2026 11:34:35 +0100
From: Daniele Briguglio <hello@superkali.me>
Date: Fri, 20 Mar 2026 11:34:16 +0100
Subject: [PATCH v3 4/4] clk: rockchip: rk3588: add GATE_GRF clocks for I2S
 MCLK output to IO
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-rk3588-mclk-gate-grf-v3-4-980338eacd2c@superkali.me>
References: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
In-Reply-To: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774002854; l=5142;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=Sd3Ktqu8MkAChPFdcT9pDGRd2S5DOpCKyr9xKDj1q/4=;
 b=XcvDme3076nteQ7MmQM1lD4cez7Yt9RUiWDCj0zoXi6C/V6oyQFRaOzJqxR126CqkTtGUkN8I
 NYn0bJtD5j3AYV0HYe3LuJ/wF5NyLoGIpcFJ7yCSchzaCMY4azWChcB
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

The I2S MCLK outputs on RK3588 are gated by bits in the SYS_GRF
register SOC_CON6 (offset 0x318). These gates control whether the
internal CRU MCLK signals reach the external IO pins connected to
audio codecs.

The kernel should explicitly manage these gates so that audio
functionality does not depend on bootloader register state. This is
analogous to what was done for RK3576 SAI MCLK outputs [1].

Register the SYS_GRF as an auxiliary GRF with grf_type_sys in the
early clock init, and add GATE_GRF entries for all four I2S MCLK
output gates:

  - I2S0_8CH_MCLKOUT_TO_IO (bit 0)
  - I2S1_8CH_MCLKOUT_TO_IO (bit 1)
  - I2S2_2CH_MCLKOUT_TO_IO (bit 2)
  - I2S3_2CH_MCLKOUT_TO_IO (bit 7)

Board DTS files that need MCLK on an IO pin can reference these
clocks, e.g.:

    clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;

Tested on the Youyeetoo YY3588 (RK3588) with an ES8388 codec on I2S0.

[1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com/

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Ricardo Pardini <ricardo@pardini.net>
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 drivers/clk/rockchip/clk-rk3588.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 1694223f4f84..2cc85fb5b2cc 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -5,11 +5,14 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/slab.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/syscore_ops.h>
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+#include <soc/rockchip/rk3588_grf.h>
 #include "clk.h"
 
 #define RK3588_GRF_SOC_STATUS0		0x600
@@ -892,6 +895,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(8), 0, GFLAGS),
 	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
+	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mclkout",
+			0, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
 
 	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
@@ -907,6 +912,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(8), 4, GFLAGS),
 	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
+	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mclkout",
+			0, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
 	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
 			RK3588_CLKGATE_CON(7), 11, GFLAGS),
 	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
@@ -935,6 +942,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(7), 10, GFLAGS),
 	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
+	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mclkout",
+			0, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
 
 	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
 			RK3588_CLKGATE_CON(9), 6, GFLAGS),
@@ -2220,6 +2229,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_PMU_CLKGATE_CON(2), 13, GFLAGS),
 	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
+	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mclkout",
+			0, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
 	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
 			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
 	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNUSED,
@@ -2439,6 +2450,8 @@ static struct rockchip_clk_branch rk3588_clk_branches[] = {
 static void __init rk3588_clk_early_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
+	struct rockchip_aux_grf *sys_grf_e;
+	struct regmap *sys_grf;
 	unsigned long clk_nr_clks, max_clk_id1, max_clk_id2;
 	void __iomem *reg_base;
 
@@ -2479,6 +2492,17 @@ static void __init rk3588_clk_early_init(struct device_node *np)
 			&rk3588_cpub1clk_data, rk3588_cpub1clk_rates,
 			ARRAY_SIZE(rk3588_cpub1clk_rates));
 
+	/* Register SYS_GRF for I2S MCLK output to IO gate clocks */
+	sys_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3588-sys-grf");
+	if (!IS_ERR(sys_grf)) {
+		sys_grf_e = kzalloc_obj(*sys_grf_e);
+		if (sys_grf_e) {
+			sys_grf_e->grf = sys_grf;
+			sys_grf_e->type = grf_type_sys;
+			hash_add(ctx->aux_grf_table, &sys_grf_e->node, grf_type_sys);
+		}
+	}
+
 	rockchip_clk_register_branches(ctx, rk3588_early_clk_branches,
 				       ARRAY_SIZE(rk3588_early_clk_branches));
 

-- 
2.53.0

