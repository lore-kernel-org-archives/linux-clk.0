Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D5A3A0B11;
	Thu, 19 Mar 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905658; cv=none; b=KoX2Uz7rQ15LmciTOgVMKqsxK9nyJ5CS1MitcUhOFq/4QbT4qWOuKy9Fg6LSodDnSzQplJ1O/KhkuSt0GkZjvcR39i9r01sHbsblLgDJKYEuLQvTWLtDfG7wxU/ZjpNqObYgsyHDJEsumZvYonXKesd2A6O93K9j5/wZyGYoU6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905658; c=relaxed/simple;
	bh=RRXcYO4mT56fSVQOstELDSYSDSMhqXysPx/fily7Lbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KeVP1IZ/3PT59c4DAJDAPZypfb0p8vA5v5IXIhiaAZX/RsGYGRuB7Tk+NN945nbDYxHDbwKeYmnII21mXt46ZbaY6KC3xEurlL65KZUxw/YsXNCuTPaXk24e2yHr+MuGPCZRV/DWwUBo/7gOOWqFBgD4KvklcX0GSHA8QaKBPWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=fail smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=Fa93/nJ1; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="Fa93/nJ1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/eya4aDQvTnyY42odUn+c0tG4YGtX2GnC9CVns2UdOY=; b=Fa93/nJ1SHCkFv09DDPc9+WrYL
	qnm5dK9CwdIuF0OcTKk1pR70Oco3mBMQtqx5+VB7RSujDXfaLRRD6J/4eEtFw4MGsRQg5zJZlBYRA
	ljm7AftcVXQtxAtGIFTKoDHWxdu/3r3rfvrVFz1w3zJUXBtyok6jdaeVtn4Fh+R6E+3nWZ0sw6ET9
	kXkuZaW04JqamnDg1VsiE8Fb29I+GM0BJQhABeOmWHYSBQpcfjxbqmLk4KvhW9epvxYqhbJhcR8yF
	JG4LXaEQhzeqI6+4PxmRvnrUcHYG5mfIa3xomRp9fkJDv4GekJV4jO1DYmz+/NeS+rIKt/I83hc34
	7xLuK5nw==;
Received: from [109.52.2.233] (port=10095 helo=mac.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w37tS-0000000DgEs-3VvV;
	Thu, 19 Mar 2026 08:34:08 +0100
From: Daniele Briguglio <hello@superkali.me>
Date: Thu, 19 Mar 2026 08:34:01 +0100
Subject: [PATCH v2 3/3] clk: rockchip: rk3588: add GATE_GRF clocks for I2S
 MCLK output to IO
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-rk3588-mclk-gate-grf-v2-3-c4c8daab0762@superkali.me>
References: <20260319-rk3588-mclk-gate-grf-v2-0-c4c8daab0762@superkali.me>
In-Reply-To: <20260319-rk3588-mclk-gate-grf-v2-0-c4c8daab0762@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Daniele Briguglio <hello@superkali.me>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773905640; l=4935;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=RRXcYO4mT56fSVQOstELDSYSDSMhqXysPx/fily7Lbg=;
 b=6wylI2my88AJ0f/POCTOB9wj2WP1YanNZ/nQ0a95gj2CwoHZOGAJbcGnCPhCpQ6XnX3tO2Vo5
 2atK0jFaZWFAkT+GW+t3rnqct4SYcJ/DxsRRYAZdinNSnwSl9AYV8id
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603191419.MH6EuPga-lkp@intel.com/
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 drivers/clk/rockchip/clk-rk3588.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 1694223f4f84..4611b6ce8217 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -5,7 +5,9 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/slab.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/syscore_ops.h>
@@ -892,6 +894,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(8), 0, GFLAGS),
 	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
+	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mclkout",
+			0, 0x0318, 2, GFLAGS, grf_type_sys),
 
 	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
@@ -907,6 +911,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(8), 4, GFLAGS),
 	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
+	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mclkout",
+			0, 0x0318, 7, GFLAGS, grf_type_sys),
 	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
 			RK3588_CLKGATE_CON(7), 11, GFLAGS),
 	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
@@ -935,6 +941,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(7), 10, GFLAGS),
 	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
+	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mclkout",
+			0, 0x0318, 0, GFLAGS, grf_type_sys),
 
 	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
 			RK3588_CLKGATE_CON(9), 6, GFLAGS),
@@ -2220,6 +2228,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_PMU_CLKGATE_CON(2), 13, GFLAGS),
 	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
+	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mclkout",
+			0, 0x0318, 1, GFLAGS, grf_type_sys),
 	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
 			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
 	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNUSED,
@@ -2439,6 +2449,8 @@ static struct rockchip_clk_branch rk3588_clk_branches[] = {
 static void __init rk3588_clk_early_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
+	struct rockchip_aux_grf *sys_grf_e;
+	struct regmap *sys_grf;
 	unsigned long clk_nr_clks, max_clk_id1, max_clk_id2;
 	void __iomem *reg_base;
 
@@ -2479,6 +2491,17 @@ static void __init rk3588_clk_early_init(struct device_node *np)
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

