Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BD53B1ED7
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387708; cv=none; b=CCjgiM/9vtM5WFjgsQI66R9UXjRA6ALmWWFf7fe0DeU+5nnC/PelqpL34DozjqNrJaoYPF0ST/GFdf+3uYXCIPbyXCAqqWXSByVc/Z1R/FaqM+ViRh24tzX3UmroskGC0mrLUnJiUl8f+vOiu2HW9/8EUSZDNq+O9gc6hPUFbjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387708; c=relaxed/simple;
	bh=wsIfzYkqIgUdZWrV5+PdN0Qh7eYY91KcaR7Usw26blQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qh6ew036fkFDFIAknBuA1vuyK56BunQ333sUp8v2bvaTFl0kks0sddGbe16Q/m/luYfgR3B2EeP3GarYa3ehUOLw3SHNeAwvzhSJTgaqJYCtpj7/UYheAaCvjV1zetp6gy5zuB1QhCR+NzWVgK7TOFZ/bpZ2JBpKbnaa8cA7mBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLvEfBvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/c0xFoz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLvEfBvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/c0xFoz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tjVn1855059
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 08:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=; b=fLvEfBvG/TaR+R3K
	HGUyBkheh73D3VdZhYc5DMl1KZqvqzSleg5sLspy087sFEy1U4u+4zlTKvqB9CCa
	lQltlRsPR84BjjZV8iGAMiS+qKXLxkKaAqjxPhBpCSTgQhE8cEHm+HHGSt6JYxwd
	aTJonDITC9qjw2i/rUU7eRrH6X5CKQgnKcmXbPZhQsmAnGUhgdpc1PWZRv/tjgH/
	fPhOdP0X2hm+6bybZGdP/TuvqdMyj+XhV+wUqzOxFoQ+xpE5dSscBn0/v7BvHsYO
	L0qGJp6V+rBMCv6g4HXVlQzGojd0V4ieXbYXYGGs1Jkm/hRSK+OqfA2tLqAxt9c4
	LFis4A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf78h28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 08:08:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304f23c55b2so3654878eec.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387703; x=1780992503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=;
        b=P/c0xFozhRSaP7Id2F4WHX+9YxSHyT2NO83rgvKdyZ3teUmkrQ6IuFDzbV0v6RSMN3
         uvqbAGA+01F6WN6MbD4rJ1cZcNwdRbolmfrpyI6wfEGZeLb9mGXY3jdlxqgo+W/mRYot
         mA9QnSGoEEPgzTWBaQBRUzP0PhD056OPSJxtxzEE7BL8gkxEObhgbG07NITgbVfpvOjj
         33u7Xk2hQvdkJZ7zmW2mr8/j9bSufDt/m4dhmAQgoM7MAdqIelVILPMcXj+iy9rV0+3J
         emKOty3n2d+nlGgcqKXimzajKHG9mmh97mc+PDdIKj0ckcveAjJuGvEKbMjjT0rPDSel
         k2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387703; x=1780992503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=;
        b=I+o823vLwI+sua8ITGfraiE2CulYg35HAnE1xGmTzzHAVrnOUbm29wP4hEi1aw1SPy
         5VUxIGMhzJJQZlibmcjnDVCsJjdg9c3SsoPU+cVRW8dcxoN4E6NhCStyAKrO4++uMD13
         6mp7VtwDWEvntxabEpsaKNiSAD5mMX1W3zvmZtiVlR00qgN6ElNM2MIbBigX/v19Jbgp
         eqg5iFP6iJ3sHyjxCmMvqfDzYP5VR1vXtSfgx2SH1XItuWKWx//QgDiCExCGX4n5Kw1T
         J7l6Bjuo19MZXWOe/qhIg/FP/EJdh0A1Dtqf82I05ZXy4gewcKxBGlwMom0SrUteUyek
         djdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W8yCwAZEHam4otg7z+IYcMHY85XOVIuegCa6Nh0lOrBSQM3JXjOBQLml8ys6VtgI5sTye0YcnHow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPs5Gd9fcBZPss+MHCXSD5eVwkIeL25DYPhHrvT7kkOiDwwm/n
	BewSjmqMgyOqCacxXUxd0x79DtzNqvvciS3A1JDNfp/QzryplE4DWVcZlCjangE/+113uwYfwVD
	yqx12IooJ4+1/jCdVYeh9YHmQ0YH4syDh6myoTIvDST2dB4zmO59TvhrpTUcuHHw=
X-Gm-Gg: Acq92OHUmUHkPEO/GTl4+tucaEzB05mWhxscTNsammnKmvLWg4IXrn3vkF0ybG9qrFG
	OMftLe1uLYmn8IWclFzYkt7kkwewOnyECVxpH4ACSkrbELn42+texCJaTl8VsNBAW1KYDTpKM+x
	9GaAW+CrNiot3tyOWNfjSv/OrZfuIdOHZuymShZktkhEr4p/5YjnsFeL0E5CngBjO/BVX4+r3Ju
	GQCZQmDcWEgNel3KzzxevDokJDQ9vkztmrrHVtSLNbiGmmR2LGh3+e/1yos5VBVEt3aNwDDw6P3
	D0monMbNoBfxPnWOvliuCyVVoGiglIoMAfpkaPEq6TetZLtbaXF9paNbDVdJLxN6vND8VOIjyXn
	OpmSLI/5gcd7ClIXyLRJ7UxVZu0SEJnfSy1nk5fuAnRbVBXp5v8Z826/pgk1Y9fRriW57vfpFJ7
	+IYdA=
X-Received: by 2002:a05:7022:7a0:b0:132:956b:3c6 with SMTP id a92af1059eb24-137d424f2c8mr6356018c88.33.1780387702631;
        Tue, 02 Jun 2026 01:08:22 -0700 (PDT)
X-Received: by 2002:a05:7022:7a0:b0:132:956b:3c6 with SMTP id a92af1059eb24-137d424f2c8mr6355997c88.33.1780387702041;
        Tue, 02 Jun 2026 01:08:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:20 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:20 -0700
Subject: [PATCH v5 4/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-4-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=4461;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=wsIfzYkqIgUdZWrV5+PdN0Qh7eYY91KcaR7Usw26blQ=;
 b=aDFb2uVNTxQj7Yxbj/PImvdLe9Kb5iRz86HHuzbnJmYu0NYzzeNpnqkVBWfIONgVzSG7vUnq3
 SIl1pNt/dyCAAh+K9dwNOeywAelHuri650T08PaOY71F1fnYiq87LWo
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1e8f77 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ejsaoIeHybvuXmj4E6UA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: LOjdOcK3ocMAwcjunnRPCz32KNHiekqi
X-Proofpoint-ORIG-GUID: LOjdOcK3ocMAwcjunnRPCz32KNHiekqi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX4aBefHDatkOT
 ZQtIo9aaMu4egwk8j1w1e+Em7PkY8Fp6D5aagCQmQZ1Rs82aHGuH4a7u3PjPzSls8iJqbJ0lzz2
 wN5KJTYP6xwBrt/dbmg8t0HS1NyBf4nGqeNwIkqgGi+XAm7ik9bOwRkoI+iZZ2ZmWXTPJYgpFSJ
 g7B16MgSofIYvuO3h/QD/DfB+5oSaqC9CQ0mlSsK+1Qvyy/s8DjMwIVgPXd+mmVd3TnlqQKr29p
 gEunKjHd8bidwCUCsz1t3vLc/JB/sBfmkP9s/UtmYM4kRULKhUmdFX08A6BAr1Z8VjEv888BIsK
 DFrWllrDAxcoE+0dM9mySZm3kE1M1uH8j21c91K7kCmfisr713mBeHCC6v7jPEjnwVgvLOB95Nd
 n7W6DiIyDlEPCzpWS7dE1LEmMI/mLiMyitJkzWlhtLD+lruazv2JhwV05htTm9nRrUDi78tZ/2o
 QH9uB27LrG1r+KMWNGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020075

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

