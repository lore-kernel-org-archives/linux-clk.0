Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CC38B148
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504974; cv=none; b=uO3KKogqMDONKgGpXexLk/DSguhfiL0/Fwa/Ed/lFtC3WXO8MIcYporE0HIOApRe5Z36tiIPYRAhZ0ZToivHDZpyS6v9+w3S/MpyRhxo5812QE+Rk+r8QfoytewyH/4Eu6rpbeaQOm21aZ1H5gQX5ZgwMCBHwoPm6pRNQ30bDhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504974; c=relaxed/simple;
	bh=kecrf/J4Qo5II/j0+5WWc0znhT2v/XE87nyzX+oOmSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKIBCCCMP7xPxNsXGUstwIpAg/K2DIJQNuCuSsJyKCLoSts0tZPCzHRZ5vI7yomJWQunWFN3HD93xXNbSodr43v1DxnsuHSRGQYbpDi/qFrIxJNZizI8HJmE0DCYd3v5ZKOoyY/Rv5O9yoL47gmd8SQInOhjn/DcFzzrKNMuKek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T58TokjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddiFzPUG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T58TokjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddiFzPUG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668896qA2258471
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 10:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCJ+1fcFocpGj+MQzElP67EnytE57g5BlCXYCBgbSqs=; b=T58TokjS4CPTx64U
	tft2MFCT7+6AVSA5jb/dW2S9FLI+Ihp3CTfbqsIXKZqZeWhZJS2V6roYJWezyTLO
	eXM8VZiQnQe7ReKbs5BQ/yWxnx2tYc3dNJ1/pb3HUxoXh89pzvCpdi66Gk3gvs1B
	Gz2OFGFKFh8KeRLw86nETHSt2bzdDZPsab9dL8egVi84Sr5PCAhf5rA51vpS89tT
	16q8Y4IkWxsRMk2xfklUUCcBGI96Gr1y773Sg9ucmxZ3lhahAgMsmYh1vn8yyLA4
	GvbWqg2Jxyw06W5mKt23aYY9ECICavBLBiQwSwhIPkROSAXQhiWa+KXK3Qr3QZ5Y
	FyvyEg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw9uj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 10:02:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so1134816a91.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504971; x=1784109771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCJ+1fcFocpGj+MQzElP67EnytE57g5BlCXYCBgbSqs=;
        b=ddiFzPUGl+NBiPakeZF5qm22wvzlvwNj2WsuaxHfZoJ9MSiXzi+x276Dd8fAuDiKwW
         zlZATTIFKGOA0iJHw2FghTwJhUTITmdrv4xVuo6iq10P30dBYXce2HwXgcpZA9Zd+0OI
         LRBzfjCmIfZ8AJQxTdAi9jEEjQO4O5WXgzjPZbdjK93aDMusabnQ0iEtxAnKxrgoAx7O
         A69wifuW3VtFAjq+r8iCgpe+R6qeK3XimAHi48+MxXJjnkbKvcPLr9OaNdw0H9QfglzZ
         jLaku+fIsI9KohFRTpbCreMCrMRbwcfthDcNgQTXMWV9ONfxS11QPUmrxmuWudnBj5Ks
         e8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504971; x=1784109771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCJ+1fcFocpGj+MQzElP67EnytE57g5BlCXYCBgbSqs=;
        b=KkvlNqkD7fuDkm3TaGIFswtKiG6BwMhD9siNZnvdIRpvatZyMp6V5FxcXxMs4MzRNP
         A5mKmLbToRBhpAxOdr92i+RmdbcZELft+TvOpYx4lHBKTchXpZwsuBjXBtaakcB3e9Ux
         1y7nk9iFGX8xbfmwGXSyZ4Izw1Ic1Mz/BaF16psXJ2QZDN8Pu53QCyUL1FKEd2LdHXQs
         BSKRDNrIHiucyXGpY52+atkVpeiL4jm8zkYg/qPEQ8Cu0JSXuvPmB4f6StnNMVz0lLJx
         kNdxKQFZQ0B3+R9BOalgx2ytXXjI8dvNW6zdbNULZqHnoCT7B7Hq3QxXwdD/WY0RR7Qg
         Gyrg==
X-Forwarded-Encrypted: i=1; AHgh+RqspddE3+73kuAH5IwFUOurtK+zCg0DpbZQ8a9GxCHyMT7mw09TLcK9G7OwhpmAdRtOYzyZDB2qsDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLBNzsGdYCzvxIlC5CVAUG4Vl/rThyxiRQ0glhyQolP+bHzeuW
	UX7yXivKODA/LaXGi9wozkhnFJXxaWAoc47oabBAkFxss37ok0csS3E6cQaDW68/gBPggQHLkj5
	IXWaKBXAJcuLUPZ80FwcmgxpdvXyD4DHPr5Yoibptehhl7B/nkb6/ANGF+C4OtsQ=
X-Gm-Gg: AfdE7cntyyTZ45i2iLTAZaoUHGj9pnpTW22CksGz/JFenq0np6aaMGpSGnUzIsG7+36
	AqRcR4XzvhvHdT1Ulg6bU7CeyTJVsePmJrTtjit7fK4gEHhIfc8pRNySRb9VgVUGOhQKsZVyLHH
	huERuVwpr2f6/VM2ohAsuQ/AanjEj2KNillR5cqVOssbtcgU7Amzw2go779IRvB9hBHjnEup3lj
	TXRUfYCwSN36qdAOw+I+cLxnkCZVIej2HIwCg5sNbGAjMA1ojaz8y1L8Ggj12vv3qY9BJiNUzli
	aKI7L5LroR+kn2QvDSJiteLdvY7SpxvLNtMb9QuF9kUyni95/RxmlODLRRHVp8Y3fGtK5thX/Jf
	Qa7KTbntZa812oZt/OPYJfbAKshEFf/6W5ZvuC+eud2e9xxBSLPcNFca8Ew==
X-Received: by 2002:a17:90b:560b:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38940058217mr1801796a91.6.1783504970719;
        Wed, 08 Jul 2026 03:02:50 -0700 (PDT)
X-Received: by 2002:a17:90b:560b:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38940058217mr1801733a91.6.1783504970010;
        Wed, 08 Jul 2026 03:02:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:49 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:42 -0700
Subject: [PATCH v8 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-5-62c42b5fa269@oss.qualcomm.com>
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
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=6423;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=kecrf/J4Qo5II/j0+5WWc0znhT2v/XE87nyzX+oOmSY=;
 b=Gb+gGH0/J8OtPDPT/+WeZmXDkotwJ45sogA3rETyLFBxZpOLn8QhF19Q8WEpkLwvwalC9Bn/f
 XP1339loLBgDKlpls99GDLIGOEfNE0gxSvQvTJSoaQjkJhZtuklp60/
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 6ngamY1L4ef7hwbWm43iwaNTry31Dzk0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXyxu+k6A7k+s6
 uu3sNAwvr96lt/CbxtCcuBhvacy9FrOWYheruY5C7qg6g8NMQgP5Lcis6hBDHU5H+jGC6I2EefF
 etha8lyfFtIxLbrUTX3DfA8TmVP9uzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX+DBLlfzxA7d3
 r3WSg304nvYerhVym3Q+DvWAMCm+za98k6JtLSf5R+ZYFbZ/smfWMWFN0r3Cqa62beAv6SSWJuQ
 4nMa1mHFOCWbkfcGhhKBo1DBzsayekhtXcc2kWla0U7KnroMD5Sp6lrzLJhkw7f7TIdKm0eHr6x
 ina9EBKK6RGSaV9bnM1DPGXilvJiA5lpYrP2AreRBk15F+5cvt3Xa57rTBtXmEiFuYqhXc4MDr9
 k106LuFbts+4yFPK1XBKzKGC/meXk2LHATyoYBinUzRc2cwBRHumktWGKFikybedXtVtBd+k6f4
 I45OFYJchHHg3nYueon/tRP6BYg7CKPQeO4DB8MtVgaQsPT2CIkA8tPF85ePZpBZ9jfSVtHNTBH
 M5YaAKOcYuEFW7MuBnRk3uyh/u4YLLskQY9d2DWTDSaOpHOG9JUAjiU1J1HgD5PbTrTDHUSqOvV
 vWUrOwKJuSFe3+cG1WA==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e204b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9Ojz-Py7MuQnRvcrkDsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6ngamY1L4ef7hwbWm43iwaNTry31Dzk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096

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
index e0b545258ba4..1791e23739ed 100644
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
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
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

