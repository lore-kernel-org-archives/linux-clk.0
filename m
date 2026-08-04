Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F7496914
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865894; cv=none; b=gDi9lYMFYwV1v3cwXtv5LT/pbZET/arksjV2Jrn2SOzv/exLlWHqyEyrDv/pqiuE0ThkOTTt0ZpVabxXM5DPU80f/mzhnrvh5NoQcADxqeKD6p9EJCCrWE52s9vclsPrbBYAupcuRQnc/2lV+FSU8AOT2MTApLaq3MHaquLUzpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865894; c=relaxed/simple;
	bh=xfiluVGIh4FmtO8UzZMq++55r931C9WWMrEh7ONDvG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkUfJerLr+ZaMmRofY30DYrHCOeGI5fKUxtT9BYsgGQHE4gyy924i792M4lqbB+1ffmfg1fWe5qCe+Q3aHB+Uye5kbdxxiLSSL2iRipfP2ur8XQkWdVqLQwSlpJTFXHY0p1cfxSD6RhIfI1OJZMqX5Ca7LEx399jxoXWIxU2qGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Au9kH6hc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kc+WqC6l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Au9kH6hc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kc+WqC6l"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0Ek0268942
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 17:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeY6NIhzLEbUMqnhdB0zNgmjsU/g5DikHDRZkKVU0A0=; b=Au9kH6hc5IZj9iV5
	zrReQ661yhgUf2silQaGy+k3EoUKpxz6U3BiwsMakvm3hl1XdWoWO960Bzd94uDI
	tsfxfPcJQHKukrrAzz6VTwRX4nwfyOTjh4JamDthyQbdYmdeoWNQDRJVpsttILC4
	J31O/iCgn/C0xVn1U60KhU67QjRDP7EWi3uGOoe4AKtTSwURWimvSH4s8VGRitao
	MnDCy/GKsDNO7M2v3CVpxEc+3kNfd5I1zzpez0tcKqQA6NXhF/K5yLkwCnvG2/7O
	U0uWgngJtrw4G++k/xJfZ+2zrZ53aamqs+OCZbvwWJ1aCRPmy9hzvGOU5eAEXKzS
	gBH0tA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nr876-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 17:51:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so120990a91.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 10:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865883; x=1786470683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeY6NIhzLEbUMqnhdB0zNgmjsU/g5DikHDRZkKVU0A0=;
        b=Kc+WqC6lVj58o9Uci/9/tHm/eDuy16MAVmYcBGPECf3mmoS7nSnJhMBD1mphMiz+eT
         XLgNVInIA7p9HRSW2wtbMI9CGV57LMbYfEtSbRhhWNU/kEPpu6xrvOfOBQrBt6KB41P/
         kSYDif7I4ssmWthZuoXj9LeAIbdVTeNvvKf1r5c44bsQqij0VnbEDz+tIZX4xESulmmF
         co6t9S4my7JVBNWlirb65+Tn50q2AwSqaHomNkYLCpHoG3lQOPhvPgM2fxP4vs2beMQu
         JY2T86zFA4/tPLVLO7pPrZ4N1lvXzsf7ueOK/DxyyXmK8nv5W89/7j4qcXLvk3P+K0+e
         FtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865883; x=1786470683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeY6NIhzLEbUMqnhdB0zNgmjsU/g5DikHDRZkKVU0A0=;
        b=oyCI8WAmRq0IY+/0bF3MMSGQmTTvO8Ldptav8OlXExfHkkNAVjXsWJ+2BQhLqa96Of
         pAUCLxG/GSWW9Uv1qlHG6muQnHAigx9pJp2VmiPLXYWIA512QxqMEtw9xuYFaCCKKRWc
         WoGUGGv6FQ+jkX/o/iNCo/+4gwGO9H9DRnHA1aUOi3+Fdluke5jCCkPMhEztpm/UsOCo
         aApksuDSdiiiEw+/tl9w51cVNlYm7kf5oppaFyCcH+ibnrmNLDk5DBlAybxqoG9PN4w7
         kcSZW1qWI8AWGfMwrqa5HPlHGSQe4RG0daI29H22SrTbyF00/iQFhTnKCCSL75jwhXr9
         N52A==
X-Forwarded-Encrypted: i=1; AHgh+RoQt2FOwhnmhycuo/LQ4738xyh+g3hQ4w2S2GlpEN3f6EhKXBQURdRbpV6c20VhHtCd7hZYCoU43dI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOR9Zj9Rx+FvSeygPfP51vRdko7z1gg22dVdcabLYfMyaucI0v
	/UKxJQIinySZ4MfEBr8rmupTOwHzBBxGt0gl1uLlWHhxUPrIS8pK6Xda18vvaX/4XDlUWj29Ryu
	Sjt7/YGatncroWCqIKih5Wylb21clhgev6Fkjqse4tDcWuQeNWg1GPLHDpb67Cho=
X-Gm-Gg: AR+sD13ajFNG6EkwFpC8aqrZIkS/gOH3DgW/0XnpD6wrAt5HnzgywnHJX3uL9Yl0v4s
	jC1FnjK8pFeDy+BOGUhMvf3HebpWGwJWnwBMTZK3iNeIfNVM2TxvRY8lrp69ugi1GU/4VV1Ieq7
	dHLJanSTN0MUz00Pj/kAsBNbM0ZajewU23yOWa0YQSxzxJm5trJoEF+eyEYhfnBYfcP2ChD/y9o
	QluWUC/AYoRtBmEkixikisbm29/MKWN82fj9x3wJMtO5te+yPswU5ndKM5nAlOzp7gUPrSjScUm
	P/UtpK9iDbswxpp4j1vRfqbwdAk70tBkZczwmrysdF6tWoLN5w6odHwIsrSWERtW8pzHsbFRSTH
	jfHX9RjAqjZgJdibcNPzo8jsD
X-Received: by 2002:a17:90b:1808:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-3903c545edamr552343a91.5.1785865882880;
        Tue, 04 Aug 2026 10:51:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1808:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-3903c545edamr552291a91.5.1785865882302;
        Tue, 04 Aug 2026 10:51:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:51:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:20 +0530
Subject: [PATCH v9 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-7-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX+/NVIoS3TdpJ
 QPAnAMGO9K1tU8Rk0xYW0x8OXB/V6+N9GTRW4xNnGpC8WsTh4zW+IQ5s7aX5Dooxx5EFtswHCJC
 znWyKf1d98l9dYJIJjUyKf1WFYDOg0ATtadpap9rzhGOTPpTcE58PM8PAGZQOMK/ROJ7XlpNQ+W
 PP87+sn7cAh8yWPgfnFfMpC2hLZpmpeFEJbnM3buILkCUVBfUvmCggDCFLaKv5drEBVIf9Db8ta
 WV1Bw7WW//YSnNcEuejx38SW3JGfEBLzvhLN1NjKtaxAoA0pr6bGNK3es3Xvp5uD39vx5ABx5vY
 /XWzMZNHzSUCZ1ecZHzsiGRk+m3b5GugZVF198kB/D0BsArat8e9lwN7yRHJzfJQ84zxInbC1yR
 quqN6kMrq+OEy6NSHpvjoo5gnd2nT2BN/JY25Sc5noG8Ys+pjUTMzG1DV4z1rHisWEqhDIGW8es
 6+7UpGRBN2c4jKTBIJQ==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a72269c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fDr36jkL0Xr7p1dDRlIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: l1Av_jjs3YiEgOsHwpnBjBfSQAagcHQR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXyOwpLEydVnwu
 nRgFezro/M7HwAku8YX9poikfgTH4t0Fkd9ZJg6BjCyX9p6OjdZoxizz20Cbqn41fmIVi5KDSfc
 MD/VQRkWg1eU7iSIfCqgEV7D+X0StbA=
X-Proofpoint-GUID: l1Av_jjs3YiEgOsHwpnBjBfSQAagcHQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144

Add support for the video clock controller for video clients to be able
to request for videocc clocks on Eliza platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |  10 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/videocc-eliza.c | 404 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 415 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d1fc9bf87126b2588195558588142aebd57c0f52..638912172e1ed0d4174ca2fdeaca3ce6741d0723 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -59,6 +59,16 @@ config CLK_GLYMUR_CAMCC
 	  Say Y if you want to support camera devices and functionality such as
 	  capturing pictures.
 
+config CLK_ELIZA_VIDEOCC
+	tristate "Eliza Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_ELIZA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Eliza devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index daf25d583be28b845985c8fb1b72392e4892bfbb..b394d9218989a5a38a3ef6703519a3413d8efb81 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
diff --git a/drivers/clk/qcom/videocc-eliza.c b/drivers/clk/qcom/videocc-eliza.c
new file mode 100644
index 0000000000000000000000000000000000000000..9112ded781c235473bcbd8b8c735283c7d058922
--- /dev/null
+++ b/drivers/clk/qcom/videocc-eliza.c
@@ -0,0 +1,404 @@
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
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
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
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+	DT_AHB_CLK,
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
+/* 576.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x1e,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
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
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_SLEEP_CLK },
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
+	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(633000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1113000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
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
+static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x8110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80f4,
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
+	.reg = 0x80ac,
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
+	.reg = 0x8058,
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
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80a0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80a0,
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
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8144,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8144,
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
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x8148,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8148,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8148,
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
+	.gdscr = 0x808c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *video_cc_eliza_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_eliza_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_eliza_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80d8 },
+	[VIDEO_CC_MVS0_CLK_ARES] = { 0x80a0, 2 },
+	[VIDEO_CC_MVS0_BCR] = { 0x8088 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x810c, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_eliza_plls[] = {
+	&video_cc_pll0,
+};
+
+static const u32 video_cc_eliza_critical_cbcrs[] = {
+	0x80dc, /* VIDEO_CC_AHB_CLK */
+	0x8128, /* VIDEO_CC_SLEEP_CLK */
+	0x810c, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data video_cc_eliza_driver_data = {
+	.alpha_plls = video_cc_eliza_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_eliza_plls),
+	.clk_cbcrs = video_cc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_eliza_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_eliza_desc = {
+	.config = &video_cc_eliza_regmap_config,
+	.clks = video_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_eliza_clocks),
+	.resets = video_cc_eliza_resets,
+	.num_resets = ARRAY_SIZE(video_cc_eliza_resets),
+	.gdscs = video_cc_eliza_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_eliza_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_eliza_driver_data,
+};
+
+static const struct of_device_id video_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_eliza_match_table);
+
+static int video_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_eliza_desc);
+}
+
+static struct platform_driver video_cc_eliza_driver = {
+	.probe = video_cc_eliza_probe,
+	.driver = {
+		.name = "videocc-eliza",
+		.of_match_table = video_cc_eliza_match_table,
+	},
+};
+
+module_platform_driver(video_cc_eliza_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

