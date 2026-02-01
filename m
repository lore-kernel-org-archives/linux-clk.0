Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E932C302
	for <linux-clk@vger.kernel.org>; Sun,  1 Feb 2026 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942967; cv=none; b=ZCFphUCHG1iCddi0CuH/iOZ1nXEVHoendaTFao0kMwvSmqggtD207gbuY6mRAaLBQA+SHB/FPKlpPDsAHGh8Oj+9t7WS1O2moEh0Gbj7h4UMk5sH/I9Yctwcb3UyKfs0MbWyUUKPN2HFDdBTNHWj/hJGtnde8qrwuQu0KpbE5AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942967; c=relaxed/simple;
	bh=MDNd56HziQpfdDNbX3xousM3G0a+/+wP6bT6aYLLnm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UaR6oDmYY7Nbf/8YI66N7MARfBlGK7aBpcgdNWWyp1/FkGrqz9bZJ2L1DN/T9Sbr9TGJ/iGViCu1emsB36pUPlsobw2o30D0VcE+Fdcud9fcMIdynS/6qi3eorqUWCB69CPquvPABA0dkIcgjqvJQo18jbXXlDYn4vG8anHOuYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyUaV3BQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Swdk4oo+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyUaV3BQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Swdk4oo+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6119SFOd3310842
	for <linux-clk@vger.kernel.org>; Sun, 1 Feb 2026 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=; b=MyUaV3BQzLtTkM7n
	2dSuZR2L2XxT0GmrDsXbYtEZyz7LQHNXhp70Derze70zjY7Zjp2BL3aj1fdnJEDR
	fhwoDV+ZIJO6IKda7Qm+32TCsC02wDWZdTwCtCIxKVt+Jb1Z7ZFWrgvE/xhUzuoS
	5yU9W9KmmgH1CVl1AHRZOHV551LOOw9ORu3d3YbQHxY8rXmYw5whISxWRJailz6l
	rZgpuRwh+xZN9ouFqmJwairH32DKJqQRj2dKt2N0/fZYd8pgan4G6KZeawPVpBYF
	R9vcbEewDu7gVno3klGbkuSxR6Qi55VmLZhk0HvrNCGnEVts6C3P2BUa7vqwKzdp
	R5zxxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx2dgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 10:49:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50335bd75bdso24651551cf.0
        for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 02:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942963; x=1770547763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=;
        b=Swdk4oo+qIqAIe2IFT7zguU3enQWUOUnlRsQorZhrhLs99VFPA1Oxi6o7KbTL87Zvn
         jC7CpAiVKFEIm74hBO8Bx3y6oh3RnKtu2XPA/lQ5oBE6fIRxsJNORTmgGAPpixjP0gK6
         4IIfAYc3WeCcgtFpgtlbmf3tWm6JPDxyNtaCgavWclCHfpQdPhC8HqEGHLcTMGLYMAuQ
         UKoYB8OLvo3fXvsR07LiELt4Y+znBIxKzyszWcMSrZ/OyLhLH2ujYgQGDB4JQ3kZgTXf
         7faWveCmDG0YZ7IWLju+f9pwx1ZPSSRqrjncx0vwqjYh2im8pIIZigKlIdqMXcaFEyZs
         YQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942963; x=1770547763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=;
        b=E3RrvV0IxY3gDQZVp9qCMFZQJ/8ttS1a3QUQBTttPS0pYAZekjjPOS5CljEUBzA9X1
         uDAPNlJg+vLilfAXNVTNQDdr05f2eRaIRTPPcQ8ODEuGG+OeNcEhNScTD26no+F9bdh1
         ueTaUZHEz3DhUZtte5SpUFq7WCQGhxiq+hl3Hyzu0w0ouP6ty9T+S877cUF19/20fNsO
         K7iLWCiK6g5J5TR50+BEME0IolBPD4zZtkgB7LYkXLd8Tm31RJL8aS1bsHFfMazZlZcn
         yT5yioGSVsjOjnrkhGr+glxQwu/EWg2OPGRBQJeA5h6SAsMlTBINAicVSF8wJT2vZijP
         c8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIq4G6MLQiI6h/jak3Akin8T3YkM07xdQ/STOS1CyuSb2D8WbE4jQeqzhd/ZtX0L99gl7sNO/1QSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YztgD2uELZDGqPBUIM3vCFz2RgTyeriY74dm9raN/GvLzPssakg
	XR/BpWB4cE04dop0WqEPBZDaXp21IrOIvYWptv+PVoFUIhkPKL1Vh6/ZIhMfo2cYquva8jBUd/W
	7AG/C/g9uvlW1Vz6g+VPfXINCerN1RxLQ32MgK9yvOKeEqei8SrGqxFMdr8TWLOo=
X-Gm-Gg: AZuq6aLeZtY6wbRg6dCp4/dzOOwPQDMbPt9K5LBDMN5ysWFArzfXkAS1jJ9/NslaI+V
	FeD1UhI2Lx5frh/BcXd4BtBSuPv0DARqSIim4H174U0DyEKLmv/W1tV+/C+TAArP84oBujVzL2r
	4uapAh4G9lI55TmNJ5hQy+sg5+eBouRtnI+y5y7xmNLM5mlrs02IXimfdGdQCPIBZ7sHzx59mJ4
	Uz72tbTWkL8kTBUXfo5FUL+vQSxJSAQunXIYF6WOxXx8HI8tN5PxOVRGx6FELHmtPdYBbk3Ukc9
	LrYiW6Up7QrJ2i+bJ/pmvptdiusmhscG5L30SyfYNmtfDAOEInkVqskWCQ/A0WJyaRVpbuimWuu
	MosYxv8L7oPAlBe7/dIOzmZi19Dr5IKzifGcOJlkDSXb7A+qp2tn4Cy7WUvjwbQMiC9/C4jpztt
	ouaPHOTx+J+BJHeRdYoJ+BbOU=
X-Received: by 2002:ac8:5986:0:b0:503:426a:1474 with SMTP id d75a77b69052e-505d22a4b09mr124111911cf.57.1769942962656;
        Sun, 01 Feb 2026 02:49:22 -0800 (PST)
X-Received: by 2002:ac8:5986:0:b0:503:426a:1474 with SMTP id d75a77b69052e-505d22a4b09mr124111501cf.57.1769942961922;
        Sun, 01 Feb 2026 02:49:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:04 +0200
Subject: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MDNd56HziQpfdDNbX3xousM3G0a+/+wP6bT6aYLLnm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+m2PNrDaIL5kZI33VRgtQpqzQPtqYo9YLlw
 fJrNcYK8FWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpgAKCRCLPIo+Aiko
 1XhkB/4sApbQ0av7LltP/Y6E56Qa0P3c8HLuU+iocBfixerEmdaVhEusANHe9a/WsO7vdkI5VXJ
 5uABplv8qW68f7qCIlsaZ1UJ3OFzOTGC7XfYJIO+dGhjTBJrsGl/8ikz6mPFEEJnZds1r+c78/T
 f+q3xRcngKc3IFASXibji8q+CQmCN9ipzbUsZHbeCBmNqpjal5WaQ8oUwGeiovJtAyK6fg1R2nC
 wZG5BVXfV80az0z02q1vZ2UJAEeefjUO5juJqQRaWdnbA5tU0znmzMwcoxlKjgAxElAb5XaZR1e
 LDMaaTGKQyE006ffgW55WRtF03jE/yL2VsMRN/zkGMyf3LH3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FP8_bOD455chocjZGL8vUjvD7dzsD7r4
X-Proofpoint-GUID: FP8_bOD455chocjZGL8vUjvD7dzsD7r4
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=697f2fb3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tBOqMctlXquWO7Kigf0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX9OVQzm6KRuUn
 1681lh3RgQMIbkcnoe+5Dt7xOrq4MpbnCKen3sPDrWsKMKg2/cwZe95Wj6TOsxkauAWZXhQV2y5
 MdPE30mJUO1pUTaf+8z9KBuFHTeGbUejjP3me7j6Rr11DBVCocSq4Hj3Va5wqwnd5CxIP6VXLE/
 TSah9Pmf13k1zhQvuLCaDhd7QoChccxjMeH6wWG/HQtCHc4HhnMjCSTBbsg5dn8Z5B0Q8HAmOEo
 jVMZtpwUspal/DLZpah2RBlmlkpj4l4X4KTKutNB9weRY1HFsjMmti5vJvLk8Ayz1c6EsCfhNfX
 39RlYWn+C0Ga9KNr/BYg5uQzrN3cSv+C3AFIG969a5GbXU17+qD/Q+QHEiqzyLTSnAoIAeNifEA
 qBXX64CjFjXClYh2zRObLlCu2AFdX1TOwm1dZvyZ36hwLPwZMeebCGaO8dN5b3YdLCZmsFPcJ4l
 Kcxi7QE52CuJo7ITytQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602010094

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but,
strangely enough, using MMCX voltage levels.

Add MMCX domain together with the (more correct) MX OPP levels.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 980d6e894b9d..531470506809 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3

