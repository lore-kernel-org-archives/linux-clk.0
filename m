Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392650;
	b=ywUtsfj+DXs3GXOpm/go2LN4vf7/h+qjsetEYUXyP60qgOgA0YQQ//nkuyWzYnYdIgle
	 Cddx/2bbaY/58DcUTofJ3w7vIoLJiyn77PgWmmTxZPDHicLLAh9nbZB/J7p5mmL20M945
	 J16VVOCQlEPE/oEaKx1pXAMvhWiKzzjTNiTgweciE4NbvMxcjOlh2F0EPrs2id4TYsE0z
	 EqKjiDRXg3tHTztSevtA8ioa2rzCePZkyS/MrUwzQXRT7Cbq+RhaBR2kJJuFrarVFLAE3
	 ZGgiyckP1guDAAPgg3pJs2GLOKrX7NcC9K1btG3Ok9CYZMm7ftK+n7vEgm9OP+f8l0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392650;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=47lhYxhJjidb4LprULqqGEJWLcgqp0KzmPtcOdzaZSU=;
	b=OL58pV/3dGUoelJgwgYyyGbJk33z3wUjXrxc+CorR9RrS3tDtMTgOY+M2SsEgk4c/VAE
	 uWOW1M1OLK5vy/1d4250oXxAJ7rl+S7X+AEg18eOyavdlN39MepJbIU2bKH8kdO/LlTRs
	 x+j/4VnW+I9EOQW2GSsUEPa4+KcL2AhPpLTwTbVCBw6El712G4MYFxZe++9n8CZbxCNNf
	 /fh78bXvWfknfMQ0R8HdUWLaOA2KkeKWjtALca9totjQZGVdL4ZkIEPlp0ZZ4AKHeM7pY
	 8kNto/lRQr8hhva0ZSVMK6sjgjwFkxE+15pf87YhuGb6TNhU0f0RVJPvK3kUk+IpH7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=zAyL9wgD;
	arc=none smtp.remote-ip=203.205.221.155
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D72606A31A;
	Mon, 23 Nov 2026 00:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D72606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=zAyL9wgD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795392638; bh=47lhYxhJjidb4LprULqqGEJWLcgqp0KzmPtcOdzaZSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zAyL9wgDJ8hCJantxSWaPIpVhpSCPToBhooGdphlb+zvt3Sqk/2+zyAfR8ybcO/9L
	 6sVPeo+PcQ7qkxTRoCidVR2zQ9sKJnAPcoLjSIJckammHdsTu9G/pXhdGECjEddqmn
	 oAF6KKfr4OYMz2/nF7m934VTox91ReTENgbx8rSs=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2A1184D1; Mon, 23 Nov 2026 08:10:33 +0800
X-QQ-mid: xmsmtpt1795392636tmlyqsg09
Message-ID: <tencent_8AD71C4349D2274F40A1B9ED0A78F1AF1A05@qq.com>
X-QQ-XMAILINFO: MKCip/S3UDF5dUxc+TTOfoqFelSVAfouM2Cjc3I1AFevuG/388bPWpwM3GfxaH
	 C4y5HYctiChX1Ne3EqBzQLuMS4f8k7ckooBeqXhB3pzLbVqt5QfovUXudtu0QbeoUBZrlG+nPOvB
	 Zy/dUT0QM8tu/vZ76OQH0cAGWT6IpMFZK0kpQ+siaWE4vmk6JAfkZZjeGQwZt6u7Ha6L+ab/1eex
	 ZnQLs8PQeKw0MD0fjxo+LzvCKiSOi6iqiaN0RceabQshLbtP38X6iFTzfezHyrZ3MNX+ekv0PZ88
	 xJ0fZ/sZN2U3pQ9tOg+gQ3iKr7SxB1sWU0oz1hiDFROSF/nVnRfeQ1t4EMfhtP4ipZClRfBD+Cmf
	 sNu+rYrVEpdWBwbgA9q+QGgwJ9zVrAHPxpYiSgN3j7A6IlVpscgwb6+Ym/B2DDbY8Yy32ywqw+BS
	 k2lqU+5EzxW0T+np95F7A9QCD8KZeSF4wONg3662Z3AnU/wL7tpYivcMkJh3AYipbnsE6W69hsM7
	 1G7ZvCon2Ad1ZQRNOP9g58EEGeu7ECL3KEwYIbLThWjkraLSY3hfbEIaqr30uzmtl0t7vRpy08+W
	 +zk9HrgouorXVuUyuom6Dz4KBUKECwBtBJiHrLHvvnxbHzj8nhaXHvDsT5u3KXimVuD80a2vNq2o
	 jFTxD4C+JvFGKfRD2+jWpdME3A8QuajZ4qseLOco8YnlYG6bttzTrNkIKalUDsCKYRJe1pd/6uMl
	 DshzSNXuo17ZCvrNJ05KEMyrPjw6FglSgIplyN4JxMFt2a88j+hVxg5MWU9XWijFiFXfLuEXwKXn
	 LLf1JLqYjlxvCucxo99igP4yuYDVUnxs9RJzXbD9dQiflWVKhjiB+CD1ZzPB23DtwCFKwLjOvYNZ
	 eUe/d+HtOymCKjh5XLFZi59acJiuPgMkEQ1oaWAlceW4JHY7omG75UtpUXKn8leEQKty43J3RZWB
	 Hiq5cIP1TiRLAMpEVGfD4XAD0xDPrXzEXW4mNpEpHwXBR2PX5k8xXokdRrEK+LjOp1Zn7gPjj8lE
	 Z2gGjVMi/ayrcuB9dmjqu5vV2yAX+2Uqb8TkQZxW/X5p9Gnd0jBQ9L5pmzZXwO8t9UhyEub54Vyo
	 jpmFsLcOPyKsg6PzUvKH7ug4u3mh9HO3BHhV3KQuuCdHUphRQ3HPSTz6zmUHWcrEeAkYN/fP2ShU
	 MNiz2IXN0eluBmFbIS5Hzf5PkYY1087b0ndRt2rikX663toQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] clk: rockchip: rk3506: Register the SAI MCLK output gates
Date: Mon, 23 Nov 2026 08:10:29 +0800
X-OQ-MSGID: <dde2ea2795acc72940f75a69caf502fe22f316dc.1795366993.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795366993.git.1194781887@qq.com>
References: <cover.1795366993.git.1194781887@qq.com>
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
direction can be controlled through the clock framework, the same way
RK3576 and RK3588 handle their SAI/I2S MCLK output gates.

The SAI2/SAI3 gates sit in the system GRF, which the CRU already has via
its "rockchip,grf" phandle.  The SAI0/SAI1 gates live in the PMU GRF, so
they are kept in a separate branch table that is only registered once
that syscon has been added as an auxiliary GRF.  Registering them
unconditionally would make them fall back to the system GRF and toggle an
unrelated bit there.

The PMU GRF lookup stays non-fatal: it only carries the SAI0/SAI1 gates,
so a missing syscon must not keep the whole CRU from being registered.

Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
drives the ES8388 codec, audio playback works, and the GRF gate bits
were read back from the registers to confirm that they get set.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
 drivers/clk/rockchip/clk-rk3506.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3506.c b/drivers/clk/rockchip/clk-rk3506.c
index dd59bd60..5046a658 100644
--- a/drivers/clk/rockchip/clk-rk3506.c
+++ b/drivers/clk/rockchip/clk-rk3506.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -608,6 +609,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(18), 3, GFLAGS),
 	GATE(MCLK_OUT_SAI2, "mclk_out_sai2", "mclk_sai2", 0,
 			RK3506_CLKGATE_CON(18), 4, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI2_TO_IO, "mclk_sai2_to_io", "mclk_out_sai2",
+		 0, 0x4, 2, CLK_GATE_HIWORD_MASK, grf_type_sys),
 	COMPOSITE(MCLK_SAI3_SRC, "mclk_sai3_src", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(52), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(18), 5, GFLAGS),
@@ -617,6 +620,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(18), 7, GFLAGS),
 	GATE(MCLK_OUT_SAI3, "mclk_out_sai3", "mclk_sai3_src", 0,
 			RK3506_CLKGATE_CON(18), 8, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI3_TO_IO, "mclk_sai3_to_io", "mclk_out_sai3",
+		 0, 0x4, 3, CLK_GATE_HIWORD_MASK, grf_type_sys),
 	COMPOSITE(MCLK_SAI4_SRC, "mclk_sai4_src", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(53), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(18), 9, GFLAGS),
@@ -782,11 +787,20 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(20), 0, GFLAGS),
 };
 
+static struct rockchip_clk_branch rk3506_clk_pmu_grf_branches[] __initdata = {
+	GATE_GRF(MCLK_OUT_SAI0_TO_IO, "mclk_sai0_to_io", "mclk_out_sai0",
+		 0, 0x4, 8, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
+	GATE_GRF(MCLK_OUT_SAI1_TO_IO, "mclk_sai1_to_io", "mclk_out_sai1",
+		 0, 0x4, 9, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
+};
+
 static void __init rk3506_clk_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
+	struct regmap *pmu_grf;
+	bool have_pmu_grf = false;
 
 	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3506_clk_branches,
 						   ARRAY_SIZE(rk3506_clk_branches)) + 1;
@@ -804,6 +818,15 @@ static void __init rk3506_clk_init(struct device_node *np)
 		return;
 	}
 
+	pmu_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3506-grf-pmu");
+	if (IS_ERR(pmu_grf)) {
+		pr_warn("%s: could not get PMU GRF syscon\n", __func__);
+	} else if (rockchip_clk_add_grf(ctx, pmu_grf, grf_type_pmu0)) {
+		pr_warn("%s: could not add PMU GRF\n", __func__);
+	} else {
+		have_pmu_grf = true;
+	}
+
 	rockchip_clk_register_plls(ctx, rk3506_pll_clks,
 				   ARRAY_SIZE(rk3506_pll_clks),
 				   0);
@@ -815,6 +838,10 @@ static void __init rk3506_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rk3506_clk_branches,
 				       ARRAY_SIZE(rk3506_clk_branches));
 
+	if (have_pmu_grf)
+		rockchip_clk_register_branches(ctx, rk3506_clk_pmu_grf_branches,
+					       ARRAY_SIZE(rk3506_clk_pmu_grf_branches));
+
 	rk3506_rst_init(np, reg_base);
 
 	rockchip_register_restart_notifier(ctx, RK3506_GLB_SRST_FST, NULL);
-- 
2.47.3

