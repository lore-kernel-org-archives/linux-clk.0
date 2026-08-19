Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE933546D3
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144026; cv=none; b=k9kvvfj2N0YBf8vUEPf1Hv1TDowBgKj1t6QSkeZ1i6c+sapD/ohtZAMyd75BBJ+itjSrVe4OA9BVuwqR0UFKQmQtsuOJhWGLuzmTXYEQeBKwoUsfhTPcr9D9rbLcY2Jb4fVP/Mx19CRYkYNeNmkr3cDCJjmFVAeSwkDNkyWG0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144026; c=relaxed/simple;
	bh=8RsFcTZ4NzYXRJqTdfViGLyVb1ACo1mLBFcBykmpf5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQe/Fal6KwzxTIKIX8rTbjwcv25yiIBmdTiIoENiSfsSH0GJTbK41wFg81iLm4IoKRadsnC/GJCYeoVllvuulAmhvIGmgEq4RD5wio1LoiRGSg2yBAVMLhLRpudXJXBZDzRPwtMr2vwX/eGLxYfRy5dwTZiM/NsZDgaK9OCKq8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fiid4XPZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etUf0l3j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fiid4XPZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etUf0l3j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClDFO4016050
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjlRc7FAhpx42lib/lfvV5EKbMu42hGOIFYC1Xn8t+Q=; b=Fiid4XPZNhLFY5hq
	w76A3EHlcNdJF9RDLhfCif51gB+CbYbnv1QLbVI2V/nPVS2L3FE7JT56d/gFAccD
	cILBNbd+vjMlVYFGQqbamJpTyDyKIZn5/V5kcEDUSVDvRhp/MpFe5I7KUFDNCWC/
	FM7wiHvukLb8hpYY6noXf2RzDxRwUVzP2Evt/5SXv2DhJdGKKJ0/ytgrq48EeOAL
	buviWKo2PNF5rJf5kyyhmVkuJ4/WtHFYlTO0ottHSHsQ/gQcx8Jri8b16R0gXoGJ
	g1xyFkAHlAl/NTATONeXG4seM/Lsd/GRwdMOkAX2ZWV9MFi15jPwWNh5z7q3u9l1
	z85d7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkkacv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9368f2b7b2bso109713585a.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144023; x=1787748823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjlRc7FAhpx42lib/lfvV5EKbMu42hGOIFYC1Xn8t+Q=;
        b=etUf0l3jw3edSrD+XTpzqP17q/6VYlgiJy844S8IAu4vVsDh1XEoubgZNnUb1ROyv1
         N8RLxzwuWhfgWY9/WLb3MD+Eh3V+yZk/VRwBtiYKF75fwNPAHjOy5386iAbd5UZd02LD
         crgmfBUjOc4IdQfkeJ3+lgy3I8h7ZqDWjLVeEpedYvxVDinaVEdE+cs9ms3kHdUnuUlQ
         x8iUcvh449qpR9yllSogdo8WF3zJ+TQnv+CWELzgcHBFEbQ+7u6QJo1No//YMIK3redG
         uNREUZlIstartiYZsHFEAmaytl/5YXj/ZOYiNplfLDhCjqgF28kUPP2dP7MnnAGobDVC
         GE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144023; x=1787748823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjlRc7FAhpx42lib/lfvV5EKbMu42hGOIFYC1Xn8t+Q=;
        b=eH1Vukoyi3Qo0IiujrYHxNeBlYT2qg8ghNdSdfXy+ylAIgXSIoiyOPi7hwWIUJhc1I
         cOabRqxE4wpd7jCnBWqCwI9z4+LHB1i4dO3TBUsrk2B19fEWvuvCVHRRfqIWHczho4I/
         l+N/Mfo5P6BHdQdQHcM/GHsYnzqUZK6eWNnEwitSR5QEok3Z6Mobmu1PR870gVHKJXxM
         MWzhWAaxy2R7YPsZglKXM1Ncei4tfXIyEab7fUFidDlAL7g7DoGrDmuDU0pwDJLFk2Bs
         7HX6rzVVB5NrB3PmHIRcCk4Kzn7n0L4ra+HKAMPskUv9r/Jh6DlF/Ay9+gIUToluH9gS
         7RqQ==
X-Forwarded-Encrypted: i=1; AHgh+RojpSHa8/1eKuhn7NnVi16/4p0HSytQLbRQCCBwo3FN0SFUJhAEgGMs44vB09OxZl4lPcV7LlJYDpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcz3OKcAHrZZ40MtjrNOfM+xhkfhVfMroYv8UfafNZLvATp4iK
	S8GuQiSIK1g82o2MtdUsNRASiRIwE2iMvuqESF11PWPcO/r8X62Cf2dP2cxsKIAKDGn2+PC+qky
	GySgdUEO5g7LATrQDt+2DEjCthvxjDNuaTVLAq6ugI3h0sKpq565za6kR0a1ij90=
X-Gm-Gg: AR+sD120ny6Hm37+6vYs9x4vvFJ5s9R7V2X/hYUBD8TCD/icD5AVZokIBe0y3YOx6Mp
	YHzqG9yg2WHoU9zpyZi0O0lE0lVmOUAHwRH8hFedwz+IUS0lHXfTlM9ynXL7pMEs5RwjOR/AuCk
	bSQhS3CCEoaALSzSro/oA1S1Y0L0dE0O3nH5RZHxAXmhPb82xk19PlOcB6/1p9rlsoH0sSaHmWz
	wOnIGlMFOf2LlPN2i8kCCpDHrKoDFIJe7GB9WhLvHlYxlkYknXnNqmr4LvSy+ektiH+DGSwQDNk
	jxghFJr2CUflpK31lyohYMY87gyixKa6liVOxQSP1p4BbVS2P0V28RZnknvBB90zAZ1LV1rFwKi
	WTcfrFOyZ
X-Received: by 2002:a05:620a:269b:b0:92e:61f1:6b72 with SMTP id af79cd13be357-9371e242d62mr343485085a.13.1787144023216;
        Wed, 19 Aug 2026 05:53:43 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:92e:61f1:6b72 with SMTP id af79cd13be357-9371e242d62mr343479385a.13.1787144022580;
        Wed, 19 Aug 2026 05:53:42 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:57 +0300
Subject: [PATCH 12/16] arm64: dts: qcom: sm8550: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-12-840034124e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=940;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8RsFcTZ4NzYXRJqTdfViGLyVb1ACo1mLBFcBykmpf5o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhachaUBA+4QXWS8b2CjlbZsBDQE0MfK7fsBAG
 UIp7oR3fYmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnIQAKCRAbX0TJAJUV
 VrsyEACWEGFLCOuXRUlF5tsM6M0PNTYKxuQBheI/23tWYkX8IIM70W5M9FLVpKXbJGQy7w/l22y
 zAWoBER96wQIyreNHvtpam7Y7HplEiYXELD+Qfq/gnvjMUZz8gyYrf8j1lB9tAVZGiy93QvbmpI
 RQJykt7Red7xLEC+phkHey5FbzY79HnTdkljuHHIDtLsOdQXBhPqE8X5J+IK80Vc0yhiWpG1gNE
 l2A6K35Xizwdvfm7EQrlpcYAWqIjpuGN7arRqwRgKv1Q9wxbhW+zri7ZSy0uTlHYaU0FiRD2bMp
 nC0kTHb2BL5kax/zsJ90yzUYMWzLA5VrP7AwFbHBXpwM10Fpg6S8XDvEtWIX03PRDg8LSRTyRJY
 MKKH3F/zmV+83ubnQXzDjDGhqvRHoAL9IYWh9k+T66UrYX6Lga0LUvlMD3VA57R1Wa1SJmKNVcU
 E5/e9UZyOVhXx+LCHDJ9DgQm/xk6MERfcx+Razz7PTmUD3nxkuDqpBQpkC4K87tIafZpvNkzbuR
 ZALmFzouN7Oeez06ulYA5IWo2cMM2rbOR98qcLeAeO/hhJymOU42q1It4ULyY3/JcsuROG/fGfX
 KjoKHA/TsnMMTcmseMkPz0+wJQHInqs9ZdpsKrXNWSJ4yAfERzLHvLTBg0ILmla7zZGJQFG+pPu
 2B6y/oG+weNOnfA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a85a758 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: PPJnVVxlGd3y7zOQk23lgS0ieCb0N_lU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX5grH9Ja0nynK
 bukrjQTY/Jv8C3MJ890cN7cmkdr/xHOyPFslmCTnq8wuXOFyI0P5OJOHB0U4cwBIcmOjk3l0PPm
 es5I9vVbrSVKK4F/vpeqRktD+wFBhGg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX3nXNJW4EdZu/
 rnYO0dHfU02IoL8w6j2n69kL1pX8VvlMVTzxD/6f2SSNHPgh6XnFsUrU3BV3xf9ZmEheakEF+Zk
 7Ld4lv3/yROO5XhW69dRqpxBYpEnoFDQ9duhJPaucHYLdeLV+xtQ92v+JQG+3c//r87UK5eFzHL
 8GWIlCHMWStARJuICBGYV+jZo3F+IqkcabADTSGj+/20WvVgx9dPmasK/80wdnmDYlTGBsAnLcK
 UjkFM/1z9H3GTBHOdPoG5jIU3E3WrCMPcSfhXiTuspvWw1K+aJQ0pOrigL/ZRUnW7GpZsCedmeC
 vXRKcaHjSfHzVS+d6NkmI/n3JEL2TjficqLZ5EZgws6JCNV5f535GPmUrzoWSKEq6qyOIRnPZkr
 Wz5pr/zPCLA57d3UZMB1P+p5BeCX6RX4QUrv7PLx/+K5XGHyFfz7dNHivs58U+m6MFsejM2HQNv
 jh43FLFaMiJ0UbSl7xg==
X-Proofpoint-GUID: PPJnVVxlGd3y7zOQk23lgS0ieCb0N_lU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on SM8550 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..7137efb45346 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1195,6 +1195,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

