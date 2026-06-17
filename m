Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9B3955C1
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694500; cv=none; b=HySuyRfnBjzdJwk8TKn4wVxRnU23CyO1CclsREQ9R1l6SACCFACqH00mFgNGRt6JeraC9AW4pBLAenuHNqD00dS6mSzFGfz/OVMJgDlMYyqNY+9OyEITzbkZcIDuDj1U0GKBAqfcK5lAB4h7w/aPJGaoFeP/FjWf4ifjpTdCx7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694500; c=relaxed/simple;
	bh=Va9DP1JOK0mstsSy90ZuVxwqnBOsm/kHZXDbxgqIbYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJmF2f2RMHPsrrKpIwpMG8ciDhA6bgz6eGHWFk48Obb3KWVpjn7zSs4n1su9DrsPvxzmepLThRPsxbtJaTVPR5LLT1/qtt7Uozr1emrS8UZ8E/XQ1EddkfVuNGB5XB/TMrIz4luZyWj7QfXbd5NMgHY36fCr+9YWcvMzNeZXoFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jp7jC87S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2eCjmPJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jp7jC87S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2eCjmPJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UlO51607946
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Goy6WfBe0KdTPrja68NN4UJlaPm1q9rbXt8RgA3d7g=; b=jp7jC87SiVxFzFb0
	AtE4SWJub1dFt5r7cmp+Cv8dt0GsXYfSzqgW2KqDz8bUt/ayhpmTJynJnE7YCE94
	wupVjU0IErxI/+CTfoJ8gn4yamgEA5i5cbAUnOhK/wmsvahRznv7dNdZLvtUbIhD
	2K1prWpmUXPFKqGq2lJpFROROgILLfT6Q4WM8WLfvIz2gPEfYI6IsEvYiK5WOsIk
	TL99MTnE1crUoSId1B7lBfaQzCSdZiSYbS7MRrGBjqYdx+PrJZBvtBQxmd5V9CZ2
	YbEgwVDDevBeVGgeaihj4pAXginffdfZ9KqbzSy39bY79sF+mD3TMRe/ucS2cYIG
	NIWGZg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef22ru6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422a0eee68so7322294b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694498; x=1782299298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Goy6WfBe0KdTPrja68NN4UJlaPm1q9rbXt8RgA3d7g=;
        b=I2eCjmPJQyN8xaAZHHYP8Qhm1iYlpFcWQ0i0E6nmzFtlzXv0F+uY53kLxO5BvQc4Z/
         jtvP3Ih5cEhq8obexuyImn7M7APhUGalUMnqdek5Er9C83wCB4kM0dxUDsmMU50/DyyR
         Ca16IjBDcI7LDkncP6rSvLhLs9Hcr/KLa+1Ft1QB+H1RMyzSw96iyZg5iFA1bGji4o9D
         idIIdYSFE49m5+TwRNglmie6WiTo35PS7nX4bdQKVdWnwK3DI4ruT2VWsDkATwYETfKR
         pfWRp1eR789sGYsrRQxYzytSBr3LLsAtSMlBobXC6mTjA9sVWZsujPNOr8cNkyUBDGBH
         rmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694498; x=1782299298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Goy6WfBe0KdTPrja68NN4UJlaPm1q9rbXt8RgA3d7g=;
        b=cgrQyB5JC0VX98L5YpfaJbeUnAaRFll6CwKsibQrNCNQcpShehMJGQjf6nPJXQYI4/
         kuhbI11KrIy+kBxTX1GkT9JXpuxP5ukIRB4qQm+kGeAPmkhUPxs+45ZR37ZR9paR8NFY
         tnMKKp3gBMBraiuOfFLGvxy0KqbPs9o8INDIpS6H7qA0KXAgxQxe53ZxUiQT1yFDZdd2
         HZV0awErFLLR9e3Dx8e/1+xhrtlsqk3XcxWmjCVbfs7cxV2qhfQpuS2af4VQQA3ygVuk
         B9V9QW0bUlif8qtUKGhJohFdxU9CQrXmxkTKLEoMxZCqBp/CDPERw6M67kXW01ENl+vP
         s+pg==
X-Forwarded-Encrypted: i=1; AFNElJ/Z6nIiZBfMpTGrkY3XBDD1oO5ajZ4mgpRk/5D3LGZy9nT4b3frD9QenEghhIj9N2mrmne9Q3ZlPCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx081/WSxEEw4cs1+H27QM7BoAwJdPruYB2FaH/oliOpDSin0Un
	vCZGlv3tOsnAM/jvpB07NOEUF1FRtGa2HtSHHewEZPDxQoWsIrDBUWyis3XoOvbtdmSLcK9SDGg
	Wl5Pn3llXt9BnzX734Bv9+378Jt7VY/CGaSojzRI6//sKHB/pVFBd0cZ6FfqPpvc=
X-Gm-Gg: AfdE7clYmuqNaIeRQARW6PLe/NMhQFZlD69DtC83AZsU7wIu/btXb03esxaVIeZZiKv
	LA7lohg1lx8hTmtY3JyB5lgqbhm6kmlA6g2ahGDyrlruLbSxo2m4AdbjhCBd0r6TeYa1J5ALC64
	TUjRhd7xkB50cFwq5cwZSYuRyPrTI1ksMU606noO2qnFzGj/OZNz2Wdo+571Dh9WQOPyGwktAC4
	FTtIjoCZ/d/Dg0gGGNEqFjtsvXYSU3BMaF+5315YdwkeuSVWr4Ajmwn+vQ3IgFbGXOP2d2gkEUM
	WQkz10nm/nC/IvPv3OyQeH/0qdfDw0n4vNYwkXEdgAghsyPVISIP2HS+cVuiiKG6ncy+2Qo87T2
	cxJ/TSqQm3MLDEpKGF2EJAOqXbd2d2Lfw/W8=
X-Received: by 2002:a05:6a00:14d0:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-84524556ed2mr3304754b3a.28.1781694497530;
        Wed, 17 Jun 2026 04:08:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d0:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-84524556ed2mr3304696b3a.28.1781694496918;
        Wed, 17 Jun 2026 04:08:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:08:16 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:37:54 +0530
Subject: [PATCH v2 3/4] clk: qcom: Add EVA clock controller driver for
 Glymur SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260617-evacc_glymur-v2-3-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX9y9RCSuLng/c
 kvK+7UoX1NIjWDhXj9loVGpOrdPg6cbrox+cQJwfOxSx+AtormHafVFqwOyLqy4Y8d7ASLUN1oO
 Qg4/7qpENNcrmPQr6F7SbagGOGTIz00=
X-Proofpoint-ORIG-GUID: bgjUbUoMKzZbm4KpLnpaKe42cLpCj4uB
X-Proofpoint-GUID: bgjUbUoMKzZbm4KpLnpaKe42cLpCj4uB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX9kbhUorfdkyP
 gW+4w12YgSSWozgjGiDt+zXsWPI1SQP3nhzYyuLIdUfQTOPSPSo3f6b5sjesiICBLX5b/6TldSh
 YW5m7Wukv2Sc78T2nWuKI5/6JLlw2RmuhpLWBTt467ZFgzl12ecJSLL0fcSqRZicla5ZtUO+M52
 wgb7mfHs1zCSrA+qx8C5H3QwRjRO7xy8GmPV+5/RPQQfqHj+Mg1QC5eDIiCQa9qlUZDGuyPhR45
 z/6eFEVjBfKFI7yWNQSmtUE++mQ7+m0FZ/WLzDaui+zS2Rhr71NTWOlRFhcsLAzf5mn2fnPSawE
 fRCH68o7Sz8iFrd+TKn+hQS4BAEcXkun0yyDy472QHoT26rPitNXwRox7xjwQiZYMD2Vnh8kHBU
 1sUkdwLOoS25PHMVgRqvHsVc1qeDsGrddftuNlqfdPFPu41iNvQXmo2ILdcm1GH0sYqD/vryg3O
 uV88kZArFBfQ0XWmGmg==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a328022 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mU7vPRoAUwN6OPuHNRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170105

Add the Enhanced Video Analytics (EVA) clock controller driver for
the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
and resets for the EVA subsystem which handles vision processing
workloads.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  11 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/evacc-glymur.c | 455 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 467 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d8cc373b8ab14683370cb9b7f8bf3..94378d435162799aa866689377e4a9f1e96ab138 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -55,6 +55,17 @@ config CLK_GLYMUR_DISPCC
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config CLK_GLYMUR_EVACC
+	tristate "Glymur EVA Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	select CLK_GLYMUR_GCC
+	help
+	  Support for the Enhanced Video Analytics (EVA) clock controller on
+	  Qualcomm Technologies, Inc. Glymur devices.
+	  Say Y if you want to support EVA devices and functionality such as
+	  vision processing.
+
 config CLK_GLYMUR_GCC
 	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index e100cfd6a52de9f88f11720d9c2043db5e553618..74761f2c767d9ce5988fedf539d80dc1393b4617 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
+obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
diff --git a/drivers/clk/qcom/evacc-glymur.c b/drivers/clk/qcom/evacc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..ba124cfc1a4def4c20962de03dbd8750b2d3f393
--- /dev/null
+++ b/drivers/clk/qcom/evacc-glymur.c
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-evacc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_AHB_CLK,
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_EVA_CC_PLL0_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 840.0 MHz Configuration */
+static const struct alpha_pll_config eva_cc_pll0_config = {
+	.l = 0x2b,
+	.alpha = 0xc000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll eva_cc_pll0 = {
+	.offset = 0x0,
+	.config = &eva_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map eva_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map eva_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_EVA_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &eva_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map eva_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_2[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_eva_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_0,
+	.freq_tbl = ftbl_eva_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_ahb_clk_src",
+			.parent_data = eva_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_eva_cc_mvs0_clk_src[] = {
+	F(840000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1050000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1500000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_1,
+	.freq_tbl = ftbl_eva_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_clk_src",
+			.parent_data = eva_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_eva_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x80e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_2,
+	.freq_tbl = ftbl_eva_cc_sleep_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_sleep_clk_src",
+			.parent_data = eva_cc_parent_data_2,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_2),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 eva_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_0,
+	.freq_tbl = ftbl_eva_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_xo_clk_src",
+			.parent_data = eva_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div eva_cc_mvs0_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "eva_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&eva_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div eva_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "eva_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&eva_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x807c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_freerun_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_shift_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x80dc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80dc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc eva_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "eva_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc eva_cc_mvs0_gdsc = {
+	.gdscr = 0x8068,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "eva_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &eva_cc_mvs0c_gdsc.pd,
+};
+
+static struct clk_regmap *eva_cc_glymur_clocks[] = {
+	[EVA_CC_AHB_CLK_SRC] = &eva_cc_ahb_clk_src.clkr,
+	[EVA_CC_MVS0_CLK] = &eva_cc_mvs0_clk.clkr,
+	[EVA_CC_MVS0_CLK_SRC] = &eva_cc_mvs0_clk_src.clkr,
+	[EVA_CC_MVS0_DIV_CLK_SRC] = &eva_cc_mvs0_div_clk_src.clkr,
+	[EVA_CC_MVS0_FREERUN_CLK] = &eva_cc_mvs0_freerun_clk.clkr,
+	[EVA_CC_MVS0_SHIFT_CLK] = &eva_cc_mvs0_shift_clk.clkr,
+	[EVA_CC_MVS0C_CLK] = &eva_cc_mvs0c_clk.clkr,
+	[EVA_CC_MVS0C_DIV2_DIV_CLK_SRC] = &eva_cc_mvs0c_div2_div_clk_src.clkr,
+	[EVA_CC_MVS0C_FREERUN_CLK] = &eva_cc_mvs0c_freerun_clk.clkr,
+	[EVA_CC_MVS0C_SHIFT_CLK] = &eva_cc_mvs0c_shift_clk.clkr,
+	[EVA_CC_PLL0] = &eva_cc_pll0.clkr,
+	[EVA_CC_SLEEP_CLK_SRC] = &eva_cc_sleep_clk_src.clkr,
+	[EVA_CC_XO_CLK_SRC] = &eva_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *eva_cc_glymur_gdscs[] = {
+	[EVA_CC_MVS0_GDSC] = &eva_cc_mvs0_gdsc,
+	[EVA_CC_MVS0C_GDSC] = &eva_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map eva_cc_glymur_resets[] = {
+	[EVA_CC_INTERFACE_BCR] = { 0x80a0 },
+	[EVA_CC_MVS0_BCR] = { 0x8064 },
+	[EVA_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[EVA_CC_MVS0C_BCR] = { 0x8030 },
+	[EVA_CC_MVS0C_FREERUN_CLK_ARES] = { 0x805c, 2 },
+};
+
+static struct clk_alpha_pll *eva_cc_glymur_plls[] = {
+	&eva_cc_pll0,
+};
+
+static const u32 eva_cc_glymur_critical_cbcrs[] = {
+	0x80a4, /* EVA_CC_AHB_CLK */
+	0x80f8, /* EVA_CC_SLEEP_CLK */
+	0x80d4, /* EVA_CC_XO_CLK */
+};
+
+static const struct regmap_config eva_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Update CTRL_IN register as per HW recommendation to ensure clocks
+	 * stay cycle‑aligned when the EVA core is ON.
+	 */
+	regmap_set_bits(regmap, 0x9f24, BIT(0));
+}
+
+static const struct qcom_cc_driver_data eva_cc_glymur_driver_data = {
+	.alpha_plls = eva_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(eva_cc_glymur_plls),
+	.clk_cbcrs = eva_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(eva_cc_glymur_critical_cbcrs),
+	.clk_regs_configure = clk_glymur_regs_configure,
+};
+
+static const struct qcom_cc_desc eva_cc_glymur_desc = {
+	.config = &eva_cc_glymur_regmap_config,
+	.clks = eva_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(eva_cc_glymur_clocks),
+	.resets = eva_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(eva_cc_glymur_resets),
+	.gdscs = eva_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(eva_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &eva_cc_glymur_driver_data,
+};
+
+static const struct of_device_id eva_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-evacc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, eva_cc_glymur_match_table);
+
+static int eva_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &eva_cc_glymur_desc);
+}
+
+static struct platform_driver eva_cc_glymur_driver = {
+	.probe = eva_cc_glymur_probe,
+	.driver = {
+		.name = "evacc-glymur",
+		.of_match_table = eva_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(eva_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI EVACC Glymur Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

