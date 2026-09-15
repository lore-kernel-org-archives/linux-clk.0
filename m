Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E8F4BB7E2
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493604; cv=none; b=kLw7raKhTVvt8DKDcvzbgTt1ClFAQASoayLWSytVdYPFZdyEKsks43pi0oipFyUbattN156ECxGlWjollUy9OM53+/vkEPbjrzH3ypzhd/FBsuTPTMxACDB9AsS5UGoMmA4mafYBAYqXkiuJtMV8A+C9DatVHf54rWCLXzDTQ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493604; c=relaxed/simple;
	bh=YBfu6N6V1jMYconJYGn+dslKjmhWBHduBYJR1ga2I/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHMm8waEgU4HuE4MWnEJEozvbgq6IzIsV/Ufwsxav/THQDrvpDNxXTX7wM25znkRfRoxBnRDwNf1esgNl7XUos+/50az7bDUjYf2ZN4ZzKu3NJ/N+g5/K/X6WIV18l77aOC/BW/RQuOfkxl1dyTBJ9UiO0XPSVZOoFL/PR85Ft8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJCDjZ9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fELN7de5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJCDjZ9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fELN7de5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FGXUQl3577015
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 17:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBqdCyX5uWMmdFdCNKsARh7IeI9dCF4P5Z+bV/8/Qko=; b=eJCDjZ9Pk8btSLNy
	qhB6B8IafO6rrZxzhARemdEag9CYxSgY782DbBPdSoHe3uyT0s+OSJl2cIirLvoP
	BsPvttRyZkmLjbJT/5glkRkpHtPVlzePcmuC8c2mC7kjYUrePF+Jk03nRniDnvXu
	3Y1xqptNLh+gI8w/3o8q5YAlzRjITWMcCwSJk3Ayf2tTa/6rHMvJ8y1crZ9pholU
	skq4rkgpaYniTQBJ9QG5wV9gyB25baZzq7Mh4jU4yhvqXldK62Nn4FgD2WYs9tZL
	L81/OtYj7NYar7keVnby5FsulZdvI4r1eDg51Jrs5tO9+eM0K+ukGQtnXuWuW/sT
	opsM1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n60b5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 17:33:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc92350888so79787325ad.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789493596; x=1790098396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBqdCyX5uWMmdFdCNKsARh7IeI9dCF4P5Z+bV/8/Qko=;
        b=fELN7de5V18HVlr/FNp2vl3Lm/btBLGvmgHuTapmTUtjrhIPLlAUXtyx+jwaIcKyuZ
         qp+mZjngzfLKnhYUdBj/By5crMW1KqjQPna3A+L5mE6GJFk0hoAvvuUWjU+24SAfez1j
         LqduUy5GoxEcWae4rzNSSvU1WGAU3vqn9NXKXAy0WVzLbti05K+syP+iSOAIyV8lOxlT
         3LDjq9SYvbpBR13OozE8wBMbzecU6JSw79xXEDDHYBpTA/QW2EvVwVAEwBuCy8Y6QjJt
         EKHz8f1iJJdB+mA6eZldzgu0+QDci5u3Y//cHPHCKuiEiycXeR5s8qELNhNvCMI79Lle
         5HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493596; x=1790098396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBqdCyX5uWMmdFdCNKsARh7IeI9dCF4P5Z+bV/8/Qko=;
        b=SfTduLwvO5ZB4PAoIIa3AzFm53pDoc1ITIXfTK4jCB8/PYJtH92Tee3EeL4yv4SOeK
         MJpJ9iWnDk5k2ja/PdmTZA1Tkaus6Cmc/wgIQRra0FVNl1MPnDTewZeXE3Sc1XxM64s0
         I6BE2DAVGPioxVVMV0eXoiWQ+Nr9gtJAFRBo6BvHyoyOlVtfxij1RFtzZEwtRZincPSX
         Vkc8RqRW+gn4Ab3hvwOtSYV9j5dQWfttD6IgSBebybQfVeFryg+WByLovoK5QIXBVD0q
         9E4oN8ebhNOeXFFCTlIvJhuKzNFJ6Sm9+ycPYlfuaqJjETq9uqBcqcGX1IDZYmNgTrlH
         Bhbg==
X-Forwarded-Encrypted: i=1; AKwUvBxR5x8cAjvjGu4y8eKSuDkxGo0zEHIs8HkxUirqGPtSkxC6821HL6CbnAea5S7BFUbE6xERndxu7fs=@vger.kernel.org
X-Gm-Message-State: AFuF++kMwi2uEO8oxhga+X7jSKJzuoSfCLgfMq5ilxeQrGVGkdYdDI7d
	ceTIq+STFkw/lTYpZ0BvKRYRKT0JMLG23sn5GZn/8H7DbsGZKXtPj47GpARjn199lR3Z9apQWF9
	V1qgi8HfvxWc9H5z7JsOXCT2ji/RASPQqn/KB7zhJXhM2UX0YOrQT6eT0c+J+dko=
X-Gm-Gg: AYBFou0H/odC/WNKKLFl7YCQvoEBP73RfhmOv5myDLOG2jpwkrP+FuXK/gDfagqf4Ec
	GRwoq5fNhIK3Deh2r8lyXcY7bPpc1ASXmZRcRwvWhpMk3ff7RjydVlpbueR93Bkxm8phZAy9R6/
	EcupjPZNYdwX8RHIBI08U/dHgHPYtGfvE0YMWUgyQeyyNxLPoj0zNYe0aAD4dGcCzNu2X0+5BhV
	Es9BD+4C4Jr23yUAHRRq/sbOZ8zZpVqFjwBkx9vkkZ1J9RBr+YFtq5Bj/ARzCobDbEAV4lolee0
	n0KRZ+Ehfm0dpzvlGWYvhwnncMNHr+tCelVlNzsCbG9y7KptZQWAzTWicOaLdzirWWJGWEeWm2Y
	GkqTXIgqHhklFsjenpAqPe8TCdoL8dOgoj4DWJy1mmbZMUIg7dODi2hg=
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr147270755ad.15.1789493594648;
        Tue, 15 Sep 2026 10:33:14 -0700 (PDT)
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr147269635ad.15.1789493593774;
        Tue, 15 Sep 2026 10:33:13 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm71567305ad.62.2026.09.15.10.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:33:11 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:33:02 -0700
Subject: [PATCH v3 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camcc-hawi-v3-2-5b57f45477f1@oss.qualcomm.com>
References: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
In-Reply-To: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789493584; l=89455;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=YBfu6N6V1jMYconJYGn+dslKjmhWBHduBYJR1ga2I/I=;
 b=dd+WgT/2/j7jDIFJcZKdpZgrdWtof6kEs5+m8gNBaX5acpChpyfAsxYanBThK+RwGiI15Siwr
 HbmItR1llq5BNuRRarqObEAvWwjxnR8Mdfd2JppQhfuOiVyK0blEVqQ
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa9815c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DNZtTDGKgN8HDTSViz0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1NSBTYWx0ZWRfX28jvIj6EwuDw
 2VsXZDqMEaIobe6StjsSE+ikqswAZdI++AvNnqotfp140fdQHNw5zzWBp2berg8bSpSW0yfFBVJ
 HKCBFcqUTmywJuqfyPRNcjZtkKOsopkP/A/vuCniMz0A6TW1c60LI9Y19Xe2cnwDGF0JTwN+uy4
 QOjmALzUBrfCQkC3k5R0lDWwacUyvIm/ohStlS7r4jkmSJ/PqpPj5VUv/61in0Brssx7cREk0LL
 xgj3BT7amVOzOmtkQYWHY6HiVcwAYwTIPTOQ24cHmWuIFuLoG1MeCXBTyCTA2RHm2x1mxVofIbu
 A8GgFUHLIKQhhzE5pltFa7+V9p4jIbXlexfTnNV4deZXdavL2bm6clJICQMc6EUT+7Qo//+LBQ9
 +8/QtMu34POxsLDalgFoQGSaZK8Ul3UGFLIbVHH53LRuMyag90Jhemty31cYl6TdOaQG7ZjG9ZS
 69hrs4zNPzt7hGMW/4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1NSBTYWx0ZWRfX8aygsEO7vlno
 lni9xBdn4RZybecrhIviGsVMH0lL7kEHb3atI1LsjEBkCi0fw14CaPogIAptMz4RrwfqaonvWw4
 Wzj8TaxQxFmYY4CLXkCu8ckF220rhE8=
X-Proofpoint-GUID: R5VJHbRD2oLsABdgq_36j94Qa50E1gDa
X-Proofpoint-ORIG-GUID: R5VJHbRD2oLsABdgq_36j94Qa50E1gDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150255

The CAMCC block on the Qualcomm Hawi SoC provides the primary camera
clocks. The Camera BIST MCLK clock controller is identical to
Kaanapali's and hence reuses the cambistmclkcc-kaanapali driver to
provide the functional MCLK required for camera operations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig      |   11 +
 drivers/clk/qcom/Makefile     |    1 +
 drivers/clk/qcom/camcc-hawi.c | 2993 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 3005 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6ef083f5d9e2..6b8e8da4e4ee 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -495,6 +495,17 @@ config QCOM_CLK_RPMH
 	 Say Y if you want to support the clocks exposed by RPMh on
 	 platforms such as SDM845.
 
+config CLK_HAWI_CAMCC
+	tristate "Hawi Camera Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_HAWI_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the camera clock controller on Qualcomm Technologies, Inc
+	  Hawi devices.
+	  Say Y if you want to support camera devices and functionality such as
+	  capturing pictures.
+
 config CLK_HAWI_GCC
 	tristate "Hawi Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index a6c676f68b79..bd70e18a7118 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
+obj-$(CONFIG_CLK_HAWI_CAMCC) += cambistmclkcc-kaanapali.o camcc-hawi.o
 obj-$(CONFIG_CLK_HAWI_GCC) += gcc-hawi.o
 obj-$(CONFIG_CLK_HAWI_GPUCC) += gpucc-hawi.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_HAWI_TCSRCC) += tcsrcc-hawi.o
diff --git a/drivers/clk/qcom/camcc-hawi.c b/drivers/clk/qcom/camcc-hawi.c
new file mode 100644
index 000000000000..aa52b99aec00
--- /dev/null
+++ b/drivers/clk/qcom/camcc-hawi.c
@@ -0,0 +1,2993 @@
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
+#include <dt-bindings/clock/qcom,hawi-camcc.h>
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
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+};
+
+/* Need to match the order of interconnects in DT binding */
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
+enum {
+	P_BI_TCXO,
+	P_CAM_CC_PLL0_OUT_EVEN,
+	P_CAM_CC_PLL0_OUT_MAIN,
+	P_CAM_CC_PLL0_OUT_ODD,
+	P_CAM_CC_PLL1_OUT_EVEN,
+	P_CAM_CC_PLL2_OUT_EVEN,
+	P_CAM_CC_PLL3_OUT_EVEN,
+	P_CAM_CC_PLL4_OUT_EVEN,
+	P_CAM_CC_PLL5_OUT_EVEN,
+	P_CAM_CC_PLL6_OUT_EVEN,
+	P_CAM_CC_PLL6_OUT_MAIN,
+	P_CAM_CC_PLL6_OUT_ODD,
+	P_CAM_CC_PLL7_OUT_EVEN,
+	P_CAM_CC_PLL7_OUT_MAIN,
+	P_CAM_CC_PLL8_OUT_EVEN,
+};
+
+static const struct pll_vco taycan_eha_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 1200.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll0_config = {
+	.l = 0x3e,
+	.alpha = 0x8000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll0 = {
+	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll0_out_odd[] = {
+	{ 0x2, 3 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
+	.offset = 0x0,
+	.post_div_shift = 14,
+	.post_div_table = post_div_table_cam_cc_pll0_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll0_out_odd",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll1_config = {
+	.l = 0x19,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll1_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
+	.offset = 0x1000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll1_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll1_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll1_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll1.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+/* 451.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll2_config = {
+	.l = 0x17,
+	.alpha = 0x8000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll2_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll2_out_even = {
+	.offset = 0x2000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll2_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll2_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll2_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll2.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll3_config = {
+	.l = 0x18,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll3_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
+	.offset = 0x3000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll3_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll3_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll3_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll3.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll4_config = {
+	.l = 0x18,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll4 = {
+	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll4",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll4_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
+	.offset = 0x4000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll4_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll4_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll4_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll4.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll5_config = {
+	.l = 0x18,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll5 = {
+	.offset = 0x5000,
+	.config = &cam_cc_pll5_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll5",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll5_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
+	.offset = 0x5000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll5_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll5_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll5_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll5.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll6_config = {
+	.l = 0x32,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll6 = {
+	.offset = 0x6000,
+	.config = &cam_cc_pll6_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll6",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll6_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
+	.offset = 0x6000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll6_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll6_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll6_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll6.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll6_out_odd[] = {
+	{ 0x2, 3 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll6_out_odd = {
+	.offset = 0x6000,
+	.post_div_shift = 14,
+	.post_div_table = post_div_table_cam_cc_pll6_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll6_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll6_out_odd",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll6.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+/* 345.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll7_config = {
+	.l = 0x11,
+	.alpha = 0xf800,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll7 = {
+	.offset = 0x7000,
+	.config = &cam_cc_pll7_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll7",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll8_config = {
+	.l = 0x19,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll8 = {
+	.offset = 0x8000,
+	.config = &cam_cc_pll8_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll8",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll8_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll8_out_even = {
+	.offset = 0x8000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll8_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll8_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll8_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll8.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
+	{ P_CAM_CC_PLL6_OUT_ODD, 4 },
+	{ P_CAM_CC_PLL6_OUT_EVEN, 5 },
+	{ P_CAM_CC_PLL6_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll6_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll6_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll6.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
+	{ P_CAM_CC_PLL6_OUT_ODD, 4 },
+	{ P_CAM_CC_PLL6_OUT_EVEN, 5 },
+	{ P_CAM_CC_PLL6_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll6_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll6_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll6.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
+	{ P_CAM_CC_PLL7_OUT_EVEN, 5 },
+	{ P_CAM_CC_PLL7_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll7.clkr.hw },
+	{ .hw = &cam_cc_pll7.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 4 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll1_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll2_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL8_OUT_EVEN, 4 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll8_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL3_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL4_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll4_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL5_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_8[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll5_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_9[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_9[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(120000000, P_CAM_CC_PLL6_OUT_EVEN, 4, 0, 0),
+	F(160000000, P_CAM_CC_PLL6_OUT_EVEN, 3, 0, 0),
+	F(240000000, P_CAM_CC_PLL6_OUT_EVEN, 2, 0, 0),
+	F(320000000, P_CAM_CC_PLL6_OUT_EVEN, 1.5, 0, 0),
+	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_camnoc_rt_axi_clk_src = {
+	.cmd_rcgr = 0x212cc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_camnoc_rt_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_camnoc_rt_axi_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_ODD, 1, 3, 32),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cci_0_clk_src = {
+	.cmd_rcgr = 0x21250,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_0_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_1_clk_src = {
+	.cmd_rcgr = 0x2126c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_1_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_2_clk_src = {
+	.cmd_rcgr = 0x21288,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_2_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_MAIN, 6, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
+	.cmd_rcgr = 0x21064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cphy_rx_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cre_clk_src[] = {
+	F(80000000, P_CAM_CC_PLL6_OUT_EVEN, 6, 0, 0),
+	F(137142857, P_CAM_CC_PLL6_OUT_EVEN, 3.5, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cre_clk_src = {
+	.cmd_rcgr = 0x211a0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cre_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cre_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x20000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi0phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
+	.cmd_rcgr = 0x20024,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi1phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
+	.cmd_rcgr = 0x20044,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi2phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
+	.cmd_rcgr = 0x20064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi3phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
+	.cmd_rcgr = 0x20084,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi4phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
+	.cmd_rcgr = 0x200a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi5phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csid_clk_src = {
+	.cmd_rcgr = 0x212a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csid_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_fast_ahb_clk_src[] = {
+	F(128000000, P_CAM_CC_PLL6_OUT_ODD, 2.5, 0, 0),
+	F(213333333, P_CAM_CC_PLL6_OUT_ODD, 1.5, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
+	.cmd_rcgr = 0x200dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_fast_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_icp_0_clk_src[] = {
+	F(345000000, P_CAM_CC_PLL7_OUT_MAIN, 1, 0, 0),
+	F(500000000, P_CAM_CC_PLL7_OUT_MAIN, 1, 0, 0),
+	F(600000000, P_CAM_CC_PLL7_OUT_MAIN, 1, 0, 0),
+	F(770000000, P_CAM_CC_PLL7_OUT_MAIN, 1, 0, 0),
+	F(900000000, P_CAM_CC_PLL7_OUT_MAIN, 1, 0, 0),
+	F(1150000000, P_CAM_CC_PLL7_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_icp_0_clk_src = {
+	.cmd_rcgr = 0x211f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_icp_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_icp_0_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_icp_1_clk_src = {
+	.cmd_rcgr = 0x21220,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_icp_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_icp_1_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_lite_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_MAIN, 6, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
+	.cmd_rcgr = 0x21144,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_ife_lite_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_lite_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
+	.cmd_rcgr = 0x21170,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_lite_csid_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ipe_nps_clk_src[] = {
+	F(246600000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(411000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(475000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(575000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(675000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(825000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ipe_nps_clk_src = {
+	.cmd_rcgr = 0x2019c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_ipe_nps_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ipe_nps_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_jpeg_clk_src = {
+	.cmd_rcgr = 0x211c4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cre_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_jpeg_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ofe_clk_src[] = {
+	F(225600000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(300000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(376000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(445000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(500000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(609000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(688000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(841000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ofe_clk_src = {
+	.cmd_rcgr = 0x20120,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ofe_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ofe_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(40000000, P_CAM_CC_PLL6_OUT_ODD, 8, 0, 0),
+	F(60000000, P_CAM_CC_PLL0_OUT_EVEN, 10, 0, 0),
+	F(120000000, P_CAM_CC_PLL0_OUT_EVEN, 5, 0, 0),
+	F(240000000, P_CAM_CC_PLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x21310,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qdss_debug_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
+	F(56470588, P_CAM_CC_PLL6_OUT_EVEN, 8.5, 0, 0),
+	F(80000000, P_CAM_CC_PLL0_OUT_EVEN, 7.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
+	.cmd_rcgr = 0x20104,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_slow_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_sqpf_clk_src[] = {
+	F(246600000, P_CAM_CC_PLL8_OUT_EVEN, 1, 0, 0),
+	F(411000000, P_CAM_CC_PLL8_OUT_EVEN, 1, 0, 0),
+	F(475000000, P_CAM_CC_PLL8_OUT_EVEN, 1, 0, 0),
+	F(575000000, P_CAM_CC_PLL8_OUT_EVEN, 1, 0, 0),
+	F(675000000, P_CAM_CC_PLL8_OUT_EVEN, 1, 0, 0),
+	F(825000000, P_CAM_CC_PLL8_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_sqpf_clk_src = {
+	.cmd_rcgr = 0x2021c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_5,
+	.freq_tbl = ftbl_cam_cc_sqpf_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_sqpf_clk_src",
+		.parent_data = cam_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_tfe_0_clk_src[] = {
+	F(238200000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(397000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(440000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(630000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(750000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(833000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_tfe_0_clk_src = {
+	.cmd_rcgr = 0x21018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_6,
+	.freq_tbl = ftbl_cam_cc_tfe_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_tfe_0_clk_src",
+		.parent_data = cam_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_tfe_1_clk_src[] = {
+	F(238200000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(397000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(440000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(630000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(750000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(833000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_tfe_1_clk_src = {
+	.cmd_rcgr = 0x21094,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_7,
+	.freq_tbl = ftbl_cam_cc_tfe_1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_tfe_1_clk_src",
+		.parent_data = cam_cc_parent_data_7,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_tfe_2_clk_src[] = {
+	F(238200000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(397000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(440000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(630000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(750000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(833000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_tfe_2_clk_src = {
+	.cmd_rcgr = 0x210f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_8,
+	.freq_tbl = ftbl_cam_cc_tfe_2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_tfe_2_clk_src",
+		.parent_data = cam_cc_parent_data_8,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_8),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_xo_clk_src = {
+	.cmd_rcgr = 0x21348,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_9,
+	.freq_tbl = ftbl_cam_cc_xo_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_xo_clk_src",
+		.parent_data = cam_cc_parent_data_9,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_9),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch cam_cc_cam_top_ahb_clk = {
+	.halt_reg = 0x21378,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21378,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cam_top_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cam_top_fast_ahb_clk = {
+	.halt_reg = 0x21368,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21368,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cam_top_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_axi_clk = {
+	.halt_reg = 0x212f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x212f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_rt_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_cre_clk = {
+	.halt_reg = 0x211bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x211bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_cre_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cre_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_ipe_nps_clk = {
+	.halt_reg = 0x201c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_ipe_nps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_ipe_scalers_clk = {
+	.halt_reg = 0x201e8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_ipe_scalers_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_ofe_main_clk = {
+	.halt_reg = 0x20148,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20148,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_ofe_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_sqpf_clk = {
+	.halt_reg = 0x20244,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20244,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_sqpf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_sqpf_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_axi_clk = {
+	.halt_reg = 0x212e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x212e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_rt_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_ife_lite_clk = {
+	.halt_reg = 0x2116c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2116c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_0_main_clk = {
+	.halt_reg = 0x21040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_0_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_1_main_clk = {
+	.halt_reg = 0x210bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x210bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_1_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_2_main_clk = {
+	.halt_reg = 0x21120,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21120,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_2_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_0_clk = {
+	.halt_reg = 0x21268,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21268,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_1_clk = {
+	.halt_reg = 0x21284,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21284,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_2_clk = {
+	.halt_reg = 0x212a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x212a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_core_ahb_clk = {
+	.halt_reg = 0x21344,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x21344,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_core_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cre_ahb_clk = {
+	.halt_reg = 0x211c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x211c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cre_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cre_clk = {
+	.halt_reg = 0x211b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x211b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cre_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cre_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi0phytimer_clk = {
+	.halt_reg = 0x20018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi0phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi1phytimer_clk = {
+	.halt_reg = 0x2003c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2003c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi1phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi2phytimer_clk = {
+	.halt_reg = 0x2005c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2005c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi2phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi3phytimer_clk = {
+	.halt_reg = 0x2007c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2007c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi3phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi3phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi4phytimer_clk = {
+	.halt_reg = 0x2009c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2009c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi4phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi4phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi5phytimer_clk = {
+	.halt_reg = 0x200bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi5phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi5phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csid_clk = {
+	.halt_reg = 0x212bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x212bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csid_csiphy_rx_clk = {
+	.halt_reg = 0x20020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_csiphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy0_clk = {
+	.halt_reg = 0x2001c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2001c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy1_clk = {
+	.halt_reg = 0x20040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy2_clk = {
+	.halt_reg = 0x20060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy3_clk = {
+	.halt_reg = 0x20080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy4_clk = {
+	.halt_reg = 0x200a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy5_clk = {
+	.halt_reg = 0x200c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_0_ahb_clk = {
+	.halt_reg = 0x21248,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21248,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_0_clk = {
+	.halt_reg = 0x21210,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21210,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_1_ahb_clk = {
+	.halt_reg = 0x2124c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2124c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_1_clk = {
+	.halt_reg = 0x21238,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21238,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_ahb_clk = {
+	.halt_reg = 0x2119c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2119c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_clk = {
+	.halt_reg = 0x2115c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2115c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
+	.halt_reg = 0x21198,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21198,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_csid_clk = {
+	.halt_reg = 0x21188,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21188,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_ahb_clk = {
+	.halt_reg = 0x201f4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_clk = {
+	.halt_reg = 0x201b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_fast_ahb_clk = {
+	.halt_reg = 0x201f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_pps_clk = {
+	.halt_reg = 0x201c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_pps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_pps_fast_ahb_clk = {
+	.halt_reg = 0x201fc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_pps_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_scalers_clk = {
+	.halt_reg = 0x201d8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_scalers_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_scalers_fast_ahb_clk = {
+	.halt_reg = 0x20200,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20200,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_scalers_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_jpeg_clk = {
+	.halt_reg = 0x211dc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x211dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_jpeg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_jpeg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_ahb_clk = {
+	.halt_reg = 0x2011c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2011c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_anchor_clk = {
+	.halt_reg = 0x2014c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2014c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_anchor_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_anchor_fast_ahb_clk = {
+	.halt_reg = 0x200f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_anchor_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_hdr_clk = {
+	.halt_reg = 0x2015c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2015c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_hdr_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_hdr_fast_ahb_clk = {
+	.halt_reg = 0x200fc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_hdr_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_main_clk = {
+	.halt_reg = 0x20138,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20138,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_main_fast_ahb_clk = {
+	.halt_reg = 0x200f4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_mp_clk = {
+	.halt_reg = 0x2016c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2016c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_mp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_mp_fast_ahb_clk = {
+	.halt_reg = 0x20100,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20100,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_mp_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x21328,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21328,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x2132c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2132c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sqpf_ahb_clk = {
+	.halt_reg = 0x20250,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20250,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sqpf_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sqpf_clk = {
+	.halt_reg = 0x20234,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20234,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sqpf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_sqpf_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sqpf_fast_ahb_clk = {
+	.halt_reg = 0x20254,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20254,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sqpf_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_0_bayer_clk = {
+	.halt_reg = 0x21044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_0_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_0_bayer_fast_ahb_clk = {
+	.halt_reg = 0x21060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_0_bayer_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_0_main_clk = {
+	.halt_reg = 0x21030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_0_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_0_main_fast_ahb_clk = {
+	.halt_reg = 0x2105c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2105c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_0_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_1_bayer_clk = {
+	.halt_reg = 0x210c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x210c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_1_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_1_bayer_fast_ahb_clk = {
+	.halt_reg = 0x210dc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x210dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_1_bayer_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_1_main_clk = {
+	.halt_reg = 0x210ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x210ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_1_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_1_main_fast_ahb_clk = {
+	.halt_reg = 0x210d8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x210d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_1_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_2_bayer_clk = {
+	.halt_reg = 0x21124,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21124,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_2_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_2_bayer_fast_ahb_clk = {
+	.halt_reg = 0x21140,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21140,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_2_bayer_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_2_main_clk = {
+	.halt_reg = 0x21110,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21110,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_2_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_2_main_fast_ahb_clk = {
+	.halt_reg = 0x2113c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2113c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_2_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_titan_mnoc_hf_clk = {
+	.halt_reg = 0x213a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x213a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_titan_mnoc_hf_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_titan_mnoc_sf_clk = {
+	.halt_reg = 0x213b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x213b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_titan_mnoc_sf_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tracenoc_tpdm_1_cmb_clk = {
+	.halt_reg = 0x213dc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x213dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tracenoc_tpdm_1_cmb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc cam_cc_titan_top_cx_gdsc = {
+	.gdscr = 0x21388,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_titan_top_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
+};
+
+static struct gdsc cam_cc_titan_top_gdsc = {
+	.gdscr = 0x21330,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_titan_top_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
+	.parent = &cam_cc_titan_top_cx_gdsc.pd,
+};
+
+static struct gdsc cam_cc_ipe_0_gdsc = {
+	.gdscr = 0x20188,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ipe_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+};
+
+static struct gdsc cam_cc_ofe_gdsc = {
+	.gdscr = 0x200c8,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ofe_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+};
+
+static struct gdsc cam_cc_sqpf_gdsc = {
+	.gdscr = 0x20208,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_sqpf_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+};
+
+static struct gdsc cam_cc_tfe_0_gdsc = {
+	.gdscr = 0x21004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_tfe_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+};
+
+static struct gdsc cam_cc_tfe_1_gdsc = {
+	.gdscr = 0x21080,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_tfe_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+};
+
+static struct gdsc cam_cc_tfe_2_gdsc = {
+	.gdscr = 0x210e4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_tfe_2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+};
+
+static struct clk_regmap *cam_cc_hawi_clocks[] = {
+	[CAM_CC_CAM_TOP_AHB_CLK] = &cam_cc_cam_top_ahb_clk.clkr,
+	[CAM_CC_CAM_TOP_FAST_AHB_CLK] = &cam_cc_cam_top_fast_ahb_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_AXI_CLK] = &cam_cc_camnoc_nrt_axi_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_CRE_CLK] = &cam_cc_camnoc_nrt_cre_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_IPE_NPS_CLK] = &cam_cc_camnoc_nrt_ipe_nps_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_IPE_SCALERS_CLK] = &cam_cc_camnoc_nrt_ipe_scalers_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK] = &cam_cc_camnoc_nrt_ofe_main_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_SQPF_CLK] = &cam_cc_camnoc_nrt_sqpf_clk.clkr,
+	[CAM_CC_CAMNOC_RT_AXI_CLK] = &cam_cc_camnoc_rt_axi_clk.clkr,
+	[CAM_CC_CAMNOC_RT_AXI_CLK_SRC] = &cam_cc_camnoc_rt_axi_clk_src.clkr,
+	[CAM_CC_CAMNOC_RT_IFE_LITE_CLK] = &cam_cc_camnoc_rt_ife_lite_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_0_main_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_1_main_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_2_main_clk.clkr,
+	[CAM_CC_CCI_0_CLK] = &cam_cc_cci_0_clk.clkr,
+	[CAM_CC_CCI_0_CLK_SRC] = &cam_cc_cci_0_clk_src.clkr,
+	[CAM_CC_CCI_1_CLK] = &cam_cc_cci_1_clk.clkr,
+	[CAM_CC_CCI_1_CLK_SRC] = &cam_cc_cci_1_clk_src.clkr,
+	[CAM_CC_CCI_2_CLK] = &cam_cc_cci_2_clk.clkr,
+	[CAM_CC_CCI_2_CLK_SRC] = &cam_cc_cci_2_clk_src.clkr,
+	[CAM_CC_CORE_AHB_CLK] = &cam_cc_core_ahb_clk.clkr,
+	[CAM_CC_CPHY_RX_CLK_SRC] = &cam_cc_cphy_rx_clk_src.clkr,
+	[CAM_CC_CRE_AHB_CLK] = &cam_cc_cre_ahb_clk.clkr,
+	[CAM_CC_CRE_CLK] = &cam_cc_cre_clk.clkr,
+	[CAM_CC_CRE_CLK_SRC] = &cam_cc_cre_clk_src.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK] = &cam_cc_csi0phytimer_clk.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK_SRC] = &cam_cc_csi0phytimer_clk_src.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK] = &cam_cc_csi1phytimer_clk.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK_SRC] = &cam_cc_csi1phytimer_clk_src.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK] = &cam_cc_csi2phytimer_clk.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK_SRC] = &cam_cc_csi2phytimer_clk_src.clkr,
+	[CAM_CC_CSI3PHYTIMER_CLK] = &cam_cc_csi3phytimer_clk.clkr,
+	[CAM_CC_CSI3PHYTIMER_CLK_SRC] = &cam_cc_csi3phytimer_clk_src.clkr,
+	[CAM_CC_CSI4PHYTIMER_CLK] = &cam_cc_csi4phytimer_clk.clkr,
+	[CAM_CC_CSI4PHYTIMER_CLK_SRC] = &cam_cc_csi4phytimer_clk_src.clkr,
+	[CAM_CC_CSI5PHYTIMER_CLK] = &cam_cc_csi5phytimer_clk.clkr,
+	[CAM_CC_CSI5PHYTIMER_CLK_SRC] = &cam_cc_csi5phytimer_clk_src.clkr,
+	[CAM_CC_CSID_CLK] = &cam_cc_csid_clk.clkr,
+	[CAM_CC_CSID_CLK_SRC] = &cam_cc_csid_clk_src.clkr,
+	[CAM_CC_CSID_CSIPHY_RX_CLK] = &cam_cc_csid_csiphy_rx_clk.clkr,
+	[CAM_CC_CSIPHY0_CLK] = &cam_cc_csiphy0_clk.clkr,
+	[CAM_CC_CSIPHY1_CLK] = &cam_cc_csiphy1_clk.clkr,
+	[CAM_CC_CSIPHY2_CLK] = &cam_cc_csiphy2_clk.clkr,
+	[CAM_CC_CSIPHY3_CLK] = &cam_cc_csiphy3_clk.clkr,
+	[CAM_CC_CSIPHY4_CLK] = &cam_cc_csiphy4_clk.clkr,
+	[CAM_CC_CSIPHY5_CLK] = &cam_cc_csiphy5_clk.clkr,
+	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
+	[CAM_CC_ICP_0_AHB_CLK] = &cam_cc_icp_0_ahb_clk.clkr,
+	[CAM_CC_ICP_0_CLK] = &cam_cc_icp_0_clk.clkr,
+	[CAM_CC_ICP_0_CLK_SRC] = &cam_cc_icp_0_clk_src.clkr,
+	[CAM_CC_ICP_1_AHB_CLK] = &cam_cc_icp_1_ahb_clk.clkr,
+	[CAM_CC_ICP_1_CLK] = &cam_cc_icp_1_clk.clkr,
+	[CAM_CC_ICP_1_CLK_SRC] = &cam_cc_icp_1_clk_src.clkr,
+	[CAM_CC_IFE_LITE_AHB_CLK] = &cam_cc_ife_lite_ahb_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK] = &cam_cc_ife_lite_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK_SRC] = &cam_cc_ife_lite_clk_src.clkr,
+	[CAM_CC_IFE_LITE_CPHY_RX_CLK] = &cam_cc_ife_lite_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK] = &cam_cc_ife_lite_csid_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK_SRC] = &cam_cc_ife_lite_csid_clk_src.clkr,
+	[CAM_CC_IPE_NPS_AHB_CLK] = &cam_cc_ipe_nps_ahb_clk.clkr,
+	[CAM_CC_IPE_NPS_CLK] = &cam_cc_ipe_nps_clk.clkr,
+	[CAM_CC_IPE_NPS_CLK_SRC] = &cam_cc_ipe_nps_clk_src.clkr,
+	[CAM_CC_IPE_NPS_FAST_AHB_CLK] = &cam_cc_ipe_nps_fast_ahb_clk.clkr,
+	[CAM_CC_IPE_PPS_CLK] = &cam_cc_ipe_pps_clk.clkr,
+	[CAM_CC_IPE_PPS_FAST_AHB_CLK] = &cam_cc_ipe_pps_fast_ahb_clk.clkr,
+	[CAM_CC_IPE_SCALERS_CLK] = &cam_cc_ipe_scalers_clk.clkr,
+	[CAM_CC_IPE_SCALERS_FAST_AHB_CLK] = &cam_cc_ipe_scalers_fast_ahb_clk.clkr,
+	[CAM_CC_JPEG_CLK] = &cam_cc_jpeg_clk.clkr,
+	[CAM_CC_JPEG_CLK_SRC] = &cam_cc_jpeg_clk_src.clkr,
+	[CAM_CC_OFE_AHB_CLK] = &cam_cc_ofe_ahb_clk.clkr,
+	[CAM_CC_OFE_ANCHOR_CLK] = &cam_cc_ofe_anchor_clk.clkr,
+	[CAM_CC_OFE_ANCHOR_FAST_AHB_CLK] = &cam_cc_ofe_anchor_fast_ahb_clk.clkr,
+	[CAM_CC_OFE_CLK_SRC] = &cam_cc_ofe_clk_src.clkr,
+	[CAM_CC_OFE_HDR_CLK] = &cam_cc_ofe_hdr_clk.clkr,
+	[CAM_CC_OFE_HDR_FAST_AHB_CLK] = &cam_cc_ofe_hdr_fast_ahb_clk.clkr,
+	[CAM_CC_OFE_MAIN_CLK] = &cam_cc_ofe_main_clk.clkr,
+	[CAM_CC_OFE_MAIN_FAST_AHB_CLK] = &cam_cc_ofe_main_fast_ahb_clk.clkr,
+	[CAM_CC_OFE_MP_CLK] = &cam_cc_ofe_mp_clk.clkr,
+	[CAM_CC_OFE_MP_FAST_AHB_CLK] = &cam_cc_ofe_mp_fast_ahb_clk.clkr,
+	[CAM_CC_PLL0] = &cam_cc_pll0.clkr,
+	[CAM_CC_PLL0_OUT_EVEN] = &cam_cc_pll0_out_even.clkr,
+	[CAM_CC_PLL0_OUT_ODD] = &cam_cc_pll0_out_odd.clkr,
+	[CAM_CC_PLL1] = &cam_cc_pll1.clkr,
+	[CAM_CC_PLL1_OUT_EVEN] = &cam_cc_pll1_out_even.clkr,
+	[CAM_CC_PLL2] = &cam_cc_pll2.clkr,
+	[CAM_CC_PLL2_OUT_EVEN] = &cam_cc_pll2_out_even.clkr,
+	[CAM_CC_PLL3] = &cam_cc_pll3.clkr,
+	[CAM_CC_PLL3_OUT_EVEN] = &cam_cc_pll3_out_even.clkr,
+	[CAM_CC_PLL4] = &cam_cc_pll4.clkr,
+	[CAM_CC_PLL4_OUT_EVEN] = &cam_cc_pll4_out_even.clkr,
+	[CAM_CC_PLL5] = &cam_cc_pll5.clkr,
+	[CAM_CC_PLL5_OUT_EVEN] = &cam_cc_pll5_out_even.clkr,
+	[CAM_CC_PLL6] = &cam_cc_pll6.clkr,
+	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
+	[CAM_CC_PLL6_OUT_ODD] = &cam_cc_pll6_out_odd.clkr,
+	[CAM_CC_PLL7] = &cam_cc_pll7.clkr,
+	[CAM_CC_PLL8] = &cam_cc_pll8.clkr,
+	[CAM_CC_PLL8_OUT_EVEN] = &cam_cc_pll8_out_even.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
+	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
+	[CAM_CC_SQPF_AHB_CLK] = &cam_cc_sqpf_ahb_clk.clkr,
+	[CAM_CC_SQPF_CLK] = &cam_cc_sqpf_clk.clkr,
+	[CAM_CC_SQPF_CLK_SRC] = &cam_cc_sqpf_clk_src.clkr,
+	[CAM_CC_SQPF_FAST_AHB_CLK] = &cam_cc_sqpf_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_0_BAYER_CLK] = &cam_cc_tfe_0_bayer_clk.clkr,
+	[CAM_CC_TFE_0_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_0_bayer_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_0_CLK_SRC] = &cam_cc_tfe_0_clk_src.clkr,
+	[CAM_CC_TFE_0_MAIN_CLK] = &cam_cc_tfe_0_main_clk.clkr,
+	[CAM_CC_TFE_0_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_0_main_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_1_BAYER_CLK] = &cam_cc_tfe_1_bayer_clk.clkr,
+	[CAM_CC_TFE_1_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_1_bayer_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_1_CLK_SRC] = &cam_cc_tfe_1_clk_src.clkr,
+	[CAM_CC_TFE_1_MAIN_CLK] = &cam_cc_tfe_1_main_clk.clkr,
+	[CAM_CC_TFE_1_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_1_main_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_2_BAYER_CLK] = &cam_cc_tfe_2_bayer_clk.clkr,
+	[CAM_CC_TFE_2_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_2_bayer_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_2_CLK_SRC] = &cam_cc_tfe_2_clk_src.clkr,
+	[CAM_CC_TFE_2_MAIN_CLK] = &cam_cc_tfe_2_main_clk.clkr,
+	[CAM_CC_TFE_2_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_2_main_fast_ahb_clk.clkr,
+	[CAM_CC_TITAN_MNOC_HF_CLK] = &cam_cc_titan_mnoc_hf_clk.clkr,
+	[CAM_CC_TITAN_MNOC_SF_CLK] = &cam_cc_titan_mnoc_sf_clk.clkr,
+	[CAM_CC_TRACENOC_TPDM_1_CMB_CLK] = &cam_cc_tracenoc_tpdm_1_cmb_clk.clkr,
+	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *cam_cc_hawi_gdscs[] = {
+	[CAM_CC_IPE_0_GDSC] = &cam_cc_ipe_0_gdsc,
+	[CAM_CC_OFE_GDSC] = &cam_cc_ofe_gdsc,
+	[CAM_CC_SQPF_GDSC] = &cam_cc_sqpf_gdsc,
+	[CAM_CC_TFE_0_GDSC] = &cam_cc_tfe_0_gdsc,
+	[CAM_CC_TFE_1_GDSC] = &cam_cc_tfe_1_gdsc,
+	[CAM_CC_TFE_2_GDSC] = &cam_cc_tfe_2_gdsc,
+	[CAM_CC_TITAN_TOP_CX_GDSC] = &cam_cc_titan_top_cx_gdsc,
+	[CAM_CC_TITAN_TOP_GDSC] = &cam_cc_titan_top_gdsc,
+};
+
+static const struct qcom_reset_map cam_cc_hawi_resets[] = {
+	[CAM_CC_DRV_BCR] = { 0x213d4 },
+	[CAM_CC_ICP_BCR] = { 0x211f4 },
+	[CAM_CC_IPE_0_BCR] = { 0x20184 },
+	[CAM_CC_OFE_BCR] = { 0x200c4 },
+	[CAM_CC_QDSS_DEBUG_BCR] = { 0x2130c },
+	[CAM_CC_SQPF_BCR] = { 0x20204 },
+	[CAM_CC_TFE_0_BCR] = { 0x21000 },
+	[CAM_CC_TFE_1_BCR] = { 0x2107c },
+	[CAM_CC_TFE_2_BCR] = { 0x210e0 },
+};
+
+static struct clk_alpha_pll *cam_cc_hawi_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll1,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+	&cam_cc_pll4,
+	&cam_cc_pll5,
+	&cam_cc_pll6,
+	&cam_cc_pll7,
+	&cam_cc_pll8,
+};
+
+static const u32 cam_cc_hawi_critical_cbcrs[] = {
+	0x21308, /* CAM_CC_CAMNOC_DCD_XO_CLK */
+	0x2139c, /* CAM_CC_CX_GDSC_CLK */
+	0x213e0, /* CAM_CC_DRV_AHB_CLK */
+	0x213d8, /* CAM_CC_DRV_XO_CLK */
+	0x21360, /* CAM_CC_GDSC_CLK */
+	0x213d0, /* CAM_CC_MMSS_AHB_CLK */
+	0x21364, /* CAM_CC_SLEEP_CLK */
+	0x213a0, /* CAM_CC_TITAN_CAMNOC_XO_CLK */
+};
+
+static const struct regmap_config cam_cc_hawi_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x26024,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data cam_cc_hawi_driver_data = {
+	.alpha_plls = cam_cc_hawi_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_hawi_plls),
+	.clk_cbcrs = cam_cc_hawi_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_hawi_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc cam_cc_hawi_desc = {
+	.config = &cam_cc_hawi_regmap_config,
+	.clks = cam_cc_hawi_clocks,
+	.num_clks = ARRAY_SIZE(cam_cc_hawi_clocks),
+	.resets = cam_cc_hawi_resets,
+	.num_resets = ARRAY_SIZE(cam_cc_hawi_resets),
+	.gdscs = cam_cc_hawi_gdscs,
+	.num_gdscs = ARRAY_SIZE(cam_cc_hawi_gdscs),
+	.use_rpm = true,
+	.driver_data = &cam_cc_hawi_driver_data,
+};
+
+static const struct of_device_id cam_cc_hawi_match_table[] = {
+	{ .compatible = "qcom,hawi-camcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cam_cc_hawi_match_table);
+
+static int cam_cc_hawi_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &cam_cc_hawi_desc);
+}
+
+static struct platform_driver cam_cc_hawi_driver = {
+	.probe = cam_cc_hawi_probe,
+	.driver = {
+		.name = "camcc-hawi",
+		.of_match_table = cam_cc_hawi_match_table,
+	},
+};
+
+module_platform_driver(cam_cc_hawi_driver);
+
+MODULE_DESCRIPTION("QTI CAMCC Hawi Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

