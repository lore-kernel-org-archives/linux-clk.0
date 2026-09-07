Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355B5443A90
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769601; cv=none; b=AhTOrQBW18/kxmNlWWocEA24Xh8wrTsznL0wmOQJVbALdgSczOsVwvPLQFR/OoVlqzQHCk7JipxUQ/b3iFw61E1is5hV8HsShffztNY33/SpQWfRPP+N92M7ukYwYkVSCybl+hfp9/s97CE4LiZB+zxAg3rqLLdTO27Imi5g8Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769601; c=relaxed/simple;
	bh=XMzbOB+VVw26jSJuJBLbKbkqqh/6sc7xRAjtkWWAOOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sU/B6VSZiK2vG2nZDQ2+ZdKJ7c8YvQ31jZebnftS9JYSN+iHSlulFQi36PMRjTX6OwRdJucnGhos95LpZxhJlxcu1uhDSF9vng2D8QUgX0cYUPYio/IpzJb1NjWt6Lj/7gvySP8LCYF+Uspo5QLb32gvVi48K30sAcTANNmV0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+mnQaFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuZGs8cQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+mnQaFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuZGs8cQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68787VQR3411560
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 08:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeKGUrKryaVKAjRHDG/2fHvAJChNwKtpps01JNX9rDM=; b=K+mnQaFAUs/aYEk6
	jGiG4HxzASjRBcQipZQOGPN3Py3/hxym45v8PwwJttttwWurVXEA7NURmm+TPXsz
	bun20XnOf6rWH3ylrpCxf4w/4twGC3+81uVaVcRxYqHNNRe76L8UUjM4RkRX+tlS
	xtRtZjV1tHYeHl1wxGBq/c14uGQ+u4l+OApEHuOlx69hYsUgT9j1dh+dUAk/ZjOF
	tsnOc5jtFxFu3qQPhyozzmIaCL4jjPsNMEFXmBY+6P4GAUNS1PIRjIBm+o6Yxoi2
	Iynj05Omd1FBUAB0yGPBTNzoXNQtdKqdJGtVxTyFvleOVwiGZWcy+tsLLAVgKTeH
	IXt27w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyg2cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 08:26:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so1280494a12.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769596; x=1789374396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeKGUrKryaVKAjRHDG/2fHvAJChNwKtpps01JNX9rDM=;
        b=UuZGs8cQYhlZP1aHUZXwWVVlD5QppYpfjHHLb8vjcPOA3ZRluVC7zLdW8zB9BzugtD
         /VVs2sQXr8uIWgzv3u68d2Sa4ocgAFuuq6mmwBckdOI83sC0Eh1x28isr2HBHQhzJLNS
         gb+1gAJgyEYKTOj1L6pNqql4QNxtjKzvWmT/I5y8Cwl0FtMtnR+EbNyxN9UFzczzMA+R
         8cudjePywlCcYFjf2a0S3dziZevD2+gm5dtNhrYLW6hKLCvkxphw9/I3u8BFbfShiCpu
         pM4uBIF1OforxVTH6ZUkVyHzdFdXCgRHnUkSIxHJp8xa/oJ537irvhhHkrQ+6q+IicDm
         VN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769596; x=1789374396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeKGUrKryaVKAjRHDG/2fHvAJChNwKtpps01JNX9rDM=;
        b=fSfuUeWLdoFHtsdBY0fB5hAYeuY+E4tw1EVsGUhZgBNBpNqq24691d7lq6iUzAYXZs
         ZX6w3SHbiFbrFiK33Q8fKVPY+Hh57RLUqzuGIi2hvpQdq19OpG+3jHmcd5fly0OUZ4J0
         KdydZlgV0U1AyOKrGVtMFhiV7EV2mBsdmiRPQTn+//i9qnOlW99zBJRd9Gest37BtAtt
         1yON0D0B+WI/9s/Jq5fQ2bgmo8MNo8ihroP2YlsD03xflNhW82oteasGIRwF4NdRbGNT
         eUiC4ia91DYPSt7Vy5Yaq4FbvdkcsnZS3Pr4kGnCcjvZK9FJX7itr13vzu8ODSp1L8V7
         10Cw==
X-Forwarded-Encrypted: i=1; AKwUvBx7OEIB+Nra8wXc3pZUJwGRd+mWFNFyQ16rRCd6EUksihKeOZgg6+5iglbmpdNVoUoz/nLX96aoTUw=@vger.kernel.org
X-Gm-Message-State: AFuF++k75d5uzhS5fWbRPY6EuqRGApo7ydJ5yiiKZqNfdMOoE5EUSCOr
	EPtJNw3AV7BodPNwA9olKsUefYl+nlEa5ApTlazZARFQHvXpgyxEY7f9JfmOIgOcLO9Mz26fz7v
	bCEnUR5bj+D6Mr2M9XwuBlB+d0ExgXJSchkBhqwPATVOG9DFbWkkP/KUSLHk/JoE=
X-Gm-Gg: AYBFou3hZBY0cRnbkChi+7YkliY8yBlGo80fGc3XmoA4WUoTpe3eZ/L2UiauUzxZDIY
	jpb7ymKIOTr0EVsjM1+pBXdiuJrsKlpyOjGRfWZWHBf4Y2vUAJgq6K8Hhpf+AurAbJSNVYPaJAr
	iNGOTZHzpCy5/szMJoJ+BXt5jmwTBoqhugkip7Udvpury/tATKJ820r0xIHAop6WkpwLtS06eY7
	pLZ+7toYkZXyua6+0MRRo73mIPsHXGk/bl83qaDqctxnyhAp1uiU4c/PPW0yeWRsmBdn3KThd+T
	eZi/pU20DH9D5FOc0INKNRAm+vyErvjanjbQlYg6IuFWWfTZX+UrEyJxX4OUFxtURvxLr43MVDp
	ojrLU1Eyo9iaGQMsOhpnSvET8
X-Received: by 2002:a05:6a20:9f92:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3da3980a0f4mr33791119637.0.1788769595587;
        Mon, 07 Sep 2026 01:26:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f92:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3da3980a0f4mr33791042637.0.1788769594950;
        Mon, 07 Sep 2026 01:26:34 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:34 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:56:15 +0530
Subject: [PATCH 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
In-Reply-To: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 6b1orQvzjLxe_0O-P74_f62uGfC4Rh91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MSBTYWx0ZWRfX/xmoduB7DqTr
 D1H5P6mhJYvvgHLSzX6Ci3ngsVoOpzF6X17RRTzB/0Q0kwB4UYUtWXCldhaPuIOGew2D1t+Vabj
 ksbX8Zr/hpCSrDf6GEkTHOUcKO6RW1tPbqxI/BJ9EojZoMlFYkowpjJO23qYVFXaP/+gOHTzT6Z
 xXuXUzQa60q2FINPcL9/P12ylu53TwxIm2UuiOJzaWh35adb7jWau9NntPGVX5Cy1o3EEcvy1at
 XoTPFvArLTBuL1HzgaJyiwsE/4t5bLYCFR4Xmpk3ltM6MGPIk7ifBLY+4ZX4/HWU9c5xoVxJObW
 0j2AlCBUjuj3n+PQDminQvuGVSihh95s7FjVHQfUcAMuscccNc2YbkZYx2ko+kipKCs76hB3QDy
 jgHJDatXYl1CVukoN9NF/V+Q+GPerJyUKQ1rhdwHmUaK3Aavu/o0PSazvFGUVt0nQ77PWzMvSIq
 I4HI2SR33MDY82GF1sA==
X-Proofpoint-GUID: 6b1orQvzjLxe_0O-P74_f62uGfC4Rh91
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MSBTYWx0ZWRfX9gyU11pErzct
 kf9Yz+Cg/omNU5l6GZRH4rXlTHHsClTsBEr50EVf60ku/JQ8C3etw0aRD8TQsJ56QeSyB5Q4lv+
 S9LkpgVz18J8/t1xNNhsOsLpQK+cFHQ=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e753d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0-BBk2c4bgoaTx3pdGQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070091

Add support for the DisplayPort Receiver (DPRX) clock controllers on
Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with core PLLs.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  11 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/dprxcc0-nord.c | 436 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c | 436 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 884 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6ef083f5d9e251d2d2c5592a3f3dd51845dc743b..07685cd1f65e20a4110fe301501bcad5060c7665 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -244,6 +244,17 @@ config CLK_NORD_DISPCC
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config CLK_NORD_DPRXCC
+	tristate "Nord DPRX Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the Display Port Receiver (DPRX) clock controller on
+	  Nord devices. The DPRX clock controller provides clocks for the
+	  DPRX core, audio, AHB and video memory paths.
+	  Say Y if you want to support DPRX functionality.
+
 config CLK_NORD_CAMCC
 	tristate "Nord Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index a6c676f68b79e4dc5928dc4cd7101c35e2e84787..69ce7c2c2e4dfe0924da8ae4979f2cae900ccc84 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_CLK_KUNO_GCC) += gcc-kuno.o
 obj-$(CONFIG_CLK_MAILI_VIDEOCC) += videocc-maili.o
 obj-$(CONFIG_CLK_NORD_CAMCC) += camcc-nord.o
 obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
+obj-$(CONFIG_CLK_NORD_DPRXCC) += dprxcc0-nord.o dprxcc1-nord.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
diff --git a/drivers/clk/qcom/dprxcc0-nord.c b/drivers/clk/qcom/dprxcc0-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..85cfa8f3be26b16fb8e49c1745b69574b26e66aa
--- /dev/null
+++ b/drivers/clk/qcom/dprxcc0-nord.c
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+#include <dt-bindings/clock/qcom,nord-dprxcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_ODD,
+	P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN,
+	P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 550.0 MHz Configuration */
+static const struct alpha_pll_config dprx_0_dprx_cc_pll0_config = {
+	.l = 0x1c,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll dprx_0_dprx_cc_pll0 = {
+	.offset = 0x0,
+	.config = &dprx_0_dprx_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1080.0 MHz Configuration */
+static const struct alpha_pll_config dprx_0_dprx_cc_pll1_config = {
+	.l = 0x38,
+	.alpha = 0x4000000,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x02000080,
+};
+
+static struct clk_alpha_pll dprx_0_dprx_cc_pll1 = {
+	.offset = 0x1000,
+	.alpha_width = 28,
+	.config = &dprx_0_dprx_cc_pll1_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map dprx_cc_0_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN, 1 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_ODD, 2 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 4 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data dprx_cc_0_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map dprx_cc_0_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN, 3 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data dprx_cc_0_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_audio_clk_src[] = {
+	F(216000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(360000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_audio_clk_src = {
+	.cmd_rcgr = 0x80c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_1,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_audio_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_audio_clk_src",
+		.parent_data = dprx_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg0_clk_src[] = {
+	F(220000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg0_clk_src = {
+	.cmd_rcgr = 0x8004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg0_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg2_clk_src[] = {
+	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg2_clk_src = {
+	.cmd_rcgr = 0x8068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg2_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg3_clk_src[] = {
+	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg3_clk_src = {
+	.cmd_rcgr = 0x8098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg3_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_0_dprx_cc_core_ahb_div_clk_src = {
+	.reg = 0x80b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_0_dprx_cc_core_rcg3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_0_dprx_cc_core_aud_div_clk_src = {
+	.reg = 0x80d0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_aud_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_0_dprx_cc_audio_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_ahb_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_aud_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_aud_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_aud_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_mdp_mem_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8088,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_mdp_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_rcg2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_mmcx_xo_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_mmcx_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_vid_mem_clk = {
+	.halt_reg = 0x8028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_vid_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_rcg0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *dprx_cc_0_nord_clocks[] = {
+	[DPRX_CC_AHB_CLK] = &dprx_0_dprx_cc_ahb_clk.clkr,
+	[DPRX_CC_AUD_CLK] = &dprx_0_dprx_cc_aud_clk.clkr,
+	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_0_dprx_cc_audio_clk_src.clkr,
+	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_ahb_div_clk_src.clkr,
+	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_aud_div_clk_src.clkr,
+	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_0_dprx_cc_core_rcg0_clk_src.clkr,
+	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_0_dprx_cc_core_rcg2_clk_src.clkr,
+	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_0_dprx_cc_core_rcg3_clk_src.clkr,
+	[DPRX_CC_MDP_MEM_CLK] = &dprx_0_dprx_cc_mdp_mem_clk.clkr,
+	[DPRX_CC_MMCX_XO_CLK] = &dprx_0_dprx_cc_mmcx_xo_clk.clkr,
+	[DPRX_CC_PLL0] = &dprx_0_dprx_cc_pll0.clkr,
+	[DPRX_CC_PLL1] = &dprx_0_dprx_cc_pll1.clkr,
+	[DPRX_CC_VID_MEM_CLK] = &dprx_0_dprx_cc_vid_mem_clk.clkr,
+};
+
+static const struct qcom_reset_map dprx_cc_0_nord_resets[] = {
+	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
+};
+
+static struct clk_alpha_pll *dprx_cc_0_nord_plls[] = {
+	&dprx_0_dprx_cc_pll0,
+	&dprx_0_dprx_cc_pll1,
+};
+
+static const struct regmap_config dprx_cc_0_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8104,
+	.fast_io = true,
+};
+
+static void dprx_cc_0_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
+	 */
+	regmap_write(regmap, dprx_0_dprx_cc_core_aud_div_clk_src.reg, 0x13);
+	regmap_write(regmap, dprx_0_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
+}
+
+static const struct qcom_cc_driver_data dprx_cc_0_nord_driver_data = {
+	.alpha_plls = dprx_cc_0_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(dprx_cc_0_nord_plls),
+	.clk_regs_configure = dprx_cc_0_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc dprx_cc_0_nord_desc = {
+	.config = &dprx_cc_0_nord_regmap_config,
+	.clks = dprx_cc_0_nord_clocks,
+	.num_clks = ARRAY_SIZE(dprx_cc_0_nord_clocks),
+	.resets = dprx_cc_0_nord_resets,
+	.num_resets = ARRAY_SIZE(dprx_cc_0_nord_resets),
+	.driver_data = &dprx_cc_0_nord_driver_data,
+};
+
+static const struct of_device_id dprx_cc_0_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dprxcc0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dprx_cc_0_nord_match_table);
+
+static int dprx_cc_0_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &dprx_cc_0_nord_desc);
+}
+
+static struct platform_driver dprx_cc_0_nord_driver = {
+	.probe = dprx_cc_0_nord_probe,
+	.driver = {
+		.name = "dprxcc0-nord",
+		.of_match_table = dprx_cc_0_nord_match_table,
+	},
+};
+
+module_platform_driver(dprx_cc_0_nord_driver);
+
+MODULE_DESCRIPTION("QTI DPRXCC0 NORD Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dprxcc1-nord.c b/drivers/clk/qcom/dprxcc1-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..573d66bb97c90dfc16d5d6ae2c4bbcfaff3aace9
--- /dev/null
+++ b/drivers/clk/qcom/dprxcc1-nord.c
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+#include <dt-bindings/clock/qcom,nord-dprxcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_ODD,
+	P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN,
+	P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 550.0 MHz Configuration */
+static const struct alpha_pll_config dprx_1_dprx_cc_pll0_config = {
+	.l = 0x1c,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll dprx_1_dprx_cc_pll0 = {
+	.offset = 0x0,
+	.config = &dprx_1_dprx_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1080.0 MHz Configuration */
+static const struct alpha_pll_config dprx_1_dprx_cc_pll1_config = {
+	.l = 0x38,
+	.alpha = 0x4000000,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x02000080,
+};
+
+static struct clk_alpha_pll dprx_1_dprx_cc_pll1 = {
+	.offset = 0x1000,
+	.alpha_width = 28,
+	.config = &dprx_1_dprx_cc_pll1_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map dprx_cc_1_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN, 1 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_ODD, 2 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 4 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data dprx_cc_1_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map dprx_cc_1_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN, 3 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data dprx_cc_1_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_audio_clk_src[] = {
+	F(216000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(360000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_audio_clk_src = {
+	.cmd_rcgr = 0x80c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_1,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_audio_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_audio_clk_src",
+		.parent_data = dprx_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg0_clk_src[] = {
+	F(220000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg0_clk_src = {
+	.cmd_rcgr = 0x8004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg0_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg2_clk_src[] = {
+	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg2_clk_src = {
+	.cmd_rcgr = 0x8068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg2_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg3_clk_src[] = {
+	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg3_clk_src = {
+	.cmd_rcgr = 0x8098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg3_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_1_dprx_cc_core_ahb_div_clk_src = {
+	.reg = 0x80b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_1_dprx_cc_core_rcg3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_1_dprx_cc_core_aud_div_clk_src = {
+	.reg = 0x80d0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_aud_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_1_dprx_cc_audio_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_ahb_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_aud_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_aud_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_aud_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_mdp_mem_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8088,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_mdp_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_rcg2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_mmcx_xo_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_mmcx_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_vid_mem_clk = {
+	.halt_reg = 0x8028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_vid_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_rcg0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *dprx_cc_1_nord_clocks[] = {
+	[DPRX_CC_AHB_CLK] = &dprx_1_dprx_cc_ahb_clk.clkr,
+	[DPRX_CC_AUD_CLK] = &dprx_1_dprx_cc_aud_clk.clkr,
+	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_1_dprx_cc_audio_clk_src.clkr,
+	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_ahb_div_clk_src.clkr,
+	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_aud_div_clk_src.clkr,
+	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_1_dprx_cc_core_rcg0_clk_src.clkr,
+	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_1_dprx_cc_core_rcg2_clk_src.clkr,
+	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_1_dprx_cc_core_rcg3_clk_src.clkr,
+	[DPRX_CC_MDP_MEM_CLK] = &dprx_1_dprx_cc_mdp_mem_clk.clkr,
+	[DPRX_CC_MMCX_XO_CLK] = &dprx_1_dprx_cc_mmcx_xo_clk.clkr,
+	[DPRX_CC_PLL0] = &dprx_1_dprx_cc_pll0.clkr,
+	[DPRX_CC_PLL1] = &dprx_1_dprx_cc_pll1.clkr,
+	[DPRX_CC_VID_MEM_CLK] = &dprx_1_dprx_cc_vid_mem_clk.clkr,
+};
+
+static const struct qcom_reset_map dprx_cc_1_nord_resets[] = {
+	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
+};
+
+static struct clk_alpha_pll *dprx_cc_1_nord_plls[] = {
+	&dprx_1_dprx_cc_pll0,
+	&dprx_1_dprx_cc_pll1,
+};
+
+static const struct regmap_config dprx_cc_1_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8104,
+	.fast_io = true,
+};
+
+static void dprx_cc_1_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
+	 */
+	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
+	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
+}
+
+static const struct qcom_cc_driver_data dprx_cc_1_nord_driver_data = {
+	.alpha_plls = dprx_cc_1_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(dprx_cc_1_nord_plls),
+	.clk_regs_configure = dprx_cc_1_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc dprx_cc_1_nord_desc = {
+	.config = &dprx_cc_1_nord_regmap_config,
+	.clks = dprx_cc_1_nord_clocks,
+	.num_clks = ARRAY_SIZE(dprx_cc_1_nord_clocks),
+	.resets = dprx_cc_1_nord_resets,
+	.num_resets = ARRAY_SIZE(dprx_cc_1_nord_resets),
+	.driver_data = &dprx_cc_1_nord_driver_data,
+};
+
+static const struct of_device_id dprx_cc_1_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dprxcc1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dprx_cc_1_nord_match_table);
+
+static int dprx_cc_1_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &dprx_cc_1_nord_desc);
+}
+
+static struct platform_driver dprx_cc_1_nord_driver = {
+	.probe = dprx_cc_1_nord_probe,
+	.driver = {
+		.name = "dprxcc1-nord",
+		.of_match_table = dprx_cc_1_nord_match_table,
+	},
+};
+
+module_platform_driver(dprx_cc_1_nord_driver);
+
+MODULE_DESCRIPTION("QTI DPRXCC1 NORD Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

