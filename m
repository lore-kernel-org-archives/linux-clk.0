Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B07238239D
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379448; cv=none; b=uFKVHslz5465nrZ75mQf4NGn4daGFumNrirSazvVSXimFEaRFGNEVOPzjEPrJCYTLvSPj4rccQLggPcmYNDbOph8iv9U0ISWHJVqOkGBNyM1H3JWRjhyafZIEXIbWe24mLJ/em0xuvf5L+MtreWj4+Ea13iofbZKafHZnyMhir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379448; c=relaxed/simple;
	bh=suXK+1Q/n9j4OLl57R712VmeC+afReb5v0mwLPIjCBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTSs9eyVGETlOuvfjTTgG4KoIqFic6KTnY19Ih+1mN8H732VReCA0wVcDDzjAveXNnri/JrX2lc0PLOST8PviWBUW2mL3RvnreoeqN7Ed0LQy0Q3+LSnKMaf/EI74YaCwVWBLAClg+cdBbPJ7/9EjbJSDDrtjeoezHorp3lLTt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBWvKCZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGBj3cA6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBWvKCZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGBj3cA6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHV05475621
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AIZtb8ts/lmF7ZxtyrpGaIzZLAPeVZZazFj9+lqivk0=; b=mBWvKCZ81pWrUU7V
	kMxkEjH9S9mmv5ZA2azdHBZ9fNpZNNkvxhwA/fOAI3+R06pUgmFILdDsfShqWkJp
	Cp3jigJEcopv2vubfcTGoW59BptBl5aM7ATTwAF6lOYMBXuW3ebWNxWxrZQ8W8Sn
	ywjVrBkL5QRCT9BFzJ0BaN0DVM52irITGV8CoJnaOvn5tVKdNSGI9KkVX1OOSRhw
	5v6H0aTe2e2J05QnhtZq3E3dWciDXRK1cDVbtrgbjWydcKRJzo22S5l4qDRp5crq
	6+yzuvSjGmMbbirf+skYNBcNNmmAXvGRsY44/FaU4aYqpa6iDW1DAWWRynBwm3H0
	LZ3RrA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngsqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so12205141a91.2
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379446; x=1784984246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AIZtb8ts/lmF7ZxtyrpGaIzZLAPeVZZazFj9+lqivk0=;
        b=EGBj3cA6g4Bh41chXe+WRf5nuoFA/SSsFj3uDbNVTiFgG3A6CLEERn8/Cueole3ScE
         pJOTSbCXA+qYgE8l4BeckG07DDjGa0Gjfbz/urq7fuNUTj15skF/Af/iKm4KGnaFYw+C
         g5sonid60gJdKg8YSWtARn7pKe6FjtgFsbEAr68bVsm+kRSOz99zJLBy1aLub4rtx/nW
         rdCNCSKtomw9TlnZITdUX0lcW1EyramEj9TctEmeaZuiiFQ+IOfMo3EqKtOcPrueLZbf
         CQ7cyX3l5EbpNLXIaRr4kp8F3or8fSXYyIdwEt8PROZYQg9lKNXvTLsjzEfvXwf+H+Wt
         DQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379446; x=1784984246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIZtb8ts/lmF7ZxtyrpGaIzZLAPeVZZazFj9+lqivk0=;
        b=tDhzbVdvC4MqSjNwIvzhJ97qluMJa6gNYbloTHIiyNSQGIoYC09uR21Ul5KQaJAU5B
         jRTllUwnyRFNAI7bbgv6cOrIVAvDskGWwlxHx1iImjxZspS0sanhVzvP9KUxIUXs/lml
         hcso888t6c6mO0oOuAt26cLPti3XsbzSznzTTl1FCjR++hqH+q7EWi+srToUjZGJ0zZM
         Zr/z/Yjb9NBwf6aQrjcP4Jl+CR/a8GOto6xnHb1NhE+w6REsAPYCPnM2R78wHGdEx0aQ
         4Qjjk9RN8lG284TtusXlw7prosPx73mAebs5GBdQN2oHoJ9pAVpADoZazbgec/CufUmy
         gJeA==
X-Forwarded-Encrypted: i=1; AHgh+RoHsCaYA/NXnXxlVWeI72egSzgd1UezEKqK2ynD5iR6LkDU9opkpA/l+NAPDN92B4H8AszJGi7Bunc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAaCJlZBlNvEj1miqzipYVLlTp0jGx2guT8IK69zv4TIBbsFCF
	xzZt5QqsrpOqx11dUCEpHojYwR+HdLDx/2RDknnT7fB1l05CmNa5rHoKBIbD9/wWOg4f2K7lH52
	urWucOcGfn4cNmwneCkhg3WC2B+V4JK/cU1JZmgv2TnrelXm8gAQrqQ4AhmNImp8=
X-Gm-Gg: AfdE7cnw6PHNMO0QIi/JWU2vDOnV30G0NbymeTe0UKyLxeLLvRlZzxi0V7TyFG6niRB
	PaasO+P1VAKv651SO8RIUvHPy2VRbC7rIHHO3wF2y/oL6tKE13j165YdkdyPuaTShuioPiUcXIZ
	SGy1tA0OS3G+zq1TRns/bC1lHQqv+BLeY1cGv8kVRn8rsD6+txFZXwh0shuPCgvjKdtFzRrNTtQ
	LpGvi2q88q4iw+uoWfrA13clyjCA4ufIdfxfpEwsI4Rfw8CKSGSgTs8F8uwJSRu4eDZThUKKTl0
	D3+LnR07O6Jo43ddw7CDE3kg0Wwj1zRL4Ok2Zbg4cd0KPf3e59lKqoWWYWvvxmoU+vh0z+2Zkmh
	ur5cpFqGO7HImHh0L1g3m6HFg8UwpkP8=
X-Received: by 2002:a17:90b:580c:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38e4b410109mr7174390a91.12.1784379445939;
        Sat, 18 Jul 2026 05:57:25 -0700 (PDT)
X-Received: by 2002:a17:90b:580c:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38e4b410109mr7174359a91.12.1784379445494;
        Sat, 18 Jul 2026 05:57:25 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:25 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:17 +0530
Subject: [PATCH v6 10/16] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-10-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX0LrlOZck2hfX
 SmyammDlC8EKaBpl3x4TyS4gcC0Vdj0iGhstskuBkl9NOf7FDz5f3i1jpV8N/K1snKIpxh2989r
 BYD/eh821HZB9eDCRJo/AAXWJOdvrzthDEA1fs+d5LBx9GfwqllNyd+TXLfT9f4sFYnhpcaGKE8
 IAOvtQ1RNF3lnFsio/iQobWYXdnwrgRE5QiUluGwS73c1exVmq+/BaRAYmtECoDUqVTC5wjw3Dr
 pXXLwgf4N8ijQ9UNpOq3LKUPlQf5bW/LFv+7SgtGK7MwNxutnkjBk0URv8svPQrNIS/+slvvh/a
 riliJ0S8XLYp9hyRPCqEHas+mESCQJzhbcSAbMX85hFFUs43v/Vmb+OkgBxr01tDpYCo817Qv5y
 h7CnX0X4sob0oZoHkHtlfBnR8ofFYStbGIrZiR1xWK6C2+hMlJ7mr3MEhpwW8y4qudQvv3aAf+O
 izx6RnKpkwd6rs11nOQ==
X-Proofpoint-ORIG-GUID: uS3ha9U2QkfoTReztadbgJYK7jX00qxj
X-Proofpoint-GUID: uS3ha9U2QkfoTReztadbgJYK7jX00qxj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX0Y/N8llI8OdP
 lu+GF07OZIaeqIdcMjl51Cck75HpxbeRB0LhM6qO1T2yGBvJ9aCfOymkN+eP7CtnrpwnSAzcKax
 Q0h4Cq3zcj/JN4pr4b/ndsUnPAB0Om0=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5b7836 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U57akka57KfjTRmel4gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
similar to other critical clocks, since marking it as CLK_IS_CRITICAL
causes the clock framework to invoke clk_pm_runtime_get() during prepare,
which prevents the associated power domains from collapsing.

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

