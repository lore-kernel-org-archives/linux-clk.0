Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2C397B12
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591700; cv=none; b=ht8rGNkzWfzZa1VmpaEhJ/RysoKls4EdrnK3QGdFmGma+Xz0KkS7BnBpTlg4ZDI9eYKgfDOsTjaZU2b+zCKIOpiyaNsUVWLn6DlQelz9L+l/dKTqKnhA/AtjZiANogt9avTHo9oXGODF9KzZ5ZucYUYmnFWcRGFrbrs1kGQk9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591700; c=relaxed/simple;
	bh=wXEQdSaGgvvhyTZjCrPo1di1ubN2oQfPidI6Nv5ympY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ztu6EnMGN14ZdYOXVX00Wdd2iY5Y69S02nunQCSQ1fdQJK+XPNxpHa9D0RidCS3lD24uc/W62I1HDpVxlvlxng6EE/11Pd24aUHihbvtivVizrMxz7P2POw5tslwDZZQnx78qOQ082v/wSGfAUesvVKL0WrMdDc0v+FSaF3e1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxuarqHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3IeANYN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxuarqHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3IeANYN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCA3R9144552
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=; b=pxuarqHaLncNCyB8
	csJZQJr10cTRRjezO6EfKVdqXv1TvwnJ1M6o7CJd2jF4+5Que3FusbIkwkA+oZ7i
	M1p1Q/1pgAMH/vVaqVwEa/3EouDwR8uwfrvcpSP32Cudz9akVa1SADbdyXfWY30B
	fp5/7xKGVQPz6+yx7gf87QPEnz6WPqqA21mgmxU+2y/uFek6H1G7Veawc0klE3ie
	/CIFU2DAvhgERYqlLJ93bhxAK7JErNWbM9kzv+aHUv5f6EwiI8Ed9JsV/DMqlSzE
	rXmcLkxItmNmMK8EYWRWReSiOQEkyaREK4mLiZvp6hz7p38o2K5wC0ZNWrh9roud
	FZZQmQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43yp86fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:14:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5753c77e3c3so4491305e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591696; x=1779196496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=;
        b=M3IeANYNJS10tUSEwdtKhI8nQUuCUMGkAYccgEIJD1Yh1z5YRGAql+7XakSZSiiUds
         YF/vOyzB8WN+AOdmIHGQpUuVfOfLRPQ6FPXyACoHyavoMksyf3qqkr66fcIGvw6XxLPh
         rFws0JwubNpQcA9G6gohNDvZA0F/+T6HgAxSYe4J7t6q4TCiPUM2njRmy8kwaGgcU57s
         mWYZ4SqOXzi9XnW8gVrhNmQQfG6PbTC2gm/isnksAviFlph45yhIypuateBeWHinfsG2
         PCGSj1nyWFE2ZvALxR3t7mlQA58znpjP/mvF1CC7it06yOY8mO3O90LG8NPs43D4KgXt
         hCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591696; x=1779196496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=;
        b=s7tUfL1V42TvzkhPHHei1LzUEtUdxVEE/X0rDa7XUoXF/6BXnAG2+hWOHDOzOsoUq7
         C8irKE3kjh7GzQEpnxnehKAEjN1gPV7/i6LzOiaZACaVh73nR9dfXkS2stK+hNDDongR
         No7fw6XFGsM3SeyYlZiVngDyPplouwpyzBRblwNDvO1v5g5dexdEF9G9ZcpG1WXYdK2c
         1VeHiSg8nwnEiyfJzlVeK9drx6nQQ/Xj7NCzSE1tM9cWTEQ6Z37eNnEFHfXvrAzNCoAH
         BYEQceOw9Jui5rlTD9D98a3AA833Q9w3Ffm5pbW19NaF6oMyrHaJ34fUsQltKtia1Iwk
         sP0w==
X-Forwarded-Encrypted: i=1; AFNElJ9PtT/PQcundUM4TDGVxzYIeudQOh6gm2ZMoCPRLaaw7/mGtUtH/RoRBPN8GSswZKT3IAOfmI+qQXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgqRB+mGc3RI5WOFKaKyIzOcnrDY+UbVzjwfoycoDxAzB/Mqi/
	OvO9nJSLxtAytUJoYX6o1t00cVIKXZIlj+wynKNnX+/mSwVXckQ6L8JgUHEINR2r3Nh1no9ei6P
	qaI/gsGTxXZ2jyel0aG3DN46QPgZBqxNLEuB9rUVkVBvtXjmGauf8077lc5NMQmc=
X-Gm-Gg: Acq92OH63z8M6V7GfWKuUmTaMiO922w49VMGEW6C9U/EvlzghM8qdz/gbkLefznDyoy
	tfmv51WUzma1GcQU8p38o6PFiRpSEcwFRRYNnRzmDAnBnP4ue3n6icsYpt5KsmFGj/hf/5cQE9G
	TI4TpM6Td7MwayAhGwSOlh3NZB4C6LIYHxOYpxqp7gL1jE3ds0hfFQOThVppsc5EKj6yGa/FflT
	RYFLPWAkrc5i70fABrlqkHltN2eWCGow82zGfWVLGBH99cM8CRyoHhT0AAUUOHgbG0vUJVYWyo4
	H7J3y4oCiQaPbnjl2T2guSibBhXw90G9Ua63CAb7colLpxBdQahmsvhfYYDGW/+RAz6Hld8TzaX
	mFCJwL0j62jRukeAHjp4mEwPVw05CSN0MV4Dhlgkm+ZzX6Q5bbSmdtANxbdUbWaWsoE8evYt49J
	QWYjRSlHfRU6YWO9c587nabC+zXoJocESsCcM=
X-Received: by 2002:a05:6102:2ad1:b0:631:487a:238f with SMTP id ada2fe7eead31-63613ca7c06mr1105040137.4.1778591696560;
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad1:b0:631:487a:238f with SMTP id ada2fe7eead31-63613ca7c06mr1104996137.4.1778591696092;
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:14:50 +0300
Subject: [PATCH v6 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-venus-fix-sm8250-v6-1-51856dbef83c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXEQdSaGgvvhyTZjCrPo1di1ubN2oQfPidI6Nv5ympY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfM06MHkt0moDhI5mKTZW7jOm76u1NtvyfO5
 84Rk9+KImCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1YAsCACDBh7fPyk71x4p9J3O7KsF5Ma/aNnd8AazJcSXJuqQ2wrw+jfoBVedICMuvvHdqO/Alb7
 YGZmgsEwA2h8UNCsjEruM/GXZCv+mDwHSs5ceaRdMTaaKYrIi8qNj0pq+VIXTiExhpzc3NI++7y
 M8pqCaeue/6PVtwq689utB9Q/pI+68nACq1KKhZXm+sWtZbuZ//FrhAcgPybUzmk0zZ1rhxQF5X
 n/0dUz/WvOJZ0T23YTlnUcRGcLqnphKo/AvhnM7d/9COjTR+xUsfWvsL5DluNtVv8rjOrc93/9Y
 HX3cyLuTBVzqgpDbAOqNhM9s2i55fIFr6Rls5AahdkgXOO9I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Wfgm2dpH2n3i8bPPxBSe4HLQhF2I59iW
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a0327d2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=rGr7YpdD5vYbGY1z0rMA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX/oBAFG+Q3RW2
 aMzXcKCR8hJnBN/BxjvX4kY7WwPgPgVu4UG2nhq/kVN60oH/0TcU9blPPpBvzLymJPWG2C20N8H
 n/OHJOX0m2SkcPyWfy9I2EvLQNloBJMsUcExaXanp7NNogI2VMbrogKO+CRvQMd++NTGT3705g/
 4B+C4s7/W9ZbsqambWjuwhd6tY3UWPlk5W7ID/SYeAY+BDPMT/eW+6LNi/IueLuZJqTolX9P9PP
 3Ai9Qk2t7zPnN7K3s9LoEqGewWBgTl0y6D013BwzAfNDopy5ZVTj/OupzaGsUOkhh0kiopiopDY
 w8fnyixGvmN8JQtrNja+xzzm+ZWNg+f3O67HCVggRQkjuQi8TbR6RXa4KOjVunUkdzBJGZ4Ddq0
 XjxVRvH5KFZetublytkTcCLIjSmbn307/J1f9tCJm2MXsAIZiMaRnn4GVVTLYSQhAFuU5M8OCif
 OBEVz8g7nPbUXRV6tQg==
X-Proofpoint-GUID: Wfgm2dpH2n3i8bPPxBSe4HLQhF2I59iW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
MMCX voltage levels.

Add MMCX domain to the Iris device node.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..1fcbd400a3be 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
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
@@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3

