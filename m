Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6E038B142
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504971; cv=none; b=Q6l3d37yz61cPld0Pab4kGlka/s0XAH4RjAFh7zf1+TrPa4PFcITqnj2SiJa5Pz8fhfEcnF2iTk55ELLTh7UOMq3styBpjHIVhnRVPbykpl/zT0xdzoqMPz1T/pzg7HusQ30DfsMsteYDITK/UzjwXq/sRo6ma0lH9NXOseFTRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504971; c=relaxed/simple;
	bh=qQ2ahtKOzqcbRP1I5GkKg6SEJG8zSc+qUEFjxDSML+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRl80hdnKwpig6iMVGMHvCdY2E+kSIF/7IXwvNDG5z5qO2PDmpSJ11yoH8yRiKIXqL8XLNjjoFQ9wYYafmjf7dNYVkB8GDN/BGhrzXJf1lWvU1bcxMbycU7MNeQmAHdcQtUJGkyaLQiQ+ko4ZHoKaghghL/ZDBXU+8m4lgHQpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jiuc6lPd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPd/bW+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jiuc6lPd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPd/bW+J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889G3f2135680
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 10:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUjpVjFlzPhb84FpHwFk8LSNJ3zWbDzddpfGOiNw7Qs=; b=Jiuc6lPdPAWgv+km
	UXUKv5TjyED9gDhP1IRS0yUGSTxyXrsfLX2yBEUteLv4iR6fehQLpUBGURR+2lRj
	7JianLWfzWGwUEY/wSAYhWBf+S/tnDCP3Kwu1IyKMiiKyRElxp13RNGjbNNKs7Gb
	sbJBBnvkzhTSQYVi/9L35aH6CR1sQIShrs2Hi3ocgp8R4HPWnD58aF24o39j9mr4
	o333DPMiH59toz5ZUBY4ipUjxvY/jIAYU1J48fhwNSD29efHW+vAousRWGCm3m3f
	L55QhpPZS7uoxEeuUifDKpOkne/E1Qlaj3zs4gfO394xrxrly6ncRFrQFGyEXppR
	OynWSw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgtmef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 10:02:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso602988a91.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504968; x=1784109768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUjpVjFlzPhb84FpHwFk8LSNJ3zWbDzddpfGOiNw7Qs=;
        b=dPd/bW+JZqUr+lqgLMBkCCYx1Iie6uVbW72aQMH8xWMj40ZiIy4zgKfDewgQ5uQ7Gt
         fOvPIf7nJj6viGp8dSMNXY4JfqvbSXB4tDtasFE3X7rYPc5kTaUdaLXGltz1TcSxCEtc
         r5SRA/5iO4QOsFGmELJzPQiVfx+I4dEI2g8X+LyOE0z/NJfxCnlPNnOZMA+NaIknPcVv
         LrqFMXck5Z3zHVf/oaU8zUziz2o/4havMu6c63xB0mN3eh6kEmS2dSVlYDfVQR8GUTaP
         TOQQiZ76jY1NJ9VAvavTy0QPqUTyndhfOc3ahFm2+oZq1pk6xn32nJmZifD05YGyhhXs
         gR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504968; x=1784109768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUjpVjFlzPhb84FpHwFk8LSNJ3zWbDzddpfGOiNw7Qs=;
        b=TMNypFEFrZpUvFG4P51u2B0DrE3677rMDqac7Zwe28FJhj7kLxi+zxWHhthrm9f70q
         M7hw67wx8LYEmiGZUJ+DGtg52hx3fyLEIkq+RggUntsIf8glTWK93M5e1Y9fOs4fsEj4
         +GBWDY8+50qHgfdRMW6RwVFkzIig+ubZzq8Sox9A5R6JhKf5EwsQQP4M9C1BBmo0iHBt
         a4FpnKTvbIioqrMymXmkpMfqhjxtqsAnLL1q9CkAEY3LlLNPQRwh2xjar1T4FoPbgf0U
         zRFwjO++SCwx9YS2l6xdYwsWyHG84KTmy5gcdzHSTxvj3PJcwRGRSBpf6up5cIYll5q1
         kMKA==
X-Forwarded-Encrypted: i=1; AHgh+RpfGzinKVLeBZwFV00Jp1VPiIn8cI9u83ZsORTZQ8hohUeGVe4IbXdfe+zV058W/xrwS6K+HG5iIRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YymqyYAX/36BEjmQRyj/kCuqVFtMdcjVCHuaAwcHq5ZD2aY6zk2
	i6q0ETX0MA3SMfU8ZWNgiu2q7dOrqcEOLry5Q0epR03fdjz6eCXE1WsJfSi4Qs6PCr8iebbs/9h
	rgeL+T7iL0yep74nH0Xk6Z5ObmfYqUAOLevm7kgGwDZqIqabwmsOh91jkcuE/vd6YXdQ6C6puxA
	==
X-Gm-Gg: AfdE7ckye//YcOv2z/BmlMcQKK+oCqIEUXGrptAteUowfsfZz2GOmz6vhkqhpZ1hY7K
	PN+wKqGfdOJjcHF6l/QTm5uI0QqEAmtXTnItjfzHpaeXbvbkWqrnLAOfzOjXnGhJ3GLCwknfAFe
	oUXEpI0kTJaLa1Z8YhNB2lBuOOp/2fta7LT3+pRIdABp22EGLLrj2I6nO3ic/ViRh3/aYO9ZuLd
	wxuRuPWkjX6BwAxDeX7ftjUQ1QagN8xqbuzNRu/os1/skxZn6S2Gqs5LDWEag1oN4TuhWEe0Bqq
	DGUbssSXpaJfNug1rcUPLeO/9Jyx7RWaPlIRkMxk4gn4n8Mwca6m157lnxlltaooxrBvdzhtR+3
	eL8J696lkJkFKmDSZ/YCHb/mapuT3UQXjelyhQLWn7ONRmcfzK5Y7RihSQw==
X-Received: by 2002:a17:90b:5605:b0:381:aff5:aa0a with SMTP id 98e67ed59e1d1-389417e5213mr1734196a91.23.1783504967780;
        Wed, 08 Jul 2026 03:02:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5605:b0:381:aff5:aa0a with SMTP id 98e67ed59e1d1-389417e5213mr1734150a91.23.1783504967304;
        Wed, 08 Jul 2026 03:02:47 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:46 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:40 -0700
Subject: [PATCH v8 3/7] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-3-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=9170;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=qQ2ahtKOzqcbRP1I5GkKg6SEJG8zSc+qUEFjxDSML+4=;
 b=Khe0NTMSSkL6iEtDhDcdMJbuBq1/4nXeAxGqJkS51g6gqQqwn05MqxzIZrVP/6MpM4Id/mn14
 yE+TeRpC58dA16n81kei56poynijQpxpf6h86AUdgWuUcU3AyC9dnGf
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: Zyy6iVtfqmRGaPFJal5Px8BPXLed3lz5
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e2048 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Zyy6iVtfqmRGaPFJal5Px8BPXLed3lz5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXzB/abPmpNC2l
 uK2o6wfI34dzOurBoHz/AR5hjKvHF0TdpEwm4nVlVIeb491A+Q0QcWOeLi25mb60E3EP8TPGpGq
 3aTXH9EUs42bYFM0j7XwoVj0umNqI5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX7OuHLi4pQxmI
 g860W57mUHoIWimkakZTqpjPASJyTXU1gRLi6CLEEohTVeHYDrdpe/eSLKoxKJRyAJf/ctPuNEL
 8ctCdZ02pfj7f3+11PZ8fX8CjpsGc1b3IDsiikb2xj5lK1Jb32wKSMjvmNwkfrVqfE4YV1oWut6
 0yyuhPmMBS1MhnnBGPv/QA28KzGL8Kdip57yNrTWPfGCFQiAzyITlkahH8yCbsfrZ8i60XWjajc
 mK8CMrVyxKn+zOtFinOEoYnXq5QNlRO4ZwEQFuhUkJ8N4bSdamIre80uO9aoO0uDtY86+KqNcwC
 F1pfrSp6DweRCbhLJa+8O5pnSRDsUI9Mifyh2185t1uIw2ZKLheI6FdhOZj2n7iz8bQiXqwzUiz
 F/JYDvFxlEOi4aR5DsRF8QO7QpbcoOsrshv+Tau2PpAed86Y4aapIwxA3CED7rc3kPaeqrwde9v
 sCKV0FGPfTI1Pce2IAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/Makefile  |   1 +
 drivers/clk/qcom/clk-ref.c | 205 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  67 +++++++++++++++
 3 files changed, 273 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 81237e2c8db3..143fb7253d65 100644
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
index 000000000000..3efdf6749770
--- /dev/null
+++ b/drivers/clk/qcom/clk-ref.c
@@ -0,0 +1,205 @@
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
+	size_t num_refs;
+	struct qcom_clk_ref refs[] __counted_by(num_refs);
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
+	provider = devm_kzalloc(dev, struct_size(provider, refs, num_clk_refs),
+				GFP_KERNEL);
+	if (!provider)
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

