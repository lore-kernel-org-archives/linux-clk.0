Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F330EF7E
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249413; cv=none; b=CpzAyWiWd5C1641SRoWS46ZlRbdkqAOa1KcT/QbNLOznvQjq5kdYNzU1GBsI9JIFba/zCSWUl6cJs3rY0uK9dUdJnYmEyAXjOS8uQohG1J6P+/EdMdrtGgAz3eigP2cg3NkXV0KL6K2/svt6PW2RBSNrQvd1rSvLUF+9viLreNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249413; c=relaxed/simple;
	bh=/8RhR7OV6oXxghCBO+QdQd4Etv2A/gx8ZJlBU0UKrQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZH3KfgXDk37XKz6F2I4558Q+CWCgK/gKwxklcX/H6kdPTDjmGMSiM9wOGeijuMkiWmCeUwzYe0BukI4HB6wXw+7s9NyBz7fQHos6vhGMkC6+43I4cRm0QU3Fb7TBoYU2NOxJ2DiJv//KjlAhsgp9QfepIcKMfnjLnpCdAS2OR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9woD6cE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RA0F5tHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9woD6cE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RA0F5tHW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBY1ui2893864
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rdTp+xDJxOCtPl8bGoK3viPV3DndufBZd+L3532s2I=; b=B9woD6cEAZ2KTJeL
	e9jY47a6/MY+R1UwDTNonB6BSOlnssvO6Gd6ZJZ90Me4alAeH8ixHgvFeOXCntdY
	cDY/GDKIHElMQPpcMSf1bcBKHEre0KsXzF6gkqAvltFKSnxOSMhBJmfRghZZQo+h
	KxVuWwVX5MhYfQeo01oXHioNQMkf5oJf0xcnNQaSwso9pR65tZoV95/Wppv0VQFS
	SCv9BgOChiwJF8fr9DB4e6UXmY/mIbIVNZ7kwu7w970keKsSQll3/927849wyPF1
	7rQwnpZfaCGgIJYId5nySoPCkmZiIxF5vFKz6nVCrywYODGDwGhSjVKqqcuGKEzp
	lV7hfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw29dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503342386c7so241979171cf.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 05:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249409; x=1771854209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rdTp+xDJxOCtPl8bGoK3viPV3DndufBZd+L3532s2I=;
        b=RA0F5tHW5fa5SmBYdSNhauUZLAhsnWnHflPxBmpU+P6feoQ6OaOmLZxyq5TI4iMydf
         Cg8JrFZ98LFS91bmnFq+HB52BwPX5/4T4pwdljjHeekoKGe2U3uyUki36zZKdtucvJMb
         YpK5kxW+ZQFU0Acd5B2KRLDaZDRlqgcSoURLqrUh1XFrxE6ugnqFuE6WHk1ywvmAi4Dx
         DLhl31TbY8Qf41JYg2s/MvWcBnbazptsbAj1AJ9gJ6Ou4k7NVWf487gfZmaNZfnDQK9P
         QT4b7iHdibnzchr6HfuHUwCwaAr9IyUgb10ZGMNe7xHzgrA05Fjp6vY63YUd1BP8+MZY
         VujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249409; x=1771854209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rdTp+xDJxOCtPl8bGoK3viPV3DndufBZd+L3532s2I=;
        b=LTnfTVW+KbstVAaqL6HIG998t2TJ3Pv87lERB3BH9evdY5dkL7kY3HLejATbW/NUec
         PomZT1bwdg/1R60MP5vZpA0G8hMdP8XzXpKQIyT281CbxhChgBsz93RaVFmijbkrMC07
         DyFexA+wIHKqeCe0AbpRAfkQ3dvZ4vN9usl2ChdWLg/ZYdR5hJr2vMZc1WVKF2jsL7t1
         JRy+j3WCmYaxj6TYeId6Ogfat7SbaQtetPe9kGvBS1z6K5m2OKW+2HHBxaT/r7afsNgT
         phlwIXpgz2ot3kUljYrA+z9/aAN07QTkqHp93VYORt9ZfuCfLb2/ab1mdORt0GRxwfk3
         HKXA==
X-Forwarded-Encrypted: i=1; AJvYcCU6HpfFFGHNpwBaLiHbMHJ+vvVFiFzp4EtXtnG1iToUFGj3WBfpZ3gUL/u7MuIGidZryTZ+0MX12mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9rQfE+wxPJdVmu6lYughZZhnJ8MAZTzKdsHknnd4UISADHPI
	NZQI9cuu1LMdpqGTLUYneWf5eAc9SJca5bJBM+vX2O9uQH0ez0NibMQe9o6INW0iep9UlK839qE
	t859HUC+jU2ZKG14iGSMbn0Npp4BrK9VcGLQEG5NQm+wM4SBimsVThbMOCFl0mJ5nm88C7o8=
X-Gm-Gg: AZuq6aLtDLqTMnvYMq/IO38/jjHGOz1kXBGN6XZyQG5k/J8bbmmmC+4eHlI5shpYCZT
	PLkZTiYF2W0ZuxnqwIWepQLqaiCzDUgrxZnX2sczNE11zgCESJhG9SmayMYuKDPYH8SjiPuVn1J
	jP0Csqrw2qriG700uFbcIAiNnb9NQz5k+DlYx5LyDCiz/kGaHVaAyAEwMVXl2vnIMvwv5O1XMeu
	6DdHA+ZwDpD3smUVS4fFyX07PFed3cZ1quOwyOZYoB0Nku5/Nt/G1U7TL8eBci7qCGYGaGtjX2Y
	i+dYHqONVSPp0sAgTmA/77ePcrZv5sex7kR+kQzlRMdEloKpU2eg8ZjVPSOzDQsUonqv5275sxZ
	H4USUTyFKBgnkrUZigFTjsjSdbjCtwQ==
X-Received: by 2002:a05:620a:454b:b0:8ca:41af:32c5 with SMTP id af79cd13be357-8cb42489e01mr1314138785a.69.1771249409121;
        Mon, 16 Feb 2026 05:43:29 -0800 (PST)
X-Received: by 2002:a05:620a:454b:b0:8ca:41af:32c5 with SMTP id af79cd13be357-8cb42489e01mr1314135985a.69.1771249408488;
        Mon, 16 Feb 2026 05:43:28 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm28883025f8f.13.2026.02.16.05.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:43:27 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:43:08 +0200
Subject: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6716;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/8RhR7OV6oXxghCBO+QdQd4Etv2A/gx8ZJlBU0UKrQ4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx7yIH6wAkf7Ly9xwz7r/vJgAhIf+2n0m8hzm
 3rs52+f7jaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMe8gAKCRAbX0TJAJUV
 Vh3MEACLYx/HLYjVo35oIft9THVNDKL50gkAsjufhgrKovPvstX93o9T3l04FSwTrKM+fvUYvls
 nsl1sB/OxuD45cbB3rt/0KsBLAPfcERTLRpKTgSLEDF7BYJgAfj/ijpxkg4BzFnbrZURRAZHOkY
 7YsD4ZLQaDHBkEPNTB6CcEjVfRNW+aGEZQlUH350AD+pTWiZ0BNjuEcT+GWgkrsOHTswdSaH+j+
 D5xi2/+UvYZ7BG2aOXGkshZyUZ/90VHo09AKVDFSeUpnEsMSl9qqWw2thjHvj2BMvNfwXJlo6dv
 WbsaCU9+BWxcbm98sotQYqXpNXMM2qh4TfXBJwFmGA26HaD9bwiKXhww1UGNbdGiQbpy0M5Pi4u
 cF7WqAD99te62WGNbUZURSMDHDvxDHPEPLGTUH8dagXNxIDlkljFohv74hiEhI0Bj8f5UhLB7I2
 bCea2Z3WrLhs4n1XhqeGNTfM5/LMBGXFODrpYFiHzMN3DTIbG2JTyKTreTGTutCcpDG66CkqVN/
 kakxR8haFQHiPTZPExuHG/eXYuHpEP8z7rO2nZmXRnh8Gq/C7ZnBGj7wAN47PiRKozRj+GpB5jO
 BtNkSAUC23SVUkIe8gffC3THWi8z8kzAcCiBWCT+UTHFnlqlTGUy9nuT0wA822YtxxBdLrYOBnu
 ozQzNkUrVe07QfQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=69931f02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=xMpycIIAKlYumkEOWPcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BOaMSgAB-dUjwBisk8YlPLvtYb269y8d
X-Proofpoint-GUID: BOaMSgAB-dUjwBisk8YlPLvtYb269y8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfX2Dp72CNfRGiC
 zPWtegvyUlY19GfKNVva3CyJex6JWrnF/anAMTXXsFH24EjruItoiTBKQtat7PBfDoAqoMRtjUD
 H0qjQriO06CaYExqMUOrja+j1S6XklJirOxC/Di+bVd7MIw2j0ouWoez0r3mkd/wAOvS0H9sJXc
 qQ2gphG+Hb7eIIm8WQiVJFq7/JBSwZcsp66/4FZavdpg6KtfPFXX4Lzv74RYaEL86Ne3XbnZifw
 WEW74yRFTO9FrjNGS15TfNR7UTgJlguDZbESUiOsi8VVp2rsWvuudzretcmo5S40m+vqBDoRTyu
 ts//xdGN3klouRsk+8SfdbD4haXez6VWeZbcZlS1uQIZAUAWR1EnxZ0yIODDUsiBP1grPVNRz8O
 g2GSBAyB7Z3m9GRoJ0rsjNwr6FmE0IkEQGKbMKK+IW8RwWUpQMISOrbrrTTVNf1i5T4+9jxG741
 j7b527BFKvBAQvXBYIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160116

Add the TCSR clock controller that provides the refclks on Eliza
platform for PCIe, USB and UFS subsystems.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/tcsrcc-eliza.c | 180 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index edac919d3aa2..dce21e33e366 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config CLK_ELIZA_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_ELIZA_TCSRCC
+	tristate "Eliza TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Eliza devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
+
 config CLK_GLYMUR_DISPCC
 	tristate "GLYMUR Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6ec63a5d4363..d2bbaaada826 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
new file mode 100644
index 000000000000..ef9b6393f57e
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -0,0 +1,180 @@
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
+#include <dt-bindings/clock/qcom,eliza-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_hdmi_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_hdmi_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
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
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
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
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
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
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
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
+static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
+	[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
+	.config = &tcsr_cc_eliza_regmap_config,
+	.clks = tcsr_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
+};
+
+static const struct of_device_id tcsr_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
+
+static int tcsr_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
+}
+
+static struct platform_driver tcsr_cc_eliza_driver = {
+	.probe = tcsr_cc_eliza_probe,
+	.driver = {
+		.name = "tcsr_cc-eliza",
+		.of_match_table = tcsr_cc_eliza_match_table,
+	},
+};
+
+static int __init tcsr_cc_eliza_init(void)
+{
+	return platform_driver_register(&tcsr_cc_eliza_driver);
+}
+subsys_initcall(tcsr_cc_eliza_init);
+
+static void __exit tcsr_cc_eliza_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_eliza_driver);
+}
+module_exit(tcsr_cc_eliza_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1

