Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A828643F
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349381; cv=none; b=vASP06ecr2y779vZ5LvvJDC1QKVjFv6Vj7jPFsKItyMHhKUD1rqSn8quHrajChDBbfAkZHruuKhx6zjcr9WgfrAb8/+6l3ODW0Nsjkjj1FHIHXcbj2amescf9bxGu9Kb7SOMNmScS8im0XCyBwqlY0u7yA6k+dofJL83I51Y2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349381; c=relaxed/simple;
	bh=h6RXWbyefgEVEM0BmVWVfZH0vo7yywZji3SwzXVLnjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3ZeVxiKvrto2sYWshnj+Cqb5KpLil3/iqmcaZQAA210F5NSBSoEtppnhuHB26B9pPjDpILQ+TeBMzc3tfJIa401flnEbgUMp56WxQkiT5rQyIGKuUctAF7WmG6/hyOrKmol9Uu6776dxMulu5p9RugTDMmICPLHMg2jbBwtEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeQCvVl6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeQCvVl6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXMor005792
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lDsdc1O7kmdJsF/Ws/KKiaWnUoZYb60kkTYRbBrGPo=; b=XeQCvVl6xYlWuCBQ
	ZrJs1JplWLg5v9G7Il4uRoUchuY02lISSePNyWIyan1a6JsNsWqCgK29zaGLbt0p
	nnJ7GZ/8/WDq9x3rWqWmtWjRfdARYUFG4H1rY+JHc2z9rpJ9c+Aqq5YYYV18fwlD
	k9SvOqGwTCYrQ87pX91H7o9xIe0khBDML4gpClfWc4eOcXeAfQQiAIODCbaLQNVW
	ah1WVhhvnhO1pwOUW6UXvQThAt2MonxTtY1tEI2bd4F7hvf86PFr5F0JYdE5rWK3
	lPyKg6A4TaaNAV4j8cmNCdmME25L9XGfjuC9NPeiv/Oq5trfQY4RGjG8sqohG5H0
	umfz5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qg73h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-236725af87fso12014245ad.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 02:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349377; x=1753954177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lDsdc1O7kmdJsF/Ws/KKiaWnUoZYb60kkTYRbBrGPo=;
        b=hm+y7b4wyiSLOmFo0mOiVwjqY8CktBLHNAoNcYHsfAlUL398UPDr0SEmzKzkcaGjrW
         /AsBZmpld/6Ej0QHgYMo+2q3CvlmVoM2s+RNlxTT/wmzja6VOzsegKcp70rxWEFHqwjU
         X8nEGLa0Yt6D7ZURLV4qBmqJx0sIWZfRVCLidoxHo6Kyzi9rZ1VH1GSZ5QbNibYk1Ijn
         VLJW6J4fsrF/+MoxG8eQ/AZr1YVmvDEthmYhBV3v0PLhoajN2SlBmop0gEj2dx9TucYg
         CMniTIWhYfSSYxxluvjIKSoeinWAugUxHc0+MW7dsYxq/rnc6vB5jC3R7wbvtigkoSaR
         epEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9lagcIovIvApufGboIXCp4w3EVUFKwYyIR28h+cK5lPUA1r+vzvW/l1qmmCBAdctIxEB+qyWXEJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySqC3wFUOuzbdCe0TVfSzzNvOgMA32U/rhXzrT72q1Phh88QXK
	j2WZsGyyi+sCT4nIjJ0WmXmLG5t0lD7vW+oDwZCzdxdlXZQe3EALYtiae6fMmi8neHq/te/fijZ
	micuDzJ3TSwTEfLbuxv0ZzOmY29L5zY+1N/PW6LLSqSm6lW1s7i2sCNKnUwXOKCM=
X-Gm-Gg: ASbGncuBpvsYPIbKdWoX5llIMR5J94sR4a5Uq39+qyDkz1j9YwUmP4VBwPV9PPkXeUv
	LaU8aFaYRCpVL96qe6Mz8ThzPNBQHtFNiXZuztl0UmVxjBioZ6TdadHnFqjcpmW/va+MkImrqn2
	OQd+TLJMcFund4x8My9IzbasNEYQJ8g45KmCjy1pJejAto8UDudY3zyo2Tj2jyKa0T0ObbKwrYD
	rAJG0o/Hfn5ZGRFmQm6KeXcyd90Lysj0t16RGNuMtX58cESj8+jxBMMSqiQeGYrczjyh01NRoQ0
	QijSaPkAo8fhybDtld2DGgVayHbiBrvACpALLcTbzVrNGNcFQAKuqYlGAkD1iRm5
X-Received: by 2002:a17:902:e84e:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-23f981b3991mr105316045ad.38.1753349377504;
        Thu, 24 Jul 2025 02:29:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUnZ+FdV8B68R/9Vy+pkhhd2kJ0k5uDXNRNy/JfjQ0HCxuulHG3A/9D4Vd/nuHaXer+bLGjg==
X-Received: by 2002:a17:902:e84e:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-23f981b3991mr105315745ad.38.1753349377091;
        Thu, 24 Jul 2025 02:29:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f8a0sm11276505ad.24.2025.07.24.02.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:29:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:59:13 +0530
Subject: [PATCH v2 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-glymur_clock_controllers-v2-5-ab95c07002b4@oss.qualcomm.com>
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
In-Reply-To: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfX6dRusO2fszsj
 hg3K78V15kfLX+1WSQPNAZSFcTq7AnPRnLJHEeytiiFul2aGSUCGVHSLAI4YsvXbpmmsuZM/Qdz
 QNbC6MtmRxIzleO78PfrOiFzJZvAi3uJ31CLv8N262Dz31562ownDhbJYbdFMAjn2o+uAlXCAi4
 +KyhMUCRWepZ4U8r3WRjoY3GLReo8VZAvQoQl/kGIIVa7ThcpALG7f77oeApwm01dA8YtecAApe
 A/F9gkqgavjGj+DQgkJ18c2Bm4Dvtpli39l11+lcEbYXzPHB/ECspKTQ+4Q6HBvvSWBUSblj2h7
 xE6Dx+GeqqH5ZwVISZiPQg9SjpTWpSrdji6bjauGY5qGjvaMqNZf3HfG6udXdxzwmnV3cgOwGiE
 7r0Xn4wz7SE3vLHqYWEr52U+xaL0qRdqhd3z4HOJh/03p494GbqpCrNOpblBMKkRnvi0gJPe
X-Proofpoint-ORIG-GUID: kFgLi_1DJIQ61K-_YAbHPME5UvpFtqCY
X-Proofpoint-GUID: kFgLi_1DJIQ61K-_YAbHPME5UvpFtqCY
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6881fd02 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9yNAuCQw4ehsCnPPvT8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240070

Add clock operations and register offsets to enable control of the Taycan
EKO_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ff41aeab0ab9844cd4e43c9b8e1ba0b50205e48e..0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -29,6 +29,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -192,14 +193,17 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
@@ -233,6 +237,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 #define clk_taycan_elu_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1

