Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5FB246BD7
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767785; cv=none; b=FR/5m079Odds7YxieojtY1WjOWPqPBTnRoEDbaLbdqtRvQsHT2wjPyEuT11k+PptwB0/57XfWyZrc1qZ3E9tS9uDhYEBD8SW+1OuY1bE4+5zK6gYfShGfnotW2pRY1j8X+Ed/49gyfecqUxN54pTZWn1Kpwz0lROxkN8TNchwPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767785; c=relaxed/simple;
	bh=Ea0XH5QnnMd0RooqHYz8fkr1Sqoxpl6YgOdzQWVRygk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJD0PsOsJMMq15GTZpGOtmnAnUXaSaEi4N0cs43H+OqUK8OdII0mME+ugwokgPCI7ndTuRGHmMXqoTBGli0Z9BGIYyips7E4ToiwcHilww5MDxcWCc6YNVxOZJY+ojOmXFHBMVnOGrm0UOaef5rgyQrswzSyv1dYOA4Rl1cMRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jA2+efW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA2+efW4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLqsxG005004
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABiB2EaBL0RQGTqrly8CkIvf54XuMQfSPZGXYHXlM6I=; b=jA2+efW4v5n6fnYL
	HjjKFBO3jkWJErEFAZhRJYeNbgOCcixJwTXFh+s72bqH3JhlR1akjAVujKVcEzxN
	5hmDRRlY90ixZTGhG9TMVM/DN5ET2mUK9XLLHgKITjezkJ0hqurM5YNZ6W9UKGHm
	4taY23Az8stHmNMbXea0Rt6FjFaeEuY7lYBZfnDeFM4NtLs5yAlXrP8CKKls4Nt1
	I25q0M9jHPlcWMDWYHI4seCVbyT+YpBXXzN0VEpHDt86ZGj2QznaCfxMjz9S0L+P
	xJizjgenI9eEEtPaawuWZ+juOO11PC2Ep573nQ0LbbFpIUFpmEZLLzFxMj6E91yS
	znyYwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyty42x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:43:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-240012b74dfso18384075ad.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 22:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767781; x=1754372581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABiB2EaBL0RQGTqrly8CkIvf54XuMQfSPZGXYHXlM6I=;
        b=enYc13wMSYvPJOqXoTYe6viSxvt0vMgNet6Ga7uCMXjxKWBlGnFMuvbaYTPaRrMkef
         LDn5b3U3fcPjs2TNcVgKNj+Dra5XOK8+NXP+N97GBBB4ldHV/b8NnXqeLkHLSKHro22E
         q7q1Kw8RDKmoQvR7p6/nSQQMEZ/BDR61sB6ppQQ780L89SZmFLsA5yC3KcmNcSkzd6Uj
         atU7G/ysZRDzzU38gwnKM9jzEt71O0yN02u9RyT91xXrjucpwFwylF5xsa0Anh4Y8zHl
         vcUkZ0SOz2vwtOwxbzsJle1QT5s4eQAcTX/uqvjwVkiPgrEEuvnlp+3few25AvmhNG67
         hMUw==
X-Forwarded-Encrypted: i=1; AJvYcCUvtz7jMIyddpz7g4l9+s2JT8uqCl0FxxH7eQQ8QMy5ZXCcvMRve/LlSwprpR0sq1E61kX5eHYleVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJE4m+vLAOwOP53+f7rxC5fPeNRYy96ZEtqjOYBnDfzxm1ddIw
	eDY39Z371lBrxrteYdIQPt3DW9GWGDyc0ZbVLeyqWqv/BnZCHAhgntfqBpulb3HmhqwIiZFlhI5
	boz1to8fetylMGlm1WCYgBqkKFQGBiUrpAnEtmKjINEJ3ZKhpp4mmYlrSwMcr3eg=
X-Gm-Gg: ASbGncsnP7r8FCQT4AMcIi0enrVdZmXm3v9XaeCEDsHlUWJEZFuZAgzohsT6omG4ll9
	jUCUA1IEtHXeULn8q0OTOw9MmGKBsldp9seA55LQrYkWyz6cpqRPFadQV0C6jYOhgIcQWTaZvHu
	+xMr+EQGh7v/5/tUdbTqZRag0SRcDUGybuOtO4TZGiP/yhvN3bzl0DNrLT3vMqmi8vfh4KIiWcl
	mZEMhvKw+wJphet9Dt+gOTK+kE0Kud0RelIqdH8zZ+XcmtVJZIPgYmcbXCsjog3qbu/EX9ahVhZ
	OegllfOxWcD5tMF1Dt1gCf176MtWCicn66fL5T6J/7s0liaZGvIYmg8Q4ET0Dmrn
X-Received: by 2002:a17:902:dacd:b0:234:a734:4ab1 with SMTP id d9443c01a7336-23fb307cde0mr217608375ad.3.1753767781193;
        Mon, 28 Jul 2025 22:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK2HfQt/aXVHTNGav8XxlNFH6DIHxFwfWkOfqcuf7P72UZ3A45H1KrBdKTpa7wMe4454xOjg==
X-Received: by 2002:a17:902:dacd:b0:234:a734:4ab1 with SMTP id d9443c01a7336-23fb307cde0mr217608075ad.3.1753767780731;
        Mon, 28 Jul 2025 22:43:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:43:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:38 +0530
Subject: [PATCH v3 4/7] clk: qcom: rpmh: Add support for Glymur rpmh clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-4-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: zScg-2QfvfmYwlgKs8dBtIMHGXcyRT3W
X-Proofpoint-ORIG-GUID: zScg-2QfvfmYwlgKs8dBtIMHGXcyRT3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX7x/cNzMtJ57q
 a3yqic6SWvJrp72j5OiY37CQve52eU9hqTkGB8lB+8EGFl4pxnIHCSkVHUlGp9wWGV635Y4L7d1
 GV51VDFAtEmRJMhSX+Rosqvh4lWHFmkjfHbqf3VTvtowYdfyN9t013z103H65TwruA5DkZootRc
 heeYX1TsO6ezM+7MlP4az/YHfqfLDOOOZN/2rLHDiLDruvITk+N97ezQtK8OEEv2RQc59EmH1un
 6fiTVKQW+bZIzjwpUruO9j9OksBDdin9nHUcn9ZHV+5OfSQU6Hs6I8slNiERSn5QHSg/fkeyHtO
 n9hCiCo6u6A5fhjqKs97VnJrieg3yJHPDSpg7SQ0cxutOF2aeTWismaLuHoHlNRl11HtIXTFWhg
 MZJ1QsuD5GBAflJauAi83Hw/oSEPZ2qmtQBIfQ2uJIdU2laQc7Hl+lOIuxxMDlwny0G+W0kN
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=68885f66 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HMeQyL50y89bOeNLT1wA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290041

Add RPMH clock support for the Glymur SoC to allow enable/disable of the
clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..1bc1333087b4cacfe39793dd19d6bef3d17790ab 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -388,6 +388,11 @@ DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
+DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -854,6 +859,22 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 	.clka_optional = true,
 };
 
+static struct clk_hw *glymur_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_glymur = {
+	.clks = glymur_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -943,6 +964,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},

-- 
2.34.1

