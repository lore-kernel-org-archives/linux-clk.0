Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8AF33D512
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699951; cv=none; b=uwxPCPmDsjelxLzc3N/4taaUDdY52FMqkA1x8nABgdQywJ3mOHEz3ghBUbN9fDZ36/x06tww6W6Jh1MKF+G8THoPwNQ1qDgO11lmtkC/E1YRVWQgU9aFa07j3P/YN3HhUqFBFi7QXWV7n5TSw2I0ZYaVKVOaYoFljLC1UBhdO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699951; c=relaxed/simple;
	bh=acO2MCTs6Urgg6mKi8zA1uUMSJs9SW0vwIJyCHIgems=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sIh8oSfvHiXFv5rl/wzp9e/RSF0LYh6roR0EdXd1kmnsSIK5xClRWzxD8Zcz+PwuAtDlhT35+I8RY9E5wPEscS18s9CNcgN1Ksrw+93zFjXei808ftpyJuFYCm05uKJU9zGcWYtHURHy07YmuMWroidFU7KN3bmeaaFIiz4liu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ol6YY4R1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1Hv3d97; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ol6YY4R1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1Hv3d97"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M5474K4046130
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXNVWei5TYAO0rqhnJeNF03LYKzM0BsJo4TzzO8e5Kg=; b=Ol6YY4R11ZsertX9
	JhOmrEsCGqzwjEJaYYVbpXpeUKt2PbjHYDlbNJcDbRVBO08ZTmjatbeCRBf2vtEv
	0aluyyFDAsuw+w44bbl3LkQqOGjSRIp4v9y+B3LO1w/oxYJALHLJrDfAqFdKGfI6
	fkSL5GhTpa9Q2pgYugpPUnVeK+PjjAkXr2T8mH3ycANMZ6T6/MmmjW1Xc2z82jMV
	yZmHF/izqX/aDRTsgGchH82EpVCbXaLY1hh3xeq94/fWPmSNL+6BEMpVSxKMBiQ5
	7e/i6Toxf64/Y0/MwkXajYkjXH2GOlHG1wxtUKq1M+dnJT5WBU9Axja67UDfiA6h
	vJG4dQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6dagd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:59:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so8584775a12.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 22:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784699944; x=1785304744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXNVWei5TYAO0rqhnJeNF03LYKzM0BsJo4TzzO8e5Kg=;
        b=c1Hv3d97WlAqgf996NDdY46vIZ1PLmMOftZMqVW+fJ8dJXTNCmAtFCW7EJ1hBkE5jG
         IziTOZbC1ugy03FhYip2F/atKJzCT/tEAd4eqxzzP4wn4HRyzQuqn5qFGckhwULFh6xS
         Rab/OEeBgTgMuoeIuPxTt8+I0r2E0Lq7sR0lQbqVx0HWedZrOPiKQIReZF5W6ozZpZ3M
         V7NZ4idlWuJShbRLcAEg+QMCTP/UFL0zOJMfXOjI+reIf+c220+Swz2EHHXvWFVIgj6/
         kztP9dnXOsqYxjsbgRHIkNMnqF5OiJBifCAnmmhqMkfXMRTXki6Qh3MUCZX6VC+Gt6Yh
         nT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699944; x=1785304744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXNVWei5TYAO0rqhnJeNF03LYKzM0BsJo4TzzO8e5Kg=;
        b=oVnEm7KuKDYCPdFT8D2jCP3qJA8TeY/lKN5HQE8yf1tYi/NJA4ZKUl8eHJG6madCnH
         66YcZJgfTt5lPOBjMDSc/fIky4Bn2xMgghd9RdngsHTO+TpNGp9bIaIZdUQsrgCLb8LS
         5XXQHHKgAlBSvXrYEL20wNXKRl1bP6PXq1t4eVOYOk4X9tHR44gk4DcZY82d+PAbirP4
         zhOJhABMFIdqhJqLoWGkd0FcEDy3SjDfcdUxWSsojVj0QczqVfk6bVB9S6tEhOcjQiQI
         DNsj4MnkUEgV+qiO+ojSZJ8w1CthDxMJzrpWf9JjkIzdsQBirZvkfab2T0M0BNvUTsCG
         zxvA==
X-Forwarded-Encrypted: i=1; AHgh+RrH5X3ArrxAPCCBt3qxYIXn9rvkJ/Hd8m2iMyE9RrvQAx0hmiOEC/12F5UFtRgDoh83zHITuaQL0js=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEYc0fspqDJQ111azDpGmtNxdhwRKflXL1qFOTRkLsfwZbkHCg
	dBPk6haamEIujSMZdhG7JH6u36WRF7qORdvVPQIwsXPbWYpN0YVoOpBvkWRwjKoABDtqXBprerO
	F6xTlBY+TTYlrcd4K8b+08E0tQC1+I6aVTE4B6AVPV0HG0Lb4U1vH8CLHLqEUI54=
X-Gm-Gg: AR+sD12sJU+OGcdEaOJbqAZ6xDxcnbB4Npiu8/ZJzWbg6b+Xt6BwQbuLDbQwIXJR4AN
	6lyS3SpW93jiRTKD51Wu4d2cLxYHs00yauYgTQE1cPeVKMFUDRBvb8zgEXNfXe0L4JdDK6RaGXc
	Pr5g16wDcLy/AoXlqPw39axYyEZdpkI+jxKy3R24hHi8JlSZgo/1MB5kyE3oYNFuNJ2kiQn+qec
	TsDviJt9JMMCdit7miXuzioCEJN5AL1/abQdXQUTeSM3B1DlJE8AjMUOFFCSdKUM7nvS+6U8Nrf
	Ug6pPvcb3hJYRNtU583EHHPEIJMs9/UXBtkP3s5J7duBzVRpJy7UmYnn6lpGoBv3S1LeZIlnfbZ
	cwRRYKbsKQ3nBIMKJEXyxxUD5h/Nil+mEduMXGXQnFveUMv0=
X-Received: by 2002:a05:6a21:8213:b0:3c3:a804:8eed with SMTP id adf61e73a8af0-3c3ad9e5886mr21016099637.56.1784699944182;
        Tue, 21 Jul 2026 22:59:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:8213:b0:3c3:a804:8eed with SMTP id adf61e73a8af0-3c3ad9e5886mr21016062637.56.1784699943693;
        Tue, 21 Jul 2026 22:59:03 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ee1e6sm554013a12.12.2026.07.21.22.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:59:03 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:58:58 -0700
Subject: [PATCH v10 3/7] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-tcsr_qre_0721-v10-3-d2fa68c63b78@oss.qualcomm.com>
References: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
In-Reply-To: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784699937; l=9170;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=acO2MCTs6Urgg6mKi8zA1uUMSJs9SW0vwIJyCHIgems=;
 b=AROu4kPogUdEGok0BvbJ8lU46XfBox+pc+VDhSsZ4bl/vkTRtd3dohiaaxMVOUjV9l3jAa7e6
 dXfIQHfKoKnC/HU0Y7Gxyh2qe/ZRP8o9pTYzM570I7J/iVL5OyKDMS2
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfX3B6Rv7Qsqx7b
 nyaMyufb9GYr+4OVcpD7WXCY/wn78Y8TYap75WIYto68VHbXTTbv5CNa+q3IwrZelExkzdS7gBG
 vbzP1CzftV3MZYPax2NK47A3jLyiUE8=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a605c29 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfX1AiCUBiOrGC1
 CE1rHVO4kzso9Gdr1ZNJJ1sO68V2dSsPeqgPKWpeOK61Zq2RAY+4m1Ssi4K93EM/+GlLTF86QbO
 t9uyzGB9vomxiRdiDopinoZ40T0wQrjX0IBS7RuSgbSqQWct4dNnUxvpafVc9FyRi8yWmkPEGs4
 u4aP/B8o3hSQcYweGUy7Vau/MOjBFIzF8kDsKgxOgQ5fQC/2gQszAcysWNwCLBMfSRAD932vura
 2gUm+XCtTW4sKZC0oTB6wMRPnU4E8DkFePTtwh0CZEAmdkxLWEYfjCNRnR2sDhe+XEjjtqVG7TY
 AKvxrqiG8HXax9aLujcw3HZAGZMBMaoC25eoOTwNQmKXmVcIjrzuKPO5Eot8MHmwH9x2AuCUG+p
 NKpMG5CrmrjXHq/6VCol03bPr/Pa2uAyvCKeyOmjATtshxFJNnJj1BuITDZUEmZJS62XrnBHXEU
 UhSr6VAeE50o6fyBz7g==
X-Proofpoint-GUID: Tp_mRpLiQtuUWy1jRVwFqblqeFwh0Z3q
X-Proofpoint-ORIG-GUID: Tp_mRpLiQtuUWy1jRVwFqblqeFwh0Z3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220053

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
index db7689ee5dc6..fff069da16de 100644
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

