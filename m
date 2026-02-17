Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B9D2DEA98
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314766; cv=none; b=UQ4c+nyi8kCCPFIKomsCmIGpbD30aZVRfB3FvupF9QD9OzizU2tq/agg+DcTXgraRkIpjXlYWzKI66F0fkRLaWBxuThBf0HHd3EuEgStyIKCcSQL1TbsT1iTK7tY7cC1K6fnWRNia9XtxYvUbDhBFO/FSQ+S8mmbBxA/m5kmDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314766; c=relaxed/simple;
	bh=/SzSv8UMfhi5znodHP6PjQYlZg18R+0NDZwkrVHeQ14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPMf/CElVn/qReT+BOVOAqbYAd0nghoZsV7Oeux9tEs4aPixsmSlhFjiJx9wMTcI9I3RkQu305RFRK+jY4sq6PqvDQHQ8nclsGt1Z9sbni8P5M0ReiG4jbGA+l/FluWrcHu0jM/ocLhLg6Fqar8algo3sAMkuvL8uteTNCpIyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWPCk6om; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dirBSn5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWPCk6om";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dirBSn5o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4Xui1545248
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz0PzecnV0gOV0OjTmSAMQlZ89zqvIEzR4OqGyCHFRk=; b=cWPCk6omPAXMyqsW
	7i2/IHomSnOMBW2oFFqKFQ3wD/BCrZPp5GjmmZ4lCLhiYu0WEqGf1h4vBRhSXP5G
	9SLSKYy4IrBGyVNwZwVtWwsk3j7Z2GbG0924KYsQzHjVAvkKUDCeibZXDJ8ns47Z
	2ok7cTXgGT2Rsqi5cFv5zcn0nzkwyjGzLvODSb5YRz06zoLFe0oK4JzW2Wo+4iHl
	LVPGOCGQAkVx1D/auaToWLC7j8Gmjeaq9uUchSIC/nWXUChtZPfbRSEKnT+bsKp1
	RrbAtsCZOUr/CZKugz0tns/EnW+jPgna6HpBr5cJeaO+nUHujKsjoH7CJricC+1J
	jlXy7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajsdu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so2836879885a.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314763; x=1771919563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tz0PzecnV0gOV0OjTmSAMQlZ89zqvIEzR4OqGyCHFRk=;
        b=dirBSn5o1UJYQ7gBqev+qvBmh9EMqrOfeAephEW8+TGPKGvjcWgQ6FJlm+uIFPLekc
         yporEu+Q2RLy1WY9AaF4GxzyhiIw1v7nL3DtLMYD6jQHczXXe4b8rzPgtNh57vA46YDU
         Ez+194hfbA2ChoHAZa0Ip1vY4SIAuxDrjz0pITv97fdqPYr/6nEjSFPndzexKWH+r4Kf
         glZ1olN0nT2BdMAdABiEDEEC7L00JDq52UmC0wi3kembrwjJryUSTkhpA6OMCofvrc6f
         b/EcthT+QqxRbu73Kz07rcql5CMMy11SgVZ+rbucx+fS4dsQju45C9qHIvj7Sr+i9lzs
         WCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314763; x=1771919563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tz0PzecnV0gOV0OjTmSAMQlZ89zqvIEzR4OqGyCHFRk=;
        b=dYdulbsPJQA2C8ZCW/bp2hbys1+SsmI+26pCDkyAsvyA3mu26R8LgCQve9SN5vd74U
         VWyQFDdgL23K6sHNKOegze4WvUsQywSybIVRB1q+e14zJdS9O8tv2cVpZAvKcSNKkmZU
         RGZxRVNw+RGUl0fZf+gkBZ2ENskec9A+OG3q31DtFU5pnsgTtJCVp4hBHvKzksmNUBHU
         tCek6RA6sGmvEIHulb5RWRS/QmYf5KWlv+l78699yggYsAZEwSfoYdrFLLQjHOgP61ac
         DTF/Sr5Je4UxB9T9of8baPPvyw3jsQBxlgCTq74V4jKGAamLh2rOcM8iBnZ+ZZmBLcCL
         ZkTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHhsy8wszMvJXamKJLXJzkRf7SmQS1amGZhRytw9TPkacoNEY1SoHeNCffAtQKpMoCjaH96xjnoCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYSM2NL3QUlQxG/JGrvwkt6LDtDu3wGG1+3/OJoUsBdX1Jnx/T
	bE3MdbdK4Bw3WV5KrbMvdSMYhi/Vwzy6FA4ey4CQsqtN9OWHE2ztFWkBVZERSnIDfHGQV2XT/7l
	SljxKOiFLmWDGReKMloIrcIZ2+Zv2tK4DervAH4SA3Me/3E3IXyqMINADwqTyoXw=
X-Gm-Gg: AZuq6aIcjyEBbvcc4JEfhus2AW0np+AE5BeOGNMOjP4DQVsJD+zJl7JCowuYh9Ghqkw
	aXaswq14nK/0p9HpMHiPom9yEmmig4A3DLJRTDpzDb4okAhgvtV92OzYmZRX92W2ApydlWdMlnv
	wU5VC1ckTKJ7LkZuY1rR39jKaKiJXD20hlhY5tXul72ozUA0Kb2KaoyMQVFOlf/EIhcRa1iNmCq
	qIissRPt1o/ee5tZhh1aZFsMJc2qQ1CBAhWvGZNHQKthfjDNHF95G4YL8s1LlI0c7IOefD/R6BK
	dZ6exxtpudlr4dMrN20YzeU+yM219MW03tuTUceZ5kN9JR0TmpCXaMVq5YB/dEcQxa651wdwVgX
	dgtb35XVssynKYJLgyqMIJfWHNeGmKg==
X-Received: by 2002:a05:620a:40ca:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb4acd53c8mr1153724585a.45.1771314763323;
        Mon, 16 Feb 2026 23:52:43 -0800 (PST)
X-Received: by 2002:a05:620a:40ca:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb4acd53c8mr1153723285a.45.1771314762783;
        Mon, 16 Feb 2026 23:52:42 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29860229f8f.33.2026.02.16.23.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:52:42 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 09:52:24 +0200
Subject: [PATCH v4 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-eliza-clocks-v4-4-5d09f28d4251@oss.qualcomm.com>
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2482;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pIwMv3xwfCvbmXtdNXhaPOf3iqbou1znO8168is1YGY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplB4+uYRxQhZASOvz/ykwpEifRNoxEwpHfPAeK
 g2VCxOJf3uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZQePgAKCRAbX0TJAJUV
 VuFVEADIRvKK4Kz4raB1hNHwsOo5jk23imbh3oSbyhYamXIJSPUlH8LPAr1+VD1aIo96jpvz5G7
 UIzAR2dW9TccUaNFCopPTAudIMi6kmffxa/acTthLwvGxNic6+Zii7rN0o32s3ZwW08kxpcG6PQ
 efZ9M38/WceM3nuW/o1+9uTtdVHvL4nk6XzVjdv2Ni7qZu/fD19k5ZeIOqPms+4VAvJkyw/2dQM
 ap8z4PfOqr2u2MCnjskYLYjpv9hlvhVDb/ZQTN3w44p6iv5H2ZmrElGn5V1nbHD12tn1hVDRnw4
 yImLrp7GyqBcXajbtNcx2BFfD2lLjHFYpZEzgi5G4/2pAkPSUVYgxetoSM5XOGKlj25HCB2y8yi
 Kb5nWaMuiPnl4uPhihSf0WCGAjqyfQ7Tf0bnW0FJVTtuDlPxVVITRTBuD7v5LV+xz8eBpOBr0Rt
 fBKePBNDr8/9yw3pg/kdv7byQNXkAY1TFKkvbCeC4bKeBu0J4nEI3/aVVCMObFXiB6XnqAE+BL/
 uHrQOTXue0yHgzmXOgGEpiWsuWLfRAnJX1Mk3FUpssiFzafgWDlBZbsq05LmqHZOsQO/hqHzlQr
 CxZBzFCdkmEdTftDzpF9D3Z9i5yrSH4tPr6O8FW1D5NcyvtviEsXkiP1gTWKQRmZSAcg+2MzZXx
 BkerIDf02c134fg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX3c+UPttD+OSh
 6PDOfFVuDjys7ZelvRRFNX1OhyWXbT8Qxs6Sg/etW5bErKVp2QE+Ns0Afcd9LeNGfTYr6WkhbYv
 trXZWKGLj1TLplc/yYS/MYx6SzDgynTq8xerOxMQ19uAWPfCQIFrM3p7wRhZJkkEswCC9eAAvm6
 ip1qppk4IGgOYb4nGjMckTrxiLMM6grLjASdfLySX0YRsdFNZ4i9iHpEFZ8Pw2THrvfVbpeKeMA
 qDVtCBjUnTP3Jx32JbfbrcDvNXvFRcx1SryFk+DtrR4zqdzdDAufiXrlwAsPrBefXglZwsOSCzo
 g5/kjoZmLiuu/9ai15lDGp1CXZp+fthaNZD/ys9/5nzKMjSnvQyJEb/9t3N8tlzDsDbsZTo76J6
 UjSfUws12wZng9MTWph2aFTkOP3oibClhjWOBvWGmRRjilu03mkwOiSqfiaaqW5r5MLrrXxQWD9
 PDVGfFR7fnL3F3NoKFQ==
X-Proofpoint-ORIG-GUID: UyHs6I6dk6CVtA3o2kWcSXrLjEPFHc4G
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69941e4c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=WYKAqXAjdBNwTyPbr-UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: UyHs6I6dk6CVtA3o2kWcSXrLjEPFHc4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..6a54481cc6ae 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -372,6 +372,8 @@ DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
 DEFINE_CLK_RPMH_VRM(rf_clk3, _a2, "rfclka3", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _a2, "rfclka4", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk5, _a2, "rfclka5", 2);
 
 DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
 DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
@@ -940,6 +942,29 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *eliza_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a2_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a2.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_eliza = {
+	.clks = eliza_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1054,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.48.1

