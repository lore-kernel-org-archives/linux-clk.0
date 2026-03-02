Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5435A948
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448839; cv=none; b=SRTSz4w+oySprxWQfWAHFWtm2u5Uqg/3dUvOUzeOR5GyfV+Ap0nrUtI/24ZUqPLwpBgbVf2cHxyQXTU5Phe4JToE1sK9JPEA0z8Rwbl1jCPYQEh2WgvfsxQn2pgdiBBZC4GCd5oTi9zKUEZIiOQlvJJszxcTnTZPn1O4yyv4I64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448839; c=relaxed/simple;
	bh=ZLaVLR7gZN/xF+dNc87MrJg/MhUqPYt4sfY78amtm/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTMVmiB8Bwwh1CvPviQBit1dyeF6T4BedUVtirBY41N9SFaBsIBxQsf0qGDgWukMyTCACuGkhnSYfWetDAk3HT0L3GH4IXu+UG4h4jab8Y7gPCXRB0oNs2F0QnlgRwOY+Pi3byqVxWtaj/xz9hX1ewwkTJfAU3gh12uVsJ/yi6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ8KC/5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANRM2xpG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ8KC/5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANRM2xpG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K5a7782876
	for <linux-clk@vger.kernel.org>; Mon, 2 Mar 2026 10:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6mepFJEyJzcQHdVxX1gV6XmEVajN4bYfQCq4Jfu/z8=; b=JJ8KC/5xgSGhR8KI
	tKqrH7+3vMSESmH2TAlbo4zGSi6YlqO9lH6Z1L3rkwW8fN2C5lkqU9kOID8T9cFs
	wWZSPgFuf4QjMJ7IF4qM0X6M2XK8rwNzjRQlkiqGcX2xEZ2W0iSxYCyhQcad+DEB
	CgfK/ObJkcSol3iA/OPwYa17v6rdDPtzGl/8qkEPdBr+JS5YVUO1NvTYsHI4jck6
	BUlRt8f4m93w0Jg+INWw15UyQVHLf82n/2+0BrwOwzpX+1fOMm6Zw2wkusz3G2b6
	IcHL/n0ggmeFpYYpbrbOzvWbpbsZtcGmF0rlueAFYcD5NfXhx8c2NnHkC2WKsTwH
	ga/ybA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00b51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 10:53:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so3092323285a.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 02:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448832; x=1773053632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6mepFJEyJzcQHdVxX1gV6XmEVajN4bYfQCq4Jfu/z8=;
        b=ANRM2xpGkM6gRjfI8KNaVtNe03lZW1kEy6wVXKoBP1SNzSsamm7Er2JTPaaso0pMY0
         OsqZkGhehVcwjtVhafqwgAcI7Bfo9yQz0KJeN/GecwdSCmADrUxZ/jGM+0HKM7OP1WvW
         f6tzCU4kGbmK2P7LpsrurKNTVOL+ERORfm0tpRWzqxZxzwbsNPq45TijE7Hh/2FWVp3v
         vLa2iMItce+RW1jMTJ2B5AQyxnqNbYZnD8agmbv9pLRvXoOaRCnky4xC9ghjPIRFUyMY
         amK0wl1QnG2MI3IKaB0zzIq9SpjqwPkJizQrWI27JJ4MFqpxh0vSBx5VcNKF0zZXiUsv
         +Ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448832; x=1773053632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g6mepFJEyJzcQHdVxX1gV6XmEVajN4bYfQCq4Jfu/z8=;
        b=RHrVKc2+hda0LYihdL85EoeBdGAKIXAA1K9HPNr90n2AQ8qkR88nS4OLgdzmnudjKK
         X5vqhzTMxrktZaDbCYDC2TcuCdRdRn1yRXIy5WwW7oriJvwtbac/Wzvdu/gOza5sYC9P
         CHmkC5P/1et+MNAAxl8AIPI9jsZAwdm3NAcrskuhmjXq8NowKScsQp1XQ7yy0MHsAhRQ
         d/PB9Sef06u1oRuG81FMucL91vSa6Q3nZlRBztlOEGRtQXVa7I2FIHhSxSLaYvn1PPt/
         fqtHRiEIX9veDb3uDyIcHi6iEtnp9WMzwppzEeI+PA5sVyw0MWIA/9ZKFEFfpMsNVXtH
         1iAw==
X-Forwarded-Encrypted: i=1; AJvYcCV+S9DKe6WpCofR7TO+NPe5r7xUu/a0xZgjhPlruThYODEv2ivh7V2Fyl8qh87Gma0VVW9wbjEMfww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdHN3K0i7ORZMYoRym4YPif2ERuzs04zs7zr1yS1t9PxmCSl6h
	FSvAxlTda4PPmTkSbWEX6B5xuo8481f3043tp2UdKkvkHA302hanEvWfzeUI67s0HkhbRXq2YA4
	J6+QOhbzcMgi74tQNOJSh2JSo+hyEsAaqNw7wthX2G29ZsqTZDfaiwYHg6korXuE=
X-Gm-Gg: ATEYQzw2UHC18043PqlB1/rPbLNqSCdfeq0f8R2h/3eS2JIGzc31GMrCulGUVinjrkQ
	dsx5u2mMmhsPJ68OWEMhMu4wb+Aa+khFdmhyEvXwBLb9D/26annFmlCN903+XyXFSJud0DyXtoD
	6j1r7sZR6wj1XpAmz/fSXkCSM9sA+f8VFm8rNuza4b8wXN5GHKrQnZmjINBwVfoIM2WAOKWuOU1
	80RpZkAOpuR56FUWT94z425sAntCc0pdktd5Oco7dfF0wboe+lGaNXTCOVZa7su1Nfi299fhIuO
	4xPODRq5RZVBOxzdKcbqlWnKXporFvDfM+mdFmxxnFmnBB6iHZgSJ+OcpZHhReu/NeRMECWB1bP
	wybxRr+PvIjmOttTA0+IvRuQZqFARZg==
X-Received: by 2002:a05:620a:414a:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8cbc8d73453mr1466916685a.14.1772448830426;
        Mon, 02 Mar 2026 02:53:50 -0800 (PST)
X-Received: by 2002:a05:620a:414a:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8cbc8d73453mr1466911685a.14.1772448829390;
        Mon, 02 Mar 2026 02:53:49 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:48 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:33 +0200
Subject: [PATCH v6 5/6] clk: qcom: Add support for Global clock controller
 on Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-5-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=93313;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jwz+sH5DUsz0tPvcOMj5CxlvtAHZNz3h0odLsGvownM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwwSjOVsHUPFZ2iDoP2rGC2bdSLMY6m9sIgA
 JniBCyMD5OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsMAAKCRAbX0TJAJUV
 VtULEADNpx/mjALLEimeUEKLTjVIeHJz15/RS0foALIGxBqx8i7EGQPyd9NqQcdXRdyf3EY0GBP
 cEtzH6akMLml+AE83468VNxIgIVGv5rlcUAo36jfGusSfIIcC9BTtCyrSsKklZg/uqrcR2YJ0GG
 aKRZigbmDgzoOpZa1bxay8ty2xNdKpwBuyekZ/jYOoCHgAhWZ6KRCWqbV822XxQOLHagLnE5ZBw
 GZTs1V9MAEdLTDfet60evis0zK+0c4ykLPUaCfZS9TXNFiCAOzTvDUyDVwsgWUatsYMo5Ak2ehq
 McA+YGnVmVLJr0xIIyaFX1RBSWJomStvgKGmINUIjzAQDKk9jdW3hUaYO+VDv3gs5qbz3FnEAcC
 nbpwjKTpFrCVCZjKzdqwG72KcRQ26ssy9MN7n44E18+m2PooO2NXvWrF9OVeEnJxubq4Z6R5RHV
 IKVv0larCbP1MCULFIxk1eBtvGH/o8dAOtnOIKn+me5CnMbNkmBTwojnBk3nSd/g8it0ec3A3hq
 9fc0m4whB9XvambuPPRmZC4VQXWkTiInrX4YaFI6ZfnQRxk9ej2isvWGrDlA4y3fZ2aNEGo5wjv
 wOylV9EkWjldA3dsYrK1nCbpHj/h8+ViXo9H+zKCXQgHUnLGN8QAjKZJpxmbyHPwJkN7jHWz4R2
 nphwOUsXVNEZuXA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a56c40 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0JRQP6o7eewrfzYs8wMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX1mTleH1a9lKD
 /eRfSwSz5ixm1ALckjQUiHKCdrvun4TThFfyc5nHmCaOrM2gHCk7KmGVjOjA6HGeiZ4uiwrQ0cZ
 /l4tQnvkv/5iDOg4i+Li+dEHHMl+Z2mK+Qzn8btLPtenHgfMK/m3ciQnmw1SKBfcwDl7oONxxZV
 MacUhtOV5SLpy0kLMNToMclKss82uCa4//vA4SmMVfNc8N3ueqMDdHH7C+TU7iaZYy0kHbxqwNE
 ZC0LtuJk6rMHZL1e1A7f8846PYHzk27EdHR5B11MGujS9bn37O8kF7M2L30528fTqL0eq2EsY3p
 kAiiJ4p6dj7EqiXJ6XP2A3TrjyIATwokH+ukiYs/AlSutcXV5+h5yRjYpjUELoyQV2SMoqLrYiR
 vakLZs3Ao2/W1rp/ZcoqFDBSDJkcDgNMtgRBq/lfTC7uerbQt8orf1Vvy2Ckt7GHPM9mD6eKyXN
 YsawROyEWhHApbJBAbA==
X-Proofpoint-GUID: 2shTXG2fvq7BRFP1VYkuVYiN3Y8XOHRO
X-Proofpoint-ORIG-GUID: 2shTXG2fvq7BRFP1VYkuVYiN3Y8XOHRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add support for Global clock controller for Eliza Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig     |    9 +
 drivers/clk/qcom/Makefile    |    1 +
 drivers/clk/qcom/gcc-eliza.c | 3105 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 3115 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb74..edac919d3aa2 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -19,6 +19,15 @@ menuconfig COMMON_CLK_QCOM
 
 if COMMON_CLK_QCOM
 
+config CLK_ELIZA_GCC
+	tristate "Eliza Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the global clock controller on Eliza devices.
+	  Say Y if you want to use peripheral devices such as UART, SPI,
+	  I2C, USB, UFS, SDCC, etc.
+
 config CLK_GLYMUR_DISPCC
 	tristate "GLYMUR Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6b0ad8832b55..98891d19b3ac 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -20,6 +20,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
+obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
new file mode 100644
index 000000000000..eeec4ebdd5c2
--- /dev/null
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -0,0 +1,3105 @@
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
+#include <dt-bindings/clock/qcom,eliza-gcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_PCIE_0_PIPE_CLK,
+	DT_PCIE_1_PIPE_CLK,
+	DT_UFS_PHY_RX_SYMBOL_0_CLK,
+	DT_UFS_PHY_RX_SYMBOL_1_CLK,
+	DT_UFS_PHY_TX_SYMBOL_0_CLK,
+	DT_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GCC_GPLL0_OUT_EVEN,
+	P_GCC_GPLL0_OUT_MAIN,
+	P_GCC_GPLL4_OUT_MAIN,
+	P_GCC_GPLL7_OUT_MAIN,
+	P_GCC_GPLL8_OUT_MAIN,
+	P_GCC_GPLL9_OUT_MAIN,
+	P_PCIE_0_PIPE_CLK,
+	P_PCIE_1_PIPE_CLK,
+	P_SLEEP_CLK,
+	P_UFS_PHY_RX_SYMBOL_0_CLK,
+	P_UFS_PHY_RX_SYMBOL_1_CLK,
+	P_UFS_PHY_TX_SYMBOL_0_CLK,
+	P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
+};
+
+static struct clk_alpha_pll gcc_gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gcc_gpll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gcc_gpll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gcc_gpll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_gpll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static struct clk_alpha_pll gcc_gpll4 = {
+	.offset = 0x4000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpll4",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gcc_gpll7 = {
+	.offset = 0x7000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(7),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpll7",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gcc_gpll8 = {
+	.offset = 0x8000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(8),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpll8",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gcc_gpll9 = {
+	.offset = 0x9000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(9),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpll9",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL4_OUT_MAIN, 5 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .hw = &gcc_gpll4.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL7_OUT_MAIN, 2 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .hw = &gcc_gpll7.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL8_OUT_MAIN, 2 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .hw = &gcc_gpll8.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data gcc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL9_OUT_MAIN, 2 },
+	{ P_GCC_GPLL4_OUT_MAIN, 5 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .hw = &gcc_gpll9.clkr.hw },
+	{ .hw = &gcc_gpll4.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_8[] = {
+	{ P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+	{ P_GCC_GPLL0_OUT_EVEN, 3 },
+};
+
+static const struct clk_parent_data gcc_parent_data_8[] = {
+	{ .index = DT_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK },
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static struct clk_regmap_phy_mux gcc_pcie_0_pipe_clk_src = {
+	.reg = 0x6b080,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_PCIE_0_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie_1_pipe_clk_src = {
+	.reg = 0xac07c,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_PCIE_1_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
+	.reg = 0x77068,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
+	.reg = 0x770ec,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
+	.reg = 0x77058,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src = {
+	.reg = 0x39070,
+	.shift = 0,
+	.width = 2,
+	.parent_map = gcc_parent_map_8,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb3_prim_phy_pipe_clk_src",
+			.parent_data = gcc_parent_data_8,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_8),
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x64004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_gp1_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x65004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_gp2_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp3_clk_src = {
+	.cmd_rcgr = 0x66004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_gp3_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_0_aux_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
+	.cmd_rcgr = 0x6b084,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_0_aux_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_0_phy_rchng_clk_src[] = {
+	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_0_phy_rchng_clk_src = {
+	.cmd_rcgr = 0x6b068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_0_phy_rchng_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_0_phy_rchng_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_1_aux_clk_src = {
+	.cmd_rcgr = 0xac080,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_1_aux_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_1_phy_rchng_clk_src = {
+	.cmd_rcgr = 0xac064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_0_phy_rchng_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_1_phy_rchng_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
+	F(60000000, P_GCC_GPLL0_OUT_MAIN, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pdm2_clk_src = {
+	.cmd_rcgr = 0x33010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pdm2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm2_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap1_qspi_ref_clk_src[] = {
+	F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
+	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
+	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(51200000, P_GCC_GPLL0_OUT_EVEN, 1, 64, 375),
+	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
+	F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
+	F(112000000, P_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
+	F(117964800, P_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
+	F(120000000, P_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(150000000, P_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
+	F(250000000, P_GCC_GPLL7_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_qspi_ref_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_qspi_ref_clk_src",
+	.parent_data = gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_qspi_ref_clk_src = {
+	.cmd_rcgr = 0x188c0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_qspi_ref_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap1_qspi_ref_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap1_s0_clk_src[] = {
+	F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
+	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
+	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(51200000, P_GCC_GPLL0_OUT_EVEN, 1, 64, 375),
+	F(61440000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 625),
+	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
+	F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
+	F(112000000, P_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
+	F(117964800, P_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
+	F(120000000, P_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s0_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
+	.cmd_rcgr = 0x18014,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s1_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
+	.cmd_rcgr = 0x18150,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap1_s3_clk_src[] = {
+	F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
+	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
+	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(51200000, P_GCC_GPLL0_OUT_EVEN, 1, 64, 375),
+	F(61440000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 625),
+	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
+	F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s3_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
+	.cmd_rcgr = 0x182a0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s4_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
+	.cmd_rcgr = 0x183dc,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap1_s5_clk_src[] = {
+	F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
+	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
+	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(51200000, P_GCC_GPLL0_OUT_EVEN, 1, 64, 375),
+	F(61440000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 625),
+	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
+	F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
+	F(112000000, P_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
+	F(117964800, P_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
+	F(128000000, P_GCC_GPLL0_OUT_MAIN, 1, 16, 75),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s5_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
+	.cmd_rcgr = 0x18518,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s5_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s6_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
+	.cmd_rcgr = 0x18654,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s6_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s7_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
+	.cmd_rcgr = 0x18790,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s7_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s0_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
+	.cmd_rcgr = 0x1e014,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap2_s0_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s1_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
+	.cmd_rcgr = 0x1e150,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap2_s1_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap2_s2_clk_src[] = {
+	F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
+	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
+	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(51200000, P_GCC_GPLL0_OUT_EVEN, 1, 64, 375),
+	F(61440000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 625),
+	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
+	F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
+	F(112000000, P_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
+	F(117964800, P_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
+	F(125000000, P_GCC_GPLL7_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s2_clk_src",
+	.parent_data = gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
+	.cmd_rcgr = 0x1e28c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap2_s2_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s3_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
+	.cmd_rcgr = 0x1e3c8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap2_s3_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s4_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
+	.cmd_rcgr = 0x1e504,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap2_s4_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s5_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
+	.cmd_rcgr = 0x1e640,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s5_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap2_s5_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s6_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s6_clk_src",
+	.parent_data = gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
+	.cmd_rcgr = 0x1e77c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap2_s6_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s7_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s7_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {
+	.cmd_rcgr = 0x1e8b8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap1_s3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap2_s7_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(20000000, P_GCC_GPLL0_OUT_EVEN, 5, 1, 3),
+	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
+	F(192000000, P_GCC_GPLL8_OUT_MAIN, 2, 0, 0),
+	F(384000000, P_GCC_GPLL8_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0xa9018,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_sdcc1_apps_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sdcc1_apps_clk_src",
+		.parent_data = gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] = {
+	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
+	F(150000000, P_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
+	F(300000000, P_GCC_GPLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
+	.cmd_rcgr = 0xa9040,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_sdcc1_ice_core_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sdcc1_ice_core_clk_src",
+		.parent_data = gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
+	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
+	F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
+	.cmd_rcgr = 0x1401c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sdcc2_apps_clk_src",
+		.parent_data = gcc_parent_data_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_ufs_phy_axi_clk_src[] = {
+	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
+	F(201500000, P_GCC_GPLL4_OUT_MAIN, 4, 0, 0),
+	F(403000000, P_GCC_GPLL4_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
+	.cmd_rcgr = 0x77034,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_ufs_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_ufs_phy_axi_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_ufs_phy_ice_core_clk_src[] = {
+	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
+	F(201500000, P_GCC_GPLL4_OUT_MAIN, 4, 0, 0),
+	F(403000000, P_GCC_GPLL4_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
+	.cmd_rcgr = 0x7708c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_ufs_phy_ice_core_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_ufs_phy_ice_core_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_ufs_phy_phy_aux_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
+	.cmd_rcgr = 0x770c0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_6,
+	.freq_tbl = ftbl_gcc_ufs_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_ufs_phy_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
+	.cmd_rcgr = 0x770a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_ufs_phy_ice_core_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_ufs_phy_unipro_core_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_prim_master_clk_src[] = {
+	F(66666667, P_GCC_GPLL0_OUT_EVEN, 4.5, 0, 0),
+	F(133333333, P_GCC_GPLL0_OUT_MAIN, 4.5, 0, 0),
+	F(200000000, P_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(240000000, P_GCC_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
+	.cmd_rcgr = 0x39030,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb30_prim_master_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb30_prim_master_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x39048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb30_prim_mock_utmi_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
+	.cmd_rcgr = 0x39074,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb3_prim_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_pcie_0_pipe_div2_clk_src = {
+	.reg = 0x6b0a4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_0_pipe_div2_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_pcie_0_pipe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_pcie_1_pipe_div2_clk_src = {
+	.reg = 0xac0a0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_1_pipe_div2_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_pcie_1_pipe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_qupv3_wrap1_s2_clk_src = {
+	.reg = 0x1828c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap1_s2_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_qupv3_wrap1_qspi_ref_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
+	.reg = 0x39060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb30_prim_mock_utmi_postdiv_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gcc_aggre_noc_pcie_axi_clk = {
+	.halt_reg = 0x10068,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x10068,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(30),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_aggre_noc_pcie_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
+	.halt_reg = 0x770f4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x770f4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x770f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_aggre_ufs_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aggre_usb3_prim_axi_clk = {
+	.halt_reg = 0x39094,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x39094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_aggre_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x38004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x38004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(10),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camera_hf_axi_clk = {
+	.halt_reg = 0x26014,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x26014,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x26014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_camera_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camera_sf_axi_clk = {
+	.halt_reg = 0x26024,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x26024,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x26024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_camera_sf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cfg_noc_pcie_anoc_ahb_clk = {
+	.halt_reg = 0x10050,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x10050,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(20),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cfg_noc_pcie_anoc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
+	.halt_reg = 0x39090,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x39090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cfg_noc_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cnoc_pcie_sf_axi_clk = {
+	.halt_reg = 0x10058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x10058,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(6),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cnoc_pcie_sf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ddrss_gpu_axi_clk = {
+	.halt_reg = 0x71158,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x71158,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x71158,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ddrss_gpu_axi_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ddrss_pcie_sf_qtb_clk = {
+	.halt_reg = 0x1007c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1007c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(19),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ddrss_pcie_sf_qtb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_hf_axi_clk = {
+	.halt_reg = 0x27008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x27008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_disp_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x64000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x64000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x65000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x65000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x66000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x66000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gp3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_gemnoc_gfx_clk = {
+	.halt_reg = 0x71010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x71010,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x71010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpu_gemnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_gpll0_cph_clk_src = {
+	.halt_reg = 0x71150,
+	.halt_check = BRANCH_HALT_ENABLE_VOTED,
+	.clkr = {
+		.enable_reg = 0x71150,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpu_gpll0_cph_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gpll0.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_gpll0_div_cph_clk_src = {
+	.halt_reg = 0x71154,
+	.halt_check = BRANCH_HALT_ENABLE_VOTED,
+	.clkr = {
+		.enable_reg = 0x71154,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpu_gpll0_div_cph_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gpll0_out_even.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x7d000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mmu_tcu_vote_clk = {
+	.halt_reg = 0x7d02c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_mmu_tcu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_aux_clk = {
+	.halt_reg = 0x6b044,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(3),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
+	.halt_reg = 0x6b040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x6b040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
+	.halt_reg = 0x6b030,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x6b030,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_phy_rchng_clk = {
+	.halt_reg = 0x6b064,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(22),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_phy_rchng_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_0_phy_rchng_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_pipe_clk = {
+	.halt_reg = 0x6b054,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_0_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_pipe_div2_clk = {
+	.halt_reg = 0x6b0a8,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x52018,
+		.enable_mask = BIT(13),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_pipe_div2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_0_pipe_div2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_slv_axi_clk = {
+	.halt_reg = 0x6b020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x6b020,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_slv_q2a_axi_clk = {
+	.halt_reg = 0x6b01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_0_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_aux_clk = {
+	.halt_reg = 0xac040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(29),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_1_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
+	.halt_reg = 0xac03c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0xac03c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(28),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
+	.halt_reg = 0xac02c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0xac02c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(27),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_phy_rchng_clk = {
+	.halt_reg = 0xac060,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(24),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_phy_rchng_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_1_phy_rchng_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_pipe_clk = {
+	.halt_reg = 0xac050,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(23),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_1_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_pipe_div2_clk = {
+	.halt_reg = 0xac0a4,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x52018,
+		.enable_mask = BIT(15),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_pipe_div2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_1_pipe_div2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_slv_axi_clk = {
+	.halt_reg = 0xac01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0xac01c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(26),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_slv_q2a_axi_clk = {
+	.halt_reg = 0xac018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(25),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_1_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x3300c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pdm2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x33004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x33004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x33004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_xo4_clk = {
+	.halt_reg = 0x33008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x33008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pdm_xo4_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_camera_cmd_ahb_clk = {
+	.halt_reg = 0x26010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x26010,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x26010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qmip_camera_cmd_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_camera_nrt_ahb_clk = {
+	.halt_reg = 0x26008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x26008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x26008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qmip_camera_nrt_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_camera_rt_ahb_clk = {
+	.halt_reg = 0x2600c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2600c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2600c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qmip_camera_rt_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_gpu_ahb_clk = {
+	.halt_reg = 0x71008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x71008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x71008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qmip_gpu_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_pcie_ahb_clk = {
+	.halt_reg = 0x6b018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x6b018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(11),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qmip_pcie_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_video_v_cpu_ahb_clk = {
+	.halt_reg = 0x32010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x32010,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x32010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qmip_video_v_cpu_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_video_vcodec_ahb_clk = {
+	.halt_reg = 0x3200c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3200c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qmip_video_vcodec_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_core_2x_clk = {
+	.halt_reg = 0x2301c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(18),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_core_clk = {
+	.halt_reg = 0x23008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(19),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_qspi_ref_clk = {
+	.halt_reg = 0x188bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(29),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_qspi_ref_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_qspi_ref_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
+	.halt_reg = 0x18004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(22),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
+	.halt_reg = 0x18140,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(23),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_s1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
+	.halt_reg = 0x1827c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(24),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_s2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
+	.halt_reg = 0x18290,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(25),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_s3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
+	.halt_reg = 0x183cc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(26),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_s4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
+	.halt_reg = 0x18508,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(27),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_s5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s6_clk = {
+	.halt_reg = 0x18644,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(28),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_s6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s7_clk = {
+	.halt_reg = 0x18780,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(16),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap1_s7_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s7_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_core_2x_clk = {
+	.halt_reg = 0x23174,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(3),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_core_clk = {
+	.halt_reg = 0x23160,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_s0_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_s1_clk = {
+	.halt_reg = 0x1e140,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_s1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_s2_clk = {
+	.halt_reg = 0x1e27c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(6),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_s2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_s3_clk = {
+	.halt_reg = 0x1e3b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(7),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_s3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_s4_clk = {
+	.halt_reg = 0x1e4f4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(8),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_s4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_s5_clk = {
+	.halt_reg = 0x1e630,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(9),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_s5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_s6_clk = {
+	.halt_reg = 0x1e76c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(10),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_s6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap2_s7_clk = {
+	.halt_reg = 0x1e8a8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(17),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap2_s7_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s7_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_1_m_ahb_clk = {
+	.halt_reg = 0x23000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(20),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_1_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_1_s_ahb_clk = {
+	.halt_reg = 0x23004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52008,
+		.enable_mask = BIT(21),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_1_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_2_m_ahb_clk = {
+	.halt_reg = 0x23158,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23158,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_2_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_2_s_ahb_clk = {
+	.halt_reg = 0x2315c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2315c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52010,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_2_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0xa9004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa9004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0xa9008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa9008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ice_core_clk = {
+	.halt_reg = 0xa9030,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0xa9030,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0xa9030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_ahb_clk = {
+	.halt_reg = 0x14014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x14014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc2_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_apps_clk = {
+	.halt_reg = 0x14004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x14004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc2_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc2_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_ahb_clk = {
+	.halt_reg = 0x77028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x77028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_axi_clk = {
+	.halt_reg = 0x77018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x77018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_ice_core_clk = {
+	.halt_reg = 0x7707c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x7707c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7707c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
+	.halt_reg = 0x770bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x770bc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x770bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
+	.halt_reg = 0x77030,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x77030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_rx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
+	.halt_reg = 0x770d8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x770d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_rx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
+	.halt_reg = 0x7702c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x7702c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_tx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
+	.halt_reg = 0x7706c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x7706c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7706c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_unipro_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_atb_clk = {
+	.halt_reg = 0x3908c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x3908c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb30_prim_atb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_master_clk = {
+	.halt_reg = 0x39018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x39018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb30_prim_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
+	.halt_reg = 0x3902c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3902c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb30_prim_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_sleep_clk = {
+	.halt_reg = 0x39028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x39028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb30_prim_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_phy_aux_clk = {
+	.halt_reg = 0x39064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x39064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb3_prim_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
+	.halt_reg = 0x39068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x39068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb3_prim_phy_com_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
+	.halt_reg = 0x3906c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x3906c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3906c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb3_prim_phy_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb3_prim_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_axi0_clk = {
+	.halt_reg = 0x32018,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x32018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x32018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_video_axi0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_axi1_clk = {
+	.halt_reg = 0x32028,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x32028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x32028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_video_axi1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gcc_pcie_0_gdsc = {
+	.gdscr = 0x6b004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x5214c,
+	.collapse_mask = BIT(0),
+	.pd = {
+		.name = "gcc_pcie_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_0_phy_gdsc = {
+	.gdscr = 0x6c000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x5214c,
+	.collapse_mask = BIT(2),
+	.pd = {
+		.name = "gcc_pcie_0_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_1_gdsc = {
+	.gdscr = 0xac004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x5214c,
+	.collapse_mask = BIT(3),
+	.pd = {
+		.name = "gcc_pcie_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_1_phy_gdsc = {
+	.gdscr = 0xad000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x5214c,
+	.collapse_mask = BIT(4),
+	.pd = {
+		.name = "gcc_pcie_1_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_ufs_mem_phy_gdsc = {
+	.gdscr = 0x9e000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "gcc_ufs_mem_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gcc_ufs_phy_gdsc = {
+	.gdscr = 0x77004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gcc_ufs_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gcc_usb30_prim_gdsc = {
+	.gdscr = 0x39004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gcc_usb30_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gcc_usb3_phy_gdsc = {
+	.gdscr = 0x50018,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "gcc_usb3_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gcc_eliza_clocks[] = {
+	[GCC_AGGRE_NOC_PCIE_AXI_CLK] = &gcc_aggre_noc_pcie_axi_clk.clkr,
+	[GCC_AGGRE_UFS_PHY_AXI_CLK] = &gcc_aggre_ufs_phy_axi_clk.clkr,
+	[GCC_AGGRE_USB3_PRIM_AXI_CLK] = &gcc_aggre_usb3_prim_axi_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
+	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
+	[GCC_CFG_NOC_PCIE_ANOC_AHB_CLK] = &gcc_cfg_noc_pcie_anoc_ahb_clk.clkr,
+	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
+	[GCC_CNOC_PCIE_SF_AXI_CLK] = &gcc_cnoc_pcie_sf_axi_clk.clkr,
+	[GCC_DDRSS_GPU_AXI_CLK] = &gcc_ddrss_gpu_axi_clk.clkr,
+	[GCC_DDRSS_PCIE_SF_QTB_CLK] = &gcc_ddrss_pcie_sf_qtb_clk.clkr,
+	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP2_CLK_SRC] = &gcc_gp2_clk_src.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_GP3_CLK_SRC] = &gcc_gp3_clk_src.clkr,
+	[GCC_GPLL0] = &gcc_gpll0.clkr,
+	[GCC_GPLL0_OUT_EVEN] = &gcc_gpll0_out_even.clkr,
+	[GCC_GPLL4] = &gcc_gpll4.clkr,
+	[GCC_GPLL7] = &gcc_gpll7.clkr,
+	[GCC_GPLL8] = &gcc_gpll8.clkr,
+	[GCC_GPLL9] = &gcc_gpll9.clkr,
+	[GCC_GPU_GEMNOC_GFX_CLK] = &gcc_gpu_gemnoc_gfx_clk.clkr,
+	[GCC_GPU_GPLL0_CPH_CLK_SRC] = &gcc_gpu_gpll0_cph_clk_src.clkr,
+	[GCC_GPU_GPLL0_DIV_CPH_CLK_SRC] = &gcc_gpu_gpll0_div_cph_clk_src.clkr,
+	[GCC_GPU_SMMU_VOTE_CLK] = &gcc_gpu_smmu_vote_clk.clkr,
+	[GCC_MMU_TCU_VOTE_CLK] = &gcc_mmu_tcu_vote_clk.clkr,
+	[GCC_PCIE_0_AUX_CLK] = &gcc_pcie_0_aux_clk.clkr,
+	[GCC_PCIE_0_AUX_CLK_SRC] = &gcc_pcie_0_aux_clk_src.clkr,
+	[GCC_PCIE_0_CFG_AHB_CLK] = &gcc_pcie_0_cfg_ahb_clk.clkr,
+	[GCC_PCIE_0_MSTR_AXI_CLK] = &gcc_pcie_0_mstr_axi_clk.clkr,
+	[GCC_PCIE_0_PHY_RCHNG_CLK] = &gcc_pcie_0_phy_rchng_clk.clkr,
+	[GCC_PCIE_0_PHY_RCHNG_CLK_SRC] = &gcc_pcie_0_phy_rchng_clk_src.clkr,
+	[GCC_PCIE_0_PIPE_CLK] = &gcc_pcie_0_pipe_clk.clkr,
+	[GCC_PCIE_0_PIPE_CLK_SRC] = &gcc_pcie_0_pipe_clk_src.clkr,
+	[GCC_PCIE_0_PIPE_DIV2_CLK] = &gcc_pcie_0_pipe_div2_clk.clkr,
+	[GCC_PCIE_0_PIPE_DIV2_CLK_SRC] = &gcc_pcie_0_pipe_div2_clk_src.clkr,
+	[GCC_PCIE_0_SLV_AXI_CLK] = &gcc_pcie_0_slv_axi_clk.clkr,
+	[GCC_PCIE_0_SLV_Q2A_AXI_CLK] = &gcc_pcie_0_slv_q2a_axi_clk.clkr,
+	[GCC_PCIE_1_AUX_CLK] = &gcc_pcie_1_aux_clk.clkr,
+	[GCC_PCIE_1_AUX_CLK_SRC] = &gcc_pcie_1_aux_clk_src.clkr,
+	[GCC_PCIE_1_CFG_AHB_CLK] = &gcc_pcie_1_cfg_ahb_clk.clkr,
+	[GCC_PCIE_1_MSTR_AXI_CLK] = &gcc_pcie_1_mstr_axi_clk.clkr,
+	[GCC_PCIE_1_PHY_RCHNG_CLK] = &gcc_pcie_1_phy_rchng_clk.clkr,
+	[GCC_PCIE_1_PHY_RCHNG_CLK_SRC] = &gcc_pcie_1_phy_rchng_clk_src.clkr,
+	[GCC_PCIE_1_PIPE_CLK] = &gcc_pcie_1_pipe_clk.clkr,
+	[GCC_PCIE_1_PIPE_CLK_SRC] = &gcc_pcie_1_pipe_clk_src.clkr,
+	[GCC_PCIE_1_PIPE_DIV2_CLK] = &gcc_pcie_1_pipe_div2_clk.clkr,
+	[GCC_PCIE_1_PIPE_DIV2_CLK_SRC] = &gcc_pcie_1_pipe_div2_clk_src.clkr,
+	[GCC_PCIE_1_SLV_AXI_CLK] = &gcc_pcie_1_slv_axi_clk.clkr,
+	[GCC_PCIE_1_SLV_Q2A_AXI_CLK] = &gcc_pcie_1_slv_q2a_axi_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_QMIP_CAMERA_CMD_AHB_CLK] = &gcc_qmip_camera_cmd_ahb_clk.clkr,
+	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
+	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
+	[GCC_QMIP_GPU_AHB_CLK] = &gcc_qmip_gpu_ahb_clk.clkr,
+	[GCC_QMIP_PCIE_AHB_CLK] = &gcc_qmip_pcie_ahb_clk.clkr,
+	[GCC_QMIP_VIDEO_V_CPU_AHB_CLK] = &gcc_qmip_video_v_cpu_ahb_clk.clkr,
+	[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] = &gcc_qmip_video_vcodec_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP1_CORE_2X_CLK] = &gcc_qupv3_wrap1_core_2x_clk.clkr,
+	[GCC_QUPV3_WRAP1_CORE_CLK] = &gcc_qupv3_wrap1_core_clk.clkr,
+	[GCC_QUPV3_WRAP1_QSPI_REF_CLK] = &gcc_qupv3_wrap1_qspi_ref_clk.clkr,
+	[GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC] = &gcc_qupv3_wrap1_qspi_ref_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S0_CLK] = &gcc_qupv3_wrap1_s0_clk.clkr,
+	[GCC_QUPV3_WRAP1_S0_CLK_SRC] = &gcc_qupv3_wrap1_s0_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S1_CLK] = &gcc_qupv3_wrap1_s1_clk.clkr,
+	[GCC_QUPV3_WRAP1_S1_CLK_SRC] = &gcc_qupv3_wrap1_s1_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S2_CLK] = &gcc_qupv3_wrap1_s2_clk.clkr,
+	[GCC_QUPV3_WRAP1_S2_CLK_SRC] = &gcc_qupv3_wrap1_s2_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S3_CLK] = &gcc_qupv3_wrap1_s3_clk.clkr,
+	[GCC_QUPV3_WRAP1_S3_CLK_SRC] = &gcc_qupv3_wrap1_s3_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S4_CLK] = &gcc_qupv3_wrap1_s4_clk.clkr,
+	[GCC_QUPV3_WRAP1_S4_CLK_SRC] = &gcc_qupv3_wrap1_s4_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S5_CLK] = &gcc_qupv3_wrap1_s5_clk.clkr,
+	[GCC_QUPV3_WRAP1_S5_CLK_SRC] = &gcc_qupv3_wrap1_s5_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S6_CLK] = &gcc_qupv3_wrap1_s6_clk.clkr,
+	[GCC_QUPV3_WRAP1_S6_CLK_SRC] = &gcc_qupv3_wrap1_s6_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S7_CLK] = &gcc_qupv3_wrap1_s7_clk.clkr,
+	[GCC_QUPV3_WRAP1_S7_CLK_SRC] = &gcc_qupv3_wrap1_s7_clk_src.clkr,
+	[GCC_QUPV3_WRAP2_CORE_2X_CLK] = &gcc_qupv3_wrap2_core_2x_clk.clkr,
+	[GCC_QUPV3_WRAP2_CORE_CLK] = &gcc_qupv3_wrap2_core_clk.clkr,
+	[GCC_QUPV3_WRAP2_S0_CLK] = &gcc_qupv3_wrap2_s0_clk.clkr,
+	[GCC_QUPV3_WRAP2_S0_CLK_SRC] = &gcc_qupv3_wrap2_s0_clk_src.clkr,
+	[GCC_QUPV3_WRAP2_S1_CLK] = &gcc_qupv3_wrap2_s1_clk.clkr,
+	[GCC_QUPV3_WRAP2_S1_CLK_SRC] = &gcc_qupv3_wrap2_s1_clk_src.clkr,
+	[GCC_QUPV3_WRAP2_S2_CLK] = &gcc_qupv3_wrap2_s2_clk.clkr,
+	[GCC_QUPV3_WRAP2_S2_CLK_SRC] = &gcc_qupv3_wrap2_s2_clk_src.clkr,
+	[GCC_QUPV3_WRAP2_S3_CLK] = &gcc_qupv3_wrap2_s3_clk.clkr,
+	[GCC_QUPV3_WRAP2_S3_CLK_SRC] = &gcc_qupv3_wrap2_s3_clk_src.clkr,
+	[GCC_QUPV3_WRAP2_S4_CLK] = &gcc_qupv3_wrap2_s4_clk.clkr,
+	[GCC_QUPV3_WRAP2_S4_CLK_SRC] = &gcc_qupv3_wrap2_s4_clk_src.clkr,
+	[GCC_QUPV3_WRAP2_S5_CLK] = &gcc_qupv3_wrap2_s5_clk.clkr,
+	[GCC_QUPV3_WRAP2_S5_CLK_SRC] = &gcc_qupv3_wrap2_s5_clk_src.clkr,
+	[GCC_QUPV3_WRAP2_S6_CLK] = &gcc_qupv3_wrap2_s6_clk.clkr,
+	[GCC_QUPV3_WRAP2_S6_CLK_SRC] = &gcc_qupv3_wrap2_s6_clk_src.clkr,
+	[GCC_QUPV3_WRAP2_S7_CLK] = &gcc_qupv3_wrap2_s7_clk.clkr,
+	[GCC_QUPV3_WRAP2_S7_CLK_SRC] = &gcc_qupv3_wrap2_s7_clk_src.clkr,
+	[GCC_QUPV3_WRAP_1_M_AHB_CLK] = &gcc_qupv3_wrap_1_m_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP_1_S_AHB_CLK] = &gcc_qupv3_wrap_1_s_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP_2_M_AHB_CLK] = &gcc_qupv3_wrap_2_m_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP_2_S_AHB_CLK] = &gcc_qupv3_wrap_2_s_ahb_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_APPS_CLK_SRC] = &gcc_sdcc1_apps_clk_src.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK_SRC] = &gcc_sdcc1_ice_core_clk_src.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_SDCC2_APPS_CLK_SRC] = &gcc_sdcc2_apps_clk_src.clkr,
+	[GCC_UFS_PHY_AHB_CLK] = &gcc_ufs_phy_ahb_clk.clkr,
+	[GCC_UFS_PHY_AXI_CLK] = &gcc_ufs_phy_axi_clk.clkr,
+	[GCC_UFS_PHY_AXI_CLK_SRC] = &gcc_ufs_phy_axi_clk_src.clkr,
+	[GCC_UFS_PHY_ICE_CORE_CLK] = &gcc_ufs_phy_ice_core_clk.clkr,
+	[GCC_UFS_PHY_ICE_CORE_CLK_SRC] = &gcc_ufs_phy_ice_core_clk_src.clkr,
+	[GCC_UFS_PHY_PHY_AUX_CLK] = &gcc_ufs_phy_phy_aux_clk.clkr,
+	[GCC_UFS_PHY_PHY_AUX_CLK_SRC] = &gcc_ufs_phy_phy_aux_clk_src.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_0_CLK] = &gcc_ufs_phy_rx_symbol_0_clk.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_rx_symbol_0_clk_src.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_1_CLK] = &gcc_ufs_phy_rx_symbol_1_clk.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC] = &gcc_ufs_phy_rx_symbol_1_clk_src.clkr,
+	[GCC_UFS_PHY_TX_SYMBOL_0_CLK] = &gcc_ufs_phy_tx_symbol_0_clk.clkr,
+	[GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_tx_symbol_0_clk_src.clkr,
+	[GCC_UFS_PHY_UNIPRO_CORE_CLK] = &gcc_ufs_phy_unipro_core_clk.clkr,
+	[GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC] = &gcc_ufs_phy_unipro_core_clk_src.clkr,
+	[GCC_USB30_PRIM_ATB_CLK] = &gcc_usb30_prim_atb_clk.clkr,
+	[GCC_USB30_PRIM_MASTER_CLK] = &gcc_usb30_prim_master_clk.clkr,
+	[GCC_USB30_PRIM_MASTER_CLK_SRC] = &gcc_usb30_prim_master_clk_src.clkr,
+	[GCC_USB30_PRIM_MOCK_UTMI_CLK] = &gcc_usb30_prim_mock_utmi_clk.clkr,
+	[GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC] = &gcc_usb30_prim_mock_utmi_clk_src.clkr,
+	[GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC] = &gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr,
+	[GCC_USB30_PRIM_SLEEP_CLK] = &gcc_usb30_prim_sleep_clk.clkr,
+	[GCC_USB3_PRIM_PHY_AUX_CLK] = &gcc_usb3_prim_phy_aux_clk.clkr,
+	[GCC_USB3_PRIM_PHY_AUX_CLK_SRC] = &gcc_usb3_prim_phy_aux_clk_src.clkr,
+	[GCC_USB3_PRIM_PHY_COM_AUX_CLK] = &gcc_usb3_prim_phy_com_aux_clk.clkr,
+	[GCC_USB3_PRIM_PHY_PIPE_CLK] = &gcc_usb3_prim_phy_pipe_clk.clkr,
+	[GCC_USB3_PRIM_PHY_PIPE_CLK_SRC] = &gcc_usb3_prim_phy_pipe_clk_src.clkr,
+	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
+	[GCC_VIDEO_AXI1_CLK] = &gcc_video_axi1_clk.clkr,
+};
+
+static struct gdsc *gcc_eliza_gdscs[] = {
+	[GCC_PCIE_0_GDSC] = &gcc_pcie_0_gdsc,
+	[GCC_PCIE_0_PHY_GDSC] = &gcc_pcie_0_phy_gdsc,
+	[GCC_PCIE_1_GDSC] = &gcc_pcie_1_gdsc,
+	[GCC_PCIE_1_PHY_GDSC] = &gcc_pcie_1_phy_gdsc,
+	[GCC_UFS_MEM_PHY_GDSC] = &gcc_ufs_mem_phy_gdsc,
+	[GCC_UFS_PHY_GDSC] = &gcc_ufs_phy_gdsc,
+	[GCC_USB30_PRIM_GDSC] = &gcc_usb30_prim_gdsc,
+	[GCC_USB3_PHY_GDSC] = &gcc_usb3_phy_gdsc,
+};
+
+static const struct qcom_reset_map gcc_eliza_resets[] = {
+	[GCC_CAMERA_BCR] = { 0x26000 },
+	[GCC_DISPLAY_BCR] = { 0x27000 },
+	[GCC_GPU_BCR] = { 0x71000 },
+	[GCC_PCIE_0_BCR] = { 0x6b000 },
+	[GCC_PCIE_0_LINK_DOWN_BCR] = { 0x6c014 },
+	[GCC_PCIE_0_NOCSR_COM_PHY_BCR] = { 0x6c020 },
+	[GCC_PCIE_0_PHY_BCR] = { 0x6c01c },
+	[GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR] = { 0x6c028 },
+	[GCC_PCIE_1_BCR] = { 0xac000 },
+	[GCC_PCIE_1_LINK_DOWN_BCR] = { 0x8e014 },
+	[GCC_PCIE_1_NOCSR_COM_PHY_BCR] = { 0x8e020 },
+	[GCC_PCIE_1_PHY_BCR] = { 0x8e01c },
+	[GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR] = { 0x8e024 },
+	[GCC_PCIE_PHY_BCR] = { 0x6f000 },
+	[GCC_PCIE_PHY_CFG_AHB_BCR] = { 0x6f00c },
+	[GCC_PCIE_PHY_COM_BCR] = { 0x6f010 },
+	[GCC_PCIE_RSCC_BCR] = { 0x11000 },
+	[GCC_PDM_BCR] = { 0x33000 },
+	[GCC_QUPV3_WRAPPER_1_BCR] = { 0x18000 },
+	[GCC_QUPV3_WRAPPER_2_BCR] = { 0x1e000 },
+	[GCC_QUSB2PHY_PRIM_BCR] = { 0x12000 },
+	[GCC_QUSB2PHY_SEC_BCR] = { 0x12004 },
+	[GCC_SDCC1_BCR] = { 0xa9000 },
+	[GCC_SDCC2_BCR] = { 0x14000 },
+	[GCC_UFS_PHY_BCR] = { 0x77000 },
+	[GCC_USB30_PRIM_BCR] = { 0x39000 },
+	[GCC_USB3_DP_PHY_PRIM_BCR] = { 0x50008 },
+	[GCC_USB3_DP_PHY_SEC_BCR] = { 0x50014 },
+	[GCC_USB3_PHY_PRIM_BCR] = { 0x50000 },
+	[GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
+	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
+	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x32018, 2 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32028, 2 },
+	[GCC_VIDEO_BCR] = { 0x32000 },
+};
+
+static u32 gcc_eliza_critical_cbcrs[] = {
+	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26034, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
+	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32038, /* GCC_VIDEO_XO_CLK */
+};
+
+static const struct clk_rcg_dfs_data gcc_eliza_dfs_clocks[] = {
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_qspi_ref_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s7_clk_src),
+};
+
+static const struct regmap_config gcc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1f41f0,
+	.fast_io = true,
+};
+
+static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static struct qcom_cc_driver_data gcc_eliza_driver_data = {
+	.clk_cbcrs = gcc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_eliza_critical_cbcrs),
+	.dfs_rcgs = gcc_eliza_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_eliza_dfs_clocks),
+	.clk_regs_configure = clk_eliza_regs_configure,
+};
+
+static const struct qcom_cc_desc gcc_eliza_desc = {
+	.config = &gcc_eliza_regmap_config,
+	.clks = gcc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(gcc_eliza_clocks),
+	.resets = gcc_eliza_resets,
+	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
+	.gdscs = gcc_eliza_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
+	.driver_data = &gcc_eliza_driver_data,
+};
+
+static const struct of_device_id gcc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-gcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_eliza_match_table);
+
+static int gcc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gcc_eliza_desc);
+}
+
+static struct platform_driver gcc_eliza_driver = {
+	.probe = gcc_eliza_probe,
+	.driver = {
+		.name = "gcc-eliza",
+		.of_match_table = gcc_eliza_match_table,
+	},
+};
+
+static int __init gcc_eliza_init(void)
+{
+	return platform_driver_register(&gcc_eliza_driver);
+}
+subsys_initcall(gcc_eliza_init);
+
+static void __exit gcc_eliza_exit(void)
+{
+	platform_driver_unregister(&gcc_eliza_driver);
+}
+module_exit(gcc_eliza_exit);
+
+MODULE_DESCRIPTION("QTI GCC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1

