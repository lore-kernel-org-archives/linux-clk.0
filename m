Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A939C649
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 07:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977783; cv=none; b=Fz40kTkESOOkAXAlaElGIOB1pUW6G3NeRIPTdk3KJYN9lFpIEz9iD+9y8JaPL07Wy3gIjT/2uWn4LUfz2sbgd8kd7CG9szkBgafZPwwFZfHT7hcafmbDjVBJMnI6i3Z4MGQWaMO23zy5ipItHryv99cJizal44UgeHk7OJgWk6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977783; c=relaxed/simple;
	bh=WfJyIWhKEYCIHyqh5La/Ewqb1vx/2ZqqLYqaQpBWvOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmBgCdMx8YvZoNaSMxkR+qIVWEwLSy5DYLG1JP7+EiDk+r5+gTjtK44c2NAiqkZBr85sutjjYnEW433geUPahDKtRZVQLtflKX4p6DMnFWXIH4v59fJoX5kYg8EJLImsUQralmf+Ur2X8KbB4vaw4xMxdBGS5zurMcW/bDkNabA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+iAOPRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4jScxI8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+iAOPRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4jScxI8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624m1gG3486463
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 07:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RajKrhuCjj+BHbI2cFJwW9wj4HU2nyiIy6rW3LhoCqM=; b=U+iAOPRowLXVBydb
	s2p3z9ec0dZ+toXZ0PMURlXXbsOWpU7XMPRu3BT3fZw02uwzgpNtEJkNRsQYrsfb
	i0lTxksj7ZExUHxMB0nBed9Z8LzgA/qSYG3zs6EMa8ExN5sy0q/WZL6EcL4Abj9+
	gQiazY6vAKBgtcc8lEnZuA2K6BtCK/wYHAxXFq38e9ZJ9G9Q9wovH+OftOZrowvC
	6TV0kpmShBBLO8UyV6QjrNKpmLz1EhSxxR8cth/q6QI4xTW00WMOBFatSh7MPGjM
	dUFnlSAlDVcBPraL26fmaO1bxIUG1xo67NHrWX4NO4wjCydShEd3rxM7hc/4Q5Ty
	F1bw3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98gj0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 07:36:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9d8549d55so13657835ad.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977779; x=1783582579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RajKrhuCjj+BHbI2cFJwW9wj4HU2nyiIy6rW3LhoCqM=;
        b=g4jScxI8BH47QOcppIntZ8RJVftVHH07G/eIAMednzgKdTWhs+y10Pn/E6t7LVDiO1
         Ez68u1bXvnwMCl/MeNR8qEbDsI0zT1Hk+YGvxNyc5cRKSP39pKQ7U+2o1rRN3rtVJb2R
         yb0reKTTPrHNYlK221TOyC3ShyFjEf3NCsruV7Qr9ggXImaDhXUg4Gnq1Qi6OnNDglSN
         H9mhN7jJvAKXHqwenbC9DN19AI4l3Itcaiupb6mlQdHJXJMuI+3HhS+o5mgFhkhMZZYz
         JCVAPotOtOmJzwSyNpsFYRwZhWKi0cXdW2nnkpzCp5jI/F4xtq/bZBVAF984qMdiZDmG
         FVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977779; x=1783582579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RajKrhuCjj+BHbI2cFJwW9wj4HU2nyiIy6rW3LhoCqM=;
        b=A5wVBA3iITngsQIzsk/BsOHNwV3LDWK5u9AYfQarWghRm+Y9N0YSQs+xfrPABd7x0v
         zIhfJfjtTq6t7wYH8F7hRv6wlXqD7wUWlbpFD2lOZLKWPtpRNJi0KZOBqK1xmE59GSjs
         lYowmm6VpwJoMFlnMCyxsXdMorLn190Dtfpuygebj/m91SnEcWJohRnkWu2Dxq7/iRRM
         CkqkwcEr2U2WdtptS7HWUqVY9dgcUlhhxzwKF+tLFpdcYHYHNfry+IsAAjEapClv2pO7
         IKsfm/oSa1jLs/xPryzRXacQpvfaezvU3SZbUaUVSGoUbvn8dDVqgg074sL3ODA+TncH
         OQOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRLBc3K6qYip2IJx/IqNJJqAC5Uig7gViC2DCgyjJdZDtwJX5G0ZoR62doScnBsr5gynV1xUBDiiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaTZwiCKUXNyAaDZ+YoWExSmbvOK5so1M3oJdATBG6jsyNu5Vg
	uEStlKytoInpR+POqgnJmdwGgnWFKMiZYjd+H7ImHQh4X7vUPKp4EPnmYZjdHB/5GlEYTjzearH
	Xu8FDbBU/iAl9zakpmwE/71UznLBDhgAZS3mLpAFCwsne2Ozzvd3iTVCrHs2eojo=
X-Gm-Gg: AfdE7cnqCLu7ds+gmpOXbOSNZFa54BKr5ayEjvLmxDn0XVMGnPWDAhJISiT1oz6iWKh
	dhySgkT8zbCD1x0hOWGkRP4mv05jODQPNpMkp0OmsEWR6aIbDXT6fhmpA5ym3geZ1AMQ3mCCEi/
	RtoxvcEBH4MfUML6AyPP3GuvqeNSPUpz2DclQpjam5Vhcg1ikHZwMdglVTcagENRrlrfS0mL0Lc
	szWO/Mu+QsSCgLlYy0kPfTRGw4WpTOqSb0e8B5XVbjqeuyostVdyJvzkXH7fjob+8FH1Od9JtRX
	IggwMIuD+IwjXfIkQyN55aqSt/5NjQEDMLC34my41QNdS2luVEA4VsSLDGEG9uaQ9JDVdyYcUA1
	HKIbtBjNKA1OzjbhoiaOmjNzKlQatLjgvagjqq17YWJPaHnEPIYW/l2TzdA==
X-Received: by 2002:a17:902:ea0a:b0:2c9:d869:61c9 with SMTP id d9443c01a7336-2ca7e8c3adcmr55312245ad.22.1782977779083;
        Thu, 02 Jul 2026 00:36:19 -0700 (PDT)
X-Received: by 2002:a17:902:ea0a:b0:2c9:d869:61c9 with SMTP id d9443c01a7336-2ca7e8c3adcmr55311835ad.22.1782977778511;
        Thu, 02 Jul 2026 00:36:18 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:18 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:13 -0700
Subject: [PATCH v7 3/7] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-3-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=9204;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=WfJyIWhKEYCIHyqh5La/Ewqb1vx/2ZqqLYqaQpBWvOw=;
 b=/W3vA8pXbSiyZ/moZ5F+0FsPraEKDuaQP9i5JlZAaa3ziB0CFxvS+otb1KbND0rVEM5lzHITi
 ZriaYLh+E+hBPp7pyQTpzBAdy+FdHIkNhR9/cZ/e9PUeSdORJjyKVaT
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: t5IzZAF7bDCJ9uvglq30bdaBpfABTF8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX6A//+ad8dVmQ
 X4QyG6bJ1vVovO6sFVpUq4Aum28GMaQz++NAZl/Etj4M4AEPGDYKy04WwbW/NUvzU7mVrnQEaHw
 I8ENFIppMJFQNRQTO4UVkMnsoB1W7xm1d0hK3g6YSb6v/oan03CAiFWjCV4pjFKIPDoB7yog+8k
 rT/Iyy4CwAbEwZClRFygps0R35qdh/WiUmIO/oP3MqIsczAKt7hKjDPIPYEIGYCIra0aSiau+XZ
 ROEaUi+gERM0BUyTEBSmV2ImYIkolPTxZUDdNW5fec7FpYWiq8B6N0tSS+z3mKoxRXpSjF2wt+C
 kFFNcUATdJtHa6Q+arXWMgnd9ZVTaDu9Drn1h6KYLnFxGTiMTE851+XxnLJO9F3MrEpfKcJPF2j
 pfW6IgdMfKCDneGfgf60ensHW2ci8a60wMIzIPJHfhqBFmPulMaCWVbBi9fAzZligLorKynGCwT
 Q5stOSR64szZGTyvN8A==
X-Proofpoint-GUID: t5IzZAF7bDCJ9uvglq30bdaBpfABTF8g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX4P2AbbHQ8zBx
 mKPJoR/mZW7Hx2tZ1cAveT+fXDftigYU2b3p+t186ODzxURwy1Bz185m85YaaPsI64g7SRTjIYm
 LqGOzCxGI7m/+8jQHNlEoOp3m+fWgjg=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a4614f4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

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
 drivers/clk/qcom/clk-ref.c | 209 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  67 +++++++++++++++
 3 files changed, 277 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 58f9a5eb6fd7..4e7abe8d49e6 100644
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
index 000000000000..46d414614288
--- /dev/null
+++ b/drivers/clk/qcom/clk-ref.c
@@ -0,0 +1,209 @@
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
+	ret = regmap_set_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK);
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
+	regmap_clear_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK);
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
+		return 0;
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
+				 const struct qcom_clk_ref_desc * const *descs,
+				 size_t num_clk_refs)
+{
+	const struct qcom_clk_ref_desc *desc;
+	struct clk_init_data init_data = {};
+	struct qcom_clk_ref *clk_ref;
+	size_t clk_idx;
+	unsigned int i;
+	int ret;
+
+	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
+		clk_ref = &clk_refs[clk_idx];
+		desc = descs[clk_idx];
+
+		/* Skip unpopulated indices; the array is indexed by clock ID. */
+		if (!desc)
+			continue;
+
+		if (WARN_ON(!desc->name))
+			continue;
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
+		init_data.name = clk_ref->desc.name;
+		init_data.parent_data = &qcom_clk_ref_parent_data;
+		init_data.num_parents = 1;
+		init_data.ops = &qcom_clk_ref_ops;
+		clk_ref->hw.init = &init_data;
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
+	if (!provider->refs[idx].regmap)
+		return ERR_PTR(-ENOENT);
+
+	return &provider->refs[idx].hw;
+}
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc * const *descs,
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
index 000000000000..11ac2d42ff9e
--- /dev/null
+++ b/include/linux/clk/qcom.h
@@ -0,0 +1,67 @@
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
+ * @regmap: register map backing the clkref_en register
+ * @desc: clock descriptor copied at registration time
+ * @regulators: optional bulk regulator handles for @desc.regulator_names
+ */
+struct qcom_clk_ref {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	struct qcom_clk_ref_desc desc;
+	struct regulator_bulk_data *regulators;
+};
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc * const *descs,
+		       size_t num_clk_refs);
+
+#else
+
+static inline int
+qcom_clk_ref_probe(struct platform_device *pdev,
+		   const struct regmap_config *config,
+		   const struct qcom_clk_ref_desc * const *descs,
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

