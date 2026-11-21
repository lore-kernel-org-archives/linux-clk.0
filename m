Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261281;
	b=JqTPiH7w6OXqslnTlsdsLeEnJeXu8KJu8U1GgG9OeV5W7bx2V9z+tJMcONjPizUDGzmj
	 Er4HkD5ZxxRta4DhUdTq8f44etWmGX08IcVkyLrtM+ZHEX+d72fdHkErMKvIffKoFNWCI
	 T1fvbFIYwFJRwYkahji5wIqtakp6fLAMuUYQQhx6os+hARFd+Fui7b8Fml9fTb9CnR7Z+
	 DAeHGISHG6saDWhymWXUhJncKDUZfnPgEk7o9F+3nbA++ZE1EEj+bEOcGtBs2S8uGOtLP
	 CraZlW3/0m2jD2sVM3Bo68D6Jfxg8mYjCkFC1rxpWwIEmL5k+ef5QQuK8HAKmGZ6IKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261281;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y+AYtfVk0LkCTNbc8GOpJgwDHV5K3ThuTa26y9mHfAo=;
	b=yhcWLHRmsbAvmpimw04rOfm6eP72UjeYCOKdpW0yQ+yrAqrXNuidqIO5XW3Wu7MAJJpK
	 CK/GM2PO8fb6yurNjtST3FQcfwkEeBW5c/t4+Mn1AxWKPJCQiFu5tpBMX8+P90Z65ij+w
	 hqwasVfpMEJ1BwBdr7kjlR5MQS6/tUvZCEzO5ooyI1AaGr2yMJqLQp28QZgwHo/ljfQYj
	 T7UhmP3QLzgmZmf71j6moZldGN0jjy3Hy/GKC1AnQjwdWYASv4UqYrT8cFgbi4BInFiNk
	 1ofP/NtL/14DpTznbJCBhAkTruzcQ8/vDnM5xdHQ7QqkGoiZbBPGB6hWTuDOBZ7Hlpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=P32bqnuf;
	arc=none smtp.remote-ip=203.205.221.236
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E2606A330;
	Sat, 21 Nov 2026 11:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6E2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=P32bqnuf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795261273; bh=y+AYtfVk0LkCTNbc8GOpJgwDHV5K3ThuTa26y9mHfAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P32bqnufmrxVvq9fqpUbuKboJgfUREEdeNy73b/aUmjyhFFmEVUzeSeEsZ8ysnxUq
	 /ec1JRAXCxLqmJ4AF5P51kJVIo4UXgFQGzlAWnjI0xxDAIDNCaXPwPfNtjLsZZA/RU
	 7lz7ddu/+arAEk5Smb/DS30w99kJ68PcPx3oBVxo=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id A483CACC; Sat, 21 Nov 2026 19:41:08 +0800
X-QQ-mid: xmsmtpt1795261269t3sk748np
Message-ID: <tencent_27C5C9EA21F34B25719F07818366912BB407@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLgVnKCHPq4TKmrtsqjLlnWFixUpd7RAqUMfvIq8rLc10uB7f6m6
	 Pd5xPUqBsCvRep8z3/QvdQ17PMxayD00x5ZY6LCbHWjqqNv3Wb6/NzI/ENVt1KhHm4LWCC33dcMO
	 a2HchLcNOtrZ0HQKGpuvxoVAOFa2FUcHhpx/EYMHOfV71r7GBHHLoHHRZ1SzRpQLNZmaRZDue9MB
	 1U2kT/7MGjeZw3YaqnU83a3wD6fYgZjiJRokUiOLRUS5IXjoYoG/HwyJg0JzQ4yB0hC9FZQU3aUC
	 zgzW7OqJlfS58xF1r5EsllNhrlSTg4zxeLrKbvxIFi6WfLfMXbh0fqMMLEf001kXgQmfNtxQy2b3
	 NgdOc7Gv/x6bq3o4iCbAXMaTYK094dwTTkoJlF/OyqYOp4UcqZO7gvG2pDGM29ikNVNAu4K6Fy0w
	 uLooprOeVLJBVc9KCNFpvCTN0dYD7LSBNG2ZOALyeorUZIxEw7CUwspCIhGIKoGsg/8SGeNxv4eT
	 5aytPc+1QTPP2Ht3NtDZQmv9rbeP3qP85fhPoAun/VEku9ApgpJkh7ooL1o/azw+TuMHNSdvT6Q8
	 j0Y125z5VTTzRiX6wWBP/sTrq51MUEy1eNrKNH+ZnKlbPofcsUVDHqrkl8WrfASTWOjfGS4vORKu
	 u8z7+gL4f0Vxg3DNU86lXyowXm9nqMOrDhMG9/JHuLf4uMFgYcTKTeLJHtUAnxAw9CGpL/4eI3EI
	 p9NgxqeZ17PccHxEHVvq+utPjajz6YGotJauE7mH6oY13cGlTp/EUw/LvESy5tmqbjNuD++wicDW
	 OP34SskSazum5l0HySjdn5LRPqINBzZaJSzJHc47wEq46UfEczuPSB3d6bNWLYIcCLOtJW1zY+3M
	 39PrDMhPoleAZ7pA2bUrKJWrIuQbM64FLLy/r8MfJ87RsnHEpvNxpHqRtRoA03pVce9Q1jibjDii
	 nTnUaF8oUKSbnX/OiY4gFD/SUBgaLGr77T8fqxc/11cBAMWPxUlQWZeNYI1amHEP4+2UKWDfac2k
	 xjjMCKvUztCINHrKkIrJ0IeR2QGFDEl1iK+KPU9iixkfJy+/FGtfHg+/U6BlQqDjoQzp7kN7Vxih
	 PpZTpfSFDOwCO9sAEkMFYIp0UwIg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: ZhuXiangyu <1194781887@qq.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 2/2] clk: rockchip: rk3506: add SAI MCLK output gates
Date: Sat, 21 Nov 2026 19:41:06 +0800
X-OQ-MSGID: <20261121114106.1464639-2-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121114106.1464639-1-1194781887@qq.com>
References: <20261121114106.1464639-1-1194781887@qq.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3506 has four SAI MCLK output gates in the PMU and system GRFs.
Register them with the existing GRF gate support so the SAI MCLK pin
direction can be controlled through the clock framework.

The PMU GRF is added as an auxiliary GRF and the SAI0/SAI1 gates use
it, while the SAI2/SAI3 gates live in the system GRF.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 drivers/clk/rockchip/clk-rk3506.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3506.c b/drivers/clk/rockchip/clk-rk3506.c
index dd59bd60..4196f4f7 100644
--- a/drivers/clk/rockchip/clk-rk3506.c
+++ b/drivers/clk/rockchip/clk-rk3506.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -520,6 +521,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(14), 0, GFLAGS),
 	GATE(MCLK_OUT_SAI0, "mclk_out_sai0", "mclk_sai0", 0,
 			RK3506_CLKGATE_CON(14), 1, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI0_TO_IO, "mclk_sai0_to_io", "mclk_out_sai0",
+		 0, 0x4, 8, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
 	COMPOSITE(MCLK_SAI1, "mclk_sai1", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(41), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(14), 2, GFLAGS),
@@ -527,6 +530,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(14), 3, GFLAGS),
 	GATE(MCLK_OUT_SAI1, "mclk_out_sai1", "mclk_sai1", 0,
 			RK3506_CLKGATE_CON(14), 4, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI1_TO_IO, "mclk_sai1_to_io", "mclk_out_sai1",
+		 0, 0x4, 9, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
 	GATE(HCLK_ASRC0, "hclk_asrc0", "hclk_lsperi_root", 0,
 			RK3506_CLKGATE_CON(14), 5, GFLAGS),
 	COMPOSITE(CLK_ASRC0, "clk_asrc0", gpll_v0pll_v1pll_g_parents_p, 0,
@@ -608,6 +613,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(18), 3, GFLAGS),
 	GATE(MCLK_OUT_SAI2, "mclk_out_sai2", "mclk_sai2", 0,
 			RK3506_CLKGATE_CON(18), 4, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI2_TO_IO, "mclk_sai2_to_io", "mclk_out_sai2",
+		 0, 0x4, 2, CLK_GATE_HIWORD_MASK, grf_type_sys),
 	COMPOSITE(MCLK_SAI3_SRC, "mclk_sai3_src", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(52), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(18), 5, GFLAGS),
@@ -617,6 +624,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(18), 7, GFLAGS),
 	GATE(MCLK_OUT_SAI3, "mclk_out_sai3", "mclk_sai3_src", 0,
 			RK3506_CLKGATE_CON(18), 8, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI3_TO_IO, "mclk_sai3_to_io", "mclk_out_sai3",
+		 0, 0x4, 3, CLK_GATE_HIWORD_MASK, grf_type_sys),
 	COMPOSITE(MCLK_SAI4_SRC, "mclk_sai4_src", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(53), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(18), 9, GFLAGS),
@@ -787,10 +796,17 @@ static void __init rk3506_clk_init(struct device_node *np)
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
+	struct regmap *pmu_grf;
 
 	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3506_clk_branches,
 						   ARRAY_SIZE(rk3506_clk_branches)) + 1;
 
+	pmu_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3506-grf-pmu");
+	if (IS_ERR(pmu_grf)) {
+		pr_err("%s: could not get PMU GRF syscon\n", __func__);
+		return;
+	}
+
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
 		pr_err("%s: could not map cru region\n", __func__);
@@ -804,6 +820,12 @@ static void __init rk3506_clk_init(struct device_node *np)
 		return;
 	}
 
+	if (rockchip_clk_add_grf(ctx, pmu_grf, grf_type_pmu0)) {
+		pr_err("%s: could not add PMU GRF\n", __func__);
+		iounmap(reg_base);
+		return;
+	}
+
 	rockchip_clk_register_plls(ctx, rk3506_pll_clks,
 				   ARRAY_SIZE(rk3506_pll_clks),
 				   0);
-- 
2.47.3

