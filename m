Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F350E33343B
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025339; cv=none; b=ipQ2AWu/efLdkoIdFY0vfM5J54c2459JdTU+hlRg10Qaia8E+gId5Ctpm2Uqe2AyPEOozxVpprNy/ztFPn1soEa+60LZcEwUHeZcaXfxDGxzQDSR2+3bFL9UswC6hrBtGfaQv+1f+sxjYvwC8SvbZe/OxObZAHH04FhlU3e0bIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025339; c=relaxed/simple;
	bh=LVke/3uSY/meafnv+KY5H8ReXOtHnfGoZ1kiQEEwTxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4IsWXOi/3nZunpAi2gXysWFi4AHTCShd7tWJcZomW5uTSRELdBlkvLQODmTvVvL+YgN7hgnMAPQsMPbnVP91X0PoLUyrYTzF7HEOdyLORsss7cUTy0B7O0/0K7WE7wRNfFiHnElJN5Blw5UH9iN4/rENuNkiqG96LKYF9U8NUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njUmQt5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YheXJCn3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njUmQt5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YheXJCn3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316LrQB639203
	for <linux-clk@vger.kernel.org>; Wed, 1 Apr 2026 06:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cxOM6L9rZEs5b6lY8QSOuBdOV8ZlCvf3Ji7AEGKfoI=; b=njUmQt5O+qpmuiK7
	Fsv4XesloYNk9eUPFbA5LkzDdSXMbY3gJdPXg4vPcDzBGWiNUD2a6O2BtwzV+mMa
	kq6AL7Male0TbWZaDuvB8lC8yrFMAV3eDTIq+ifMorSyI8KG2yquRdklXjw3H4VM
	QOcKK+Ta6l9vLBS3OGvzeelVlziSc12QO+C67DP6mdpOeEsawz56FehtCCq6f5ey
	Nz/p7WB/eCpa3sM5P12EgpBVzN8M0lrEbT6roow6RcswKtm8H4oFu0g5n4t1UHW1
	cBJS8AXwyuDAczyNtbdYEsAc4htuPcFy7rxN0VnuLqYalrjYny8V9CJxDNM4Gx1X
	n98Bbw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2auqrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 06:35:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0ba59a830so8263516eec.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025337; x=1775630137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cxOM6L9rZEs5b6lY8QSOuBdOV8ZlCvf3Ji7AEGKfoI=;
        b=YheXJCn3UzP/z/LOyOfc5uUXMvPpl6DqkRiHEeQibAOpf2wtb3hJWUATsUUtrV4NzA
         u9Ncz6RcHx14fF52s02znFqJomE+kG37FNjkigZG22mjRY6cfSEiDD0BS3f4Pd2Atw7e
         SM6AQA5HgG0WI5UEutfzH0/qlhq0K0jTd7QwQ8Js83dXb4aCSYdqloMWITNgoFFukVNC
         uZXRSt4H3/lTNDn2AwFBX2/q4soKm+uxgNBgajEqU4mdd13FgDy5+NVms6DWDghzEMMi
         5Li2+48DmnFzeo6UqHsmzvyMzx8Tz4DW958zvfs+49ayhEx1GeRdlGM22yJHzNLLZfk3
         QNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025337; x=1775630137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+cxOM6L9rZEs5b6lY8QSOuBdOV8ZlCvf3Ji7AEGKfoI=;
        b=XBnMCqYNBFACvyMBKoEjXzs5PIpnaLny0h6GKHHW/ZNW4El1TwRkyGI7KWyjgbrdiQ
         4YeFl6vW09OMF77kh881SEZ+w4j63je4/0am4JB+EblQeUhNSflIvXBcD+lyTuEMRVyv
         4OdS3iIgb0d9LFB+ngitpXv9Eg20hiL5xP3AU9BifqrLet9XBKzb/1znlfnYSzZFSSol
         LhfciPQrZ06KUgInQ5j/9Kp6PCeWBXRhD4w7DztXaWPGhuj4eL/L4KfZ+YnW2k5JJg/U
         XNgC5Cib4lC9g6oGcWmxzXfdG5q+BK0MUky8Wz3uOQ+vmBnJ9P2vcwzxIif4gL3DqNAu
         B2xw==
X-Forwarded-Encrypted: i=1; AJvYcCVkdB+zJ0SFdOLUhwmiLhjeU/Y4ug7VLdyAnREIM3DVxB73rmUhyeqRXVF7yiMq6nPA2E1hZXtSUfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWz+u3fpBr1r5j5AhMm3H2KkGNUufzJBW3ZzFiqi4w/2Kyf6E
	TnM64F0Fdc73s7xBKqerNcWzHs3Zufn4SH5UWN16y266E/rfVDT4PJwnYCdfdqBw45Jsq7h7ZEd
	b9UMXD0Gse2oHaEOXGLrhCE1lTrfUDF/DdAJlSynxT7K3KfHDBav8paH34R7Bh04=
X-Gm-Gg: ATEYQzzi0SPO7WjdcBNAVerppp82mCrfoEDXSuOEL931S5evEzqTmQ8BFvVoaHOZE0H
	YDZwwgSF/J/RD/UK2I/P2orgq7yrCqP+QaAA6vvjY29Z35eXwENap5YR0eFam8Y+qvCZ/tGPV3P
	1ILexRjNSmyeXtRjTayz1KBh41GSCs+Fpbs0ljinyWG7eBnyvRaT4Y1MLp+kpfYTbNSeUqcjVth
	5PmgykkWkS5G43w+gMkvztUqkY68V91H4HY6c4XqNcpaaHIMNc5YdCmMrQ4jjPgzIdny48GOISZ
	s74ai7sYBgt9sza3ANH2o8iiR+mXc4kVlWCRAohJsemFJbM+MeOR2JjcL21xlVXsk3hntPfKw8E
	ldLb00PdjuMwGcJdP62mupGHcekpmBRzgX0fIorRF2BP1iG3labZT/+Yx+pKk126lW3Eh
X-Received: by 2002:a05:7022:eacd:b0:128:d967:4678 with SMTP id a92af1059eb24-12be64b0cc3mr1389361c88.23.1775025336509;
        Tue, 31 Mar 2026 23:35:36 -0700 (PDT)
X-Received: by 2002:a05:7022:eacd:b0:128:d967:4678 with SMTP id a92af1059eb24-12be64b0cc3mr1389343c88.23.1775025335687;
        Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:27 -0700
Subject: [PATCH RFC 2/4] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-qref_vote-v1-2-3fd7fbf87864@oss.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=9128;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=LVke/3uSY/meafnv+KY5H8ReXOtHnfGoZ1kiQEEwTxY=;
 b=ZMQkYONijHlGWjbgJ1SHvJA6ZoPBdttIDCfk5Se3CxVupNEwawERJyC20q6XjKO1LmWgQe9iA
 rpo23x3JB4IDMZ6HHj4Pu8FadSAYeQ5Hu35I+nvFLxHD6JnSzvt1ZvU
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfX1tv1Om2In332
 /ZwRD+stic95cmr/I/1PjzYD3m9SmlaCY0+EPVMs/zNMEeUUrBx9L6dorXhx0mlTC8JJSPc8kn2
 iJFmIFpBAhSahFOffEGFpna/CRywX9YK7gVazhrLqfv6xbC+IPJpiFmJH9S79N7rfKuuiF90KpW
 reuQABN6MZFZ0wy3Tfk+fo0fjKhrltqlDH9xt9cW1uot2fo1wgro97hDdBkWr4YmtkZZiwtbOgU
 xAJl1UPVpdI9ye1c4YHcyv3460eyV4RwP51Kt/U7tonb65XecmYsroSTzkiEnmMj+rhFbwphpCv
 5C3xNcoQkRtteOih65EJ3DUKhgqnLzJ+PEjCjOpWh4GXYt48MojyuHqprr5R5ShkDsxvaJW4nJ8
 fTVjlVUD7kplXG9y+0rBy71zVWhSs46f7m4VZ/Ex182RLuwc1gwcKxwpGt12jPb7ySvpHHnf5O5
 38Sw+LdX/c/IpkUE6lQ==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccbcb9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 18vcshIiMrb5PPKkNPO_43ZC550Xei5S
X-Proofpoint-ORIG-GUID: 18vcshIiMrb5PPKkNPO_43ZC550Xei5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010056

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
index b818fd5af8bfb85a51ee90fdc3baa93af30dc39a..c5effc18efd80dd6c25a5398d723cec0f66fe0e6 100644
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
index 0000000000000000000000000000000000000000..ea2ed03460f28c6dae089e19cc07a5697b9f3d35
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
index 0000000000000000000000000000000000000000..1066ef46ac21e9db1f3440faf81ba52afdf1faf2
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
+ * struct qcom_clk_ref_desc - description of a simple XO reference gate
+ * @name: clock name
+ * @offset: register offset
+ * @regulator_names: optional per-clock regulator names
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
+ * struct qcom_clk_ref - runtime state for a qcom reference gate
+ * @hw: clock hardware handle
+ * @init_data: clock init data
+ * @regmap: register map backing the gate register
+ * @desc: clock descriptor copied at registration
+ * @regulators: optional regulator handles
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

