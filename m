Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6602FF15B
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057047; cv=none; b=ad2Zhp+RI6njovurp04wN9OxwNNc8ep+Vn1nt2UWds5YeFCZdvp3HYCp/yidCuvxhq4wtMatzdB3J252DWJbZW39yU+ZYvMKJOUCfIAyG69M+cBvoXz/WpKXmSulPFBh5asJU2ZgMAJAIQ8a9001wrYKdtpngWsr26lT4KP0OJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057047; c=relaxed/simple;
	bh=8TZSAgGn0ST4uwQenr8bMUEmLD2tllnMMegjYZ08myg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3a2RAPWmRDpzhQQE85IscJCPUDS9AWGFALoh6jOdnUxZtyWgr7elbV73S1g38ExbnBFsJmFZOD0DdB1/MdnESH+jcVMLWBI2+HoAZDwDlbbLlnakR+I2BAF1LCuKv2eShg7pxAeeZ9L+jAu7dsPGvOH+4PBxTyNYjbKbtZGiWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZFtGnIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6pTtnQG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZFtGnIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6pTtnQG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467ib5L248294
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 08:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=; b=dZFtGnIJfflKDtT2
	Z9GF+8lwwzsHEtK5k8iui/yHyiuN2Df5TSCmL37zn2K9IRoyiVl4nRZ2tEXSaeX7
	olO2k02fz1EN9A0VEuTHZ8yK6PCAeArilRiHS1mjnifH9exM0mSoBhoPj5xNL8xh
	CbENIH+whYd2jnrsdY9zfjG7H9Iwyb07NOu5LVjgaHvFgeYPIse85LQfrD4zfe0V
	XYurUKh5Ve82dcFalFNo+MNklYRtFfLmowwT6cYcslw5qV/FMjJe62v9i0VamqP0
	SJmyEKCJYnRHcnHh+W6NIkNVi+eMj/AuahqMslXbM1c0rYWxPU4vXkK33yCc9XCB
	2NvuTA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq43nfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 08:44:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dc3d81736so3869256c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057044; x=1778661844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=;
        b=g6pTtnQGWgZA2krDa5KHjKWmoJ2tD5A6Wpm6psBDlwIAwUS/blV3IkvtHoJKRFYBek
         LPkwEjZXyPkOetN59uWeTkGyxSYjPbwxoaFZcgBXHRE/uGP11BYjUrxRdnN80sm0ezHl
         0x4BFmdFECduJpOrNEI2RR8ZJg8YruWj/Cg0MLTmtIXiN1FvVw+MFpUNZf4EFPL76VfV
         ZqTIp54fR77098zAzqoPerSf5WuBy0FxvACbCWjxRdDQ8y/mrmndVscNs1oIpdjIvGYx
         WGVqfx7lrM3euu040QoefuP99/4Ls27DNBfaR0QlRwRNXcQEehvpSIUzrSvGk30zXi44
         zfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057044; x=1778661844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=;
        b=bBw8YHkOUD9/HY1bSI9xNIc4a2GG9lca3JC1VcTecJTnPdRDIap5bvtNwqNcmtQOHy
         F7GWbhg2HsSP9GbDbTELgyFcwHAo2b7VBK8Hb+TgJCQtctX9V+ACl0V+2c3jSnfGjj4U
         MqyPNtSpxkxC5h8UAjtTRykNHHfZjBq6JOsPjp2+HNlsCp0D/obBfhueRT41DkdS46TT
         a4w/c1dIuAJ21McjmcBoCxjbWGezvKcDPTELCUNgxDuzKi1bOd35d4+7Er5i2jqBoESd
         v9MP19Tb3p4gNke4d3qBbb3BoYu4Dt7iZx2uamFB4uerEaT2AsS+Bw5QxmX4qPYIaPAJ
         4Uyg==
X-Forwarded-Encrypted: i=1; AFNElJ9jBB4D89lLkzh8Q+ue2AJlqQUPjfPYHVsEzYEKlJ9Z7YVJnt5XFPGorpNY//+SF6yosl74ZhFekL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7UOzjq++wdqjVBnJPQSPUASBajZ50EBHwlvUIRTGdwNdI568
	L10UlgGm+sjWeh/T4di04nWeUwXkCG9V/Lf4QvBxyYTj3XYoQ9zKGTHegxMpP6k7wmGXwxGg0Kp
	XRhHiIoPVSZm8kng0t0t4+gT8XwzJ2JOPTbFBEV8oOb6wKVW+DpUBgw6pK0AXGv4=
X-Gm-Gg: AeBDieseklpZZFvfE1PYZYwm5BkCayE7lHN9sYTEieRKClfIJLKsBMlw4YI3TwCA/7w
	xY3QCYLYcqCJlALxmYkpKudYwCYSy6OJrdLVtxuwKbUIf9OSFj8ARABtEYjDvxcx38i98JdGFZT
	uoRFxGA6rvXI8YIzewGnB+W9g2nx2q8zBsm1Ov6hjqd/zpshGy74CKWwKUxPlfJd0qXdIoFChKP
	rlGlBiN6zzPbLXlTGBxTWnnYpX5G9q/qggkjX1zJFDBaLdsVAtugjOYtqJ/YkV99PVJ5ljvMcSp
	mFseXa5kInb6Wf+uxzfE8eq1l3xwgPS83lRG9unQyUbLR3Kw7z/CSQazH69utA0xpzFFv78ElLS
	NqsqFPIsfCgPOH9Q9RCjaNpLkPC1BujS3Tp9fTSx4eS8ypZkdkDWFZxzMSsv4YFByV9XKy2ViH0
	CDTf0=
X-Received: by 2002:a05:7022:6986:b0:12b:f616:1a4e with SMTP id a92af1059eb24-1319cf59611mr1129869c88.23.1778057043987;
        Wed, 06 May 2026 01:44:03 -0700 (PDT)
X-Received: by 2002:a05:7022:6986:b0:12b:f616:1a4e with SMTP id a92af1059eb24-1319cf59611mr1129848c88.23.1778057043429;
        Wed, 06 May 2026 01:44:03 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:02 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 06 May 2026 01:43:52 -0700
Subject: [PATCH v3 2/4] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-qref_vote_0506-v3-2-5ab71d2e6f16@oss.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
In-Reply-To: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=9136;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=8TZSAgGn0ST4uwQenr8bMUEmLD2tllnMMegjYZ08myg=;
 b=dbxfpoi2P8RbSIS72U16ah5cj1rwJ6fWVERulkmsm/y1rDnWHMwxsfJwa1YEulcPo337AK8B7
 sPQr8xkmRyJCqwCoCvi5/pvM/mhnIp2pEIObK9mT4BCaX+YX2/yHEd7
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69faff55 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfXx0BnfCVL8VYq
 oZYQDdLx7vwazNAdonM72QilNx+v55W2PSU1DOzFzr9BgqAxuCjq7G80eMw1TOC+QZeRPAdLdT8
 u0h6blIeeyk4eaP2cyxWugXANlYto0S6FYZ48R0b9borSMKb52QqDLSa9PXyXxlWW/WWrjKm+zn
 p34YlzXsiBdJsbVax+gf2GJeqx/WC4inUnjQHUM6MipBFBxZKLB2JBpmWeHCX2nemNX0hAwk7K9
 FgWUMIKojJFvgTqzBzTvc1IenyNsdfQH6YKqAy62zl1IV7xWCy/ukh/I80xpUoUaqGTL+VkvDwx
 6cGHlzHaco9i6yrR4a5IsVvS3VbH3KCmqNDkztwUZHrx/cebhbz7TlmG93BhSXLxU6quzdg3E4z
 4jsz6/G+LpanRSGAKiHBHgLN1+dGqzEid105CCgow4739E/v2ikBs66dPrvLH6DSEbSs37ifkke
 04U5j1zjhZSVDen6y/Q==
X-Proofpoint-GUID: -8nwONuexVERujUnZ73ogLzDMiBGY3pg
X-Proofpoint-ORIG-GUID: -8nwONuexVERujUnZ73ogLzDMiBGY3pg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060084

Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
register controls whether refclk is gated through to the PHY side.

These clkref controls are different from typical GCC branch clocks:
- only a single enable bit is present, without branch-style config bits
- regulators must be voted before enable and unvoted after disable

Model this as a dedicated clk_ref clock type with custom clk_ops instead
of reusing struct clk_branch semantics.

Also provide a common registration/probe API so the same clkref model
can be reused regardless of where clkref_en registers are placed, e.g.
TCSR on glymur and TLMM on SM8750.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/Makefile  |   1 +
 drivers/clk/qcom/clk-ref.c | 202 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  69 ++++++++++++++++
 3 files changed, 272 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d9..1659e9d9afa9 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -8,6 +8,7 @@ clk-qcom-y += clk-pll.o
 clk-qcom-y += clk-rcg.o
 clk-qcom-y += clk-rcg2.o
 clk-qcom-y += clk-branch.o
+clk-qcom-y += clk-ref.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += clk-regmap-mux-div.o
diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
new file mode 100644
index 000000000000..ea2ed03460f2
--- /dev/null
+++ b/drivers/clk/qcom/clk-ref.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#define QCOM_CLK_REF_EN_MASK BIT(0)
+
+struct qcom_clk_ref_provider {
+	struct qcom_clk_ref *refs;
+	size_t num_refs;
+};
+
+static inline struct qcom_clk_ref *to_qcom_clk_ref(struct clk_hw *hw)
+{
+	return container_of(hw, struct qcom_clk_ref, hw);
+}
+
+static const struct clk_parent_data qcom_clk_ref_parent_data = {
+	.index = 0,
+};
+
+static int qcom_clk_ref_prepare(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	int ret;
+
+	if (!rclk->desc.num_regulators)
+		return 0;
+
+	ret = regulator_bulk_enable(rclk->desc.num_regulators, rclk->regulators);
+	if (ret)
+		pr_err("Failed to enable regulators for %s: %d\n",
+		       clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static void qcom_clk_ref_unprepare(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+
+	if (rclk->desc.num_regulators)
+		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
+}
+
+static int qcom_clk_ref_enable(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	int ret;
+
+	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
+				 QCOM_CLK_REF_EN_MASK);
+	if (ret)
+		return ret;
+
+	udelay(10);
+
+	return 0;
+}
+
+static void qcom_clk_ref_disable(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+
+	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);
+	udelay(10);
+}
+
+static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
+	if (ret)
+		return ret;
+
+	return !!(val & QCOM_CLK_REF_EN_MASK);
+}
+
+static const struct clk_ops qcom_clk_ref_ops = {
+	.prepare = qcom_clk_ref_prepare,
+	.unprepare = qcom_clk_ref_unprepare,
+	.enable = qcom_clk_ref_enable,
+	.disable = qcom_clk_ref_disable,
+	.is_enabled = qcom_clk_ref_is_enabled,
+};
+
+static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
+				 struct qcom_clk_ref *clk_refs,
+				 const struct qcom_clk_ref_desc *descs,
+				 size_t num_clk_refs)
+{
+	const struct qcom_clk_ref_desc *desc;
+	struct qcom_clk_ref *clk_ref;
+	size_t clk_idx;
+	unsigned int i;
+	int ret;
+
+	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
+		clk_ref = &clk_refs[clk_idx];
+		desc = &descs[clk_idx];
+
+		if (!desc->name)
+			return -EINVAL;
+
+		clk_ref->regmap = regmap;
+		clk_ref->desc = *desc;
+
+		if (clk_ref->desc.num_regulators) {
+			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
+							   sizeof(*clk_ref->regulators),
+							   GFP_KERNEL);
+			if (!clk_ref->regulators)
+				return -ENOMEM;
+
+			for (i = 0; i < clk_ref->desc.num_regulators; i++)
+				clk_ref->regulators[i].supply =
+					clk_ref->desc.regulator_names[i];
+
+			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
+						      clk_ref->regulators);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to get regulators for %s\n",
+						     clk_ref->desc.name);
+		}
+
+		clk_ref->init_data.name = clk_ref->desc.name;
+		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
+		clk_ref->init_data.num_parents = 1;
+		clk_ref->init_data.ops = &qcom_clk_ref_ops;
+		clk_ref->hw.init = &clk_ref->init_data;
+
+		ret = devm_clk_hw_register(dev, &clk_ref->hw);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct qcom_clk_ref_provider *provider = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= provider->num_refs)
+		return ERR_PTR(-EINVAL);
+
+	return &provider->refs[idx].hw;
+}
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc *descs,
+		       size_t num_clk_refs)
+{
+	struct qcom_clk_ref_provider *provider;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
+				      GFP_KERNEL);
+	if (!provider->refs)
+		return -ENOMEM;
+
+	provider->num_refs = num_clk_refs;
+
+	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
+				    provider->num_refs);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
+}
+EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
new file mode 100644
index 000000000000..09e2e3178cfb
--- /dev/null
+++ b/include/linux/clk/qcom.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __LINUX_CLK_QCOM_H
+#define __LINUX_CLK_QCOM_H
+
+#include <linux/clk-provider.h>
+#include <linux/errno.h>
+#include <linux/kconfig.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct device;
+struct platform_device;
+struct regulator_bulk_data;
+
+/**
+ * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
+ * @name: clock name exposed to the common clock framework
+ * @offset: clkref_en register offset from the block base
+ * @regulator_names: optional supply names enabled while preparing the clock
+ * @num_regulators: number of entries in @regulator_names
+ */
+struct qcom_clk_ref_desc {
+	const char *name;
+	u32 offset;
+	const char * const *regulator_names;
+	unsigned int num_regulators;
+};
+
+/**
+ * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
+ * @hw: common clock framework hardware clock handle
+ * @init_data: common clock framework registration data
+ * @regmap: register map backing the clkref_en register
+ * @desc: clock descriptor copied at registration time
+ * @regulators: optional bulk regulator handles for @desc.regulator_names
+ */
+struct qcom_clk_ref {
+	struct clk_hw hw;
+	struct clk_init_data init_data;
+	struct regmap *regmap;
+	struct qcom_clk_ref_desc desc;
+	struct regulator_bulk_data *regulators;
+};
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc *descs,
+		       size_t num_clk_refs);
+
+#else
+
+static inline int
+qcom_clk_ref_probe(struct platform_device *pdev,
+		   const struct regmap_config *config,
+		   const struct qcom_clk_ref_desc *descs,
+		   size_t num_clk_refs)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif
+
+#endif

-- 
2.34.1

