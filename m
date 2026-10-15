Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7352FE36
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071353; cv=none; b=R7q9Kf0Kk9eu5IkOFYHrI2TCKPqZv+JRfVrHugAkMqRE99zcbbJm8z23XkbzD7tsYYGKx9gxHRcxigxU2HOecaApaHJpDqTcVScIADAjp7sPNdrCvl24bis4RFSOBBiHXS2UHxpXecIiLGYaWUCUYeS0gyrvcA+GgcpXITZMBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071353; c=relaxed/simple;
	bh=ANGYa6xStmd5RkeSYczi4lnlS2W3c8plLCbN9tzOolQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbo5ylYX7xND22L2k1BtNj85ZmiQWP7QInNavvfMHbUpiojC0qtnJcX6jnS3aJyS98RdhdUpVgAxmlq6pfa+xQUc9MgiD9L4Sy6hJgvVQmCRjVREzgsaY6mUAZZ2kYdTIxM6qcgugYXdVyN3zDYAnQEzlUvVnsllfOHWt5nw5Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9gsUEim; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcDin77B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9gsUEim";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcDin77B"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jn7c3408833
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mU4utiyJpaBbnghkOL3PMYOkch49AvfB3tYq5mHxmhE=; b=J9gsUEimGnoMdUFH
	aV4zQbhy3O/eX44MlbfglHqL6M8CuPb7cjGxvFC6yCI1i3Efuy3Mc+2N5M6fk49H
	WwvYvBuIq2COHF++fIQt/6Zxr+julPZnSwWS3vkAyucx9i3bourqUV1ygMOCaOvv
	TtEGKb0WmWGSLrdMbZ2MYRR/ivoWjyZk2gJ6e4BMuHMgoQxPhzrhOwpbsO9AL2TX
	0KnPHYV0a2J3xy3sWJpuABXL5twdOiAsxqCuROmFQkJrBePjvz+uc7W46ZKMfgyk
	Fh5EZAl4lXDS2AHafIWeuHjNZJS4AEQDFJEKcWjJlmxGsERBpV9y1XKzEuYGHzd+
	FUA8eQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn300w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e84ec157fso488559b3a.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 06:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071349; x=1792676149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mU4utiyJpaBbnghkOL3PMYOkch49AvfB3tYq5mHxmhE=;
        b=NcDin77B7ouNGmgEGpnv+LINUX/6JSnpZGJmRVRLdDDA+RGq9AjEvvAgOPXRI/J0CP
         sHGzSewaa4nuuZWJb+o/cfpQIUojcv0AY25B+n4cMl1Lo+D6UfsIe6Ez6TVzWAjvgPha
         YE6O9IWTXJzW8qKf+TlGwvRNdDOciUEAjw08app8qzGKgM4/WWtyijQREQhcszlRLgG6
         bGmZj+c4pHwwcLGmV2r6MbumxuwE9HuX2pR8VlQJzN/bToqfJJiakf5zlW2PfdptjNNs
         IGCvKlmU9oY/XDjJd5htDigWZhTyynWbF8AvpqYt71x8CuTEkmKC1uDwPmTd8y4pe2kz
         J+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071349; x=1792676149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mU4utiyJpaBbnghkOL3PMYOkch49AvfB3tYq5mHxmhE=;
        b=dmRXSJKpV6h//290D9iOwdc86yPxGdkdCO/P7MfjhnUEp+0nUvz0NEZbUCpylkri7e
         xvfz9mr4IeJe6MzhF9O/2zG24FyIOn0fkqZLfNiK3PR4C2DTRi3S6TKaXTOjnRyEApC8
         Pehv/QQL01PTQB09NWYfBKWF/ORuTtzHuHJluLm1S4YJ6bhVsOlUbDf/19HmShEMhQnt
         oIvNr63ejF7/7iy75kcdUkGQ2slH3bmHWnwNDHFLBGw/5/o/4LzIk1E6F4graBjXl/BD
         U9cvVeUGCtmBS9OU3Vv317P3n9QdkVmj8NWwKej423xTaYExa4u1Yx3Us2bSqZfs3BHz
         Mstg==
X-Forwarded-Encrypted: i=1; AKwUvByPpdybYZ0DOFRu8+G94kqphkIxMOqHk/0mHZhmqX3eO4h82C+i195ogoJ0WIRkJIt9uHHqQZwNNTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLbhhLPPs9ZXRbKPhBMYStZJ7gRf0l8wlkeKU/ceNQiH9siJ9v
	6HLggwGM7STBhaKcizNUmN01xABLnh4XxMbhjn1KkcOmO7Wp7jSL1SLZBsxa/nB+35ba9i5H8WK
	YA804F6OS8ffOwcTG//szc57iXTjYLYiN7kRfq4DEjlYsHJWAp0AY6XATZjaa6ho=
X-Gm-Gg: AYBFou3K+pPEC4raW6/iO6EoxrmnPE4zYM5830Hls49NamO030QvPOW3EJTcUvCo86+
	rTv13OKGjN4A9AZ3IU9S+MfO6/Bz/Zjv17APS0iVeN0j7rjJGyU6HqcTi/Iwh12OFsyoFUnxIub
	e3oiArgNDI3FXFnQqAfB1Q00kPchOue39s+05DUaxESR+9kTV2b8dQ36JLlfviyslPsULB0fU9V
	HVy+/fALQke0XC0mC5UnmCrqOvY/9bZjYCpfOLl3ulSRCfm9EpRqz6BCwz4VmJXn+6HTGVubO74
	sy9KbNn3hjyY/xHxGR2TQcaKIHXWUgyuhI045mcpEraf1cJyFI/B8rnSjnKHg1CLwrg/CGGIKai
	cG+ayV+sPypcncKrKlNqRkmXQlaMKKA==
X-Received: by 2002:a05:6a00:3022:b0:874:706d:8577 with SMTP id d2e1a72fcca58-897c6b29a06mr15633587b3a.31.1792071348867;
        Thu, 15 Oct 2026 06:35:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3022:b0:874:706d:8577 with SMTP id d2e1a72fcca58-897c6b29a06mr15633543b3a.31.1792071348317;
        Thu, 15 Oct 2026 06:35:48 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:47 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:05:03 +0530
Subject: [PATCH 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock controller
 driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur-av1ecc-v1-3-448a476d54af@oss.qualcomm.com>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX4m5JJCYhg26M
 oxiC3PG0pf5jWG8xjn8McOcu28o1Cyl0+n39BGQfy/WjeFAJLb75sq+NCRcFVrPmhLWWWo1wRwW
 zx9abrWZp3hja9/1xdJYrIBU93oUUxjSYpSYXVqrmb5S9gyRUXKhzEZfYerpbdS9fL5+mHacAMN
 6kvvAloDx7ylo0APtMZl4UkH7QvbKZbV1brGm8cXTMCXcNBxxPdKARtVBBtk2gz2BsTD2pSXBAA
 eb6E8DvMa6na+QPa/SjBUoserl1pYPI7KogLGtZ9H6lHDRua5UcXAbWeJxiObi45xTIxekE3KBj
 Qi1ytKpoVBqdybTpCqD7x8PVhGVfgDtxP1fBWDkR0xAQ6vsOqdDtCfz4/FKumcWRSItvjTHwSnK
 iBuoFnr0LeX4ry5Nt0CwoOQNVx74YFy35Jnj+vjH6pW2YmQwvq8okGi6KI4vcnaRzPaMV9QiA1U
 1TuBlINEB+Puu3AbdGg==
X-Proofpoint-GUID: NBr-H_ad9fi5pjAIEmk1n_9k4CkcvHmh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX6BCblerPSNxe
 zqCIuNU+9ij2Ud40Y5LmwNYNLbmQEMqEIcoNF8O1LeAl2IpxREo1VTvbDCGBkQID9xaT64IRLqf
 bDeAH7v/0I2xvCgNo5ezOf5CHfPT4oM=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0d6b6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hq77mm9E1D9dZevUziYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: NBr-H_ad9fi5pjAIEmk1n_9k4CkcvHmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150054

Add support for the AV1 encoder clock controller (AV1ECC) driver
for clients to be able to request for AV1ECC clocks on Qualcomm
Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |  11 ++
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/av1ecc-glymur.c | 393 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 405 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a4ca5587ed8d6085c4d6fcd57eb8c..94f3445f6bd0ecd297d83b5804ff0e4433d48261 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -69,6 +69,17 @@ config CLK_ELIZA_TCSRCC
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
 
+config CLK_GLYMUR_AV1ECC
+	tristate "Glymur AV1E Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video AV1 encoder clock controller on
+	  Qualcomm Technologies, Inc. Glymur devices.
+	  Say Y if you want to support functionality such as AV1
+	  encoding.
+
 config CLK_GLYMUR_CAMCC
 	tristate "Glymur Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f269d18f1b78d6c7f92e14baeade1e5..61d4efb7547146544902dddf52e4853d073d5467 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_CLK_GLYMUR_AV1ECC) += av1ecc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
diff --git a/drivers/clk/qcom/av1ecc-glymur.c b/drivers/clk/qcom/av1ecc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..228e73a1a1357dc9ebe508b9fbcec71326388806
--- /dev/null
+++ b/drivers/clk/qcom/av1ecc-glymur.c
@@ -0,0 +1,393 @@
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
+#include <dt-bindings/clock/qcom,glymur-av1ecc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
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
+	P_AV1E_CC_PLL0_OUT_EVEN,
+	P_AV1E_CC_PLL0_OUT_MAIN,
+	P_AV1E_CC_PLL0_OUT_ODD,
+	P_BI_TCXO,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config av1e_cc_pll0_config = {
+	.l = 0x1f,
+	.cal_l = 0x48,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll av1e_cc_pll0 = {
+	.offset = 0x0,
+	.config = &av1e_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map av1e_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_AV1E_CC_PLL0_OUT_MAIN, 1 },
+	{ P_AV1E_CC_PLL0_OUT_ODD, 2 },
+	{ P_AV1E_CC_PLL0_OUT_EVEN, 3 },
+};
+
+static const struct clk_parent_data av1e_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map av1e_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data av1e_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct freq_tbl ftbl_av1e_cc_av1e_core_clk_src[] = {
+	F(300000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 av1e_cc_av1e_core_clk_src = {
+	.cmd_rcgr = 0x4018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = av1e_cc_parent_map_0,
+	.freq_tbl = ftbl_av1e_cc_av1e_core_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_core_clk_src",
+		.parent_data = av1e_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_av1e_cc_av1e_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 av1e_cc_av1e_xo_clk_src = {
+	.cmd_rcgr = 0x601c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = av1e_cc_parent_map_1,
+	.freq_tbl = ftbl_av1e_cc_av1e_xo_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_xo_clk_src",
+		.parent_data = av1e_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div av1e_cc_av1e_noc_ahb_div_clk_src = {
+	.reg = 0x5020,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_noc_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&av1e_cc_av1e_core_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch av1e_cc_ahb_clk = {
+	.halt_reg = 0x6000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_apb_clk = {
+	.halt_reg = 0x4044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_apb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_axi_clk = {
+	.halt_reg = 0x4040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_clk = {
+	.halt_reg = 0x4030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_gdsc_noc_ahb_clk = {
+	.halt_reg = 0x5024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_gdsc_noc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_ahb_clk = {
+	.halt_reg = 0x5028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_core_axi_clk = {
+	.halt_reg = 0x5004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_core_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_xo_clk = {
+	.halt_reg = 0x6038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc av1e_cc_core_gdsc = {
+	.gdscr = 0x4004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "av1e_cc_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *av1e_cc_glymur_clocks[] = {
+	[AV1E_CC_AHB_CLK] = &av1e_cc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_CORE_APB_CLK] = &av1e_cc_av1e_core_apb_clk.clkr,
+	[AV1E_CC_AV1E_CORE_AXI_CLK] = &av1e_cc_av1e_core_axi_clk.clkr,
+	[AV1E_CC_AV1E_CORE_CLK] = &av1e_cc_av1e_core_clk.clkr,
+	[AV1E_CC_AV1E_CORE_CLK_SRC] = &av1e_cc_av1e_core_clk_src.clkr,
+	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK] = &av1e_cc_av1e_gdsc_noc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_NOC_AHB_CLK] = &av1e_cc_av1e_noc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_NOC_AHB_DIV_CLK_SRC] = &av1e_cc_av1e_noc_ahb_div_clk_src.clkr,
+	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK] = &av1e_cc_av1e_noc_core_axi_clk.clkr,
+	[AV1E_CC_AV1E_NOC_XO_CLK] = &av1e_cc_av1e_noc_xo_clk.clkr,
+	[AV1E_CC_AV1E_XO_CLK_SRC] = &av1e_cc_av1e_xo_clk_src.clkr,
+	[AV1E_CC_PLL0] = &av1e_cc_pll0.clkr,
+};
+
+static struct gdsc *av1e_cc_glymur_gdscs[] = {
+	[AV1E_CC_CORE_GDSC] = &av1e_cc_core_gdsc,
+};
+
+static const struct qcom_reset_map av1e_cc_glymur_resets[] = {
+	[AV1E_CC_AV1E_CORE_AXI_CLK_ARES] = { 0x4040, 2 },
+	[AV1E_CC_AV1E_CORE_CLK_ARES] = { 0x4030, 2 },
+	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK_ARES] = { 0x5024, 2 },
+	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK_ARES] = { 0x5004, 2 },
+	[AV1E_CC_AV1E_NOC_XO_CLK_ARES] = { 0x6038, 2 },
+	[AV1E_CC_CORE_BCR] = { 0x4000 },
+	[AV1E_CC_NOC_BCR] = { 0x5000 },
+};
+
+static struct clk_alpha_pll *av1e_cc_glymur_plls[] = {
+	&av1e_cc_pll0,
+};
+
+static const u32 av1e_cc_glymur_critical_cbcrs[] = {
+	0x6034, /* AV1E_CC_AV1E_CC_XO_CLK */
+	0x6054, /* AV1E_CC_SLEEP_CLK */
+};
+
+static const struct regmap_config av1e_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa01c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data av1e_cc_glymur_driver_data = {
+	.alpha_plls = av1e_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(av1e_cc_glymur_plls),
+	.clk_cbcrs = av1e_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(av1e_cc_glymur_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc av1e_cc_glymur_desc = {
+	.config = &av1e_cc_glymur_regmap_config,
+	.clks = av1e_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(av1e_cc_glymur_clocks),
+	.resets = av1e_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(av1e_cc_glymur_resets),
+	.gdscs = av1e_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(av1e_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &av1e_cc_glymur_driver_data,
+};
+
+static const struct of_device_id av1e_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-av1ecc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, av1e_cc_glymur_match_table);
+
+static int av1e_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &av1e_cc_glymur_desc);
+}
+
+static struct platform_driver av1e_cc_glymur_driver = {
+	.probe = av1e_cc_glymur_probe,
+	.driver = {
+		.name = "av1ecc-glymur",
+		.of_match_table = av1e_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(av1e_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI AV1ECC Glymur Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

