Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF5258ED4
	for <linux-clk@vger.kernel.org>; Mon,  9 Feb 2026 01:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600766; cv=none; b=DFFeUW6k5u7xu1xHokhatD6W9PARnMmyiPwIAtwSeVAFOcZCKvuztR3xXUbxrpXScY4aLgNUObaLMb9dAGwEqxdxc2HM9Xq7CwWQJRXLnPgDOdos29FXtydlK96op8o2Gae4JNvQUtNaaoCtU1uGj03pvnZqlIgHPDxuPJ2tRWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600766; c=relaxed/simple;
	bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUv/FaDHMl9vpoZaIkaAOAekCAcuuyutkm0/GCi4+oJOq4YL3FPY7TQ09GCFUoWURXqeQV0gH8jfrmW1Ai85b9QAov391fZFVQWR1zmBSjMzG6CEn2WtooUTpgPprFPkraRmfVaK3OCNtHOw3YgxT7913t/R5a2TEZcwi/8bf5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7Uli7I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzG3Fzvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7Uli7I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzG3Fzvj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618HFh171169018
	for <linux-clk@vger.kernel.org>; Mon, 9 Feb 2026 01:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=; b=S7Uli7I2MnVM6IDl
	R9gSScAmQwZQxBYikujVR6fv+vr1VUmkoiTmujEu9nWROFhS0JI/p2vOmhuh3Mms
	RN2WWRgIsbjomptrDrm5M/ympN3Dz/lID1m9/p+qEQ2PdYR7ze/lw+IVwR9MiGsA
	0PPQ50KfXZKumZHwSb3qQbEH2mcrze2S23t5T7hUdys67TUjIXcKsdnudw7Zp7++
	J1jNsHO4DurhkZQ91CFU9EPIMFTjgn0SgQDbr8Fv1wqiY3rKgwwf/hU2M5Z54Gen
	mGqVeUPPRfezqV+jHTIhc/FWeTXqOUgAlP0DVOeFeX6k2G09Ka2XlAkZy7Ecb65Q
	KmE+zg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xj1b6ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 01:32:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70a08daf3so1036802985a.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 17:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600764; x=1771205564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=OzG3FzvjoabiJG7I8ZzpyZ+dK2nhE+85B67hM9CM+rz65ckW4+KX1eMhP5IVzjj9MA
         Vru5Gvwm3umzTGBbmgx1npooO3vvWWbHGcIV4yPcj2wqO43jEb9FAJsSXXW0nct6U94H
         fom/aosvDfVWug5YqviPtiWT1EMPLW294aqnHvkXJvWhAyslgG/3Zb2HgAb6DbWTHtJl
         1rdyQRlxlgrY4V1dRmS9ktx9LS8GnB0qCHE4/XB0tmKbwEBTGPO5lL8oL2zr0gdGsahp
         ryrYW7XpY7KX3tcNmFn1RcTvbZVSvDqugJfj0Syj7U5hAu/soEqaWjSmygs+Ccesco2c
         swLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600764; x=1771205564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=AOr5f3puFdY6bl7cyvF05QRD23ja/lNOiBJc21jnydgjY2tIYIVrm9T7CKgH0tYkva
         ZClJPxygQP95YnQrozowh1OsLA57LI64lAnazxlCtOSD8pd3dk8vfIDtSjs50yUNeL2M
         Hado7AuoZ7L2nBXH2HU2LcfyxWL3jFWw2nfJJR4ZS9/ZgBfSHw95qfF2mB07gSzOj/Vq
         w5IZIqBHxc+rf0xWi70h1I13POj3RAoJdcfXzbvTHZdaRJM9XLUzMfUiPqcs3XA0bP/H
         8TwzzFKNEvbZHGw+6dayN73k5vhwb6eFI75X6iiQjX0LEeyVhtv0G5FW2e143wMh8ZsR
         dvsA==
X-Forwarded-Encrypted: i=1; AJvYcCUok8YKgRNGu9rIXzJ8zovrPJsKuQ89W3jkqJOWVlwh7SeXOha/aDULdIjCBVMsQdCfwt3u5wQTE6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+hXXYjMZsav2FxebBZDZWwTZmM2SvwCn95fP8s0pA1JGwDiW
	FcCa91pWyPbJTj7jQygiqMUBMfdljzDlzwRjL13M6z6xLHybbzyBmW7dIeF4RRs/xU/nKTlDziY
	h4svGSYwsOVxMWw1Jw+PGjory2dGEKG0TPvi26sGqMhrg9EirMOgyh7LKkfIel5i3mcXyYzc=
X-Gm-Gg: AZuq6aJ81StkP57eJV/Rcbp83c1DR8/KWzjWS8Sffgj8k/SKqLAAuOZBEiM5FL1OVcQ
	E4975t6k2r7RieASbVScSCU7onmhotkxq2OagANht3bOY3hPbCO3rFtamqAkh2S7mFbXFJSea+p
	UxRNI9tbY4VMtV8r0iZM+2/Mhxx1YqfYUId2QcdAQvE0l9zJnA6LbIcSFtvqZemRXdCXB0+B3wS
	HvYNqczxYSpdoasMaox5LqlqOCd4E/L9GdkVbuX22msdscbT4/dyZN1HOsq17HzcZ9cH4qs3Ax2
	d8MOGWL2CdEXSsaqz94BIobM8oDaBS5nRfFfQQb+ssS3B+mCy2zVfqqrlmRfM7dJ0fkePSxgYfe
	ob3ITgXOXbv/fwS/d1uyg1Rqg2ZnegmfJhwhUQjq6BKR6X60MwbW1a/UiMvyFcHorn2nqHpy12S
	q6lwdEhTq+VYgxi8dCOREzep4=
X-Received: by 2002:a05:620a:45ab:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8caefccac74mr1222186785a.2.1770600763810;
        Sun, 08 Feb 2026 17:32:43 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8caefccac74mr1222185585a.2.1770600763392;
        Sun, 08 Feb 2026 17:32:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:20 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-5-0a22365d3585@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTkmJsL4kleC5vw4uvTcTGmVWfWCZLGjjZJAm
 eOUhGQfU3+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JgAKCRCLPIo+Aiko
 1XZpB/0RO0lLZwrCkx22/CU5SlJtM65S4vT7oHOjMXUyOjBg8+OI//S9ks5ykJuxJS0C/AlZkhT
 4f5z98h26mP7WtTcbQaBn25g6jI8V0YRwHdITbRCsKR7Z9KLvXpcfVNxhCUADKlBrNAnq18jxsw
 EFbc1B0xK3dy2UqpV/6TaCMzpNjXrPl5+DUxjim3c9Nek4h+59d3sWXWQIQMH1hDL+VP2/077NN
 d++1fXxwLxqpc6p0XhJnpAvqgNYJdOC0acn6F+8QJ4ucAwWBMHp6fHpBxJueQwntQCcPA4eQqYJ
 T+sMens7DH2nCftZZygSnWlt2DjRfDkRh30c24HODBAjBM7V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Wvd0-1d40sNSbG9qCRUbO1wewsqmUQeN
X-Proofpoint-ORIG-GUID: Wvd0-1d40sNSbG9qCRUbO1wewsqmUQeN
X-Authority-Analysis: v=2.4 cv=F/tat6hN c=1 sm=1 tr=0 ts=6989393d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfXwgwkacgecuoA
 GBnL7rEPLH8Mj5XS2Fk8H95BWTNYSuOvpdU1f6f6lHMxXR+LEYUNkbi8jXt9K1WAjPPCVpPDTPP
 WWoGl7Rk8HuvUp1gmbZAtWvEY0AReHMyRHc4niabKJuYxD30GnL7UEJyOWFtM7+eN1usxFtPYqm
 dNsD1nMIiGmjFfTwVbm9HNkbjXAeuwBtgSTuT+Pub53VYbwN9runzey/X3tVnXZaH3JbY7CbSHW
 1k/n09MxGJQ/zhRdx+xvki/sH2sqQjvxBOb5Gt77aceBTxbYG7uYrAywYGUahmEOwJno1mrdMO1
 bI95xo7S014UCNAeJ1gb87Rjzgv3NhSom2wHGQHvkTjIRpndOuhBju1SE/xZuX4g3E/ExmCMXxy
 kFstkRDjmT1UGbmiePvMZTb52utI8lvyQYpfUOUXMP3UqlipSdVpyDWWimKZ8ZEcFJB/yTmedbh
 4z7zC7slDhJkEatQesw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090011

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
index a1ab8c3c27e6..a80defcb29ed 100644
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

