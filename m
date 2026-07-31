Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFCF360EDE
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 05:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477236; cv=none; b=L2r9O1lLGZQ2QbcphJ4NPuVn9ShBD912IrNILDuBgZ0PSI+lKfep7yBpCrZzwUNEP5D+Mw/j7EX74d8Kb+p926txbBSqWLkv/B3HeOEtEx6gH1Clr5YWXsvXQxetvu/Z0mtp9majCEMb9aCRpFKkNwaErSvthQ4zg4x18J8KluU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477236; c=relaxed/simple;
	bh=Q0Nl1EB4GfCK4Bq8Z0yG/OYSY+bNHkVeD/9PvlEJnPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkLzjagXQK/SHIoyY3NrPfaSWjvF8P9kwBsRg/2Pff58kHX3YG5BeXNUDlsXLJTlTXWLIKS4tBqIpC2PO1JIz0KmxKbADclKX4cQns9UUW13obnH9VHjZ/Pmcecg174ZPGRk3ngcuWP6rMJWIUDDYaOPKtTPkHIM3s9DHFU/ebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvQpqcrd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaVhsynp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvQpqcrd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaVhsynp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5UBFV2878824
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 05:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auiKWVPSK3ge7Y1W/jIIHT46ACyN9n6TctmUdNMZDvw=; b=XvQpqcrdxrYvvLk0
	DWI6p/IsmCoigAfa8bs1S5WYmRkh0pOqVHBr8JHZm516PI6BzvNadmVs/B1SrXq5
	3CW+6Np88Ty9gIaLGv5lBvAGWVsHGNkoL46ErPbgxrXy0rEM3MXpXDz3xK2jA6Tr
	D6iJ0byuYc4gGSORlOCEGeZLkmMCBK8D13avH1O4NcJlebIezTO23b10stdKl3Kb
	HuM/uOL9tkTOMtvCmB8yLDckAEgWZnJP2pKcdy5ae+OFfqZzLn4/IwDEu+TFaDt7
	gqO2ZpfK9BBw8cnE7kf1bnwFv5WWpVegXE+4vYDt82Oo7Xpz7hXETqpni0/iD+DI
	NIyE8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnm7g2d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 05:53:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1579228a91.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 22:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477232; x=1786082032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auiKWVPSK3ge7Y1W/jIIHT46ACyN9n6TctmUdNMZDvw=;
        b=QaVhsynpUiEHNXzehcSxvii8vHuPahKaReQ9Q1NqFF2u56f7tu8AJk4cWEFKKCZ+7E
         ixbG/Pf1esls8073dwMXSBKP6syldukdn+ioWciaujz59yjLAQwr05yJ+VmnP65MID0V
         uSspYHhhvKzF+Ceuqm7cALJPq5yb/j96ccOvoa61q7EjBJ7EHCT/t7NN0peIHk5LuN0r
         kysXOZC5zAYQsvPY1epIaO68UCkmg7fHWhZXJQLcBr5W+pfChay3NbvlDxHxb/jbX4BP
         h+UFemlrir2K185fYEsG7nweCnpZR0RspmhljFIhV1d07OCFj8FNUWHHLn9fBU4VEbrJ
         XZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477232; x=1786082032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auiKWVPSK3ge7Y1W/jIIHT46ACyN9n6TctmUdNMZDvw=;
        b=X3il9pgy11xukjvo7Xlkq7UFvOpvSAnosgWlhZp1YVdKk7446Guck+h1LorwD6eOjE
         NVE6viqO9zqNAikgmJLv4yH9eS2ixbUXMA9FkTVQU5bmOd6Qpa6+J2iASAcCAdfTWihZ
         x0Rku18mXdYOYF15lqE2t6bxe6HfF4kDGXnVd80pF/ibGP25Gqfj/Sjsb6MiUCW+O9DN
         OGwf3Zxi8vD81/TZgqe5owiyt1caXBDo/pQUITLob0k6hOFPWMHxy4T0BFDq2Du7p3Hd
         07FI2up03aucQhl+qH/sX7jJjLajrljO5s/VD0FSVWS7LcT4zivcauVBKE2eRbSp7wtj
         0O+w==
X-Forwarded-Encrypted: i=1; AHgh+Rr/e8aXOqzep8XUMRl2n7dBGl56ZlHCPmTq9tUUXEvyLKd+bw8eGuX92JI3Nk1jGX6DAtmfcic4mOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH+j9lhJJvv2THAvQYV+N1jFkaAE4GPPMbVuTBON2vWSH357LX
	g1Wr782Mnpr6WpBCBRRhME7Q1/N67GDgMDge3tIntYMky6nTUJbH1IaFxGGXviSMbFRmOt9VtNk
	pS/9h8xBX8usLV2vW3154cJvxO7R5cdmUWn4sCBaRzEGKu+/VTFzyjWiybxV6d0o=
X-Gm-Gg: AR+sD115/KhIJUXy1GIrf0iS1DM16x5sZGcKCIMzbVcuxTzH/GNVjp8aujAntwhnvGc
	VJDuWNeQ1jy2yNQ0JdEiOrBok0TyFvAKEQGPYF5J8d6t/1OItdCjsCnzbr7B1YGSUfrwKLWFCcs
	hkLpFCZMBNGTOH7n4ervoyMxgC6y6CWRM4W/GkIZGxbCNrKjnJhqDVHbWqkzSBGFjFpF7RJBF/j
	DcDSW2BGp92WzlSwbO9bxn8hi8IUSh8GmmX4hpm+QpW3z8mQyN/FKFowrv+I2lsalcJVt5A+nFa
	Tx8fA2qtOcRHSkrNlYKVCek+2oLnCTGDOuDZ9ki/W3Xyf5CA9+hJlIVa70xcUDob/SrL9MjPHQF
	snF0s+6+3MEtHPdBB0gYN48GhytWCRd4UK9lZBAVE/j1OJUo0zw==
X-Received: by 2002:a17:90b:4c0e:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-38fb10db706mr778123a91.5.1785477231702;
        Thu, 30 Jul 2026 22:53:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0e:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-38fb10db706mr778075a91.5.1785477231204;
        Thu, 30 Jul 2026 22:53:51 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm1643675eec.7.2026.07.30.22.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:53:49 -0700
Subject: [PATCH v2 2/2] clk: qcom: Add support for Hawi GPUCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-gpucc-hawi-v2-2-7bf618ab8a34@oss.qualcomm.com>
References: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
In-Reply-To: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
To: mturquette@baylibre.com, robh@kernel.org, andersson@kernel.org,
        conor+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, taniya.das@oss.qualcomm.com,
        bmasney@redhat.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785477228; l=14900;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=Q0Nl1EB4GfCK4Bq8Z0yG/OYSY+bNHkVeD/9PvlEJnPA=;
 b=ecsA0ci1KXu3c+rF1WIPbKDIlUNYZQDnBBWkfCQJvS5Ohv8a2VKxHUcKuNUurngcbOMT/jUHB
 8XmfBobHUDfCJDsQ07BpmXrom/UC3ScLzcGsr8aKe+wMpMyEb28AMn4
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX8TrrmmZ9BTr0
 hxokBiEi12enZcPLam8hEVBA65j40rFFegK+VETbVOzpOMOHxEnGhMQU88IM84Pe0LAFUtJzlMp
 cvE6O598f5bODtUT1HM02pSxyQeTYh8mXaM5V+mTiciKron1J6VAP3095BUpqpsTEckhEMu1cLo
 TvXGq3MG0YQ+SwHdmUcLyNUo80VzKxHa2vqWn/JMVX5fWSxVqHHqxrWEYNLpjuVuhMmdyuHS3M3
 7df0Q30ew8ZmqHoW2da4Vxs+SQDraS3XV/hZQX0fRbtn0VSiLjY9YY+GuA5LOxr4iMZQXayFk58
 j8OC+v8ZW5tKv9nLCAFMyLHuqr0m9e2eK/42Je1YDXJSBInacAKKPUkoylVCyZd/XeMVMs1t6Bl
 un96xCI3Hjkcy1GYzXvNNxKlbM6Rh2mMBVO9UeH1tFsKClyj3t1pHKBs97yY0fEv5muNtsFuHBV
 QZhEDxTAxOunruIxFXg==
X-Proofpoint-ORIG-GUID: PsqjoMDigc86q3vt42Y8uFw1Qxrdda1m
X-Authority-Analysis: v=2.4 cv=FI0rAeos c=1 sm=1 tr=0 ts=6a6c3870 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FzpPky3w8eEy4Oq9N2YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX/7e/7xA6igQ6
 sJl+rjDY6DdDviDEPDQ0BciN9+3wbW5vcPh7OOy6ciZ2o0ecOZomyd3z2aoQC4PJ7S0xfjZXc55
 BXKNu41JbSNffUeSsio1c8Ia4uEHdZ4=
X-Proofpoint-GUID: PsqjoMDigc86q3vt42Y8uFw1Qxrdda1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310038

Add the graphics clock controller driver for Hawi. This provides the
clocks, resets and power domains required by the GPU driver to enable the
graphics subsystem.

Reuse the existing gxclkctl-kaanapali driver for GX clock controller
support and build it with the Hawi GPUCC driver.

Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig      |  12 ++
 drivers/clk/qcom/Makefile     |   1 +
 drivers/clk/qcom/gpucc-hawi.c | 461 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 474 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 63f271aff177..498d94837afe 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -391,6 +391,18 @@ config CLK_HAWI_GCC
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
index fff069da16de..dd4e2700ee5f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
 obj-$(CONFIG_CLK_HAWI_GCC) += gcc-hawi.o
+obj-$(CONFIG_CLK_HAWI_GPUCC) += gpucc-hawi.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_HAWI_TCSRCC) += tcsrcc-hawi.o
 obj-$(CONFIG_CLK_HAWI_VIDEOCC) += videocc-hawi.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
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

