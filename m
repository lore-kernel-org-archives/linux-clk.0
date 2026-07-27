Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBF93C0A1A
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131416; cv=none; b=WFhu+jxPUPjpLQekdIfn3obxIEM5xJyzyn6gtdgop2kUeRb2I1W8vsqYY0PJgCphNYNMrn+N9hkZusauwrcLRhZXgB7xb9xC05ATqviyZIdKD3U1x43JOt3he8NiYnIjBUfibGom9teBf1jp3uYO3pFdXmfmSe7vLbzoHDojkso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131416; c=relaxed/simple;
	bh=eJPN8pnO0n4D4n2LxQgn7cW6ziQhs1rzcoUCzMMS+/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZhnkYPrJF9LFi9H/K+GuURZGyuG4gO2+HHAwiXLnLaTUsmTHYroJHfbHZxObdWuppMnqmbAY5U1tsujmdzYmPsvOdq0fwHtSaMcTc3GH3Do8LfZ+eCYvjOXPb736N48Lasx7IRk+sqvZ08p980K6Fn+P8t3wRctT5n9yh9kcF5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l19WuZIh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyuhHwzj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l19WuZIh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyuhHwzj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1gCb72467424
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l0aHeaM5YZM7ziVLEww0tu6e+Qavi1hPVmw02Gj3bv8=; b=l19WuZIhhxpE7LlO
	Xm1C8ZrQmJEx+SCd4qeChB1OuL5M+PYHHf38x/ffwhGzxvkqSPoMssTEAkmzDH9v
	hjrBzfk2b69xGdyNa8QuWr9Q8WUsiDEM/sPxRSz+FuG7LV7PMV2Ks0ZPwu/QB+XS
	SoSdJwHczbSoI9ZSqrKdA9Jr3CU4zG8Ad1AsFW0Tb1HCMhNnB+CiwHzHaLLD5+FQ
	n8GEeHU/r6grr4IIlm4UXkq1+cwIpgeihaZJNA/RXOgh/YaUckgJ7lzEBT+S0VH4
	IPDewBCNzExipOtWqLU+c4bcRKFyoARNzsUtCJHr0zbzjCUQJtlq6gL92bYDimSB
	skRkRw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm574vb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:50:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84865f326efso2375484b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 26 Jul 2026 22:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785131413; x=1785736213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0aHeaM5YZM7ziVLEww0tu6e+Qavi1hPVmw02Gj3bv8=;
        b=hyuhHwzjJhDEwo5Vz5MjzSxigEO3g4t9zPQ8nVd6VOPg0hO2MsbVxwQQGmRcNw2PI+
         c1znv3jt6hCn+Nmj7PEfSzcULW1k08GShTlTGAsTfamD3Yr5MAMHb53FbCiFxLcmpOyx
         jTzyriaKID7VmJ2KHWpeT9gUdd+gnwejAQYQWiM33wmbXV7TEJqYPvGDSWpeWJ31njJ5
         swVXjZPsFIBChNyIB1dfeFRt58xFo3WasqyHsxnPTMyJU672jLaHNRmfkO0lOjaqw8oj
         HR5AcFCFma4ECor5fuz8g5rd6QQIheZS37DNN8sM8LL9+nCxMvgLa6DyhTeFVgkr+3Gz
         DE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131413; x=1785736213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0aHeaM5YZM7ziVLEww0tu6e+Qavi1hPVmw02Gj3bv8=;
        b=OXIprZmas8POZEhgZMsv/Wi0XoXjzxiDOHTVdVv5tK0MQ8tytXZWXbo2xAfsHugs9S
         lpJCVZ4YqAVu5hPYhY3aFfKTtshmmsHVV7CeXZFVMNbIxSgmW4hPnN5fGFfQ1gxxt0RX
         WIlTXrjG4i4X6lL/mMac7U9QcGsyUJp4V8oe0MKAnUJqZg05NtOdLIc9Kt/Bquo+wsid
         JvOx37pZmjR0yfN2QyXTuF3sD0MP/utxwHD+mrqhOKikJsHq7pH4w17cpPyBrRe6JTiw
         ZGoeDjMxSCHCWiCqDkvl2xivpSqh1pmx1V+f/lS5lJyKjDPeSa8SZMfRxWtJhWigR5jv
         iADQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBUlRqtRwg6lLqIKZfnMGu7Z8lm+t+hTw4BBCJhV9urCY/nyWzzvNr52dndJYpjf3pYyE5SBtl4oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnWiZK+CEls6orZTVoTg3sIlGzScD3mlSPaxomhyJ94SVO1DXk
	EtsF19LVo6WagYZ/hr1fm7q6cRbC+Ge1QSW0x+2TJHpuhjUblIdz0eWOpbg9DBPGGW0WOJ9DtCX
	KaDTukDijnaQcemDlGGWBJMxIK8c8Rg3oiu5dcn2I55+4ptUVIkxw+ZAlp4CL0Zc=
X-Gm-Gg: AR+sD10fNRa12jJRQc2zXfoSZpjzbq6s4oSARB9Ot0nJY8b4salkBjEHRct1udurWSK
	txdEWdyxi8Ud6sGkjEQf780+WhhIyH6fsH1zAQDv8HwNMVeBLZusPm3VH5uN9W9wGSLgCCgg5bo
	TF9DNAZ0LrRkopq21hYsifkbuQNS2onxk2jjbAW7ESwiOdf1+3tDyAw8/6kmgbyW5OmkBrFff2O
	sRrmlagaVf8z5fxq13SRCngv7a7zPtY7Iv6wj1aW/J/5zPqQcnIoE+ad6F4vVzBeyW334o8Kq3+
	2TQfnRS5N+TB67KUbKvSzacxrf6tM9MtVrNFgY7tBKheXbbsA/bBMjCVAVR+kgoXVWHVMyVF9ud
	OF5SIg3a0RwIHQ80t16AxPDXOGy5ep+sTL4iS0bhyVd0q5KVEoA==
X-Received: by 2002:a05:6a21:398:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c67dfc4420mr6992875637.67.1785131412567;
        Sun, 26 Jul 2026 22:50:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:398:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c67dfc4420mr6992845637.67.1785131412090;
        Sun, 26 Jul 2026 22:50:12 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm27934761eec.16.2026.07.26.22.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:50:11 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 22:49:54 -0700
Subject: [PATCH 2/2] clk: qcom: Add support for Hawi GPUCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-gpucc-hawi-v1-2-224e7884cf9a@oss.qualcomm.com>
References: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
In-Reply-To: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
To: sboyd@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, mturquette@baylibre.com
Cc: mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        taniya.das@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785131393; l=14853;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=eJPN8pnO0n4D4n2LxQgn7cW6ziQhs1rzcoUCzMMS+/s=;
 b=XPd1Z3TBwZP195UwDusGA/DxwQ19rKTw3CdOIPhqud+aNCrusT39SJZs8tTtxQjDXNRg9Zhqe
 xO8E9r+qtgXDnaw6RaVElYHdQ9Of9ffdRq/16QOhcFG6Q5CUrGPIAHX
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfX+XTXvzVs9Jzp
 jp3Bza1NYaj5iB2wEKaoosrseedmaq4GbJgj+bLOReY1vrU9JjNnPcjeM3gdJHor/1VGb3R0PuA
 sgRqxgOnTx1gIYb7ZRmXAipF5sXCOhU=
X-Proofpoint-GUID: 8XhXJzb4gkVFrFGHTGAR-OZ_U0HOr27W
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66f195 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FzpPky3w8eEy4Oq9N2YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8XhXJzb4gkVFrFGHTGAR-OZ_U0HOr27W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfX5dfkSgSEnfOI
 QSLo4ukprMdkwWfj7P2o5DHA6tFnKTzLXo0ELAMQsSdBbOh6RN8Z9aFyROIZIxdUZE5hfDcyLcZ
 PqfvTngEPgeaV0RBcm08CiUZEkzKuXT5QfuIE2eh56uTrhPZnkb4qwYBMDLNbS4K/IeBmGC6O22
 8O9lWCmmJbVF/wzl7NJhN7BCUsiU7HyToAyBNVWyKnmJTqyo+VyjwYsLRjZ4Lq79NZSOxB33zEM
 rCsaYboQG9OMrGbxtsBJcBfWH0doNXnKAD6A+r1y5Dg+M+Khfv4np9n55Gd3gK8ThBGxYp5B5r+
 Hvp0RH94D5t7A7gjrTPQZtDdlIBcGVtllCsg6oGBUuwwBQm174F1dJJVbUFQC9mvESN5JFsVwy8
 7EJAeYXK6GArCas+EmzRRGg+S6cPfN1ssa+PPHjfNB47c+d1pioWvX7+Bdaqh7J8koARVkmrKcu
 UKoYVQrn26g+5LG0KTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270055

Add the graphics clock controller driver for Hawi. This provides the
clocks, resets and power domains required by the GPU driver to enable the
graphics subsystem.

Reuse the existing gxclkctl-kaanapali driver for GX clock controller
support and build it with the Hawi GPUCC driver.

Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig      |  12 ++
 drivers/clk/qcom/Makefile     |   1 +
 drivers/clk/qcom/gpucc-hawi.c | 461 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 474 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911..6f8cfe428d4a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -327,6 +327,18 @@ config CLK_HAWI_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SD/eMMC, PCIe, etc.
 
+config CLK_HAWI_GPUCC
+	tristate "Hawi Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_HAWI_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the graphics clock controller on Hawi devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics. It also provides GX clock
+	  domain control required for GPU power management on Hawi-based
+	  devices.
+
 config CLK_HAWI_TCSRCC
 	tristate "Hawi TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 58f9a5eb6fd7..2c28100867f7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
 obj-$(CONFIG_CLK_HAWI_GCC) += gcc-hawi.o
+obj-$(CONFIG_CLK_HAWI_GPUCC) += gpucc-hawi.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_HAWI_TCSRCC) += tcsrcc-hawi.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
diff --git a/drivers/clk/qcom/gpucc-hawi.c b/drivers/clk/qcom/gpucc-hawi.c
new file mode 100644
index 000000000000..30b3ffb0638f
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-hawi.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,hawi-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_EVEN,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco taycan_eha_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 788.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x29,
+	.alpha = 0xaaa,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
+	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(788000000, P_GPU_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(825000000, P_GPU_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(880000000, P_GPU_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(917000000, P_GPU_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
+	F(150000000, P_GPLL0_OUT_MAIN_DIV, 2, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x93f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x9430,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x90bc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x90bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x9104,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9104,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x90d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x90d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x90d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_demet_clk = {
+	.halt_reg = 0x9010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_demet_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x9108,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9108,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x900c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_accu_shift_clk = {
+	.halt_reg = 0x9070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x93ec,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x93ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x90e8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x90ec,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x90ec,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x90ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_mxg_ahb_clk = {
+	.halt_reg = 0x9744,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9744,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_mxg_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x9080,
+	.gds_hw_ctrl = 0x9094,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gpu_cc_mxg_gdsc = {
+	.gdscr = 0x961c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_cc_mxg_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_cc_hawi_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_DEMET_CLK] = &gpu_cc_demet_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GPU_SMMU_VOTE_CLK] = &gpu_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_MXG_AHB_CLK] = &gpu_cc_mxg_ahb_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+};
+
+static struct gdsc *gpu_cc_hawi_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+	[GPU_CC_MXG_GDSC] = &gpu_cc_mxg_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_hawi_resets[] = {
+	[GPU_CC_CB_BCR] = { 0x93a0 },
+	[GPU_CC_CX_BCR] = { 0x907c },
+	[GPU_CC_FAST_HUB_BCR] = { 0x93e4 },
+	[GPU_CC_GMU_BCR] = { 0x9314 },
+	[GPU_CC_GX_BCR] = { 0x905c },
+	[GPU_CC_MXG_BCR] = { 0x9618 },
+	[GPU_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_cc_hawi_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static u32 gpu_cc_hawi_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x9704, /* GPU_CC_MXG_XO_CLK */
+	0x90e4, /* GPU_CC_CXO_CLK */
+	0x9008, /* GPU_CC_CXO_AON_CLK */
+	0x93e8, /* GPU_CC_RSCC_HUB_AON_CLK */
+	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
+	0x90cc, /* GPU_CC_SLEEP_CLK */
+};
+
+static const struct regmap_config gpu_cc_hawi_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9744,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data gpu_cc_hawi_driver_data = {
+	.alpha_plls = gpu_cc_hawi_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_hawi_plls),
+	.clk_cbcrs = gpu_cc_hawi_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_hawi_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_hawi_desc = {
+	.config = &gpu_cc_hawi_regmap_config,
+	.clks = gpu_cc_hawi_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_hawi_clocks),
+	.resets = gpu_cc_hawi_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_hawi_resets),
+	.gdscs = gpu_cc_hawi_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_hawi_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_hawi_driver_data,
+};
+
+static const struct of_device_id gpu_cc_hawi_match_table[] = {
+	{ .compatible = "qcom,hawi-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_hawi_match_table);
+
+static int gpu_cc_hawi_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_hawi_desc);
+}
+
+static struct platform_driver gpu_cc_hawi_driver = {
+	.probe = gpu_cc_hawi_probe,
+	.driver = {
+		.name = "gpucc-hawi",
+		.of_match_table = gpu_cc_hawi_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_hawi_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC HAWI Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

