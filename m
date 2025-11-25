Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2A32B9A7
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092739; cv=none; b=izhOEkeit+721FiF+f5rVSeOsbDfzcmGR9+g9bJQhDvnWBUaUgwk6RMMlt1QN38czQqnsB+sBVMYmZrPOmUAAQ+a55yrQDY6/y9dTEN5ZxgGBw+JWzOIkxZStbaa9Vsai6Pw0p4ar62eH8gRIqCREjZNHgPGQrV9rc5Lt8Tk6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092739; c=relaxed/simple;
	bh=rGL+a7GW3mkjYjbhl3ql8cfub6fQeerzdV/sAh0cb+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBqFl2hsbdm/DWUqYc7zoeqC3AtiCD9THSQSY0pie8jrWiDhX/hwtUboU8/mtRaiVMyYsDuwYE6H8HLVWyuDO6XNDJJ5poezbQlG7OawX//dmLKUNFk6UiGuVVDDMVuhqYXTN2NwWv1xAmD7d/l7gePiX4cmiN1MCUismwAcyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov2+BXhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGbt4eiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ov2+BXhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGbt4eiD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9wNmQ2659054
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=ov2+BXhlfhkyjxkj
	KnbJISDEgql4rZGwgyntBueF9Ij1iGIq03/TDSXrd62RP9FeJU4y7R9QiB2XtOl1
	Z4SzFET1nFR+V75xgiUxI2LoJS+YzoPXpLIk0K1Rpvt3Z60F5hKwpGTe3drdhUqe
	7Dm8qb3h0Tbey/Ww8Ld2gMycMnvsJ8jFn2cYk8Owpw+lLVrKtW+z66gL/XtISYDR
	ogayitwjWUHVWC8JbofZZL0kaG4qVLgzlyTu5SDmiEeCiVtkucdEcSn/CrRw5m8f
	/Yv0DtVCiSaZ3PhUPqsIf4+dwFwNCYNbDG8SMVFkrLukwhKcKE8ODIU7g6fHEq6/
	T+qBEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9x9c6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dde580c8so203965515ad.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 09:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092736; x=1764697536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=ZGbt4eiDdruuFum+WiLRoSg+YhzPA6tdkMfPgjYUtl7VH/cI7ZLJRX2eI0A9sYjAy+
         epmlBT8VTz7BMwBLX4MlHkfoYF0fDSB/qzvnvdgY2gh/frI7UX4gCkjoKfaQHhiJ+qys
         YH43wQPKje8/WcTWBfDJBfQR61n4u3KGm0od0lFLYMNBNlIJtL8s3buf0hrocFqaWKf6
         Yoeb3UZU/NiWFPXDMeuNFHr3g7SAlcftfKRqNgrh7QYnOLn8HQMK0k+HYJ9PeOAgTBDM
         Ib8zpZaJ+XJmd8lcRl4CX9lxBqCYmouA23UwNM+4ov1Ww+dj3hFVBn5sGAnshlvE/Plc
         S2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092736; x=1764697536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=rb5KEvT7Dcra4aVu9Q/TVyOl+yQefjW5Q7VcphLSoCg7MmhnYmkY4g8HyntdpTyiz9
         CCWKpp9+eMuuYN7y9lNyNA9ZPgl1yfo9FLMWnPhhq/248aN1qHqDH/DMu6dM7kVHWhcB
         Ew2vE+gFudUSLssi4LJcaYF+QYlU5UELaiY1NgMbv723a+pVKUQevY9+32SK2c6Zb1CN
         XPbqG1jr+jZTdpOVVLiCocfWwRK/+wSdmIwMKoum9J3bmJeACx6AE0Uk5g9cSU9UNnRp
         uZ0RFYbvz2aZN7VGTIBJ8+Ql8RppivmzYzZwC6P2xZ+bq15/2elR9sIxOl2LsjUrmuV5
         XU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3Mk8C+5gnGVJW4hEYFpcC0AamBx6HQG3o985vaDOi2/82UaZ9y21hairQKPNQz1FRDeOlAPGTj2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyopP5mZMRHCVguD/I1+uof8VgkrLuZDXdI9oQ2osNPsFTy4b3K
	2yp27qNTHERyQdrnCVUkPonE6d5ZS5jOJ03ET8uHAnHkVbUd9pNbjvmOu2hzpOOrRg3AiMM9BkH
	vsiHNpYAx0F8zAS1uPF4upFnKMw815Q/XMjVszW41lfk1+pBz0sV5WgznDCrxOvk=
X-Gm-Gg: ASbGncv20PcPVKO5TX3pjh7Q6DMrdCJdRkKgoew1B0TcxjRAdohOcKZ0Wer/3rcKTmL
	G0S/iNZHq063znCxwr68RucNuf+jjsJaBM6MbhpvQ0pBMmLl+dvBKRorKcx+iZweYujLgZj6Hcx
	HF4sbKnmiMOBGaBT0S9FhqqvDB3vDopNWByaqU4e8iKIa/jtdzsklYldAWoUMMFTCtttHCvlvh1
	kTTPM7dmnyAxKaDu0/RRJ/1UuJfBRPK5/gnYqlBuVBBB/7/GeSMukA9gXq3dyXfA/BTBmWxrEME
	BeQ2176uYDphIptvX7U/7Bt1ijtszNWIgJy9GnLR+mfrbjdZQfQusBSMK2XJZSG6zV5qEqK0jWC
	ObOToSoJCw64MQh0SFeo=
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id d9443c01a7336-29baaf7b90bmr40218365ad.20.1764092736465;
        Tue, 25 Nov 2025 09:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxPsF73cA1rD9RUUeKsVhqXSVlzd8Y1ZhLmKg/DCFPDWbHJfilV2yMNCSYMEKyoA6qt4Ypxw==
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id d9443c01a7336-29baaf7b90bmr40217975ad.20.1764092736060;
        Tue, 25 Nov 2025 09:45:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:35 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:10 +0530
Subject: [PATCH v2 01/11] clk: qcom: clk-alpha-pll: Update the PLL support
 for cal_l
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-1-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: vKru-unH4tYMlH2j2K35DylvFtt0rMBV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0NyBTYWx0ZWRfX0It1C+QEFBHI
 AX2iQ+OHJXG/xPuwOA5/bL7sumtuZkep+KJBznhzWtM5ZAIEyNRSD4vyOm8BauSaxuWBgVujCMp
 ZhmI0THNKMkDf7eC588iW+toxPW/ol8kLKOtxNezZeyIz5LsDuoVwlyYtfCmfZ+OuguuXh41sQ9
 FhaUAy/1IVs9v8p/fmo/nWNmLMKygInBS1lcNDCBsMGTbPoh8/DonzPJxKSBTrimmoJ5f6WiWeL
 q2v86jNy1Xh6tHpnz53KQ2+mgAzDE99cfUEqsugS3qOJZ2IzKXwsl9Z84+jZLZMHhaC3mjWtnQY
 VCxTz+/iLQEocOfZ6qx/6k1CstsPcDrhoczUB4spbrrxlJXlkudTMACjOZMx4xPW8EMn887vVno
 mUDxMIq27FuA8bNAJWIb3Sr8w2nMEw==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=6925eb41 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKPxMsH92d9TYhJkRyAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vKru-unH4tYMlH2j2K35DylvFtt0rMBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250147

Recent QCOM PLLs require the CAL_L field to be programmed according to
specific hardware recommendations, rather than using the legacy default
value of 0x44. Hardcoding this value can lead to suboptimal or incorrect
behavior on newer platforms.

To address this, introduce a `cal_l` field in the PLL configuration
structure, allowing CAL_L to be set explicitly based on platform
requirements. This improves flexibility and ensures correct PLL
initialization across different hardware variants.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 6 +++++-
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c11e44c5f39d15f149d62149393cd3..6f50f0c4b984e991982ee8914a496c00c4ee063b 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2338,7 +2338,11 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 		return;
 	}
 
-	lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	if (config->cal_l)
+		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	else
+		lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), lval);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
 	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d..ec5b4e4810300fa787420356bb073c24bb05da62 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -128,6 +128,7 @@ struct clk_alpha_pll_postdiv {
 
 struct alpha_pll_config {
 	u32 l;
+	u32 cal_l;
 	u32 alpha;
 	u32 alpha_hi;
 	u32 config_ctl_val;

-- 
2.34.1

