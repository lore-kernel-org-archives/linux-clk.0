Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92E32F8E8E
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935370; cv=none; b=mE/yrzW1knlJ1cBU+OggiHHeXz5hAw/p8lbBLn1jj4ctmgTtCGDc1VkF8+h6i76HpkCq/g6O2HxO3jWeslJAbXqqhB+MnBv5LGxGciLohm54coYi2mvAn93RmlKWus7hfrUVLwCnClBt2PYZuHMUuxlsiegGvPHZ1IV3yNsQBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935370; c=relaxed/simple;
	bh=rF9PJqOQNpVhxI1U24ucm9hkSO3YJ8aA/G90q+vKQHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBZUsQTKM2T/S1avqfXKD2qyd6Y5oI2K5H9zeHDgOMVtNIzJmYali8/vQXTnSmto3eFw1/lXbqD5az4ahb+BWRE9989O1aG8NM8TW0ixLFmlmuaj6m3Eb/hoIZGS+e+3rYM0/qjPFgUHspgwhltcXz7vrZELrfHLVLz0REEXVls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uhvo6AEn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUSHj40X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uhvo6AEn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUSHj40X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKnJHL3010238
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bk52NZCjSDBei8Xn+4CgotGWYur2P5DcmfCBZQxsl6k=; b=Uhvo6AEnPiXG/i/A
	hldOtUo2WIQV6Xv+AyletNf4T7Pg7Jjcb4gMTvzas3fSt7USUv12ICiJDNXkptfq
	LktflKyt3kNhJDU/AWCxNFHZztmYum7mLcnEoIuqKLaW401+RX0Zv7hrlGp5fIQA
	NR0hiKxIMpm3hDvAQB0kDmaLGNKxW4ZLC8vIEuD3tidJwvy1ZlV/MkxpzM38zWOa
	Id/NfcarQmVDDUB0n/WgwHOKqhV+VJbkpi2yb2FvKKtHBWCNQqMws+CBzqcp6v6z
	qBms6JwYON8pHb4SS55vhJXvZbIMSddLaF6RtGPwl3aCpJhk2bpTUDlWSPSXPQUW
	bjJExA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrgyq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13312be8a31so8083373c88.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935366; x=1780540166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk52NZCjSDBei8Xn+4CgotGWYur2P5DcmfCBZQxsl6k=;
        b=XUSHj40XC3B0s4qk9ZW3earrE6d9l8B1ced3KkFpca1nsYNYxaxI+6jxrY+a6GI0t2
         4CRDbz0fYg3+b68d7qR1jaV38T8YU5icWuiYQ3XsigUWRQopcnyUr8EXuaha817Gc4SW
         b+RXMeRC+g/vzEU2yGkVhqHgzN1xMKIPGC8dt/MIEnLsSBBdIWCnUHG7jzZvokt/HwlO
         5I3Uttpg6897ZFLf04vryzSE5CyK9nASnduybyCxqgWQ/VAyWKrI+TPsl7BecRL7nfd2
         D5/1VmQo9RVpWKH6nbjloV9yhCTYV1irgzt9zazDI9Dy0fwrD7mcZYIKf9MBly1bnkys
         DjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935366; x=1780540166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bk52NZCjSDBei8Xn+4CgotGWYur2P5DcmfCBZQxsl6k=;
        b=mc2iqD6k3Q3QT5fKMMBw1kSamY6me8fFGqUl35lKklwVh9/8ozE7noFP3TBpJB7YCF
         3CjYIR0waG+tkedDwfZn6bucCco0UINPIRzBSKt/zw3fkEqdEt6UfojJ4N3l0hJUVOxO
         2z493+Tv+m/8l/pdZs6P7qmCNh7Knlcie19SEoF/QnqT7aYll8XtbpOheHJ5OQ63Y6ZB
         hnsFTafzEOp5X+Yp+7FKEiA9XNpRF1Mnennw35fIEL6+oyFTEqTVb/Npm7mLG1jHC1JE
         6DtpQkmDh43cnBvEoboEZR0IcfxLXJDegv8nv5qhhaK+m30Mhk3rUnliIm2ywtZKqE2K
         ei3w==
X-Forwarded-Encrypted: i=1; AFNElJ/t8mUg7CCmawAJhDKsLn8jJgm8esLnzPKWdLbHVTZQndAt7IwEEt992X/06jUsXfC0wyvUrb2qcpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNkvAvroAajSdR56x4nuiyR1olyO3O/T9Fe3Bon8ypUR976b96
	wnEx+66bsKMgybLFOec+ciEUte9qqPBM34QZIcfedbj7U1U42szHq/hPC5t2TWYIyzooG79L22n
	+0IdzoqwwLPCAROdHvmmkethKV/iez40y8QGk9vMZM/E071iGy+XMInaNf8Y4uk3I4io8PHArUA
	==
X-Gm-Gg: Acq92OGFBKvGUhyY4Jy7m26OF9TlKEeFCeniYxDR7GuzXfLc4wnTYyYq7qlwBiKAhw7
	4DGy+jnFUGRMM4r5VJFo5AKfVRDx6/fMgTj1VCkdYqVt0OoAQqwgMxaPuCjNHz/1mnlYMkH927/
	Uv8zIP61xw0Jz5WExqP6Y7coYOAxLHgYZpDSU65hz3B/xWjPjFK71aaVptTjKadoYADvZ0yYybz
	UwFmRBKCMKS2JbdQKqdMnC/701dSMDJDU3II2gy1TcJiWNuLX3XATZX34oLZ2h/rxZzXxxeBMtw
	lfFTKeD8YvQPZQXj7pMe+OAEZNKsgp9keKX5UWuCtDaWIYw9GU+Ja/AIwRmz8qVkwNK8AdSmNw/
	o9R6JlLxa6mupuJLKzJaXO0XyJSYWJFMNy5ibjUtJnNmJ+6RVhhdJ1h87mjo43Rsbamf/AP6/mf
	XnYU8=
X-Received: by 2002:a05:7022:438d:b0:137:8921:4fe1 with SMTP id a92af1059eb24-137892151a8mr62194c88.37.1779935366133;
        Wed, 27 May 2026 19:29:26 -0700 (PDT)
X-Received: by 2002:a05:7022:438d:b0:137:8921:4fe1 with SMTP id a92af1059eb24-137892151a8mr62181c88.37.1779935365551;
        Wed, 27 May 2026 19:29:25 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:24 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:13 -0700
Subject: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=9197;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rF9PJqOQNpVhxI1U24ucm9hkSO3YJ8aA/G90q+vKQHU=;
 b=XIY4UpbiRdheJFb/CUsLmO8Nhc6OOJqnH1neYmn27bmrONJ28F1ifSERMvXDDBM4dQ91+6PgR
 ywb/IOFtl3HD8hKpNNdOBQ9kTBG7m6ZYK7mtgZrGyBdwreh3WW0ktis
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfXzH6YIiPt6DJR
 AqbuLvo9n0RJBfI5maD1yChYWCgQGjHlzqo6uzyYj+aGmXI1mcsA0NX+gD+A8fjwiEv3Z1unv2e
 BXnxMSBpddyavYx8CxHQScPuf2aXzl3hBYUac05rOqLylyaMzCS+CTL0xds0PyfxSxtacctyRnk
 TDuSmdXMy29A6iYr5VEFKMOAH0JGZctAEAy8H9dDZul68i2tVAQPocJX80lbPvl3vCeOeIKO6g+
 zKQQsp4u8UAcrNwD2Evub37V3un226Mj39KMSr0aeBnFWt5m3KO7RaImC7wnWEbYsjAEk8gLQ+j
 +FY30m+eQ/v8Wo3woTbgRXrzdyzosoVE8oyz5R/uL97ZvYgmvEedkH/1Ik2Pw9afXKPGXbW3oLS
 4iRhL4+e+ixAkfz3DmD4OAMgNej+L9Ik7/MsKHB5IBMaamHD2GVSZwyf0UyQkDWguyCyUk5/SSE
 to8sOlSi3FaOzb7D77A==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a17a887 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: GTOTLXWwJ-JwjepsWuh1_dR9Dicn5uwS
X-Proofpoint-ORIG-GUID: GTOTLXWwJ-JwjepsWuh1_dR9Dicn5uwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280021

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
 drivers/clk/qcom/clk-ref.c | 205 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  69 +++++++++++++++
 3 files changed, 275 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index e100cfd6a52d..c5b02360861d 100644
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
index 000000000000..213c0f58bb36
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
+	if (!provider->refs[idx].regmap)
+		return ERR_PTR(-ENOENT);
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

