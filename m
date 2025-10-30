Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58AF3570B1
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822606; cv=none; b=hxM7uY/FezU4diOaFcfbTr9phc2y/uMZ6L+EjJa14NjiIlosKagkhnC3XT8UXaD2AmWCinn9kQzmwOev54NPx+7zQlH0F9P5VISVs3ZsATydr3fJts2VHYt43OCl+1iMSzWkzH2qG9ewMBqpNEoDuS/FQK1pTtVa0N+y7BGxexA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822606; c=relaxed/simple;
	bh=IAV1p/i78JaXuL3u/QRB9tBlb7z1goX0q1Bcnr7ue1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hy+D9p2IXn+4jIFPx5sQY9NtnpbHFfu+Kqxq7bPJlDImsHw1EpycjMf0sy4vYJ5pU4s/qSnZO42pcvCrs/8SzOpbcGFaXxuSwv3PT4mtie7yyXf6nOo/tkka0p/Ri5X6E0fk/ZMgdc+Pa870TOV7ObLm75oGFXhAAQM6kw+M/qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn8YXeFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZR/eNgw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn8YXeFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZR/eNgw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U81Omv1578977
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	luiRV3a8OsNa0Az4359IuHjf4gtWlkSrwaMSKrEcF8I=; b=Wn8YXeFweTe2QgL6
	xd66gOLIZBPvZW/LrX5YmnvRt2KrLJl+VjlUffJ6S7jp/GT4+mUpbLgaRkxTuqRz
	YZLaI2fN+eJE9aopl8DaLqqIPgXnEbh/OxOCsKtunvvMzvK38YcSvGkk/MSZjSeh
	16N8kl9BVxcX1x/C4ZTdlD/5shQeOE3DLTgpQPiYP5snVxvvIqaj9yHxMGfTuI1i
	bNh//D0xpyrFZ5Rwa8wTkimLVatBBNp57OP9tAk4CioA4BQUluo33pGU0lARjXWY
	51inaJtF2bSs45m/SsbDcqjjUCL6CTuHXvl/UPfDKlbVRPvLOilJpV0nI0hZPsf3
	c8CWEA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjej49m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:10:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-332560b7171so1512458a91.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 04:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822603; x=1762427403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luiRV3a8OsNa0Az4359IuHjf4gtWlkSrwaMSKrEcF8I=;
        b=CZR/eNgwlQa63TlmS0N4AJSmI+kwvcBkNYFMmIdiqJifLZMk9QytEl0ZqIxYCxiOJf
         2l98BmKa95TVQSpW7RcP1du0XxfqEySvBF27OW6z2jkEXiD08olZSW01mnMIO+h3ntPW
         dHoy57mVyjlBGo3Qj39/P/zhAdGXDFEExwiaq+BDDDw5gXak59cLFkFnKV7u5xMyYsvU
         eG9VEKKY/vPJBZawppy7oPng4zmwgXACywWr/U1vwz+CQpYG/TMO+uHDeCnv13/84qG4
         WfG2TPLvoJ2szRqnFVaKPPDRUdjEd5lnF3IxASlTG2iFI/EvS8NllyRTRkrsxI4iSiOM
         embQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822603; x=1762427403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luiRV3a8OsNa0Az4359IuHjf4gtWlkSrwaMSKrEcF8I=;
        b=sMzAKcEz/wDYMSO/Ul173TeTPS4ja6H1IrXimX/pn7u7Ro+CZwVyWevigdFYKP+ykW
         CiZjBZ/AVrsb8A2oMLELN/2Mp47NqLne8FX3X9dqjAgOIG1gBe2M6ARwi9EfogVTmapH
         qrmXcbbe0ZraiN69aH3k42nDmdo79Wa8h5+rwBLxaUqPD/SbMOuAtLpbkmn01i3k9+Lq
         JTUIrYOxm0+SDrysHyduZLertML2PKmXP5utoy1ogU+8GGQFikrGguD08FlBk2bP496v
         orlsI1Mi0LN6YjaPB0Lodak+/XiMK84ktbnwXPFqxDEEjyu+9FR9xUvEwOJgZh1efbE8
         yQsw==
X-Forwarded-Encrypted: i=1; AJvYcCX9EOYduB9cwsX8NLfw7p+VpAqm+8XB2xzdaCL6S20altMbFoEJI6F3S0QNYM/WX18eCvcQ6m2J2XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWaA9Ksa+BrYYICp15bKm4x1h1T1eyuib/ii4ATGlCuOHqfIk
	cslfqDrve2vcTigrxU+Z0cQL8RsUn1vyxqFMiHKnWkn+0LIc+f+5611IYGUy8MVeHU93dZBwiB/
	1ccxP6PgH0X+VVqPbU96x0WXkSGujEbqCOUl45o/BJoknh3/aQLJlPZF08+OaAW0=
X-Gm-Gg: ASbGncsW/ardAPL6UWISkSb4RRNgJOPLX3WutBjYeymm1xG3AChK0ceVUUxBG3dz/j1
	6WKx0nqra1+ib6feImR2alxqhNpe4f2X/+/8o4k8yo4hGbEOVpTUQeDopW5Yi4yNHtxoU1NgJy0
	Ww05m0S1PEs/GxFkIAP0KPjk+HPQq1L5i/6eGMwjUO6fLjk9R3HrmaLJQpAP69M8R6OhfFs4y0o
	uC0BN2U1K7PxpsjP4XZvLUjHfz/r8ER+9jUf+Ubnth50McXDL6kCehAYP9NS/VG4SfX2hmFoCc0
	HL7miUB964+josXHsmHV0WVysRggZHdFPWwcJT9SCMh2Z5aIgGA5J6sWE/J7jl6XtYTCTWumAeb
	jt1MVqiVdE3Ow3Rnxu1dAijc=
X-Received: by 2002:a17:90b:2d47:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3404ac69f33mr3270711a91.13.1761822603195;
        Thu, 30 Oct 2025 04:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbHC1HFelmDHqObOwIowGBB16arZT3vxABxH1mnb+tfbjHa+mNJCBky8fkK7KVVG+4T5c4Vg==
X-Received: by 2002:a17:90b:2d47:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3404ac69f33mr3270665a91.13.1761822602653;
        Thu, 30 Oct 2025 04:10:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509727fesm2262839a91.4.2025.10.30.04.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:10:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 16:39:08 +0530
Subject: [PATCH v2 5/6] clk: qcom: Add TCSR clock driver for Kaanapali
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-gcc_kaanapali-v2-v2-5-a774a587af6f@oss.qualcomm.com>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: UtJEbHVme6F97wsQB23VWq_80HUlV-8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfXx6ayGW6KP/Ec
 zXqRelAAj2XpIPDchRY0DF/g7S2peD54/wTeEQs1K4VL4gzBknjG/L5rv0jjllE6rJpIecT2NAR
 n4xs78S4JYPrSuaFPs5FN02xUk4KUYWdId9FzMSSZtQQ06QsTCtMZI13SCgPcr4JRsgn1AUy/J6
 fPRWYP9174M7gK1F06UNv2nFHWD9UXu59y8eqFjfJpVWNKdo2VsE4txB4y98NWH6hMv0va9nQPc
 hN206ABHsMSunoDo28YiMNIfUPGxQgmTVXh+EmI/yrjAjVzv8kB5w/hZKY8zW4fTNlanLV9ucew
 MhoOppiI9xbD0+LZb5pswhpv/eJG4S7ziQ5mTiL/wsXcdqYPnRj/xGLgICo/3JoJ/fvJ6THen0v
 /99Xeb0yV5lC3eBD3Bb1mzhNMLS4lQ==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=6903478c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dL8Wr0w3JFnQZPpevKkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: UtJEbHVme6F97wsQB23VWq_80HUlV-8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300090

Add the TCSR clock controller that provides the refclks on Kaanapali
platform for PCIe, USB and UFS subsystems.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |   8 ++
 drivers/clk/qcom/Makefile           |   1 +
 drivers/clk/qcom/tcsrcc-kaanapali.c | 141 ++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 4a78099e706c2cee5162d837cad3723db75039d0..8ec1803af76cb87da59ca3ef28127c06f3e26d2b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -46,6 +46,14 @@ config CLK_GLYMUR_TCSRCC
 	  Support for the TCSR clock controller on GLYMUR devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
+config CLK_KAANAPALI_TCSRCC
+	tristate "KAANAPALI TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Kaanapali devices.
+	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 5a0fd1d843c87a6f0a805706fcfad91c3f705340..2350631814779ad086d5c8304b250b0cc2f5203b 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
+obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/tcsrcc-kaanapali.c b/drivers/clk/qcom/tcsrcc-kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..14cfa75e892cc5ee1b03909f8c03d92de8ae2cd6
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-kaanapali.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x18,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x18,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_kaanapali_clocks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x18,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_kaanapali_desc = {
+	.config = &tcsr_cc_kaanapali_regmap_config,
+	.clks = tcsr_cc_kaanapali_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_kaanapali_clocks),
+};
+
+static const struct of_device_id tcsr_cc_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_kaanapali_match_table);
+
+static int tcsr_cc_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_kaanapali_desc);
+}
+
+static struct platform_driver tcsr_cc_kaanapali_driver = {
+	.probe = tcsr_cc_kaanapali_probe,
+	.driver = {
+		.name = "tcsr_cc-kaanapali",
+		.of_match_table = tcsr_cc_kaanapali_match_table,
+	},
+};
+
+static int __init tcsr_cc_kaanapali_init(void)
+{
+	return platform_driver_register(&tcsr_cc_kaanapali_driver);
+}
+subsys_initcall(tcsr_cc_kaanapali_init);
+
+static void __exit tcsr_cc_kaanapali_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_kaanapali_driver);
+}
+module_exit(tcsr_cc_kaanapali_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC KAANAPALI Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

