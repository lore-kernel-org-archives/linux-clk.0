Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE12C0303
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328280; cv=none; b=HW2DmCRwSKFv/JdldlEKeTF8v227NTjEB3WJmN5GX0DZDG7QOnP0MyRQRvgG3qd6wFe1cqxXf886vXCX1JSNF8UOPhd5+tbE9+9Bf8Vk1LowIiQbfohagfcjGlhvjJ4MgwI1FlOjFLBcPFJdxVJsVP8D1+5TXThBQjkSjk8JDtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328280; c=relaxed/simple;
	bh=ZHbltqqZhUD1jVo7+BO4TeZyxRK+L4LqOOOuyvVz8D4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOi6B5d0ZtMYrvUwMJzaaJYTFUYkbZemdsOMzpYfJb/f3hvnvmfHmZaGURypRPIOrrPjSCmWkTEQihdDc0EZ00zdlfUAGYY3YK9sRBZKR+wA+R+7beIte2CpgfaoLf8SlrS6nJv4aSSKBVHrn9ndPRVTuCr4Juf+M7j6Mc+i100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXDi2QE+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gt5dSqR1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXDi2QE+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gt5dSqR1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668NIpu4073011
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 08:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lk0MzSHtBA/os5t8H9YsGzmeBZcs5r1cPhVETqwWRBg=; b=oXDi2QE+jdZs3fZT
	6qIBfJEX4ypWqSLdSD8u9PsnKhtqqbW6/tjFKyDx7MyRTz0FatC6VrTr471aNPIz
	ePgOAUUKmQ9NEVHUrLYVa4PSV+S0x3jiMzlzrjS03kmHx/X+I8v2FYKZ0LI4ROYF
	xtYbWABXD07yCnh/er670PSXQKnINE5zedX1+qBtIePGfXit3pOMo5ge3rUXt52t
	ZK48teU8NtPS7rYqrXe+YL7u15WuJ0UwgPIUpCmCIxuE57YFFwh/2mjYTYmZLh61
	cmAF2SFsQQe21ZhNxWJ9NTL8J/EAodZAaXPMXKGCKyouAULYJpHBHjaOuyCscO5f
	wTO7AQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t884gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:57:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6bbd0afffso58813735ad.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 01:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328263; x=1783933063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lk0MzSHtBA/os5t8H9YsGzmeBZcs5r1cPhVETqwWRBg=;
        b=Gt5dSqR1kE/qRykZQ9M4fTt730o25TZEQVEEa+7aNAmTRKHTvfXmxYlnUoX2to/leH
         rzoWKymq9XsWd8dfXNIYrZr6sWsY6Ms0roCs+C5Edltkatg1vbOCrNcgyyC4jpKhdW9W
         kGZmVxtL5+3QecNWUjdIuy0Sb2syfig0G/CaGnHuZpS7eXI4BI/TZGa4+MzRhdWF0rZ/
         c/Qkh4cfy7zlyqX7fE+7zaYyJOIQW/HNbVS9EKlVumt8yPZg+4Y9eqBwzTSLVWZRdSED
         AC/9ovpjpeFqdlNlCH+NcCkazR/aMViIgoTP6VT69usrJ1MA4lPIoAQpGFKSb5ZrYKVv
         WziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328263; x=1783933063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lk0MzSHtBA/os5t8H9YsGzmeBZcs5r1cPhVETqwWRBg=;
        b=rGbldhSh3sPhGq1LM1fipr4O8y2bvVKUap1cxUsNfDoukQHnqP0v2reLsNxkXGTcC+
         4irFEc03TJqeiKkxDVFjydV4dgE0sjFSz3MvFawFx3aB+pVbUTtvRXiKq7I5rAnBdKUH
         OmBVQLFUXqw/+TRHSmlMiaxZAy8QP6PJIsridFvGYttDX2ikyztvfPCAj9FTMk/U07gH
         6MkObRmrvOU1bKTukpGI+5RyPlyN/W3aE7Fzj7A79kQywgxsadymtHgXgfmEBsuocF84
         aqGIyTCZJpIWrzYWtFXOCma85ItAHySPOSbRFXpQ42/VO+PJjC20jshBX2rFdZvvt8+R
         Xc1A==
X-Forwarded-Encrypted: i=1; AHgh+RpbuV6JbbPATKK1sT/ezRrPtAQ3CWXyYeGapyaxztkVcpkhBXj4naxP8BLVcsWZnZhcnuTzyIdDZhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxheNO+0GQk6Pe5fGkny9gAivBr3jlyD0L8XHsrJ/Ybeu6DALkk
	jckDD7a1EsCr1e3cXpyncUASjK41t8WQ9q7chYyqRblcsflgcMuSb5ygp/t8mXxM2AGGRSjbEUf
	yOFcN4gqcyH2aQoNMTl8gANkQhiigubx0Xq17oMlU5eiNAYRqYFAHzqmUeV8tjaY=
X-Gm-Gg: AfdE7ck10syFxsy2UgslQ9gX66XTBrmoZurr7vK/He5bxGglyxVcXGQCk0uz8mtNuoZ
	Bzwh5LIrLFCIZYO1bBQOFsIQqF6xYEPFT6KGpCnv3u64sF6aBNPfXzizEKO0P44mNt0GtHHOW9s
	aop1koKrPuLlAnOBihiVo3lGCX8tQ7i8fM9AiuC5SC7gEANXhianzMOEViU7P9lLQWLr7tyCtKa
	j3kG0SLeFsRakZSCMlwz/0c0aRT5OXNr7d0u5dGThO7FQC37Staiy5d5MqzHO3mjsW6qSCRrQas
	mYyxdgdzf5R6dhvhhe0T9VumAJg2GKWHtT1vJ2yeu6/ma7WjEYGnreSGFtKqIPU0xeV8ZJRDJpx
	QuLTJOCSArOQJKIyeb3m1csmu58ThB4RU8MI=
X-Received: by 2002:a17:903:2c10:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cbb9f0419cmr97187615ad.45.1783328260683;
        Mon, 06 Jul 2026 01:57:40 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cbb9f0419cmr97186455ad.45.1783328258985;
        Mon, 06 Jul 2026 01:57:38 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:38 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:27:15 +0530
Subject: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX/PeRbcxvyFCO
 kidAYdcNlzw+JFLhcVP71cdTxX7qL2xYqcZ24Ya+BFZUg8mAgJpVO1uL4LrCFmU5QUnqJEDBqx4
 47rmF+e3ZeR+uZgVzifMmUg1Tb+JWBw=
X-Proofpoint-GUID: w_TiStVrCZF4FfitT2rlc00uk7Frn0Hc
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b6e07 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rPu78mh4tk3JbfRwBHIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: w_TiStVrCZF4FfitT2rlc00uk7Frn0Hc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfXwpG7y0BGR1/5
 49a5ss1i8oR6Qf1BZXB2osTIv1SXHlBcmHvlc1/l4OMyRCOSf++ouZo/aMWOv2NoWfRT5DhU0pZ
 fn6Mk32sitrEo1gsTVppO19J2uhW1EzK6pvdaPgjIZKaf3SXz8X6ncVwogu/USimWhCnknVUtYV
 eyLM5K0RePPfDYghR3PXqIOAY6qVKkKteOzsUmJfeEDTs9VDTrDal8VMnsvh/RqJGvwi7144IVR
 N5kIJOrXJ5nTB50m1lxWGESV5zSsoHiA8iTm1hiUaDGBcxdMSs6r7gSc+BFQEKTtGoJUysq3AFb
 wVtMwlUG2/JHDUkxI2I4kGJfBLNcdaI+e/krm4csrtclgg1XCwKYTAxt/jL8cIVYm8ccaOmouMQ
 g2dIqziGXevpuJh2r74aNXLNh2K4bJhFQZ5DtQSmCFJyUwtU+qxCIj/ph6fXVoACD2D0Uo3vIK+
 KYE/rp9XeM/gCBPodJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060089

Add support for the video clock controller for video clients to be able
to request for videocc clocks on Nord platform.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  11 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/videocc-nord.c | 507 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 519 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911a35430bba7670409f59972dcca0f..b634036d7e9f5dfff44d2ce871d0776b09b6d4a0 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -155,6 +155,17 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_NORD_VIDEOCC
+	tristate "Nord VIDEO Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  Nord devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 58f9a5eb6fd7fc457607a179d8bab5623fedf706..d76675b9d6fc2b5b1fff4513ccb203ca8f5c9c7c 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
+obj-$(CONFIG_CLK_NORD_VIDEOCC) += videocc-nord.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/videocc-nord.c b/drivers/clk/qcom/videocc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..ee73e89a01daac8c72b67ebe058a3287ba0656ad
--- /dev/null
+++ b/drivers/clk/qcom/videocc-nord.c
@@ -0,0 +1,507 @@
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
+#include <dt-bindings/clock/qcom,nord-videocc.h>
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
+	DT_IFACE,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 720.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
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
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1305000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1440000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1680000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0x80d8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x807c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_freerun_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8114,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8114,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8114,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x811c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x811c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x811c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_freerun_clk = {
+	.halt_reg = 0x80c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_shift_clk = {
+	.halt_reg = 0x8118,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8118,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8118,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x8068,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1_gdsc = {
+	.gdscr = 0x80a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_nord_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_FREERUN_CLK] = &video_cc_mvs0_freerun_clk.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_FREERUN_CLK] = &video_cc_mvs1_freerun_clk.clkr,
+	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_nord_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_nord_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80dc },
+	[VIDEO_CC_MVS0_BCR] = { 0x8064 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
+	[VIDEO_CC_MVS1_BCR] = { 0x80a0 },
+};
+
+static struct clk_alpha_pll *video_cc_nord_plls[] = {
+	&video_cc_pll0,
+};
+
+static const u32 video_cc_nord_critical_cbcrs[] = {
+	0x80e0, /* VIDEO_CC_AHB_CLK */
+	0x8138, /* VIDEO_CC_SLEEP_CLK */
+	0x8110, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa060,
+	.fast_io = true,
+};
+
+static void videocc_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Enable clk_on sync for MVS0 and MVS0_FREERUN clocks via
+	 * VIDEO_CC_SPARE1 during core reset by default.
+	 */
+	regmap_set_bits(regmap, 0x9f24, BIT(0));
+}
+
+static const struct qcom_cc_driver_data video_cc_nord_driver_data = {
+	.alpha_plls = video_cc_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_nord_plls),
+	.clk_cbcrs = video_cc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_nord_critical_cbcrs),
+	.clk_regs_configure = videocc_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc video_cc_nord_desc = {
+	.config = &video_cc_nord_regmap_config,
+	.clks = video_cc_nord_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_nord_clocks),
+	.resets = video_cc_nord_resets,
+	.num_resets = ARRAY_SIZE(video_cc_nord_resets),
+	.gdscs = video_cc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_nord_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_nord_driver_data,
+};
+
+static const struct of_device_id video_cc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_nord_match_table);
+
+static int video_cc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_nord_desc);
+}
+
+static struct platform_driver video_cc_nord_driver = {
+	.probe = video_cc_nord_probe,
+	.driver = {
+		.name = "videocc-nord",
+		.of_match_table = video_cc_nord_match_table,
+	},
+};
+
+module_platform_driver(video_cc_nord_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Nord Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

