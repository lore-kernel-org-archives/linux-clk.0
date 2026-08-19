Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12E35C6B3
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144028; cv=none; b=OXL5PwWaTxe1FAkVpWaAIKRfi+IdRaLL0YjEJZNfoCNl6O3Se01wkzVqLMGCIUtIuebnGwrpr5dT8jE45u7/Y1ICzhCgx49QCtXscHXo9K6ik5k4+DGuPEwbGEX3lXWMD68yxCom4/J71EvlGZqfd8WGchbCzMjKfuZ8OHiN6io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144028; c=relaxed/simple;
	bh=uiH5LC74HtGoUooDtWPifVIUwlH74OMcI4/Qjk4DDlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ygiwd55QUJKylXqjAdonmgjV8ISv+CKxoU9FIeIoWFE4oddGLbvQk8i8XiSa/GJyihsxPx18+4mHgBVYX7zyXuQIdxqyiY/SG/nW6UXYeCV6giCq5rPt5wlyndedujCs5GxsLraCvQMuDBeAP17B3QVYEB7eF/pdNM08CvQZVsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExfNRz1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8GouYyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExfNRz1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8GouYyR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClIhR3570078
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4JypXCcVFXJYX/rpEzE0MV5AMG/upx6Kutl9T3ij4c=; b=ExfNRz1jSjxcSjcg
	y0yFk/r9w20Yg2Ch2EtTDW/HoiSxGuRIvc7Lp2wwPTc/OBY+5acR3DNKJNMFNFZ8
	Xf2gYfpieUrqZqKcyQsB786o98xLU0y/teK3P7aTS/llI7SvKL9exw7K9d6ivv+6
	FIY2tpK/A9gDdDmPFAPrwIWExe2LpxGMidZR/P+i0mKteQZVc86XHJJxHhifyzy1
	NCfOL7h+JXAp50pl6bX1vB5cifdlgh/7tVwuZ26SFxFwnncGx7wyE1DB4qd0rzBn
	X2qnH3XudHySwz86eOcwY4YBPKrgDVCJj+xJBuxfUZHNmGt1rx04KZqJ8AsdvkAQ
	hEruLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm38mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-933023a5980so161167885a.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144025; x=1787748825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4JypXCcVFXJYX/rpEzE0MV5AMG/upx6Kutl9T3ij4c=;
        b=f8GouYyRZ2xMw6AfsN6GQs/CstrRIR5Xx43xlHATS2n2HvLDJvI/GqqfFB7zHYvVds
         uq/C4AS3mXHDkgQfvnGRxVR7TzQvQs82p5MATAzclEh1IVfQloyYu7NY58/9e1yodds9
         HRRk2j9HsI5xUC9FhuSqr6qQ+rYxRj4yIn/EUkGLGpGkUzXEc9vWzlsju3XHxfBxqjZk
         PkVPxmNwLAZrtf+rpJiJVnHibz5dh04zuoRm9txWoZDYDvTO/4qkS/Mn8loQ4YmhiGhR
         7o0YmxRLYYwwLq0KmssMBIXXK5Q74bRH3J+481ZJ7ppSkr8FD2GU0PtcKdOgrC9zocMR
         9++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144025; x=1787748825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4JypXCcVFXJYX/rpEzE0MV5AMG/upx6Kutl9T3ij4c=;
        b=sopnh5VXOh6Prr9GCzij6ZTb5g/NohYpzpSsDXvxhmUVr5NNIfRIsSAk1wUHjiTd0m
         ZyCSfQ4sBBByYkPrNPPeg1dj4kX+7mNColnTIVQI5JIsPL6MkhGv763wVpcAQaxfOKg9
         n+y3Y+YLjQ47rb3RMDsCYRAAjkx0Uzn+YjTRYUdbwnbAC8Y02ee85/1k0xa9SP3mW4f1
         AnZ/NWEuVRcNtt5D5KnA5tzhYaGtXiSLP52z+e+5WEMZ6NEQRoxQgDnpYLZU/E67ptLA
         h3rSYrRsgcoy2n/LGl75/jAn994LzpUlnxjGoK8yz/BuR5NQhYNBrzb5D3nWeSBS8XnJ
         js9A==
X-Forwarded-Encrypted: i=1; AHgh+RpO+Y+Ek4lSh6SkbF21aDkr7BwWl+01bjGuGDQnkwPJhU9z5Md/SXcX4a4HOMoLkt2Fcwus4Sm8NkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMixehsVS0tM0TNzlJadrictZDjNdVkdthgQNqZT+Ey+FaNOLU
	WbUPqNUwBvvE+AC8obHjEdWVcFIccIqH/qTnmIcOew3rBELzUPhfIF/RMv5F9Vzyk+HS3rU9UYI
	APCeT8IynVqZCBSgHI8cEBY8NUI3po/E0TsRnFAJ8YMat5f7102AYWLPqMJwIjkI=
X-Gm-Gg: AR+sD10BAn64B/X4q3dzey5Ux+0QWz/lCelyTL+ucmoEI7kv4sqzkKjFd4ev2mZvwFB
	AdDnK+9nisf3HCxr9JPW4+tKdv9xdaDP4GyxKrILPePvFugVVXfFT5VUXs+wUjdFZZ3OcDQCEwg
	fVamH0aRFNi+f5eZWZ9gX64cSSZr5SZER7Xff0B3PHBvXGaKQYG8fsmxoO9y/EO0Uz7xKY2to0Y
	6rX0MSYy2sWUEz0M1U50BKVRP1WMx6CStSD1fTWEp0lFkJIxw0Rbkigy1DdPcXL2b15RSygF6o2
	19+6Xa/S/RkQL2fCLCX8d6IHFL265TjdVYrX9tWPpe5MO16Da0031cpoXpZUwuCoMuP5qq16YHu
	FazKHwMHz
X-Received: by 2002:a05:620a:708d:b0:936:ef9a:deea with SMTP id af79cd13be357-9371e2cce2dmr349177285a.28.1787144025434;
        Wed, 19 Aug 2026 05:53:45 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:936:ef9a:deea with SMTP id af79cd13be357-9371e2cce2dmr349172885a.28.1787144024977;
        Wed, 19 Aug 2026 05:53:44 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:58 +0300
Subject: [PATCH 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=968;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=uiH5LC74HtGoUooDtWPifVIUwlH74OMcI4/Qjk4DDlc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacluYKvfl1UakPRiiwu87LtqVHhGKXn47rS9
 TcID0qZkliJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnJQAKCRAbX0TJAJUV
 VhOdEACtIMasiJ7df8ejDQeC6ehrgi+fLRzXcMcETR1jdOg6JLuNzS5Zj2kZ4m0qOvsxJzneiMf
 7K1tFOcy5BGib9wx7wZXfYzdx6lgbPjzMgDAkfR7RMkJN1/lF5hfVCjYPdyQn//iI+ozS2a9lpv
 RVBEH2HRhWWIk/y9bf3SquOFpQKQS1N3P82ufOkMIliHvyjoLb9qFlafRFpiadh7cNLupal2DhX
 Z8EF+yjOQ4hcFMQ+PJZM3vcUaa+3fbvVcolv4NzoT7IEBPRx0IEOx7jjQmzcpaX9Lt3oGDjFduc
 iAEQ8bq0sF1nmaWLBjTIEvmvOzHzgjN7MKC4fpdaryX6r+TriuFs2oQTSa8stM+APhLUXsppwH5
 fC6qVWU3z3kS6aHrh02b8Uc+FaiG/dp2iUg9pQINWzB0BNVb4y1miGEl5Ev3+dC67ZJyaXoM/UQ
 /GO0Us+i5VqfqzSj2AbASOXFm+1Uyf6lrhhWPALVc4iJm2Ff0T/IqbFtWuRAfjitSyWvANNCvYB
 cEEAJMpgWXZ4f0QNTtUaMGZLWWnukZ2ghn7cOwo0jcd+1bzT2EQ4RUfXdXJysDk//jSW/f1rxgK
 Pbi/BmPmyodZt124ZPApJpzw1QGGldXtaxV8y7IlQx4zQ0a/Js8KyY/wdVrqDBvO6+xcUfne0TY
 ibP5x8OZU/ScK3Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: RkOzraLx6mu8roVJY1ORy5_dV7m_nI6Q
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85a75a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RkOzraLx6mu8roVJY1ORy5_dV7m_nI6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX8ZOm6BSMR8Iy
 qdl8TKSs6YvVVtrYdyDzDvNhNCwWB3nAeZ2qNUhy6PybOyOQIk5RTuVsbbtFH9xgXdD01nyGEUf
 aZenJV6XemyEgSpvZkMfr8Usi1sq/8BPJdyBqa87tgYqFZAHlLePGuJtMvS8Y4jUDCXMsYtPL9K
 VUGdUJonJoW+RTl5vgsKMCgcTf5fKxwuY+lU4UO9VjcXaOjRVFbdoVus+lNaSUDjoM2ShBPuZxC
 U6Ke9v4gUxuulN8/gijYlbu+jSry+F0yfXOy4qYtcv8CGw1fyDAl8nBzn7l3zq+xh9yip5vpLFc
 0xXNuGJyYcR/EpP3mR7MqQy7fiJNpgXDWVBQi346ys9asi9Tyl8PmLIgp5WnDa+8WL3pKczeKm2
 +pixhSPpRTI3XMMrOc6cnB7zj4MWLD6XAiD+k7j8RinJHi4wdtCm1SjYaOmwSFBf1sc7kvG5LVN
 YtKp//MQjieQk1J6C0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX6WKT16p987VX
 RvDBg6q5367GqaEAj86hC35R2b3n+lXoEwsaRAe8bKAOHtT0VBHCiVbBnNg5f9hCyES2CjqtloS
 ZJpCNYsJgMHanjzwNoXMvf8jw4NHqZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190100

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..962797c15abf 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2019,6 +2019,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

