Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB248AE08
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590157; cv=none; b=kM5HEycS9IA76xwAYRd2Q0DGONfb6CInilSMv4aG98OzW48/7Ta/9wReU9TnWTzGoNumC6fq8w8S8/zcZJfyMv1JyMyv+BswsoNJF/oHZJBuafUhZiNKWSQfn1uKdeY5R53IYKSHHgzvpe/nWW6fCGBw0Pn+nPOfmq/3fT1lmik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590157; c=relaxed/simple;
	bh=tAf0rKBBwkXyRwND2BGMfyJ4D0SH0mmO19xN28c3anE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKw0AtOJ/6fVbharA9xy8whLlhmYaz7kpcj7cwFNo5mtG8pVXz3GpNTy3xe7ydnKahLfheraXmPs+Zn7Jb+9T59d9H5Ded6hy/s3jKMMF9s+6d77eDUdTtxnFl8aqmBjr1KSysOzC3xt7FzXI4wYw5MApUbtwKHn+p9CWdwYDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/2s9QTB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFqJRNNq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/2s9QTB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFqJRNNq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EireD1132209
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 16:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=; b=h/2s9QTBH1KDJOPb
	s3Pnj45qUf4ulrCdQETtUEalncY2iwnYA7r6x8RVGrp7LoSL0KjOeZwhbQppSRQO
	mn52Tsr3HPlJgtKGQtBLNqpflxwjaM2sqjJaSdr1xxTnqW29mSv6+tafwyrL7mki
	+ouiyWxmvmZMMrKV1ujHto/cdhfyZb2EzfHGM8Lyx1orxR5dRgEBvHEiqHOi2nA+
	ESsimG2j6niz7EuFFjkXafxx7nP5uM6xMItISUY9MLyLR+pqDaaZKdqCqXiMbX+b
	1V60JtXllc7PE/+kdy3pqCrqdzaHsrYavwpGHFSxq25DorPdcZdqel6SxhgWO26H
	GYGCOQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wshyjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 16:22:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd441619aso446204137.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780590152; x=1781194952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=;
        b=FFqJRNNqZ8A1Pnjw3h+6K46JUyutLUQCB7AxGfDRQy+6HWOqLynybOUMo1cjxSRg8X
         rJOpsgjz4X1wY9GHGvfW6+HM/K0yBdZi97zTpXTeqYzG+TakBYLjIVe7rh5Gj6EjQPit
         9RqErhLWCoNs2PJjSum5DX57s2IEz2FLCPX+2GTlnTTdSW4vVL55wmLTtAqp1po9Wq04
         LeV8uDnrP5Z+QBTC83ons/xvQmex3vdS6OFVoYEnaJ8WuxSZ3Dx+6GAHzBetDajodeCz
         FkDTPYwO7pkmzNLVtChqdi5JYNn+/5SoN8MvCfPNMUgGphfzgJRp6KAEDqz0sjbcGSE0
         xWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590152; x=1781194952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=;
        b=de4A/CU97w81BRIzgzrXOYZqNNsGS9dEbXt+JIvGhlbTtxFr6YFVgImRrbboVL45bS
         plDo4mX5FCBltqXgCRaQRdtcpMFYLIDjO/ERu3B9baWvA18ojUifzQURgW2NOstmhkXn
         SPhPgrgdgP7yrne8D1Jdo9LH0sRXDs6XQgrmIMLR2t/al9xVTmFPXEd7wkCD52mkh9jE
         6kOE4ZYDM9QVDoL9HIOjbVdpUqrSxbDI2eNG3f1ZEcgBRPDG9EFAngkhAVDLDBLtLRjI
         XH5mmprtuFbkCa+V0eNmhWwHITtBTOTYGbj/WgQds9BhzV2nEI2byhpls1bSmBxlT5wS
         Vfog==
X-Forwarded-Encrypted: i=1; AFNElJ/AJEuN02La2Pg996ttbjF4Bpg8M/kIHA/9CEbrJpKjWzLO8pT3tj94zJJTJrn9hVdIGQujdsCa/KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU9LOvjoYWpxAfIoUKYrzOYa7ynW+wTqAcQm6xMT121EnCN4ah
	UY65D0X4+CzLzenoOkeWu953Ihcc0pvyFrTOWpgQ3IbwpRv6Sxoo3O73GFMhT6yJeaSA94hb8l/
	ENJlibXbZHuFLeT+tffnt/aOel4Y4P0bXCJAUtjREq/lA7GHCH+zqLJ6eeO0g5hY=
X-Gm-Gg: Acq92OF8hlwTrO8C3SsHfj8M6surM65ECBIymBsLbbxBJ/8rg+W+R7JLuDIAIzqRosp
	xv6v4UANJDL7amxPlcRuICp/IZHYrXdnfX+4PxTmBKXnvLLpzvMyDkE8G9T544lI3qJt9k+R7aa
	6Ul6cf9E4kWZk4e/OpJzQPjccldw3Lk6QgNix2WnilSaVKGFO4tyPRdIqFZTiTdoo1c0MQA0HMD
	lJTxFf1i7UnkXRzqs1AMgKW9um/f64O4segSGVnQvsKGaLdfK8z4vpgnLYt2Fh6N73+y6xBOlEV
	u+YdumJpo4kUMSbPrQyaNkOHPjUnlXJmklVVH2MBKLmHsEAhGEZ76LW2B9ZG/+n10VVjUHoZAC5
	sUCgcTIHoDNKBs5fApxLE2A3G5xZZ2aHIRM4jGSmla0oZbqyRq66/JdekXR6lJOpqC6KYu4+RIH
	DuczfebFgxcc31wC5NauSEkgg+PQlacsk0pAiLP4J8oeUe4Q==
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr5261856137.6.1780590151640;
        Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr5261811137.6.1780590151171;
        Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm17591591fa.29.2026.06.04.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:22:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 19:22:23 +0300
Subject: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tAf0rKBBwkXyRwND2BGMfyJ4D0SH0mmO19xN28c3anE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqIaZBK6EmOt15zGsa7CbGu/21Vfd8Op5b+pOY7
 lguo+qKNTyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiGmQQAKCRCLPIo+Aiko
 1TcMB/wMY2JZA6XcGclZFriqAELGFsj0qR+EpLlX4rJwIi2GQIs7nGYmJPmIJcCCHQ0GHDcaYiD
 GaCpQRA60Ayvm7gfASpec456uvD+ujDD3mAdR8CKJwHwoDf582I+Q0Gqu9QmlKeZOi/8W9FQ/Tq
 vhLFq0rFXj05Rv0QxC5750kS8ug7YJPFWvDmiFC/oNsKScZGW00E4Xc9V6X3ygIIwt7h2SGCfWE
 LCOLrFq3OAmYEgsSyQqzcOSGXT8tTUo8n4dn64LeeUWQUSNmbo87g4IreUZR90rnWmkjglNsfzX
 RyRJGkkoglNtBb47m+jMZEJ9R97Gh5E52s7YNZy7qCahce7o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: g7gd0qomn6bfC_15h4zcD7TqZAoHOzhX
X-Proofpoint-ORIG-GUID: g7gd0qomn6bfC_15h4zcD7TqZAoHOzhX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE2MCBTYWx0ZWRfX5ZTDwt+lnTou
 siH3o+pG2b34FusRqu5p6qxsyMtLBlmOI1ZVAqL0ruhyLsYwgll8oqBdmeEMEj+6iQARyBf3kUq
 16Wt+PDGM6/iOOzyogbDPJL03gYDstKE3r1X1T3W+3x2kFGfKReW+0oAXoB2W8X/rY89i0YwnVZ
 iqehibRrmX01UZaMEGUFj3M1A6Dfr5sL3dZ/OQ4yXhRIgU1cDOfhH8vslkvNb5nzJ19Ip3vRvV+
 vNbMIJEjh4pE5qOMGeb6BtQMyVkDLYDyAGKQFkXDnYqN0ozVK7ueujcihBjC5xGUnTxDO2JrKtv
 EGj7Dqp/HyAlcslqkyEbKhhRYpd20jsIIZuRIvksMx44TaIlutpdVHD2sof2ioMlqrBrb7iOLVw
 uvGghTYfA1X+b11trwqZivNlj4YEoZmiq0OLPtVQ6iLqdvmGwbLTNlBlAb3VnwXE/tMB9KCRRla
 TEAo0Y8CDExThTnt6nA==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21a648 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rGr7YpdD5vYbGY1z0rMA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040160

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
index 7076720413ab..6150380795b8 100644
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
+					required-opps = <&rpmhpd_opp_svs>,
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
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3

