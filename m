Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18542E3AF1
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314771; cv=none; b=TDoGbd+vd5991wYcyNN62llz0qJo7BLZltuXK98PCWbT6SADf96xgfSlg3DD3uOV4FSVxQCuOg0ypDzwgjho8XYVdtgnps20fjFhjihRk0ZDzY92WFI0CoUvSvR2kLOwbcFdOcanudSqreYJ4OjaugwbOPbzLqAAXexnVXdRr9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314771; c=relaxed/simple;
	bh=kSfceoKoPkCgd7aDR+qYIcA97c3pxNAG8T/RrOOziqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTCK9I2D38tXMqJI6AGf5g+KmgSRniG+lMIo66lpa4K5Q42Qgr51Pr2vaVSy7iODcKrN+hghHL4NsRh6GtcQ8wmVtpLxXqRrabbVPk3PhPsvaKCWFXCAcTrqgMna/7DvXvRyZ5vuPBLZR6TWNUNritJKkWOPYUZ6kAuCD8DeBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHdm6Cn0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Si5e6Xix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHdm6Cn0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Si5e6Xix"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H7SD653394685
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qJJfStkAEr01lyx9zngav29xGmsak5mO1cGnXwyAnc=; b=XHdm6Cn0pG3vQmDe
	lduOib83RYdJw/jF09itorJprMjibvWWqjnxjEsU18RVGUaxzvWOwhPRASvdVn1H
	Y0fIrskZ6uguGy99F1cqsaIFFbyLfsjdVoEPKCU/rowjBQPgvziF6Nu4pJDQGcK0
	LqZQyMiegqzvYNWn9GU9Z0cNnc3em/9If8RFh8LzCOr4HnG/nS/Fba31x1yrMU+l
	Roeaz3gLBAAGRDgmSz1UIK0As/m95t5ZUsEzk1DPB/RdIKmtvPNgIFReKOeiuUgX
	QBEakZCHNNO3OtdoM3Pm47bUupgtdluwz/1iTDMmRtKF0EMSPR+xCIhf2PawxKIZ
	QFekkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kh9r6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4b8e9112so238127685a.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314767; x=1771919567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qJJfStkAEr01lyx9zngav29xGmsak5mO1cGnXwyAnc=;
        b=Si5e6XixNo1EJUWvZJYIF//cb5nS4gzhQe6oMB7+U5qYJOZPhEKZVzdzYkJNrABJwh
         GK30t5xFpt91POE6pk9+6VASFcZ6E5rWjewDGOYvtimImqnCFkvaiDW6Q7w1/LP4MhZ5
         4Zqc9z2L5YMun9q7ryUutkeRB/bfqknFHvWT+puDcp+BzG9rN362oSTj7e5ZzejRo/Qf
         ocqB6YUkiUISPzpSl4vk5AipHzOKCvI603Tnj9Er9ng7X7j/fK1MizBo+91z1zh0XwKz
         +eOZ3v11o2t0UhtbNBonGX7a1HfrLe8oEJvahT4AkzJamesshDY9OQW9H8rRbt/wSnuZ
         qdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314767; x=1771919567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qJJfStkAEr01lyx9zngav29xGmsak5mO1cGnXwyAnc=;
        b=RVV7gmJytHDGTt3C4mI6FjaESTGUyDz2z+ceqFgrdBZG54LWIo64eIl04wKJvJx3hP
         hOEE6vHLVAkcxFWmWji5uJJNVPJkwJGBLWDMPM3ScDXZ9vraMXuNwIrmx9d3tGQhCza0
         eQ/0xx1HdccCtdVnOdK72f7JYPo8aFsbpOFFFufacORBWEBqhSlCd5b44UIVMWQTSjjk
         PmNrBrhbK5wBxGRd4rODNOr5/9JMbUJiAqvHniKbytaz22YZIBNV1TXadpGZ5JGEb3kY
         PlPqKOpsLtOMElc+Ze3h+XW70FkFbl0Mjoik0w3hf7W0SnRT+IYVow4kvcitr7zmrzRm
         MNUg==
X-Forwarded-Encrypted: i=1; AJvYcCXhR1zwVXCzE88zjRDN6dLVNn2Uh2Xh595UqPCFU/mgWeokinThAolsVKCHEGZe8hVRCP5b1OyW/Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUfoltN4glQ+DcXALnA9N5hCi1Y01Z6qJDlj6E2xQ79JQzlW0
	INSjByaSR6p7cvKV45AkXM2wBD+YzuD91c053oNeDLiZdLfOE1TCkxoef4LLA9JpyV409n6U7hp
	bUE+kuQ43aihbX9bfAOAWVSoHd+LhzjHMkJBWGQZwMnfdm6h/jxR2T6kDWjXoIac=
X-Gm-Gg: AZuq6aII02a7x06zjwgeh0y4uTzWXxEHSPgrYFsnvdBLwYRHgeqbpdv0ld5+IbHifXC
	D+3tDtlZfMJ0AiRYn5scNlqxVYnDupiFlpds3swI0J57kE8atHIhqY/NczNsXrplpg/DBNYZd6P
	+QypGefQjkxTpvynpwoGXjCYOECxW85QL3rgAm4xaMsG12A+M1I++L+Uqcj2nUSycyE6lsh5d8+
	PI+UmwVPV0xB/1Z23rW+kjQneqHYAs75fpnqV1kBHUE2qMwO6DRLWTsrUaetCavwyb5HW0oWZNm
	n25xdgv6ZAKYYR+gyydcpZ4x4ZWCgpUh0WhfRpPWZ1Cp2Mp1V2GKIXQFQnef2Cidk1HTKr0Ig1f
	HwlLTwSRxZ72Be9EhLl9ZzO7IJ9IIdA==
X-Received: by 2002:a05:620a:44cf:b0:8ca:3d7c:e765 with SMTP id af79cd13be357-8cb424604b1mr1389479085a.50.1771314766952;
        Mon, 16 Feb 2026 23:52:46 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8ca:3d7c:e765 with SMTP id af79cd13be357-8cb424604b1mr1389477785a.50.1771314766327;
        Mon, 16 Feb 2026 23:52:46 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29860229f8f.33.2026.02.16.23.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:52:45 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 09:52:26 +0200
Subject: [PATCH v4 6/6] clk: qcom: Add TCSR clock driver for Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-eliza-clocks-v4-6-5d09f28d4251@oss.qualcomm.com>
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6777;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kSfceoKoPkCgd7aDR+qYIcA97c3pxNAG8T/RrOOziqk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplB5AQoZm+JkV4dOCIsIyI+j7F7Go56+dlOmFX
 +Q9hUgLTleJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZQeQAAKCRAbX0TJAJUV
 Vh/7D/0clbUjuOxScSqTi1SBKFZdN0WJoGEqf80RJcwF6uQC9M6c2LCW0GtD1AG1rCGBIRd7Ef4
 AHd3uxrdrELebfCyYZUGXMf6CPz69K/9EN6DJNzoYcS6NIQ13oNmQGn/Mk97Y3uj6XgLPii+pGm
 z0hbi5H8u9SZiZPrKhF/NF2MyjxV84EqwNDorBmL/NcdMBH4XmY/SyBo+6YVvAzh0hy5Ngap1qU
 0uvwNG5JAhKNUfYk01Wa6whjRBJ4plWPTBU/OArHUvBiZgKcFBzjf4xlf8T0lJOZZYi8vctO6VB
 bsL6rcRCt2IN7yqnY71aD/99K4lwF2tik1aWW/6+MkhAHQeNyB1h947nUCilqFy9d8uXYa418tG
 ilLYKhXQdZroY+2QT+aT7O5DaKZXFXHoiboC6ZIqsvQY1QWvnPX5WGOsgwT8BMqvpclAaxFzqpm
 wDZUSbmJ9Idt8l2W+L+a48dYMIi8B+RIxlOnWolnCZHAmDaVLFor9lWxXHU02UXSCE696/O9oJ4
 0Xvmuua9vTFbJub025UsZo3N48A1Drft3ZpiNyXlOs330PWeA3D2yEVQfOiqDvWtaK+LqVvY3KU
 dThPI7Gbx+6+cWXBcUVo3CE5GSyYntCzvKQfFIQViCFddhZSdTHOpJD8jHuZ0jKOFMBRjGy8cOx
 rZXtpqT9abYRDpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69941e50 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=xMpycIIAKlYumkEOWPcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: mvIPLzqCtepaV12gr_mHrQOhRxUOQMt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX8yiX2I/9efS8
 wb8E93dyPIlp/h6Dzkl6iGnY5fnu1MgVhW7ciRxm7nKpo4/VLsYOsS8ihOcb1g+mn3H97lZ78QH
 k1XT4AgXpFA17lJ5sVGKDVL8f0V0Gv9O2xRZyNrzViePxZThyi5+Hjffs5y6BkYy54tZ07Tmutu
 nl7MPOs85WgbZjSQMRtNQ8sywQYpjdpyctE8wYvDf1wxVqYilm59nMf9dal3kIsrabZU+Vf5s60
 /EAzontc2XoPOywUm9OWJoLkQvi1y/Cl4dnYAXBr6SPH4LQp2hRgifMkzvpB+MuxBrka9mDGCRC
 /5Q7WFYGQUTcIKhm86LI38k8je5Ems9aQjSCaEvhM9agym460eFq4fTlLTRAnxbxonFDqafp4tz
 2JagbTkNekRFjiczEWX8FwJP3ulqI4u4aHBFlukIwWeFnPqJSO4vqnFubZZB0Nf3/5i8rj0HNMf
 UoahqMIg3Q3mEZWHceA==
X-Proofpoint-ORIG-GUID: mvIPLzqCtepaV12gr_mHrQOhRxUOQMt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064

Add the TCSR clock controller that provides the refclks on Eliza
platform for PCIe, USB and UFS subsystems.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

