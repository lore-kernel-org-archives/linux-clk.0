Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C03A3E68
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706108; cv=none; b=u5EUJ5qVkP5aUdyrzGDkCCtxPvQpEaQANg8F+pvRzqTvSJIYrdVw2BOzFVjK5VPIlXRp/HR2eJ4X6DNTyEWJDpX3P733KAbhApNgT/SqzOE9aPnRjpZgXea/WOpaIp85nH3tEXaQKP+g/eCEuGC3QTxy82zpoqVX1aUHoXX1Wc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706108; c=relaxed/simple;
	bh=UY552z3y8obE9CEbg4drEcr+gXd0WCTjZOc7FcG2UE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aYhTqSPOC0alvPHcRD7y2mQ0iW5ZaVmYVgtW6WbcRMFGHQt53kJv2oaabTc/0NyMOJnrcnq6J6KjlE7ytP9TSbWeYVModmJUppgWLTn30SJgbMFCeC5c7Zf7G8RpJ6FXCS9d+KlSK6DxjNEEW0zRrtLwwb4y0y43CpQckxJPrxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOQic2JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUBTiXHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOQic2JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUBTiXHb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBId8P1599247
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JKDaKyK8qTv
	C9N3FxHWako1QPbw3kAUgAinToGZ5C/U=; b=OOQic2JOgoBb5LDyfFvwo2MOymO
	WxL1Fy3uZY3ebaj2dusAfo0LiWVTDISYzctQTyvCu0P5g/8bhEt6hD65PZihmZly
	4Sj0phoT/LBvRIMKlSRwq0edh4DQSV0wN/vqxFpxedsFvP4xSU/t4mhvEt22DLkc
	4VldjcOy8Fy6REKJkrlWzip/RsIylu8YTaGE6qmfSVsTjyKkd8/aVjTJ8jOLLJKM
	/LY5TCXqPd8Mo11N9s35O6+2cDdr4fBj1WSA/xzhdyO9rwG5UqT95Qdhc14WCHUh
	a4ueMwsZ1wPLVnuH+eDJ+8Bs/HyxNXkSkHfkBBJAZpLefS+S8pHlXQqHKEg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnjjtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:28:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fb6cd0879so3111665a91.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776706105; x=1777310905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKDaKyK8qTvC9N3FxHWako1QPbw3kAUgAinToGZ5C/U=;
        b=OUBTiXHbM+Xj6wxO1b2c8WtoMOZT9Tu9dhtBO1I67+HnJ88Q7FHhX++srnkbfHg+oO
         Dsx1bbMIw/i0a+5u/AgkNTP8rHzGOVNnX5HYHzCp3fQf94TnZoTS3ofC5oYoNErKidOz
         Pf4hPw4e38bSSpqq4XLiVcHlfgrRjhapbLTZYkb496glUGybqQJATkEGXgN0a7j/oKrm
         fQ0XOXVXLYvl8Q7uw9REWn6bDRtFVdUvwD4JMrX/P7Ad/gIOXDa7taZ6WbwNArujDOXD
         BNEH22Jy/lBX/VkDjaho6zJBTB6lAyjWhSvYD7Uuv5YcyWD0X07THup3Yn1b32kifz46
         hG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706105; x=1777310905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JKDaKyK8qTvC9N3FxHWako1QPbw3kAUgAinToGZ5C/U=;
        b=Px5btDqQorlCqynrZ0GCGZ50RVJs00GhPLU7LMcW5eeJOOf27ujTDlCW9w/Tcs4Vst
         QsLLVMkhyo8rxH4DM5fz4ottogtBRJcG0/cHrMVT+57YlI49FMi8HIMALBoJ6DyiCBBu
         9iH6BFD96Yq5OgJllvnB24SEXTtZX1ML/R/hf4bKg1DTX4rWXeGqka5ccb4N/nXK+fgm
         HmgyLrqhGKcDKrNqz+TAqIlhut4fjdhlSjRu1OevllWIUM9ZgtB8DuVGyglA2GLl+ssg
         B2ozEtu/WH26hdfTR9/DnwyMnSJBjsuR9MGYWfYAmnfkpqG06XuCk4BnbUWscmATUFsk
         x4vg==
X-Forwarded-Encrypted: i=1; AFNElJ/VI4tQiJwL8fgiFqPHOhbSvKhwq8HY3Lj/hwygv152OeZLVSLbb5SMy8FTHaGtuTtkGVIxrecVTYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWF364oRZi/12RNJ9o5vigfCmtgDEPxwIUYqcaMvL4Eaui0xf1
	d1vOt2GTvLaL2yfE5SwbXZvvfnaGbg4QG2uD28mGeoKstqGdaf7XdZ3z2OH/dcQxYRssRtyvKdP
	pAgYE92ZoepwZkpEd6SWcJXO/MYdWYfNQva9Sgshsi9qpsJgPFW9o063MRXPaKcU=
X-Gm-Gg: AeBDiesioi3iiAe1aOkZIbj0OoC5G9J6lNh8/wBYZqlmw776w9MDNh2bOEb7lqTsb6D
	bGVVJEJbkk0a3Nx1poiBP0AyvMWWC1WjEP3CFR4HAvAIKsRHA34H8X7UOmw19zHFOLCN4TZOTqR
	Zf0l+9KCPSCWpY5//pTdMFJINkcUtXhQ89c/gGMgR4isZgF7rDSz71kXz3V+gHS9PEGY3Um5m+d
	cWQ341fqF5SOhAaLC3FMXssuhVGCBc6drtfwraC1kqSGpO1mMuurtuYe+Z5Fy+QyN/zje3090HD
	m2qt+NfjsSKfAgNSHo5OuDkVpERPoMpVn6C/uuzWaEjEIa3hiDEfdtA6Ajkx5UhvJXoIfqI7ezP
	cNt1YNIpezNQ+QRSx6ZlNXLyob6ztg4UKInadZ3cE2koe3gdx/vZVrDN5hvAWv60=
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr14800060a91.0.1776706105288;
        Mon, 20 Apr 2026 10:28:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr14799968a91.0.1776706104426;
        Mon, 20 Apr 2026 10:28:24 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa17632sm113132575ad.24.2026.04.20.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:28:24 -0700 (PDT)
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
Subject: [PATCH 12/13] arm64: dts: qcom: sm8750: Add disp_crmc node and CRM properties to dispcc
Date: Mon, 20 Apr 2026 22:58:02 +0530
Message-Id: <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: NVN8FGW0Uh-BVT2aO0UrucLs3omW7WrF
X-Proofpoint-GUID: NVN8FGW0Uh-BVT2aO0UrucLs3omW7WrF
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e6623a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Ts-O78zUOEHCRh5K-HgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE2OSBTYWx0ZWRfX3rh7w/odbk8f
 mtQQQ0clERKPGLb0UlXQEAjnC4ekXelghBpXl7ExcC98cgIHL1gHySkpH1F72Fch8go1IRrcNPF
 YcKAatflpr0D74Bf4cdxd0997b+dXbDuDmP33ffREkbdQMDQzZGUC0oP7SSlsTftGr0z/sbT4Bu
 fC03eRyz/EcOZRgP6cpFepU5FEFsu/rQ5GzEONF7N9Jzw6EfokU2LvAw+G+UbCNRxLqygrEx7h9
 0RsE5ToZtKQKIizCPaZiKS0m+XkO33IMUG66dxIRaOgB3wszmD8wEYFU3hFiaJLRrd9X2cCUu3d
 QDCzUgRctcm0kciu2o11b/nWee9wfIRStQ1+l7Twt5P4IQqsZdmoAN9buy0pOn0ANoiEiQ4PlLI
 N8jOEIOsyttzltEuC0zsQu0+UkuhwDcEKhX5kv4H1+ZcCp06Sqh0gAz/0a4KSJZkGbXQ6O98UNw
 lP1s/DF0bm12c0zInXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200169

On SM8750, some display MDP clocks are controlled by display CESTA
hardware. Add the required CRM properties to the dispcc node so it can
communicate with CESTA through display CRM node and control these clocks
using CESTA.

Also add the display CRMC syscon node, which is used to read the clock
frequency lookup tables populated by CESTA for CRM-controlled clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 5d2c59f37015..0db586b02131 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3431,6 +3431,9 @@ dispcc: clock-controller@af00000 {
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 
+			qcom,crm = <&disp_crm>;
+			qcom,crmc-regmap = <&disp_crmc>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -3451,6 +3454,10 @@ disp_crm: crm@af21000 {
 			qcom,sw-drv-ids = <0 1 2 3 4 5>;
 		};
 
+		disp_crmc: syscon@af27800 {
+			compatible = "qcom,crmc-syscon", "syscon";
+			reg = <0x0 0x0af27800 0x0 0x2000>;
+		};
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
-- 
2.34.1

