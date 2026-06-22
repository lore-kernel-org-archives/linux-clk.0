Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E92935BDCE
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105102; cv=none; b=n1AYTCEVw/a8tg4TEsxULANnqpwCLowb+VbJ0ubhOxiAphSQEygLk5JkIr/+p06JJnfS+XkrFd7eIM0W9Pk7G/jc1zIRJx1zhuG6tEhorXkMoQM77QTCxw3I0z2obpcFf1t1t4fKV5U1WKlIZ34EvNXnhDs6TxmrzdN1RnR1K4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105102; c=relaxed/simple;
	bh=rw+jGsr4GUmMEn15wX/6cDmASyIshmLyIewu6Ex4SSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+rXSluwLRNe+3wKOzWVe0ySgpm/3fIHKHaBrBVl+hYqvLJB5z3rrytPqUIlse4yW27R1De+GPAo7OrnRs/x5ASwWrC7OMlc6y+Vy9pqCtZaFXUEcdVOqsIfwZCWPC9kzgCtBpyQ9QUwqQ7OObAwUd/Uht2oSIgsaJ46i2QxVBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYCwCspw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mr05nnYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYCwCspw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mr05nnYk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59Peg2428401
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=; b=XYCwCspww4fB6MRA
	KF8z7EIL3ifQYwvco9T7HNX0neEu1QUEmo17ieEoDWC+SBStng6Lk8fyAldFB3d7
	BNvRYfeqsuA5AF4v0H1lWuQMDJkyq+XDcIszaH7gNCKRxi7DjMUjFb8Kc/kkvTTN
	/thXSeLHaAzOAvHSw3BtP1c2am1fPImf31It23SsWFw4xAWzxkgzl64qOjarA/Fe
	Eke/X3eFfG1Jtm8z9qEAdofI1OeK/BuwVug1lc0xCTYqSAPNN7jg+3X+kmqDE2ng
	qqXDssm/t1CxRwtRvW+nbV9JE0zNRGZ7Nbnt1uF0Pgmt37/QKpLjnmcJIX4UJ/O9
	RNMGjQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtscxcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c13bb8ca9so3784829eec.0
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105099; x=1782709899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=;
        b=Mr05nnYkezwO/DT5dbui0z8gF424Pj3uguHqBJJLR8QlQsjuMcIDEDHSoCLcPCNXxX
         IykXKfcqvMB1nMuZQMorMiCPETRMYvqGpmjj6prXZ6i2iTiMOmKbxYBSJyG/z1ea7eTf
         D2MscWCJdHGCaIC/xtDhSZJlRFO0vuWWf1OEh1qDa/YRbaaN6llet5V3hqUharwRKYdM
         jgexrVA1KlEruqt/G7vU5+Q0bwrFLE2MRGWvXVXeAON18n0Rb3NCvC0J1IPiwdwI5Sq2
         SQ4bgK85rX9qUiYVSUdxqSbU1KRAxbMA+YhL5imdHd2Gnk9MWtxzSsawxzVek5lwS51h
         kgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105099; x=1782709899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=;
        b=T01Oh/27I+IxryLrtItGEKtS/PMvKodnerA5tnIYJoIMulKvjzA6mRTCrIU4Qr1p5A
         6b7e07PiTR82+f3izwTSbY7ouI8CzmUjS9UXufEUyYnkQhV9EhdXle8SkiclDCE/kDfp
         qzP8vzrjDCn9oZUScLt0W3vEq/g+wzDTegfo3TgQoYqxAypJD8HhRKgNkjk9r8ALr7l8
         dNAWmquytV8PtrG9/TSmLTozRM05g2wiLEmLr7XUexmlVIeysbM003Z4C7c6Zhmze+FJ
         bxP5a+zv9k5GiUGaFZM0Fl+kXzTi9aIZHvE8hkSvd+vcoPxtqXEK8bNJM9CBal+KDXT2
         E4bQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ878p7KF6vIyfUqBpEKW3CoMFLXPlv5hlXn53AvE96e3H7OwDtZMZ4NSKK0TKs56l7hAlft+IAt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXqGEUGo3zLaN8oH+G/HxeKxft3CXB4x2UFBCedntrmoDA7c8m
	QRRcdep2y5WLoVIgOA8nqCfdKjgvKlgZk7hAhMsaDn4JupSDqUCV5PYCGQtDoENrSlZRO8h1Hen
	F51P364g7rqJnySiYT086NeRP/fh6ysFLPncvzA9BDSqGfm2fa/WbsMf4pPmRsk4=
X-Gm-Gg: AfdE7cmMEkx/1TfDN8KMfR4K7RGYn5u7Aicq4bcN4W/1dt99c8d9Lqds8PkBg5kbd1j
	NiKDwgz+d3wuxnIIYXfWFOiv5dcMpHtyFtX7xBRFUlIa3Eu3zCvi4M9hRwWSj0d6TH7QlDUf7P2
	QFHCKB39L7gAmFg/yjO1bEOqphzePZ72pyoWx8mnuQlhitFMiouGJJP8uCUQalsjw9sJcbR0WCO
	62rhO40Y7bsPmzqJ2rSm2S71QmweDCA8vNIcFN2RUmGyq556C/sJ4CYOAlZrmbFgzWdBIjgjzqW
	bcnfmuOPtiXdeW8vRhKhR/zxtsIAbEWE6QWx58EIPpmKA+EEQ020rtIIgl6iORTatl0YEy//5fg
	3fs3GS5iWf1VaDwh8K5BtWTohxKeJCueFyvfhNUJoBD24aO1OWAVUBhSS+w==
X-Received: by 2002:a05:7300:6ca7:b0:304:ab8:f87c with SMTP id 5a478bee46e88-30c06fff418mr8800544eec.12.1782105099209;
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca7:b0:304:ab8:f87c with SMTP id 5a478bee46e88-30c06fff418mr8800514eec.12.1782105098653;
        Sun, 21 Jun 2026 22:11:38 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:28 -0700
Subject: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=4460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rw+jGsr4GUmMEn15wX/6cDmASyIshmLyIewu6Ex4SSM=;
 b=neyFdZJhWpeusrQeV6c4WGn71aucsOGLhGoNrBICZsLh5N/Kg7Rq/rgninvJjOgnLQFOaKQaO
 yDiX0J4mov/AD4zELMFdiax4N17g/ah+ylNfjiveby7xWgBiovaFC+8
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: 1J9h0AhIuwOAN1fiGRuRq_kbtEhAjVJH
X-Proofpoint-ORIG-GUID: 1J9h0AhIuwOAN1fiGRuRq_kbtEhAjVJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXxUnbX8dm0UKA
 k0SaXav+n8EvGJkkcPtdv4XGnzUHyoR+OnHk6fNK8AMKflkAiIIRP0Cd7FnuvzlEWUJpX845mTo
 1yfm87V4BuOtwhcXRDK+cQa2+wGWPIeJ+ioPuy1Ag8GDK+GNEiQWCEJlfKF/0C6sWeCV0RyOdXZ
 Whp4NJfxMunIZyQBqyZB8CZ4i7lRIN22WVy8Z9rl5qxsu1G8z6QGWYLUY3O9KP0zjkbz3yv+exo
 ATzLAWKGHSMOYD1zoSzDM+pwcp4+MZf3Grhqh50YT9R/naGdTbEcrGwtJkNt6pMc7qf87iNJMZ6
 iHTqX3sXM/2/DxnOtDw2bcU18DaoMCQbZEman5Wci2n3rE4S0UVSVMzpdrlJi40ytc1dD5G+6xU
 3VMvTV7JJ9utGvCV/76nmQaz34hG+a3nMPnmF6r9u+UKr51KVAEm5dWXwlG/9R7LN7xBBr2TuYT
 T493JDYuL49ylQMVVtQ==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a38c40b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ejsaoIeHybvuXmj4E6UA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX5cmK+jFcOGw+
 KeNl8pK7sXsmkM4QfmgPxjQnpvSTrw/5BQP76408FCwcY3rombXxTv7gpoX8t6Ng8vyDXnAMBVY
 mGELUJVCZe8yYyCkQLa46gxn2sK046A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 99 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 2db039342f30..9af520b71f31 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -13,6 +13,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -57,6 +62,25 @@ static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
 	"vdda-qrefrx4-0p9",
 };
 
+static const char * const mahua_tcsr_tx1_rpt01_rx1_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt012_rx2_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -146,17 +170,86 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+	},
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+	},
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+	},
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+	},
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+	},
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+	},
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+	},
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_glymur_data = {
+	.descs     = tcsr_cc_glymur_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_glymur_clk_descs),
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_mahua_data = {
+	.descs     = tcsr_cc_mahua_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_mahua_clk_descs),
+};
+
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
-	{ .compatible = "qcom,glymur-tcsr" },
+	{ .compatible = "qcom,glymur-tcsr", .data = &tcsr_cc_glymur_data },
+	{ .compatible = "qcom,mahua-tcsr",  .data = &tcsr_cc_mahua_data  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
 static int tcsr_cc_glymur_probe(struct platform_device *pdev)
 {
+	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
+
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1

