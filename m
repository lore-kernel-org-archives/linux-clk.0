Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F72F90C4
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779014; cv=none; b=RDV3QSO1bs1CTxSWHZk0PMaV45cfMsQMN6z5p3s6DhjhPZqdtx+P3E88hv/ea4ebfhbAJ3ltPx/n/K5pILHXJUCQ3S53E7r8+Kxvqgth1FW5SzF5poJuuNDLYac7BUVZtvCrBVdneUils+zv+eKgqaXSrgJp59eC44HgQcpJUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779014; c=relaxed/simple;
	bh=rGL+a7GW3mkjYjbhl3ql8cfub6fQeerzdV/sAh0cb+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9UVimfbJkVbePdrcyoO0j5WPa4fPyGrfTjIOJITmaadohMv1B5g4vdBgvmeDW9TEMObxzpf5moFzCAiRiHIUUQu2BX3VY3ccU7r7UXwtwCRmwAcjIVHhf1rQlmKdHqNKtpAVNZYvBixqtMuZ82ulrlXtrRqwRwuUxEuCsSYzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I18Pnfui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A08WWes7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I18Pnfui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A08WWes7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079c8UR2877581
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 09:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=I18PnfuipaqPS9wX
	kF9iKeVqVxwr/RMebUMxFldv4ahClAXpe+Fg+56naXfIltprBLc1G+gFIVD/QhcD
	iDHjCi2dqQSqny8BsV3J+pyga2YvqeDDrll+fmFr4ag7ekC7U9aK0Evj8gXtYmca
	/8CHnwKGTLjLHU6AIVGYZhDVAIhv7nhOzFqjwOHreGrMGb4ZVQdONcmnOZ2TDRYx
	rQZ2f30PyIy66ikpRdw+NbdC4g31a97seoSY1jt40JyvQcTofvYYxfvYObUQPzXt
	qamYSDbSiXx/1CLZUzrIPy0SmwdJ44jdMkQjF1IjEAOVaEyDOVC6lxUnZ1tHSuBn
	+od1sg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn1cr0hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 09:43:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso2958079a12.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 01:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779010; x=1768383810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=A08WWes7c+pPb41tWucEdLnPzklQCjwJA26Ka+SYRKeH8vmLv3WTGRa0/i1FPdISgC
         2Y/cmEZp2rn0XvsWn1fW6DY+YFPu9VFOzM5T5v1RSYE7zb2wik3VFyrQL5A0PuokGrsl
         uzXPigwk3w2cTosKyn8WhsTNTdZrdR7K0lnB6WmqcBfTznvlfzf/iQlaULbYK55ZXVb8
         4qsYkA4g6LCl3JhgqAaeb2sYsJi/slei51kd4GRpjwjCGhFdztTF7L5EQ7BGZCrknSDw
         q8rZCAi/2Bw9kMDCRihEjF5HAMuNyitkv9qECj1/+W019ShmGGorkgR9znB/QHkjzWtt
         BR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779010; x=1768383810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=WuNKfkaxNCEim16F9E84Xg6rmSzkPi1ShDTQB1MvbXe5heiC7FwiQ4ZCoxPIR4ryIV
         2PXKS3KJAD8z5FdkHovzc4Du96YHlJDEmEv98bTjYOEhHlBFzT7ucpmW32pB01qWg1tl
         Mhs26V6AJbDQ7xI2LloYlGzQd/UvCcLhdcTsZ4NzDN9Utu1+FIq7VXzj8/DzKtYy1VgV
         r5YVE2Apt5rtc37ST6JDMZr0NpsYM3jsgkDEpNXbW5S9e5ZGp5J7u58YuhcI6cuXAu9Y
         6feLdjTUWs/etgFHhrLtbTLVPqIu6nYcgYU5Vi+HFFVu7nxlVLY9COSOKRttSQm+u54e
         8vZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3pb7uTjpS7/PsSV+Q2CD9HOB+7hZJZs9ByM8FmuC4W6NNOZ1Xe81D7cwlnNcX6i0BkSK9ocQ9OSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVaehiTrc31BeCy1wxlLNZBrUe8wrpKZ9f0DCWdXPW1fOFoW3L
	3CsRGwK4POzkNL7dBXIJieIrAmVPD84ImFu4V0lgR1byaHj+pn28ky834pYPPRHmmGvKphmPi77
	PcspRssmxusQ866eEJut+idXl06Xews7tRUsadqGKtzffh+23xy+P9c4GCXNx6/E=
X-Gm-Gg: AY/fxX5dbmF5QAeUplquQvocbDdfzzi/dsCwexyEBVYLZHRHhm6yAj6NGLBx+HpSKwu
	zfzd3E1Bk7gR/JQPn8wNwb429vXdrPgRHQUHZbuSr46p3KSw+osW3ovM9GeOlJIql1JO5sFJ19J
	DP4vqT236XhWw3K1q/F/bNkMHZ6oWuL7bjlQim9i9fU+92yZjtt0vxmfE1SfRKO/XsKWH2aVUSw
	lGbwIZcaqpRQ5PuvjbDyEZC84YSdUBb8qm+2X+abaw5aWCTJySZZNmtcK41CvoO9hAg4uZ+jxB6
	/hoMOWjNgnqGlI2RJfYU/nXuW056aqqPY6TLuz2d+/uW68fbbLKjNNMQU186W//PEDXmfnamWfX
	dn1tOE2ZPgfnLvKBZcRiODJCRlfBmhyEdYQ==
X-Received: by 2002:a05:6a00:8007:b0:7f6:5158:5b49 with SMTP id d2e1a72fcca58-81b7de5c201mr1814984b3a.19.1767779010379;
        Wed, 07 Jan 2026 01:43:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMv8PnJ3CXFfRzrWhWCZsWCgO5o82SPURinQIFa1qFxjuJZcsiNvT/2i/W8Cd0JCfLWwcqdQ==
X-Received: by 2002:a05:6a00:8007:b0:7f6:5158:5b49 with SMTP id d2e1a72fcca58-81b7de5c201mr1814953b3a.19.1767779009939;
        Wed, 07 Jan 2026 01:43:29 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:04 +0530
Subject: [PATCH v3 01/11] clk: qcom: clk-alpha-pll: Update the PLL support
 for cal_l
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-1-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3NyBTYWx0ZWRfX6yhPinQmK7HH
 4PtNmNyYHC+8EGsTRpjRczttWaFXjiQ2m/Ac968RjylfjahOWT+SVx4KYJQv+N1wOJl6np89pho
 I6f1YPu95hY4pJ1IiUTLPUGsUrFhUtA4RS6vJLAd4sJlyhBla7ZDNnwV69GGps2mFvfJgpfjVDI
 neap6RXwxFTL+V/Pn90BblxmuHjfzAux/xdE6XhxYecE4BdrwMeXJeo5yY5H0xBidIctOiaqKf0
 bAVD5aEI1Epjkgr5sIjVhkizYhzEFRulee5xd7V1uMFui6B8PxKVypG3W4l+4sfcjY4butLqPD5
 +feJirZbwvrI6BW44yuOffzD4UraLAYgclg5bLCrhybEgvLgmb4ww6LBGN0qJNe6rQi/fyKvvsn
 nzbVMA6ga33tc2ioVp0g0QVl1vbKKcVyYKh/KbzKDETkFty1NYEP1VDmApozeohmQ1d/Mao6MXL
 2eorgr/rDgRWBz5h8mg==
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=695e2ac3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKPxMsH92d9TYhJkRyAA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Zuogg3bn_4hf80nqmbn1ACriH00HV7pw
X-Proofpoint-GUID: Zuogg3bn_4hf80nqmbn1ACriH00HV7pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070077

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

