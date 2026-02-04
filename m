Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912F2773EC
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 01:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166814; cv=none; b=mH1eZkjQMaKLVvYLUdo/4bncDsGUiePwfNqjUpnAgDgwTiYtY8AHAtvBAM570JIzZnhP2Z1rgv109sEy57l9SCwxjqNuW5vYVf+AiTLTdFC4nqBecWAKf00rDL+f2jQ8nxL/VsGL9vQZW6TY7dUhW2H73VkCMhUGUhqNNdeUTzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166814; c=relaxed/simple;
	bh=8EnJ0bNvZO1OIHx736H60u2YBV791x2faUG9T+o3uLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XXpLNfBe5SNxc3L9wo6PW+kPHJBrFuvl6LB5tKLabUR49bYXn4SCRfl06cBmWoTxhKReJuzVWrb/MbeLPY/tukQo5gqzfWtGTOaHYcyIZKcjxKT4URXSz0gp9WgUvfdFjHL17KYCKEC1fV20nUUMFJfG5YLzxFHT673WvH96Y8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enkmmN9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjjCfIaZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enkmmN9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjjCfIaZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImjZ03824711
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 01:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tG//vnsGJ9u3ZjenYg9OjE6HUkUp7WbTGJkGw8lCw8U=; b=enkmmN9yzMVBKQcJ
	mLMVFnuw0/K+TnmzCeTFKIGHLT1YYes3sUna3qhzcFQuNGEOLLfYpPb0IzFxQVtu
	vOJCjy4JcH30HPhTGiD9nbXAQ64W66m3Hek2keNxuFmHlW0qh/XZV49qy3iri90M
	7OMh0fK1nIm4yIz6h7t8sNOtrigz05R6VL0ek9nHThPsfKIsum6IYjaTs9ZOzxtS
	oTiJznu1eiVpC46YkmDUBQEpLRXNwR2VqjQS+smUWZGFyQpKcNe2/yfElL6GNGHw
	y+4hzes1u6ln5gb28HFe1BWFrm0Ajoy1LA+Sdj1BaSCqkpk6nKNEkOmg9hTurIRW
	aWCsTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33jgmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 01:00:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so1993769985a.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 17:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166811; x=1770771611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG//vnsGJ9u3ZjenYg9OjE6HUkUp7WbTGJkGw8lCw8U=;
        b=bjjCfIaZgnm89r38ezSollXR+ZKAe9D1JmtV7jGIwrlgIUY0U+I3HTXfmnf/fROws5
         urMH5TclPaHWVwHlnLCFOLXQwMlJq0k4jbm2bb4TL+ea9aipzhKRGgQzxFAaOLp7RlRh
         xHb/jienAv+CXMfX0W8FJkyY8aswXul2qjIB+atks5/ITTLzjuI18U4o4V2An6KLn4YF
         8rCJ3+ro8tMHSr+skVcgpAwQFYG4EVw6e8c0NbmO/QNma2Jo36wu86pclt86FOK0205S
         WPceanjr+dmqEffVCR7S6wcIWELTDVcS1n8DIThxp9JhaWiuNMbHuTYiHLSdHzPIpGru
         ddnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166811; x=1770771611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tG//vnsGJ9u3ZjenYg9OjE6HUkUp7WbTGJkGw8lCw8U=;
        b=uNeiIixPDr/gKHfemMQdEoO81yVdzxhz1l+VDEVD01dvacTJA+g2stGCLp/tAyakRK
         NmqdzYdeuCxcp/CzKcTuLsS909OYzAW7G1arc0Y/reZ3Bj/UtV9FE39y2zs0kGHPbSR9
         06eTN7ZzI3McIS06K5sbZ/7jN3yf2pqU56ynufc2Dspm69XiVtLarLgkC7FYM58Y1FjY
         fEXtImsVwvlyHpxPlqGgPyP5GtdN6odQKRCXlnhU4dChuF1iRaq2K0eDj+gopHbd0uZA
         O7c1HRE8mrX4i/XYJazlCtNiNnxZ2XazUJyP/Lu5ECpoabZPPHgXKwZ89LpnvL+skeV1
         n/QA==
X-Forwarded-Encrypted: i=1; AJvYcCWilnSAR1fXi6ogm1RPbSuVaDHMx3DjiaDq/aH6Tqdpg9kwmXyfrSodrre898j2ky+d1TPoNBtn+fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzGifQBFBbvZGGsI/fiPQKoVgvwtcu4yudArAjSOPBX99Oj/gE
	9J3hrPPTF8F4gwW/eZSZ7pFKK1gLSBVPwKSAn6FhYd2Sl53DLqyEATNe10HeUFcFkGCP9poVfsP
	6s4PqBVSkQFMCgHZW3OnMFcHnani6viHavA7DQi/VpqmTE2vSKXL9zIlqOhRPqH0=
X-Gm-Gg: AZuq6aIZ22qcb02YUzOROZFqFyIKfh6DNOscx4+wXBLWkoDb3mEUEvTKigBHKDPbVK5
	siHvzpnS8Rs1iqZSReA7mgnpia7LlPoUXFlSExLwxfzFduRXJ7BYDg8EXdIgiL9lzk49HwM4JvB
	f2piEL6xcWpJ3flaixDs3eUY+oLWRL8L6EnE8uXFHj5AdxCe4tsiMqvM0gGiZ+NDhbTNRsR7cw+
	8sE2sxBvXNZbhRh2Cre5XRIrRGsxdPAdowGl+ixj+16hUOEOwBqUX571hLhpPoRVCYYlD2GDHAh
	NQZgOz1Gtzq8jW0FWORtf4Oi/jNRABghRShrjeohJDbiN0umljJUG3L9IM2eCCJhXt+1lLVP8j4
	4fSVEWQVhFElJo9ijmBfsNKF9daiCSfy4M0zVNsjBkza8cVZJFjE+T4oRkfGYB8epPlGOqqlEyq
	jODD0Gtxw/BswS5cr0rXat96Q=
X-Received: by 2002:a05:620a:410e:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8ca2f9fdc94mr179570985a.74.1770166809587;
        Tue, 03 Feb 2026 17:00:09 -0800 (PST)
X-Received: by 2002:a05:620a:410e:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8ca2f9fdc94mr179567785a.74.1770166809158;
        Tue, 03 Feb 2026 17:00:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.17.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:00:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:55 +0200
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-7-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8EnJ0bNvZO1OIHx736H60u2YBV791x2faUG9T+o3uLI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoId6bfGK1Psp59FHAP6PnmwWqSLQ5SEt2yW
 htFcc2Tq3qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaCAAKCRCLPIo+Aiko
 1UiFB/oDaRdvUDPZg7ko9e7OmOCi9UUKpwmTqmzOHuDa9KsWA9FLEAG2i+LEcWcScskUQK/s+EP
 uXAIir63bGwy12lDiOKzmR+0pjnHYpgskeQJE9hYETEdL3fRrw6D0ro+6+xbb186qN6vgGBmG+0
 YirYOery37T1PxL9WRFQZji3HWdqRd6vnm5t/j8i1ZF0BihhB1+dMIc32KStJJqil/XRU0qiY+z
 im1cYmuqsNE1D7lbvij11sVYjOlq6Ck+de2nDLU9RxQaoQUJfBizsCwYDpgJs8b1t1/pM0UpiP/
 uewEL+rxzzlI2GvwDXqX3fS2HfErPehku3QINcEqRIMN2AAW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=69829a1b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aWxgXjsr_KMwSVsjpdnpf1MxiYYT6rXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfXzBE4xom+nfx8
 xEufZ9m+duBSX3aj1ExC0BmOGkWF4loBiZUNm3fTD8tGJTCex3nwO4qBaYk6tKiKE84r7AvWW+r
 tXembDmIM3HFrbdLXFRHYO89aruG5mfEwrQEtGM0s4WKslwUPICW6CnZ4mWSv1QNC9ouLFKA9ll
 ubZByinI6CSZ2UkYOYnKJbmbiNizNjjuIIqy5jbx+8uGDwQJN0uvKCvgIRPq41U8pXSifnqw3eh
 FxO/4eGDcP+6keJptrtO+nG4r6XaEWsiaPD4o3ryb4n0g6Si7CVnzcHeIJT2y+gxoUFUmSyKOVK
 HCXUGjLYO8K0kgCBOOu7TFQvHJU7+/iBF28ghsR0m2m8NX8io8+xs5666tyNEk6y2INokhT7LOo
 jzON2DPQBw67AOxGyFJCFYCSzLzymKmfoLZgGJb16cd6ep5RM7wE74BrsiQmRRdMLqEoKE/B6CX
 PmQqqPKkKmzr+6gufoQ==
X-Proofpoint-GUID: aWxgXjsr_KMwSVsjpdnpf1MxiYYT6rXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040004

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d8be5c1add1b..7d11f1a28546 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_svs>,
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
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3

