Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE312522A7
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166807; cv=none; b=Msu75YnzR2qodwQI2cEUZPcQHOZsG+cjv7HiJa/+jH5VrIGbkwTb0xhPUKp9n7Br1igvU5xUEda+Ku/Yha6AS0xoxPUPMP7Z06qoCtf67u9xHA36X4s7Ep064t10PXUzhhmscrLy3NLjAwmoL98h+CzSq66uWDUuq4taGDRziy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166807; c=relaxed/simple;
	bh=KSGW4Q8DYDhhzVXQ25otMmzjfKUl8PxhFUQ2hkE2KbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sW5PEOzBGZvfi4s2WCrEGbMy9uVbtOktyQmxMggJdTDGc3VcagTJEQiJoLMqc72QcykUayDJklJcSnxGk74Wbrwv66h/IKaLpr8tMqYlxBBYRBrY+N29k/+wSSO4iOPGCflIhI2N1rYgImrWzUROSU4vUDnrdxH1nzJ04PogRnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5Z9xROV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vtg4OLBk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5Z9xROV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vtg4OLBk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilx013337229
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 01:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OoBrr8C/QRp4i4HyUTLL0ZS25JBMm+mtVzwTnV3jZRc=; b=b5Z9xROVVg8vUvl3
	DgXj0wgIcnpFjmj93RTrVfYlGIdrRM47DEIFVJ8GedRT5bs6pjCf1W18EUpaWOlp
	C61aQHu8SvfWQHEHQNJ9ijNt6rWxPdhu1lhFXDR0UYKxK2K3zOXat4Yncro1pSO4
	Ethqwp3EaEPyHBijPgqbhsshngB9EVgBwi8Vxr3ViIsrzw2RvyL9+PlZyA28SAu6
	yqBZtF4WiCs0aU0IxbZ3psgoJJvMYAm7SaMIRNoI0jSoXYvLZ79qTy736BK5dIFa
	ZFkDQNmmwDaxuDAi8e4ZNeobYubB+Q9H0qMNyUVRi+d0gT+6dfMsQ7XS9z5xVcFO
	CJIAIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gewaeg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 01:00:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so567731485a.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 17:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166804; x=1770771604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoBrr8C/QRp4i4HyUTLL0ZS25JBMm+mtVzwTnV3jZRc=;
        b=Vtg4OLBkG0ar8PrXY5/au9AAtc2EervwD+aAe2+zZPUVoKbw/pd6ZWsjztsNE6J0k3
         6SC8ZcNV7F4inwmvugmW38drvd0R92peWo8vfb43300rfJJvLuBkQe2Oka/jRNhfc1iD
         HTkbw84vIcrtoHMww5hIupxocg4yXuCVCO/LkNM5+nKleGjsfPTT7UrY8bUU4WhVmQG+
         SIqCLrkmWCwYnjrsh65MTeoeYMbqDtjOpls2489h9/h204gWE/GJtmXL2S6kyIS90ld/
         pKiCxdkVWXKjOjf497sOPIJdtgvbERm2xUST6orkNIjKZxRwfxJ6tSZjN/R1IswUG8fH
         9Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166804; x=1770771604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OoBrr8C/QRp4i4HyUTLL0ZS25JBMm+mtVzwTnV3jZRc=;
        b=wWgOjjonkZX/R2m6F1LsuG7/eD7FmF9MxAGXdzyMA227XkS3E1a0tqZpOY23qCvdGG
         AifcaYlhLhm7TsifQQpLK0uYBmxeVRyt+IIb7SPuErlPFV+BWs8RQQynWaQodtSIIyqI
         A/vKml++WMqf6aKG+SkXJXg8rmtfIk88HCAS9/JRLQQl3nikYZ9kyUdEnmg0jeNOLQzE
         3boZHKbWgOYynJFuwIXX8IxOWeg7qrK3bZBMo2gOr0+He5zrpgJDES3O4/Hi8AYp31Ss
         2LrPv8QVFsZ6rE8emZqFvOLp36V3kbq4fkTkMihzsFbRgPPSHVYTQMBKzZKVFvkl1+LT
         ktSg==
X-Forwarded-Encrypted: i=1; AJvYcCXwytKeQOrkkpKe1EYeWyj5rEv3D5VcC8tHMBIkPfbzlwH0YryJ8eKWy/aKqOo+CoatEJhsCUSDIEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/oY9V/hAl18B8heBLxygp4dvl/o0sZTzfWwZ9yOUpA7dt+QrJ
	zhQ0lwLmJ88Ms+QlTxpvBp+1TijR4VIoSjOXV2y4aOl0HsbLHguwWcFoRIhBL8zNjqCQ9pV+J7T
	7ykVOVlSQyrB3kpnxCFiRPlYKirw23BW7trtq5Eo9gK93iG5vYeeo6Fnh22CQDBk=
X-Gm-Gg: AZuq6aLvwE1Tm8E127AxOeyXg9z0tikes4xIDdMc9XZipL0+hloyp/qC+S70Vv1YaoM
	tYXOorSIJHP2zUXhKf0OUbjOtkT5dm4OBD/W+ppTY+787ghWZxT95nl1OZ0hjkDlwCjj374/u5A
	VcPnKGFsSRIeeVQfWYnqrnA5aSVvZE1KZU2f5lf1KGBU2jgbZ4geSLAbunOcJmkQrYhbrf8MhAS
	vR6OvJ7RhNghJ6O0vkSiYJwBKfmjenyU6ENIeWZ6UFI/xg/IOLCbPO01tJs2YtHvfq5yINNeZRZ
	PgE8a0Jhe3OYb2mxGfrnVmWrJj43Yg9avQDwFT9hHGYYm+J2lTTZiKzLXRC7SDhOKMLTxp1frCW
	uxKQn2gRRk5qNAZLR/Z0f/UMUFcQmgXBStgjBIfgclKHnudlPDlV+zcLTHut90YK1aJfSgQlSdt
	sZyyGVkiLIUigohcIwV/U4KVU=
X-Received: by 2002:a05:620a:29cf:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8ca2f83bdc9mr196461185a.14.1770166803846;
        Tue, 03 Feb 2026 17:00:03 -0800 (PST)
X-Received: by 2002:a05:620a:29cf:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8ca2f83bdc9mr196457885a.14.1770166803314;
        Tue, 03 Feb 2026 17:00:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.17.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:00:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:53 +0200
Subject: [PATCH v3 5/7] arm64: dts: qcom: sm8250: add MX power domain to
 the video CC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-5-70fa68e57f96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KSGW4Q8DYDhhzVXQ25otMmzjfKUl8PxhFUQ2hkE2KbU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoIF8Rb4QZxvt4JJAHhE7PQtITxEFt8T28Fh
 YnflDeO6baJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaCAAKCRCLPIo+Aiko
 1bh9B/9Qdca0dqLIdd8Edm3TsEkONTyhZGu4hGaMiqN5Cyp2g9K+VkLg4UcwdlCWxaiCNOb3+X1
 yHcjlSoo0tYXqbmUh5Ao87ncvIfabP2JAM80/W6j76hA7tshBfityk/rT9IBwOaBdiGmmbqPNXM
 Y8Zv3KkoWZ1NLxKuW27t1hrvbzX0jxZRfCR0u7/rK8PPMKY9e3gYU6UOxcAb4wAyVQ10jzIaOuK
 Vh1kTB46FNwndUVfx6qfSLf7/hLg7WsZ+RYBoza4HXHrz+t7ZBeT70Hx0LDz5OZRoHBcs7Vo9cl
 PnR61mgjurPnIpaDWDo1Tr8aqjyolmafUUpsSq0nLICoaLsj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8iltVxvwLRs6AUX1s8lOSCA8QGO5MXrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX8ERgIyIAMgjC
 1uEqK3doKQ5omZGFJQI2L4U7y+8/zFQyZ5zbKYc/fxundzeDnW04rMfjk/zhELqkXdQMuFv9SyC
 kwI6J/ewfF1g1VSpUdGIf6vYeqQqxWxUVIaEeY6T96KuaJTtQ8xEx6PFulFdl0hgJjO8mrzV60D
 LfNzwRx6FnsJFFNMG2TC/HwjdP2dp+bAs3ScB7f4OcnupvOdgukeyIzsYfo7+qh0t16FkV9UT11
 7pKJfzzj6/oy60/SgJLLQxX1AwuvvVmFtRl4JkOA7NooLqdGOgsVWN4Cxq5C2jxoXwSyScgVgUI
 t9oEs0O/D/D+B/b1vJ0/EY0bGxeRhtfJi1PLgmZ36FHsftFyTEDHGeBGfD3VUI9gi4bheuaHTdn
 5dumYqYnDUkEx0zGwyX2uST/olA1ZVwtOvkrhj4AYWdzlOs8rwWxqNZxV44jYMfd8Y7PpyqkeAc
 n0K3vysp0Ru9ijOI1Zw==
X-Authority-Analysis: v=2.4 cv=XI89iAhE c=1 sm=1 tr=0 ts=69829a14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8Bs0yZVtKZY9psgxZcQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8iltVxvwLRs6AUX1s8lOSCA8QGO5MXrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040004

To configure the video PLLs and enable the video GDSCs on SM8250,
platform, the MX rail must be ON along with MMCX. Update the videocc
device node to include the MX power domain.

Fixes: 5b9ec225d4ed ("arm64: dts: qcom: sm8250: Add videocc DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..980d6e894b9d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4374,8 +4374,10 @@ videocc: clock-controller@abf0000 {
 			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
-			required-opps = <&rpmhpd_opp_low_svs>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.47.3

