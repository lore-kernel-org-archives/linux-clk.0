Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F8239E6C6
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977785; cv=none; b=DINno7N47YS+H+B/XJp8zKWwT+d2NHmYHcok5lHGS37cF3tAesy9EM2iPQWSv7dhFcyiNUkZQPxH/nDVm+7ZS7Baq0CPtAx9QKDp1aSDXoeqWBDlz9lbXCyzossFpFGvniu8ZfTmLiCE+mFblItnbUExzF/gDaoJkhcIkBpWTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977785; c=relaxed/simple;
	bh=x4JqYfx5XKMV2QrzDKhoYgOB3jw+qmSVfnwf+7pslQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogE8dMeTIgo59LMOwhfmO7q3TL+HoddW/JzQP0rKnJGeIUO7dTeeHBudW1RGqI43E6U7szik9qlGcr4t5Vh/fKL2CjYO8MNsYKtqDx7nuIZa0kYyAXxdHB2dy01ZV92j0KArQW3O+3xLJowTLfEOl72+KS8IFVE19V5mD6sTUe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBqa049A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f01748Bx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBqa049A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f01748Bx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KD013050485
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 07:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=; b=bBqa049AL/UkZImF
	pGNSd1LOB81ExtbaAIgr8rsFgR3b/uZ3JOeicrZ8TwQ5ioIRuSWASPHP61PyOM8b
	skc84qJ0WCFyzGjUliaUeYyPtr/SzxNvUqHDxM1IzcKpVzKiJbdIZT71CnL+JaJu
	robYRVXnWl3Nojl26Px7ZaQGhLkGqdT2wBZXZWsrxEChuRB73+O+z7PSKbv00Zxz
	teuZJBHa38Rcie3Vlo3ui3VeaFqM9Rq/WkWh/viepONMqUlmH1tuI4t0lJzhPMDt
	rUVE8FgveW8AnzpvHgRh/d+FU+Ws9qqGE0bV8DnIXs65tgklsWWTjF80WWCSLTzk
	KuV1Qw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gptwmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 07:36:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9ae1da340so32915795ad.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977782; x=1783582582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=;
        b=f01748Bx8BMNjyD2UbLNZA2ha/CfKDEyXklh/eKV3HWqY+V8TZ8dTzm4NZHay+eqOk
         ZKupgMQQx3M313ZdE7KdbqHC6bRwzsnTxksotQuC7+OpAFdVVoO1u6YrEEZCsGX64fLe
         ++F3q0B9Ja2DtY+lb7sPhZiRGWFXezDmdsaK1IkdUksclz3A3KCjDMIZre7FOOmc+ZsB
         TfSrHtX4KOQLZO4cnlRjK3dFuKN4bOSNX0NLcW9CLa1Hvsmp4mQplsfmB3mT2ZR0IIjc
         7QwQ/MG5yzD9PSX9b1ULaVrXI6nw44Om3kdXLSdy9umPzw67watTyAWYkaoi2Bezwql6
         mCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977782; x=1783582582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=;
        b=ULKiqCCuGBQdapL9bcejDUrJGf06+6xpOV/F/hBUlCA8LoDjAN03d5vFNDZqj0DNOq
         UJA+3ykKDo+C4pXsmKZA9TgxgOhlgA5tCwGh/oYKyLuzmI9hBUOyTgGYJFcmM7Xdnv8q
         bdKkygYPV1dkU+lUSAuthE4+Gh9neCdwFvnSxzDq8amFmgHrJMsT/iKc6eBu92x1uEpH
         wTShFY5yQqsVaH1qDR1grjzEXu7O1sRHohGOXJUoo+vlHplX8m8nCQopleLPYuCo+in6
         UyHDv16yiDz7t3aJrLlFfMC1N+2XP8KGFXE1hQJlZQT44dAPZndO2UrGk/zoI++VzN1R
         30dA==
X-Forwarded-Encrypted: i=1; AHgh+RrN7eis+HEvd4sLI0BHgpfFwJpJCqITrcqKUUrfpRBBuguvaAGnFz0E8ifpzX2pircdTtgsIe2+Jdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrXdNhnChLZ3An9IM/gOx54mY+SHD6tXwQURhcPma2H1/kel4j
	XlK0TU5BO2Y6jdy4ZmZDVyaQuTSEEq9IWnYYFldzpHUF4J2uu5y+4vBsjiIh6ER4iDHxoxF53Fy
	JbbZ3wNsUMANvyreMDRdzZ0yN/CPYK0Bm4yfk537jKDZvpm3IOGG1cXprOv5NPAg=
X-Gm-Gg: AfdE7ck1gbKAvYU7mIytCJooXKzBwMCq8haRtQcD8Iz770qUGJGvR4FxA1z9W2z2z15
	vDSf/ZOYWrrXWDK6FbBhjZ5psKNlr61AbTQq1LQECCBV+W8cbANaq70CrmOTYQCAFlZD8S7gqBc
	oSnRSa4lgv7vdVdeMIYZXcGgY82MXLhFdaxWGSgVOJkYUyjNzOS/aq5Pcl24OcZTaPOr+9CVCgA
	EIjlDpPnimeREDX9sc6OvQ6aTE6yI7w5/AES7lIF7KAsOoDf+0mFwKPGxupvNsffymwkCvy0SiX
	fD6gB0cK6K1qZKooqWGb8kQMoceHZxRR6eI/t70EXOGCsQr/M6WgyJ3w02UepYlCgI9Z69vzBZN
	6qr22thUxFv4XT0j4NCjfxvjYZ32GpY3Awa20ZOfieH+SbWtUeXTJO4Ttmg==
X-Received: by 2002:a17:903:28f:b0:2c9:e5ff:995d with SMTP id d9443c01a7336-2ca911dc967mr41848725ad.31.1782977781628;
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
X-Received: by 2002:a17:903:28f:b0:2c9:e5ff:995d with SMTP id d9443c01a7336-2ca911dc967mr41848465ad.31.1782977781018;
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:20 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:15 -0700
Subject: [PATCH v7 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=6421;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=x4JqYfx5XKMV2QrzDKhoYgOB3jw+qmSVfnwf+7pslQk=;
 b=KL+aWixh1oLXXQtrcaWbixLx8ZISIBgqjw0qkgYb5wupcfIhOkkW/2GEmc9A06TUlpksDwjjp
 Ml+giJiV+e7D2gWxUYkkiWxFKerBepz7+6G+wKkkEp1z59RrBOCjJ5I
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfXxufM8ctXIC9Q
 AmlR+a66DN0sreTqtwwzla1DWW1BRCUwy2OzOV+dxjj8GYRCfafXI2i4rZLtY4UhodTv45v9cd2
 ctwfDrSUON5rnomlADAYxS+ZwY+0BwU=
X-Proofpoint-GUID: pv-72bbNrYZQpwRW4mYMTXXKn7_o7d8h
X-Proofpoint-ORIG-GUID: pv-72bbNrYZQpwRW4mYMTXXKn7_o7d8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX1xnTyW5BXdso
 8D33oh1H2CpLlDn8OkGpVAOrRY+p7qlh0lug4WC4GDZ6v9KT7bBnNT01n9kiZEIRlwspQss0r/V
 sS6ioGQTMatPSfxMkwATv0PbaSFsnkjmcv1+VyMJVi3cVWqrW33fiCDFYUb1r853nWl1VoTYfaI
 Vre5XKEyvaDihj2jU7leRxyUC1tdd5zCptJCEKph4ixziH2KyC26H5jOdVa2GTqv63gdv2lpTwv
 UuM5MmMSYBBfWu49vK/jvmEm9TPjH+k7H2M5wGexQWDI59Wunwp9qsUuIxyWovKy7+7w/tGbiQi
 +HxQffysEsbDCrVQPowgmy3vaQ9I8d9tZI8TcNyDSp6hkwM1Py/Mr7qMX/5aSHttT31ptCCR1f4
 byMlwKfdu8sdY9/tnR4l/CqhpEITBtUgqiEOkkGwfS4KZpZBH5PnaKmXTlXyP83A7rRpv/XmNcW
 TtzQPl4NlvQ6kDCAnFQ==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a4614f6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9Ojz-Py7MuQnRvcrkDsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 136 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e0b545258ba4..37ad53b0d93d 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -12,6 +12,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc * const *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -56,6 +61,43 @@ static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
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
+static const char * const mahua_tcsr_tx1_rpt0_rx0_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrx0-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt345_rx3_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt3-0p9",
+	"vdda-qrefrpt4-0p9",
+	"vdda-qrefrpt5-0p9",
+	"vdda-qrefrx3-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -145,17 +187,105 @@ static const struct qcom_clk_ref_desc * const tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
+	},
+	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
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
+	if (!data)
+		return -ENODEV;
+
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1

