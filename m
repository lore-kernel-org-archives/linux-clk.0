Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E184369D5D
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017257; cv=none; b=BlvmklXroeHZrKXbv2zxLA2y+5pwpxDdaZEpflO6PiiEDQGue8DBqEoPvGhdc6PMWRADWAzIKke4bTEXry9naFH0/i8v7UN5ikcVMB4rKDFUl8ugG/hMfW5dgL2pkibtVYbzxB7BdUr24nVEuy+gNMaSSb5rwo9IDtinUfjcy78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017257; c=relaxed/simple;
	bh=xvEppMuh7bHMtzlkUdcvZDLvzPcPeT1rc/Fc957Trsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShkAQPmYTJtpwL4q2RdeILU+OptGceX5qbx5bUfgZ+8uGLoeKFIt2q8VyYtn9kLJHJGaerpPPHS71ytB43CBwNG+GBjB09o2BCav//9bmFd/9qm2BSu6I8S9OzF48QMvnLVHDE4wG0RJXnsBCdWVZ4Bgg/jCN2cbdkm51aDPzrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghJecZv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRNNAGKY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghJecZv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRNNAGKY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3NUl671934
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=; b=ghJecZv6optUF0ae
	tLRiXwjwNW/eVCDs5+tpApw/TsHkw+ZJ36GKbn/wyeuDjyAaZkSLFu4QzbGiPjaZ
	ovrrqHLofMwTfshs5+9QQPZo2LBfKqvs+5umG8TqRpSzUqmDeOlP4S2B7W4KPNbB
	7uYOSNKK2hVngKJj4tZ5kUwtO/5pyX9exl9LH7vZM/J35+2RJAWzmRDBf2q9Nidh
	nSFqt2b6HGKSsQo1ReQ+82HLPdASyVJk84JmPzJ66MFkA5+v14ziieLkEMKOZYHB
	q6CoxoCmV0BI7vlCWUZ2iiBH3KGTqjbf66etBju09PNpsMeJGINjy/xBO46NqSME
	NYqYLA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7nbcb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:34:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a20348ceso29603305ad.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017255; x=1783622055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=;
        b=RRNNAGKYMx4RQITwD0k51bnwv7HQfCmcofVDBx5cSJoXoo1xMOWPCQEOCTsxcdHXF0
         vkEc6YbEpDcii/l8pKSg3pTlC5h8+YtEXtYApFnjeLWOz8s/OG+ZXfy26Gq+r8IOiReL
         8MUGyblxVmSH2C32oK446vtdy8755R4kGDPCPWONG3NPKuppgQSLaqXZy2S4/I79uBBM
         GKXmaND9YPOJh98juokvTZQeZ4jKHhF6HvyiW6S8rFpdH4ffYnXWyN+V12mjEwUMCjFm
         XMNhnZjUT2Xb2AQKmCMaFjrpkOIF6DeGfAAPP6Z/0txeiD96kFW9kX+ME5bIbo/MoTjz
         ZbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017255; x=1783622055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=;
        b=JUESrkCIvtocPdsFttd+5+sqIX448BBO7V9Yxcp3WJJAtSH7lViWK4bCGIJmadq5lS
         QmbQjswVW8vrhKTAqDbdu9uGvNu4wpc2LIG2S/qPt4YmoDcIa6rpimU9ibRhpxM5nF9j
         dUK22FqYgc68jJXjQ3Axh/dCHacndl4vzPU1O6rPUp8C9ZEVfeflbivDyl5mP3gNSjEG
         bS5yVuBs6YjuIjP6OnkxYDyZwm9tJ25GA/FWmVty1cDh3OY+szDtvG0Q2A7gFQvKeaMc
         S2I1liOQiEMllLwwXJokIWzX2Arzxi1WfRPc3pqjD7oZBXP5MqAMvPv1KGgB7TJLwWlc
         okHw==
X-Forwarded-Encrypted: i=1; AHgh+RovpVNa8VWkiRZeOF9WzjJuwq/qIq0I/mLezHaa40gHHqGPcyeGXGPabJRdjho8fFqnAY5X9Mb+1eI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1xSrwpbMgzrAh3EA7+tBTayK/vA8AHQ0ZxqMiyX3KV+KTIj26
	Q2vcSUvLEjVe+mgOe+FR24j6G3SW/5CKsF1j9+BTSixq8XRwLWQugz+mpwQfN7FYkRFBjx+g/MO
	w/NGq+n26x8WwwJceHMzIK72pWqS8hnzHPnPvEF4EdbOlbVEdK83TCGWLUDnUgjU=
X-Gm-Gg: AfdE7cmrSnDP5AAmhG/EYEVV0y9DN+jAq0DOFI3KYZgNo7lBuEEiG3sZah5aVULkx/O
	b/gyuHGdXFH19/WHourY01srAjz0BL1aMZIjqioIgBBInf6TXitrWIWUHXteTWuPAATF8i4uBhT
	6KUSFnkuCqWyIz6byANAoavbMEDHXlz408TFrScptPZTzfBpS7CqgrBhFWRuzXB7KwRmU3byBKp
	E1lIZvdYzsqZQx7Ln1/xOgjxK8vJCHBSxlMoXJVBnFBUjR9LpGsJD9W/ZoDPo+gDYCg+msE6esq
	x1Cj3Z5Nnc73wzDcGo3d/n5x4i04cMOpRo1vrxZdY126GtjHL0uFvFME+UeYmseZU4paygrErYJ
	AIc69+jHS8a5SA2+tB5gmeQUrfIy0e5zeDgF2veMW9g==
X-Received: by 2002:a17:902:e806:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ca911d8b80mr68383095ad.29.1783017254920;
        Thu, 02 Jul 2026 11:34:14 -0700 (PDT)
X-Received: by 2002:a17:902:e806:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ca911d8b80mr68382765ad.29.1783017254353;
        Thu, 02 Jul 2026 11:34:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:13 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:36 +0530
Subject: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXz1FKXtCjWMZb
 NaT17W/CiywltO5anXHlaH1rWK/bMH2ea5CItd77IfPQQrdgOx8fCys6FiRwhPpKkR8lRHYDj2X
 R3pKfgqd2GG+D41lAVF8EXUURikBpJp3H2KLNmRicqkmR2ZEcVJ1f6qyLZDploqiyhxMkj7B43C
 myDJOW2h7nG19h4wMkl2Li8UfiGMxOpR3XQMTt9s1hikxlkVfI58K0nH4DgGatrgcjgvBNch2ww
 j+03IaB/vSnJea2gbKxPUFzEojbkQL+9ugX9VPEVGWceStXMpp0sBUm2jKBgOa9iW9Bbpb6lUm5
 GbxDbQXb9vq0CMDHactBTIbxDVQG6xj7vinbeCEnY4noJvYodIPJSPMaVLtK/O/7DvgZBH6O3RF
 X/GBVGhdADCjJQUmB0x21WgAxSrlevcvoc3I7G1Pjeqdapb/GrRA1tmE3mMhMo/1eRHXMgtEp84
 2IxqPhHvRNUam3ozJuA==
X-Proofpoint-ORIG-GUID: HYOBG2ElZndOFdVfI88ukLUi1p0bOoEh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8ZsdZixXcvcr
 OjCBNTTnU2A4g6i40GD74hPXFlFL9pK50JgekfnavxhQ8zo+Sdcbusvy3t5Bxs7qvKvtVZ+6f6f
 gJZA37TyRfATHfWItyBHzHBaBp8yN4w=
X-Proofpoint-GUID: HYOBG2ElZndOFdVfI88ukLUi1p0bOoEh
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46af27 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U57akka57KfjTRmel4gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
similar to other critical clocks, since marking it as CLK_IS_CRITICAL
causes the clock framework to invoke clk_pm_runtime_get() during prepare,
which prevents the associated power domains from collapsing.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index b19e8910931d85ceda079c2745eba37e18112955..78797b77d7c7ba053201064ace3963cf2bd5281f 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -148,20 +148,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	},
 };
 
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.halt_reg = 0x107c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -324,7 +310,6 @@ static struct gdsc gpu_gx_gdsc = {
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
@@ -353,6 +338,7 @@ static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
 };
 
 static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
 	0x1060, /* GPU_CC_GX_CXO_CLK */
 };
 

-- 
2.34.1

