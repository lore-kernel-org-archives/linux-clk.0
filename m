Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72347432313
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890558; cv=none; b=WYxjeyB3FHSbiIVicXBwUN23+s9ZyvLRZIuZTjd6B4TV0FK7ixLoedE0HSHfB/b96KavluPGaMAxGfduoQ6iQmoeuzKxtBoGBgmNrUY4p4PrKBZQxVOHASPFlK41DKhF8HfpVPpDqY/IJaAq7oiT33z4XCotDXiqmFszsFn0BUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890558; c=relaxed/simple;
	bh=XkrSJOrUMXrqM0jErKidhMLRA3MusR2SXKbu2qcNAV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrVBExQ/Fg8XEo2BELEJ0F1Mn4WEKJYO9eT6UxodWlFnLVmReFJYrfzckKKtQhcoGR2yIGYCFASmkrbkWqHhkWQ4IziiVwL3uuLChuzFEnpqx9AWlF9NkZeEjWOuF8QNJidU49c7JZoItPGCYtrr/d2IrBKntg+sEbnjbh7U+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLZ/394A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcCuApGz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLZ/394A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcCuApGz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADrwe2742607
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	En7X/0vxCX7bXKmBPPslDv+A+U5gNa1lX1RqN8slhCU=; b=SLZ/394AEtYP7xlQ
	i2KSYYMzJcLTiLebgiY1qMl+JUS5YzmRtGhYylx+1sgUtxomDR5oQHXVW6TD5EN8
	uFDdfm+fzlhGMxEbqF0j8EWQ9zsjgTLSSeN9nGi6BvqmKRu8IJVUIMolhUdTMlgm
	HEpzQi4WoWHjOtZTfBGuBEL6qtyiMsEz+Y/di3vnYVB7gHjzaXE0v0jd84KyY4XI
	uK7SjmMtaOjwPbZa8dRLll+VO0GT4s1j7bmW1ett0dEA+3XCgrcjYucXriL/ONdN
	vwU0CZSJgn6vvwftsAnIRoSAXbor+8F4E1ggbnQ/CQPtzhKqJOgQwEtw68fcFHSI
	RqqICA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51ec0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:55:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so14128645ad.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890553; x=1785495353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=En7X/0vxCX7bXKmBPPslDv+A+U5gNa1lX1RqN8slhCU=;
        b=UcCuApGzq60WK5lTbrTdhF+plv86XPZXqAtCqnXp5DIJSudhecaS/wq5LrFr/mFosB
         G+ikJ2+b5sEdzEdSSyfonYWgU58ocFkvN1gr1lcFSatcsxBdEAcFoGY3MWOpIi0Pq1ps
         pdSXRgYHBESIsVklFFcGwsB5AlI1BSVw72SAE/LsYDdoYiCFiPSn9gvb2AJwReZLanfe
         bEaIinpCoEz6MtVsIHfq5xSoOuVtHce/JGRRcXxjEnR9Zbwb/5XLwgkTQYd/SUU9vXWF
         K5ysBbRMr0WkQNFO68K+evCg5GOPdEgTAX8eOwKhiD2tU6N8LtFBBI0aVeNDfJpZm87e
         Ha7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890553; x=1785495353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=En7X/0vxCX7bXKmBPPslDv+A+U5gNa1lX1RqN8slhCU=;
        b=GU2TmHHopjIaLxbxVwkyJajqvTzdGjiD3dgy6gcus9OnnaN+rMp67OmwW80op98mWU
         92gavtQjnvRIATwcXOkvfysmm3OykV5Xvt8o12iYS17BMuEj/Gf77c4wzg+8XTK9u19V
         SNOoS7kzic2X/QmR26BeRvQeXHQHVvFxHLfFkro/rI0sVen81xN1PCF9EDMz/mBXbX+e
         r76YHWKxybfa3A0Wzma5L1msbC8QQ3y/6fM864kCXxbB0+4uT+ytqTBVUyAFP2PT8G48
         T/zuwE2myNkwam2jYcQpOdcYwmjqIJbq9C9LIs9fzgt7fXjTMGqBQY88g9Y4B+sTetyi
         +vkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpc9CQw0XMPzEYFFw5BA6ofNXXPS8rQjcvkASp+k1mW8IXrz5HxgIeh/rQ+PHsZQCUfnGMHJNLefls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr6mjO5Ls1FRhMBCbH/JB1U8us23YrFv7q3jf4CHLvsd1BbANB
	imAzCggidsocaF4gJJTT0uEt1PfrFSQGUb2XlOc3gWTIlkZtQH8cT0CK8DdXp608ahV2WJ1GDER
	z+u4TPBHqyHxBTvNHNFs87P+Bgj9w0jpRifnP+RaJ+ffcQqoGsqvg4SsS6RY/VhU=
X-Gm-Gg: AR+sD10MWhWU639Kx8uF5OW6nagdg1hlEciUXr6Z+k/YLaidwBbYZi3nM33qzxboHZx
	7aQj7Q6Qt5tp1NnNHlQJLFQOiNC2+5Hje3Dp0scpCoCeZ6avPEJqHMq50i0Bvaf6dqj2Zcu2QZy
	//jntgZ+n+QrFCPvmd8cKBj0AuCwv1sPehzPXrpCR9PPnBC7pEEKCOP/r3flYVL0c7FQ/JU+n/C
	bw8QJSJZeCGZVTVxUkkYepzO51Uu5sO+u809+C4vYANZLm+AFSilvTx0hPV6cs6f79BJuBZmwGb
	YCBmecVX9Cj0oIJMVMNGvLZV9WutJTpaf/opUy1ktajBc8euqJT8Wo+fI+qX8o2LZGAznYMnqiS
	yjtkZ9DDE+xCNRXrPWyw+52lb
X-Received: by 2002:a17:902:d4d1:b0:2ca:d4f:adab with SMTP id d9443c01a7336-2cfd71750bdmr431085ad.19.1784890552648;
        Fri, 24 Jul 2026 03:55:52 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2ca:d4f:adab with SMTP id d9443c01a7336-2cfd71750bdmr430705ad.19.1784890552029;
        Fri, 24 Jul 2026 03:55:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm49314775ad.55.2026.07.24.03.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:55:51 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:25:10 +0530
Subject: [PATCH v3 6/6] clk: qcom: gpucc: Add Nord graphics clock
 controller support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-nords_mm_v1-v3-6-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a6344ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=F3NrMrZ0Zf_nGyolyosA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: WWUy__fgWkgS9hCOvi_O8KR8syr_tw4U
X-Proofpoint-ORIG-GUID: WWUy__fgWkgS9hCOvi_O8KR8syr_tw4U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX6YZxS643QZTL
 1c/q/feCmHu+4Uh41dg2U1rpicfBmzFdqDsVzc2cqec9ZmLL9v43L6XW+0ZmWEgj49Pycy+X/xe
 IXKZVeu7SEWWc7VLVnLqZJazxT6Nz7E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX4PfaIMQM9E88
 W4P3QNGewE3nnEdMlk4AGtLKwqt8LXTdaLJSk0xtQ7KkRqqhNe1/aG/zJTGzp6+2sDdeWZyME1y
 okwU1s7VtpJxOO1AH8WptcR9QOe5sxmWqG/NQmN5BZp7iKcQ7xDZyF+V/k9uviEC2hy88lygWoO
 TxiDYWm4ERkzLDsvcCElMXk5gYOnkhiQBQSqe4XzM1QdS9Lzo9X9qCApkIka/0w+p8tpBb9TML6
 ROhQuc4T3j0WWq1EUbMHKnZu6GzUeIeGV+fzDlJDEqOe5WIDUm8nwVGZezyOua3nZuFyWFcPVnw
 Qyi8bv/BFzJrKlS2Zw8GjJu4tdTB00wXE91YhjUNh1Wu99/kQ7ThYj1N1B6LrlOMCrGpUI/se1p
 CAPmglL6E5AxUwVEjip7VrnKjEXq5md97u7p8LKBVX12Fn6cbZ1gTXb9kvz1GjEv0ycLuSU7o9+
 Bl/qByRumP+HQ7mSM7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240099

Add support for the GPU clock controllers (GPUCC) on the Qualcomm
Nord platform.

The platform includes two GPU clock controller instances,GPUCC
and GPU2CC. Register support for both controllers, which provide
clocks required for the graphics subsystem.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |  11 +
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/gpu2cc-nord.c | 545 +++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gpucc-nord.c  | 593 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1150 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 874136a2ad9aaa117df2c7ad5c8abc5280b76339..10dcfa72a0bd3bdd70e2bee05964e8c275ceb07d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -166,6 +166,17 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_NORD_GPUCC
+	tristate "Nord Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the graphics clock controllers on Nord devices. There are two
+	  graphics clock controllers on Nord SoC.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 4282f43e7078f1fe0dde6f942040eb6bd122d7ce..fb0a5bc94e32b2dc1d56268aa87f455b20d779eb 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
+obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/gpu2cc-nord.c b/drivers/clk/qcom/gpu2cc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..a05ff9fa1506e9d63b789127866ea5c37e5a1e2f
--- /dev/null
+++ b/drivers/clk/qcom/gpu2cc-nord.c
@@ -0,0 +1,545 @@
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
+#include <dt-bindings/clock/qcom,nord-gpu2cc.h>
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
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_2_CC_PLL0_OUT_MAIN,
+	P_GPU_2_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 934.0 MHz Configuration */
+static const struct alpha_pll_config gpu_2_cc_pll0_config = {
+	.l = 0x30,
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
+static struct clk_alpha_pll gpu_2_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_2_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1100.0 MHz Configuration */
+static const struct alpha_pll_config gpu_2_cc_pll1_config = {
+	.l = 0x39,
+	.alpha = 0x4aaa,
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
+static struct clk_alpha_pll gpu_2_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &gpu_2_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_2_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_2_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_2_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_2_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_2_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_2_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_2_cc_pll0.clkr.hw },
+	{ .hw = &gpu_2_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_2_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_2_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_2_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_2_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_2_cc_ff_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_2_cc_ff_clk_src = {
+	.cmd_rcgr = 0x91c4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_2_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_2_cc_ff_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_2_cc_ff_clk_src",
+		.parent_data = gpu_2_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_2_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_2_cc_gmu_clk_src[] = {
+	F(550000000, P_GPU_2_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_2_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9174,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_2_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_2_cc_gmu_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_2_cc_gmu_clk_src",
+		.parent_data = gpu_2_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_2_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gpu_2_cc_hub_clk_src = {
+	.cmd_rcgr = 0x91a8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_2_cc_parent_map_2,
+	.freq_tbl = ftbl_gpu_2_cc_ff_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_2_cc_hub_clk_src",
+		.parent_data = gpu_2_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gpu_2_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch gpu_2_cc_ahb_clk = {
+	.halt_reg = 0x90cc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_crc_ahb_clk = {
+	.halt_reg = 0x90d0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_crc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x9114,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9114,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_cx_ff_clk = {
+	.halt_reg = 0x9100,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9100,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_cx_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_cx_gmu_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_cxo_clk = {
+	.halt_reg = 0x90f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_freq_measure_clk = {
+	.halt_reg = 0x9008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_hub_aon_clk = {
+	.halt_reg = 0x91a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x91a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90fc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x9104,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9104,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_mnd1x_0_gfx3d_clk = {
+	.halt_reg = 0x9164,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_mnd1x_0_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_mnd1x_1_gfx3d_clk = {
+	.halt_reg = 0x9168,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9168,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_mnd1x_1_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_sleep_clk = {
+	.halt_reg = 0x90e0,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x90e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_2_cc_cx_gdsc = {
+	.gdscr = 0x9090,
+	.gds_hw_ctrl = 0x90a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_2_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gpu_2_cc_gx_gdsc = {
+	.gdscr = 0x9034,
+	.clamp_io_ctrl = 0x9504,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_2_cc_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_2_cc_nord_clocks[] = {
+	[GPU_2_CC_AHB_CLK] = &gpu_2_cc_ahb_clk.clkr,
+	[GPU_2_CC_CRC_AHB_CLK] = &gpu_2_cc_crc_ahb_clk.clkr,
+	[GPU_2_CC_CX_ACCU_SHIFT_CLK] = &gpu_2_cc_cx_accu_shift_clk.clkr,
+	[GPU_2_CC_CX_FF_CLK] = &gpu_2_cc_cx_ff_clk.clkr,
+	[GPU_2_CC_CX_GMU_CLK] = &gpu_2_cc_cx_gmu_clk.clkr,
+	[GPU_2_CC_CXO_CLK] = &gpu_2_cc_cxo_clk.clkr,
+	[GPU_2_CC_FF_CLK_SRC] = &gpu_2_cc_ff_clk_src.clkr,
+	[GPU_2_CC_FREQ_MEASURE_CLK] = &gpu_2_cc_freq_measure_clk.clkr,
+	[GPU_2_CC_GMU_CLK_SRC] = &gpu_2_cc_gmu_clk_src.clkr,
+	[GPU_2_CC_GPU_SMMU_VOTE_CLK] = &gpu_2_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_2_CC_HUB_AON_CLK] = &gpu_2_cc_hub_aon_clk.clkr,
+	[GPU_2_CC_HUB_CLK_SRC] = &gpu_2_cc_hub_clk_src.clkr,
+	[GPU_2_CC_HUB_CX_INT_CLK] = &gpu_2_cc_hub_cx_int_clk.clkr,
+	[GPU_2_CC_MEMNOC_GFX_CLK] = &gpu_2_cc_memnoc_gfx_clk.clkr,
+	[GPU_2_CC_MND1X_0_GFX3D_CLK] = &gpu_2_cc_mnd1x_0_gfx3d_clk.clkr,
+	[GPU_2_CC_MND1X_1_GFX3D_CLK] = &gpu_2_cc_mnd1x_1_gfx3d_clk.clkr,
+	[GPU_2_CC_PLL0] = &gpu_2_cc_pll0.clkr,
+	[GPU_2_CC_PLL1] = &gpu_2_cc_pll1.clkr,
+	[GPU_2_CC_SLEEP_CLK] = &gpu_2_cc_sleep_clk.clkr,
+};
+
+static struct gdsc *gpu_2_cc_nord_gdscs[] = {
+	[GPU_2_CC_CX_GDSC] = &gpu_2_cc_cx_gdsc,
+	[GPU_2_CC_GX_GDSC] = &gpu_2_cc_gx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_2_cc_nord_resets[] = {
+	[GPU_2_CC_ACD_BCR] = { 0x918c },
+	[GPU_2_CC_CB_BCR] = { 0x9198 },
+	[GPU_2_CC_CX_BCR] = { 0x908c },
+	[GPU_2_CC_FAST_HUB_BCR] = { 0x91a0 },
+	[GPU_2_CC_FF_BCR] = { 0x91c0 },
+	[GPU_2_CC_GFX3D_AON_BCR] = { 0x9118 },
+	[GPU_2_CC_GMU_BCR] = { 0x9170 },
+	[GPU_2_CC_GX_BCR] = { 0x9030 },
+	[GPU_2_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_2_cc_nord_plls[] = {
+	&gpu_2_cc_pll0,
+	&gpu_2_cc_pll1,
+};
+
+static const u32 gpu_2_cc_nord_critical_cbcrs[] = {
+	0x9004, /* GPU_2_CC_CXO_AON_CLK */
+	0x900c, /* GPU_2_CC_DEMET_CLK */
+};
+
+static const struct regmap_config gpu_2_cc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9ff0,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data gpu_2_cc_nord_driver_data = {
+	.alpha_plls = gpu_2_cc_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_2_cc_nord_plls),
+	.clk_cbcrs = gpu_2_cc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_2_cc_nord_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_2_cc_nord_desc = {
+	.config = &gpu_2_cc_nord_regmap_config,
+	.clks = gpu_2_cc_nord_clocks,
+	.num_clks = ARRAY_SIZE(gpu_2_cc_nord_clocks),
+	.resets = gpu_2_cc_nord_resets,
+	.num_resets = ARRAY_SIZE(gpu_2_cc_nord_resets),
+	.gdscs = gpu_2_cc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_2_cc_nord_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_2_cc_nord_driver_data,
+};
+
+static const struct of_device_id gpu_2_cc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-gpu2cc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_2_cc_nord_match_table);
+
+static int gpu_2_cc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_2_cc_nord_desc);
+}
+
+static struct platform_driver gpu_2_cc_nord_driver = {
+	.probe = gpu_2_cc_nord_probe,
+	.driver = {
+		.name = "gpu2cc-nord",
+		.of_match_table = gpu_2_cc_nord_match_table,
+	},
+};
+
+module_platform_driver(gpu_2_cc_nord_driver);
+
+MODULE_DESCRIPTION("QTI GPU2CC Nord Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gpucc-nord.c b/drivers/clk/qcom/gpucc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..f37bc32e80ff66915108c241fc0e46b2e8a5f8bb
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-nord.c
@@ -0,0 +1,593 @@
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
+#include <dt-bindings/clock/qcom,nord-gpucc.h>
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
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 936.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x30,
+	.alpha = 0xc000,
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
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1250.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll1_config = {
+	.l = 0x41,
+	.alpha = 0x1aaa,
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
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &gpu_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_ff_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_ff_clk_src = {
+	.cmd_rcgr = 0x93d4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_ff_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_ff_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(416666667, P_GPU_CC_PLL1_OUT_MAIN, 3, 0, 0),
+	F(625000000, P_GPU_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x92b8,
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
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x938c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_2,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x93cc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_acd_gfx3d_clk = {
+	.halt_reg = 0x92a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x92a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_acd_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_acmu_clk = {
+	.halt_reg = 0x9294,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9294,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_acmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x9150,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x9150,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x9154,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9154,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_crc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
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
+	.halt_reg = 0x91a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x91a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_ff_clk = {
+	.halt_reg = 0x9184,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9184,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x916c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x916c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x917c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x917c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x91a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x91a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x9008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9008,
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
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x9388,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9388,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
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
+	.halt_reg = 0x9180,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9180,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
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
+	.halt_reg = 0x9188,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9188,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_mnd1x_gfx3d_clk = {
+	.halt_reg = 0x92ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x92ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_mnd1x_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x9164,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x90e8,
+	.gds_hw_ctrl = 0x9128,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gpu_cc_gx_gdsc = {
+	.gdscr = 0x905c,
+	.clamp_io_ctrl = 0x9504,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_cc_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_cc_nord_clocks[] = {
+	[GPU_CC_ACD_GFX3D_CLK] = &gpu_cc_acd_gfx3d_clk.clkr,
+	[GPU_CC_ACMU_CLK] = &gpu_cc_acmu_clk.clkr,
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GPU_SMMU_VOTE_CLK] = &gpu_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_MND1X_GFX3D_CLK] = &gpu_cc_mnd1x_gfx3d_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+};
+
+static struct gdsc *gpu_cc_nord_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+	[GPU_CC_GX_GDSC] = &gpu_cc_gx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_nord_resets[] = {
+	[GPU_CC_ACD_BCR] = { 0x92f8 },
+	[GPU_CC_CB_BCR] = { 0x9340 },
+	[GPU_CC_CX_BCR] = { 0x90e4 },
+	[GPU_CC_FAST_HUB_BCR] = { 0x9384 },
+	[GPU_CC_GFX3D_AON_BCR] = { 0x91ac },
+	[GPU_CC_GX_BCR] = { 0x9058 },
+	[GPU_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_cc_nord_plls[] = {
+	&gpu_cc_pll0,
+	&gpu_cc_pll1,
+};
+
+static const u32 gpu_cc_nord_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct regmap_config gpu_cc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9660,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data gpu_cc_nord_driver_data = {
+	.alpha_plls = gpu_cc_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_nord_plls),
+	.clk_cbcrs = gpu_cc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_nord_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_nord_desc = {
+	.config = &gpu_cc_nord_regmap_config,
+	.clks = gpu_cc_nord_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_nord_clocks),
+	.resets = gpu_cc_nord_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_nord_resets),
+	.gdscs = gpu_cc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_nord_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_nord_driver_data,
+};
+
+static const struct of_device_id gpu_cc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_nord_match_table);
+
+static int gpu_cc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_nord_desc);
+}
+
+static struct platform_driver gpu_cc_nord_driver = {
+	.probe = gpu_cc_nord_probe,
+	.driver = {
+		.name = "gpucc-nord",
+		.of_match_table = gpu_cc_nord_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_nord_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC Nord Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

