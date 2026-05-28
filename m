Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA912F8E82
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935371; cv=none; b=bIUrCzxlue4zWpWGsNpng/EOpvId7GEXgQsPt3VGKW6l/QXLH/aQ7fjVlIZwEd+BD2n3Zv/Fc29r8DsVSjWTvsVJB+MVvNT/dXMpdp8a+7PjkBsCcWw9Y24fHgdjmB6mljUVI2Dx0+s4nEHVLEEoIx7fWLox4K0eKiMuWx4OVoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935371; c=relaxed/simple;
	bh=wsIfzYkqIgUdZWrV5+PdN0Qh7eYY91KcaR7Usw26blQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4WUObVs2rR23D4ClxLfff810DBrDK3F/ZjJU3y4a3guUrfiJX1Gm265ilxxrgCg6HG9074UOOLXyn/9eVBBKrNlZ0CZl4wyjCJ5Aq9D6dY762NHHbaW0q/eFSS+VQuQnLn6CQYm982kERGvc8zHC9fk61WBS0ah1fCF0V2OnE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idCtpraf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLZTPW53; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idCtpraf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLZTPW53"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKn8dn1638897
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=; b=idCtprafIt4IyKEj
	3NzC7ZMUZLCQ9ldaJFrvxD88NaVgxoN092otJgYxFwCwP1tGYaIKShJ1QKtgnrY8
	ELTfWGRfbnPro3Z/kZ1cvWISIhiNS+VX3YaTJ0GO0F/hbxATM9rYSUG0munAlK1A
	JtZ0F99hc1B3zsHHXyLXegflWF7Ewb2QZ8x1+ZakYxxNX3GXDZ+PSLeSqjcBQbiL
	AUmRRcCjSaVjwHnsLHY5qDZ3tc2SnwkwNKqwFREc6ONq7cc+ZT7e2CVTaSSd3rpH
	at3ohdEI5OW/yJhXGRCk26NZfxttZnClb4v6wSGWWKVtcmH1U4jwC72cuLPY1aBK
	YVwvZw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yngy88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d0d0b28eso1129052eec.0
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 19:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935368; x=1780540168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=;
        b=PLZTPW53pPkJHHWPa6PaoSkW+cnsBtMYIwPFvCUOlZC7jRazSHtl3S3TIDD63LsnoS
         zV4/0U05DsqvDrMtYzjk1+IXKtuM+jsxUTvR5+RL/2oG7I7i3+l2wJ7+D6cHcrY+WhnV
         jx7pWzwmEfqjYKyvX/ErJyX6sGV9JPwPuxtxPxsSxRoQS4F9jKNNaq3YloIWGTtASZwh
         cEMUxfMGsbqizqp5P1XVBt/sxtzEmJTaMwEiFyX9fUQ+uogLBd+FcLVJmm1T3FAJAUu5
         BBqT/iUuoe5Z3+xFGuxphXqrkywUJ97yRDQuybqE2vRFyzfQbKlDiMw3pAQHp9+UMQh0
         q8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935368; x=1780540168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=;
        b=RDkM9WBsW8pHwhGU7QStyAfJt7lcPqjaa3dLJPEzVfyqzxX8c4WeFjLAhHrzXo9w/3
         eU68kNAS++3F2vVqg8eGDZAU7XW2jKAk2imOQl5Wie6hvLgFMrPH+/sFHVRL8PSHWQvg
         4WWU+NzbgLp+dWi5scSVmPlBqWiSlS2FK1ZAx6L7PiZo1PaKtSX6z8YHXgRSZS7J57g+
         aenqTWeWVkBEVLiHAepUqmrCEs9aU2qxp1X4CXjPr7U9p3OOniB7maHyxCsltHmxa9Fa
         57QEP9PaZKMzF+k12YSAJxkSupUSrY6n0ZnfftyQuv9+hgiEKBI8rBP62kmLVPTReeO2
         BfOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+U7BoB/13nnAtscHfFycJ5r2jc/L6FJKLGLVE6iO52tjD5qTIzxv0L9n3kWNK1STw0iP2qfdIRiuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVB8sRB5N3qEGK+pkHWS1JS1YnTr6weRsX7iMm7SXSnFQ11pCL
	mYTFREziy/dLF0D22WNQuXy65mAkYPVfXNq0fQuPuR7ABdRcikL9n5kwd2rIOWlYdfQ2GRmXU5v
	e/tvNVwDFRD2ObPmpEGTrzwe80C2KH0LxS1aLEkL1GpKd6Cw8X3Hl7hKQuw37OdaUv0PyRxn+1Q
	==
X-Gm-Gg: Acq92OGuG1OrIsZvP9smbwFOzJy4lN7tX9yRqiiNwFcJ+JWnlRo0VqXUqr18TXHYQVB
	561V0XiWGrOt7iNae6tvpxCKsjvW4woqWyZAyQKGq1UevFj0f/8jSbWfJZrH5amVj2mfPxnUzO4
	d6eTywjd2kV4yphkvVZq5pfStbd9PnaYh97srn9x8LMgI6D7Ms45v3oniLyuKTjv6Lesm8sCCiK
	yAeYWHKnh+GC6gHmxLwuH8WityulcPYNerTfsfI9oQaVCSESyQZv0tAW6FcWKeuoap06BxSaKSS
	UUD55qfDH+psTW12iZb4y6ViYFSjZaaxlAKgaryzTMW5Oswpg6HXZC8r8bd8JAvMJdoq3V9HUKP
	o+e81AVTjqqw+tvgDOm5IA2/2lXyyyaVYK/a23zeR2o6VDLApXB4YQiDcRoMvHx4Z7SSXoCRH1r
	WGo6U=
X-Received: by 2002:a05:7301:2c89:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-30448fbf229mr12039180eec.7.1779935367944;
        Wed, 27 May 2026 19:29:27 -0700 (PDT)
X-Received: by 2002:a05:7301:2c89:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-30448fbf229mr12039164eec.7.1779935367472;
        Wed, 27 May 2026 19:29:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:15 -0700
Subject: [PATCH v4 4/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-4-ded83866c9d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=4461;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=wsIfzYkqIgUdZWrV5+PdN0Qh7eYY91KcaR7Usw26blQ=;
 b=K48SexN3wye/ZO6WKJ2IfUX3S+Jtx/LZc8dZfpxrb1CrKCIMCldBrgAGtX1FPo6SbPx3i1qJ5
 +otzLy/0bAxATdrXkROALKiKlps/p8nqna2YVKDo5cKC8qyOJnYv1ht
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX4p9P0bfepvQM
 A2H3qRDjPReDcrw2uvbo5OB8soWlJUMqfsSyeQaO1dZOu3V2JXoFj+wmEDhsgNKSrU8yyyOthtM
 sdLBVAvVwC3Hw7Ci+3p4QicmeIoVrbvuuHYe2SHJ9NBQE/ru1ZT9BSEAHnjC+0ZZHDif4xp+LJC
 FVcivT8wadQPtWE5RhRq4ucTwBNar9kdKfS2aJCvDztNewvRH0gFdse2jAK60fF1utXAUNZUqpl
 I8FIRSJLhN4LL3pTtb0EmZVY6cx/e8S0oBGH8q8SoVYdz9AKbFSZA7gGlptXXZtEfrxCFx86o3y
 by9mYi3sTwNnpN3yP8bUmZCJtrbhPBC46Jl1uae2TcF7+Do3E8iU6R9KKBvnVylG3POKK1Smwxb
 UL8ZXeaPIW2LrnDAxrupmVKlku9xlalm0XBN2igupKqYFbynHV5WHqMFVVD8EMOLXvlJwBSuOeY
 6eflYJmK3isJtPYoFrw==
X-Proofpoint-ORIG-GUID: GfcTKEo03zTlEOuOrC5wCAT7e4amMsWQ
X-Proofpoint-GUID: GfcTKEo03zTlEOuOrC5wCAT7e4amMsWQ
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a17a888 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ejsaoIeHybvuXmj4E6UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

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
index e317003398d1..deca9b8794b4 100644
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
@@ -40,6 +45,25 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
 	"vdda-qrefrx2-0p9",
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
@@ -111,17 +135,86 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
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

