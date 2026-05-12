Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DB43AA9DA
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591706; cv=none; b=Xj1vL2q4UVssnMuHkifAT1T3m0FC7DZ41D7C9nKmmd3jslMP9xvkRHc+LSny7EWNMiBJLNj5/hPmkOeaRw3g//3oi1riyJDfI6G5DdXYEn1lY1RfI1d90ZYTfuwsPwVqOjDmNvEX8NAnCejznbvxYWIjLzgR2f9AyQjX+6lY7Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591706; c=relaxed/simple;
	bh=vngOrHkgNad1Q4pt3o1jl/qHUnWu7b24wMujj5oCGFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ou2lvTWMJ7glBcrGttBJHcFB73lwObYYAueTzUwEUPmyeviXAaUHY4LeafODVDjbeWVRhcd2zHBc0eew9gu0izK7xcPpsTnuirP0JLPuHU/H6riRY7joL/1SEyzfWnyyN8gYUx8rZmXEVrQY2MuRMCE6Tx+5D2QNxzqeGBtPgWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vfd6PmCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZEypaob; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vfd6PmCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZEypaob"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB2odM3443736
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=; b=Vfd6PmCBfd+Rg+jg
	6RluTjMnnwSC+KO6mMAwb1VhwaU+ETxHk1On4h29lWOAvELvVKushktz/DactpZH
	aZpi+ZYncxm/KAlJPw1z29B6OKjsifsIhaXHvJD/4QE1C2EF2DeE0mMfQ7a4dkT5
	/B8CGl7H2zDBoXz/m7NWcpy9C8wQjcrCuyYP40tqix3p2xrL51dFiXPMua2F7NPv
	ktd8z9LhM6x9Mp1/P3L4CNMP6DbqU/PNhPVjfHfdttlRr7s/LqpsH+AIPZTMPY9Y
	D/jednpjaJ9TbLescHV0RXQEF2boCk5FHCQ2O3W2OTssKsGJkP2WI9utFiLmcy86
	OEkvow==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0kcwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:15:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6312aa1d7adso3260782137.0
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591702; x=1779196502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=;
        b=TZEypaobp60AKwUlPncDRpWO8xAmNnHBTZmsuKP30nLJSCMAHUNSf5V/LWmuVt7L4h
         KYQjRbRVJeQljjY0tcRhFgaP9KjOs/c0ZshXQ+IyLABO46NSWAizlCPQK07pCVF31npo
         sek86r6xjVDo+2Ep/UJcRlcfJYRVomWMLxCZqJtJS6qid1Pyed+w5DCJ65lh8NyKbWA4
         D4YStcOaTRYPSRUoLly5wehT0FR6g7G3warj143NALYfbuWUie4eoOa66nYfc4tFgjWD
         eMIdO/kmn7etx1T2ave0GVwbYr6Eju+athYCL5Jgog9Mlj1GOv6Qkdwju1KQHN2hcLAr
         cXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591702; x=1779196502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=;
        b=dX4OxOX5wBD0hdIRhjXUCrCnKAF/xM+A7Seu70JqIrr1lFjuw84jZJ3jKegNiNBOOl
         oeqpQ47HN5jubrZ0ExztQgThIHcksGa5HBiuBAyxg636l2EmkU1RPrtCnQykdMUsKNJG
         G4Fv2VTm1I62yhIzaqt5mR08z6U9m83k6xkkWATG4pGOqHesncsV08nYSFef9rbbNWTf
         niFnx1dIaMOYeV7+oHulew75efvbQjiC4jE2ObxTNj9TyVF8Sho09KR1OE+sosfpVdo/
         NvHWMHL6aTQPQ4lo/dXecak9rGhEhiR76DaU/26hiXejPj6Cqx+bMewHsGaQIICKmdzN
         RURw==
X-Forwarded-Encrypted: i=1; AFNElJ+8Wx9H/ibGH92YeQrdIFpbhSwYfoJXuGU4ryA1teDBTCGFrb3YyVXIUcoZ3EkEkAxSSKdYPIiqrs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEXJ0r5rQ6JwjjAxeOtcdNpwOpbzHTeGqe+ulLDgt8MOFamPBR
	m06mRGO5fU3JDvOzLWvbuxb8CJifRtQTlvnunReAxxYyiVEr1OyQObgwj3OxCG+WzruJCWp8ruL
	fyAWxS7ZlE17SdX9db69uwwC8r795iGzkA13ClHAnOi0I896vMg5cLcb5jbYQ82I=
X-Gm-Gg: Acq92OEhPG1FIhcVKlv9kXMB+pfMPxuIi2Hxq2r+sfJGe0U/KEpqqfen9gkFBko2fYj
	p8L2uYn2r8IPDEFKKEWYG83O/q6b9OBxPyRih5sEaKgDCViwV7CQTx565e6gawO9yzy1hkZki73
	7Ccoa/SUiakCtEliOcTk841KrGCLvW6x1+UhIilNCOK05++p9Ybk9gjYGc2kqUI/hEFCBzDTo6a
	cWl8562ANFRb44EF+YpCpvJBNFhnFN9uMXUhT7slTXmy4JPGzx/lehOjz4S4SqQbjknT3OOE+/F
	dvjqAm7EwpSaV7TTj+3H85T46W4zjzY6HmgMmT6zfLvz0RdE3H1vlyDQ9BqiGeurqEbfvWuRhSW
	USYfpjAnajs5uR++2Rs8RSR/iTnP6uYzoi3zt8EhGa2q66hH61AGuuNzkKpJaXAhlW7OU2BWP61
	nJQbOWJsY+phsL0Khl6BdXWeNga4DHkki3HO0=
X-Received: by 2002:a05:6102:dd1:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-63615810378mr1185940137.10.1778591701809;
        Tue, 12 May 2026 06:15:01 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-63615810378mr1185809137.10.1778591701211;
        Tue, 12 May 2026 06:15:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:14:51 +0300
Subject: [PATCH v6 2/2] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-venus-fix-sm8250-v6-2-51856dbef83c@oss.qualcomm.com>
References: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
In-Reply-To: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vngOrHkgNad1Q4pt3o1jl/qHUnWu7b24wMujj5oCGFQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfM4ux+oBQwIZEZ6sAiS58J7gOTOLKiw4t+w
 A5ZjUc/POWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1XgnCACOk+6lr+9DepHGfXKgOi+V2oxMVbImOmk50sdWQH2yW2zGxO3qMWy8WDKyKFcYwDTVMGE
 bbhvZOrvJe3WNY6XGx08fVJ6nb2jJlHJ35F13lYNj/faKykaE/e6tNIjkLRALQ7x2lNuViH0woS
 JXBb3+VF7VNK2oxsNktug9TrUpq2rTot9dFilMmlV+A3qDd/4k1uRmRFiqPTyT9W8tEERKuIo+B
 /gj5V0c8PgMrzptJLAZdln8bLe4NDEyi07YLT4m+OApasGBFAQ6viNoxnKsG/vA9USyorLdJety
 u149cXE1vBy/nq6wWDaZSEJXjGA/PKIYl7BNSc53rjLpPt6m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a0327d7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: I8EnTK6xetlZBEL3kAvel9_P2UDuKV3o
X-Proofpoint-ORIG-GUID: I8EnTK6xetlZBEL3kAvel9_P2UDuKV3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX/EagQLQZv1Ht
 khT39XNqqJJ5pw7g3FoF3L+/z8cS25GhFLEGPm7MbIAFu3VSPPJVCojS/9kB843ZtRPRQvmBjcG
 6oNcQbmgHaq7gGGUO3tWXncc2l43SD9SLguHa/ig4f7eiUCs4pg4sguW4XbU6uOg4XUTz9W6/yv
 k4AkAzylSIm+rqzkS4l4uhPjvaOj/pm2pw81KgYpq1uOpuLh1focJSMRRBHPYaGTysyJdmAfv9+
 hKPn6wCqbc3vO+KFIWAlQsKIohApeZjp9s4cKj0p7hGcXWasbDhn9J7JYYCe3qHCF3v8EESOrEy
 KWrb/OcjtxaNhRx7jasDHNOsBDmGvJOxEDmT24PkhL7Kuyrr9c21VMvOZu/A95GTOKnuZm/sNk9
 mDw562I7pUlB0iVtPAPk1mVq2P+0yw4Z8Gq4xY4d64GL0z+DZ/GpL6Qb2eTYsQDi/nSNS+QxBI/
 GbRmiIksTO20ojDglzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1fcbd400a3be..9ef6f3df2d48 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4355,26 +4355,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_nom>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3

