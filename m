Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458896;
	b=MggizoQlduMLfzanIQhagbxysCY9HC0XLgaVG9EBgQEihAJ1MB1NelwYNcBy6GzRYXS3
	 KOGIz6nU4UxeUrT79f9JV6eY1yqwCOWdJBZgrW3p0MljiScjTCLvErrC29088XfRXrauf
	 CDpKfnHDa4uv4pxK3jfAx6ZZuXaijHE2aCfl+VMHM3wG89U8ntyuhVwCEY9c4IrlmuwFu
	 kvCaB74Lt5xThC4f0tD4lHr8ZQlJK5YlepOrJH2LtscIATa5dz7DxteJB0yWpx2HfBIAR
	 ZjfauHsocRLDJhIsWeaJgY3lsusBo5E986jxXIWLnhGpf2dbc5gUxC2/EAz1WXjNGYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458896;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cXJf4DiiFh6FPS7q8TcETpIQClk56ctGCe/j5Oo2rgc=;
	b=5Q5sBra5z/t7gSPh2NtDZstO7gVR2Rwk3/wTGjMMVZqDjJKs8iM4i/PyOaQ/P5eguPlN
	 8oy5nkkSrWfuZYznam7e6KIDS87An80ASlNw/yxrcGjePtesKwbuwlpy6nBVSBSNIIpHc
	 qIorrmU98Hugp533lmE9T+2FXtqPxkE/4H3iBxzRCR0+9agpN5xnnIRWkQvWL42ExXZT2
	 6dLY3j7cC0c5txqHNwk202iHucBpXbKtzW6ofisWsyJwBkh2vpZ6I61LRw6lFMQupLSHi
	 iOSyzIYk6BdrLcxhbO+3z8ya6tT958TpoYDTOMI9YDk+GOP9pH8+1+DjWdgkwp/PwKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEBKS016;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CB606A31E;
	Mon, 23 Nov 2026 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEBKS016
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E435B1F000E0;
	Mon, 23 Nov 2026 18:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458896;
	bh=cXJf4DiiFh6FPS7q8TcETpIQClk56ctGCe/j5Oo2rgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gEBKS016GnPSuPfVY+woL2aKH8v5gtehnI4ZhKKfpNElp0876ZGrujrC5d/QFFydE
	 ZBBichychjOquH5hTv6Lyn6qikeM+2gEM+sTUj0vY47pfWZ5fX3TAByLDzqrFdiVsF
	 72CHaEnT8nXeQc+UZncy8IcWjqPppkC1PJN1uTcldgPb2LgHE7CPtTfRWtVrURVgHG
	 cElwvbT+fNVFQ8qPZOu3vfy3tQvMio9u0h/se5Qk+4N3zu54dRj8rOKJWSyNB2PgRP
	 QAXArL2YRDLaZR7hsJ0EaxqHpS4ggPcFyxtL6T1wN3hnCg9Ei8DaIJ6GesryeqR2gs
	 IpZlza+EnvMzg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 23 Nov 2026 19:34:34 +0100
Subject: [PATCH 4/4] clk: qcom: gcc-glymur: Convert USB4 clocks to use
 phymux ops
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
In-Reply-To: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795458875; l=7871;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=5lwTrE0u9s5yxegiq0nD0VYPKaJbMe2vvMBhIPbp4Uo=;
 b=1spTgCJpCEjGAFoXdC0cI3cKBEs1RLBsIEqYLuSTfwo1x4qvromuDp7/O3lxRd/MfaOPK2E/R
 sls3uSFNl6nAGqrbjGEnZ7zhSgZJpYpRqYtnwxo42pIRJrUzqFzRyG5
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Almost all of the USB4 clocks fall into the "phymux" category, with a
glitch-free mux switching between an XO source and the "fast clock"
derived from one of the connected PHY's outputs. That allows for
running the downstream devices (at reduced capacity) even without the
PHY being oneline.

Convert such USB4 clocks over.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 144 +++++++++++-------------------------------
 1 file changed, 36 insertions(+), 108 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 96d1c07348bc..186c779e3084 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -104,12 +104,6 @@ enum {
 	P_PCIE_4_PIPE_CLK,
 	P_PCIE_5_PIPE_CLK,
 	P_PCIE_6_PIPE_CLK,
-	P_QUSB4PHY_0_GCC_USB4_RX0_CLK,
-	P_QUSB4PHY_0_GCC_USB4_RX1_CLK,
-	P_QUSB4PHY_1_GCC_USB4_RX0_CLK,
-	P_QUSB4PHY_1_GCC_USB4_RX1_CLK,
-	P_QUSB4PHY_2_GCC_USB4_RX0_CLK,
-	P_QUSB4PHY_2_GCC_USB4_RX1_CLK,
 	P_SLEEP_CLK,
 	P_UFS_PHY_RX_SYMBOL_0_CLK,
 	P_UFS_PHY_RX_SYMBOL_1_CLK,
@@ -623,26 +617,6 @@ static const struct clk_parent_data gcc_parent_data_33[] = {
 	{ .index = DT_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK },
 };
 
-static const struct parent_map gcc_parent_map_34[] = {
-	{ P_QUSB4PHY_0_GCC_USB4_RX0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_34[] = {
-	{ .index = DT_QUSB4PHY_0_GCC_USB4_RX0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_35[] = {
-	{ P_QUSB4PHY_0_GCC_USB4_RX1_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_35[] = {
-	{ .index = DT_QUSB4PHY_0_GCC_USB4_RX1_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map gcc_parent_map_36[] = {
 	{ P_GCC_USB4_0_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
 	{ P_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
@@ -707,26 +681,6 @@ static const struct clk_parent_data gcc_parent_data_41[] = {
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
 };
 
-static const struct parent_map gcc_parent_map_42[] = {
-	{ P_QUSB4PHY_1_GCC_USB4_RX0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_42[] = {
-	{ .index = DT_QUSB4PHY_1_GCC_USB4_RX0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_43[] = {
-	{ P_QUSB4PHY_1_GCC_USB4_RX1_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_43[] = {
-	{ .index = DT_QUSB4PHY_1_GCC_USB4_RX1_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map gcc_parent_map_44[] = {
 	{ P_GCC_USB4_1_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
 	{ P_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
@@ -777,26 +731,6 @@ static const struct clk_parent_data gcc_parent_data_48[] = {
 	{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
 };
 
-static const struct parent_map gcc_parent_map_49[] = {
-	{ P_QUSB4PHY_2_GCC_USB4_RX0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_49[] = {
-	{ .index = DT_QUSB4PHY_2_GCC_USB4_RX0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_50[] = {
-	{ P_QUSB4PHY_2_GCC_USB4_RX1_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_50[] = {
-	{ .index = DT_QUSB4PHY_2_GCC_USB4_RX1_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map gcc_parent_map_51[] = {
 	{ P_GCC_USB4_2_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
 	{ P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
@@ -1099,32 +1033,30 @@ static struct clk_regmap_mux gcc_usb4_0_phy_pcie_pipe_mux_clk_src = {
 	},
 };
 
-static struct clk_regmap_mux gcc_usb4_0_phy_rx0_clk_src = {
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_rx0_clk_src = {
 	.reg = 0x2b0c0,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_34,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_phy_rx0_clk_src",
-			.parent_data = gcc_parent_data_34,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_34),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_QUSB4PHY_0_GCC_USB4_RX0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_usb4_0_phy_rx1_clk_src = {
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_rx1_clk_src = {
 	.reg = 0x2b0d4,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_35,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_phy_rx1_clk_src",
-			.parent_data = gcc_parent_data_35,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_35),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_QUSB4PHY_0_GCC_USB4_RX1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
@@ -1204,32 +1136,30 @@ static struct clk_regmap_mux gcc_usb4_1_phy_pcie_pipe_mux_clk_src = {
 	},
 };
 
-static struct clk_regmap_mux gcc_usb4_1_phy_rx0_clk_src = {
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_rx0_clk_src = {
 	.reg = 0x2d0e4,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_42,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_phy_rx0_clk_src",
-			.parent_data = gcc_parent_data_42,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_42),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_QUSB4PHY_1_GCC_USB4_RX0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_usb4_1_phy_rx1_clk_src = {
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_rx1_clk_src = {
 	.reg = 0x2d0f8,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_43,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_phy_rx1_clk_src",
-			.parent_data = gcc_parent_data_43,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_43),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_QUSB4PHY_1_GCC_USB4_RX1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
@@ -1309,32 +1239,30 @@ static struct clk_regmap_mux gcc_usb4_2_phy_pcie_pipe_mux_clk_src = {
 	},
 };
 
-static struct clk_regmap_mux gcc_usb4_2_phy_rx0_clk_src = {
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_rx0_clk_src = {
 	.reg = 0xe00c4,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_49,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_phy_rx0_clk_src",
-			.parent_data = gcc_parent_data_49,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_49),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_QUSB4PHY_2_GCC_USB4_RX0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_usb4_2_phy_rx1_clk_src = {
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_rx1_clk_src = {
 	.reg = 0xe00d8,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_50,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_phy_rx1_clk_src",
-			.parent_data = gcc_parent_data_50,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_50),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_QUSB4PHY_2_GCC_USB4_RX1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };

-- 
2.56.1

