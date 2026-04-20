Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A127C3A2553
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776705937; cv=none; b=KMH6OtytmPjlLvzoBI2fILUCXiqdyoz+NvlsOmQZ5rHzLuLyZxdyUyhghO6yNUalKil4mATHOw0352vzKMItJjvV03uA91ZtPRqTvQon25N0bVJd2+QF+l2/5PbRzi2d5zbYqmiLyhortA5BYo+0M1uxcA3uy9g2vhqSFUexAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776705937; c=relaxed/simple;
	bh=jYa8noxjSneEwKKI80YQTf17d+/soCGjTRTQKVVhOvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D2lBHaEzEAInNBEtPnX7Sb6zUD/q5+NE+hlizRFy9/dW6hMg5LnDKjFRdZR/bb6fQ/Ka/PDs2UradnmAqIGtR5wg8wiDatRGb8vvEYkz4Vw3dCkaiHShjgzqshbJGW79oyiFInxg0wGPuVdxDmvSdomK8NhyEGuqykO2LM+SmfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deRkc+AV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOEeS2rX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deRkc+AV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOEeS2rX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFOpxo1599885
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qP9CDOYQkD+
	vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=; b=deRkc+AV19InyKecLcv4OcuxQEu
	QbsCXLmCquqq01+uCexXJwwYt/HqYsaBJBViXCWWCfs0HKco3gzt2bZO6GfjKTIx
	WFMztMP8rWjZRGhHXECW2QBEFT0kXVOYXQLN8VJPbI/gjOEEvHCfksxqJqmvD6Wb
	cxTDsTIujEgbnNdifGW+7QJPJPdIdyaqBysNTKPaycq+rR5UJreR/Prmiv1dp1Jd
	2aP/fCpfvjMHTHzFy1eQ+P41yM5eCcKQJ3gWxGbclkXaalcZNABuTZz+3X930slr
	ZAYOli5Xzb+3uhvyMETkzoI2VkPk+CtXTNVKgMsxY1FjA+4RGfA/d4IsZJg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh899ukr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:25:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so1507525a12.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776705934; x=1777310734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP9CDOYQkD+vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=;
        b=AOEeS2rX6sha0aLOfLbrvZIhhLope9OoKUJF9qkwyelyUOJYPjdCcfHA5SoYlFhzHs
         wgdsnV1enn/cUMO3B8LwFKYZmMD0ph/gRUCBS2MRTua1E+HqdCWIxWnE2NNRnXZccuV7
         WFVLJeeo49KE0dBSdh5pNRi82lp6Lr3Bgd4Rpp3kwHi9GkKwMuHsAnWWnYzZpKCgFOw8
         FsbEFayP69ambg5h4I0ucrRBcUgoFdyfePLnqELRafIJRf2NhMNRFXvvWetfARQ8AED2
         w027BaDNmA1SD+Xmxo5zP2olPxyyiJL1NnRK7JHujRiY+zXk3Va0ebYbHmBsEIvbYtAa
         P/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776705934; x=1777310734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qP9CDOYQkD+vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=;
        b=Ynfaf9AqE4YWX/lJ83pXxMj3WKTQYfK1jDR2A6YzBV2vNDE+weJVmwyh/UEWvIt0SW
         p0t8dKJnFPm2vVTMH0mHJA6sXam2u9tJDvm5z8EF9L5/1a5hV+FaSbRSZHN2dBTGxO6u
         o1nlZ4zxUE4pNvkrklkkQZretYI2jYbDoJ0uY98rfH+xcZo+n0K9IuoZMBm16M0afPzF
         BsN7gaXx6bIVjc2iw3+9u5Z1Q/g2qBNVzvH1FXQznFCalg/KgTiplWcf8gCiLCkmWpDQ
         648A+1M0W9ahnYmU7kLxqedZVcCUKflxSMNaIEF6K+IEdfin55kzQ1y8h6IS/zuNQ4rM
         kRXA==
X-Forwarded-Encrypted: i=1; AFNElJ8/nl8nQSZLIPiAz3ZypnACaVM22iL0FFOZXfnl2c0WYdoc46fBPjGnkcP718GaT2fSFVv5ArAbfsU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/MsYH7CRtMqJ038cNiZgbjJsiIAhVX4Nrk1PpKKOQZH0tiqfB
	sR27pJDUS5Iv9Cn/rHKgoDX7jA1K6w9GO94Azi3oUgF9ezZVk8nw60MQg4aksU7XHZgS/xwN2ka
	seV/Rp5McMQOhfEcFaUQm1H4QHFN6wvE0AfLFoMfnW3pwNaEjuX/z774CYbGvfIY=
X-Gm-Gg: AeBDieuemqTyWbv8V9m37WjNptpJYgtoqp67djMT58FL8DhaflfQ6J2BYMoPzIk7PUq
	H4XzMgzMLBgzWqsA/+q+6WyBDXMyIwDItQcmGe+gBBgnscr/T06TB5joA+fLjFOpsWAB0cdDDmS
	u+GWTuGcCqKeF8jfsNTHUtbITzcjZLeTFeHHxB7A9ozF+KGRQgPZ2B4KPGOPS52XQOKU5XpgG9D
	LvgF6iau2wZFdzvIWSUgmc46BoupEbLcsJnNOnBDUAIao8rN8HF1Lj2fdxpjJhH1EB0CVgxBa1j
	ClPJ/fz0DO9c0ymAL3T168H4zTHcbySRsPEMYp5Y+z/fFEluhm05fLnUnQehOny4aJsWdAAKYSX
	JOd/Bmt7btnJ+/wpiT+1B6hnNbHYjaSAxYG2HWxTsynShTDHQOOAMuTtXgTPl0KE=
X-Received: by 2002:a05:6a00:be8:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-82f9a889558mr6565384b3a.33.1776705934270;
        Mon, 20 Apr 2026 10:25:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:be8:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-82f9a889558mr6565362b3a.33.1776705933634;
        Mon, 20 Apr 2026 10:25:33 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f94204ac8sm10217353b3a.0.2026.04.20.10.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:25:33 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 11/13] arm64: dts: qcom: sm8750: Add Display CRM device
Date: Mon, 20 Apr 2026 22:54:14 +0530
Message-Id: <20260420172414.4123379-1-jagadeesh.kona@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE2OSBTYWx0ZWRfX2X2h2mINXbGh
 W+7xD5ZvlD6X9Z9bZjIhqLt5GWWMu15kqkboIzd5VsLSyz2VfwFT+NZWkMfHkI/2izO/wOIh//D
 qzaeN4qGESJcOQiDRlghb8VCeFKDalOviay74JxMVDhgeu+h9r0850f1Yibt2H3tV5N8t9Ol1Mp
 3/XxzLOGJ+pOkm+eVN/mC01rIrqHrr/5zZ8/MKRvIFiPhX330CYWCYxSR76RsnWffGy63TD2zTw
 ebl7NpBD64SG1A5Tv/oMoN686KyOsd6HyIHcvCnN+TuiPRE1sDO5ko0WsHzUN75M2HWGo1Xohws
 C537HZldE1RC9tzkE50K+bSEKWIjAlNT/qL6FhcwNvOEcxnOkg0+lKacs68+6OqH5NX6SpgAR0x
 7SeoBjqcFd/QzUYx95MeFdGukSl/T2Wx1OxOE241GY6fulxADZ1igXDviibvuzLRhLQT9fSk4TZ
 Pi44JZcpWM9taJA6nBA==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e6618f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=LxRhXBDcLp6q28ypcw4A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: hqoqLdXyPzJDT4ujypgJc4yD5XjIPrB4
X-Proofpoint-GUID: hqoqLdXyPzJDT4ujypgJc4yD5XjIPrB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200169

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

CESTA Resource Manager (CRM) device provides DRVs for global and local
resource voting. Add CRM device to vote for resources needed for display
subsytem.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..5d2c59f37015 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3436,6 +3436,22 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
+		disp_crm: crm@af21000 {
+			compatible = "qcom,sm8750-disp-crm";
+			label = "disp_crm";
+			reg = <0x0 0x0af21000 0x0 0x6000>,
+			      <0x0 0x0af29f00 0x0 0x100>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
+			qcom,sw-drv-ids = <0 1 2 3 4 5>;
+		};
+
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
-- 
2.34.1

