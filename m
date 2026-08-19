Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3D2339369
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144033; cv=none; b=QThdFoRSzgZ++fB9iaYIZodbkWMsg54xP8HfCsbxiPkAqtfZpplZ2t18am16iqBGOp38M2ZCv6M4aeu2JkvS6xCmF19oX8U3SYWDW6yyqqjhxhH8RUXypDlB7cuDrnZPJRo4W+j60atGNPATlwWAAvaTzo5+kaAUPnj3NGqx8k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144033; c=relaxed/simple;
	bh=lRo3ALU80eN8NLOuV0UOQeuSVv9zf1v4drYuyPGYgDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tP6hjmDNdKj3qvLQbYBEat6qzyws055uwM93FdiZISF9adtYygDW8/MUeR+MVhbd/47Vk6JXW1JAdqtccCfx7lgpaW7g9ihPGEPj3mzJlxRPh+zdW1oQM1NzT9RCw/CTtRVlJZrgxtS8G10LerpYoj2YRqWdE3hvA47ZSY74IsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFJEnTZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7alH4rj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFJEnTZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7alH4rj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClwrX4084620
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=; b=XFJEnTZdYpMu2VIZ
	j6hg5IoHaxF5SklFUr4hi0qTCz3Y/Y+R9WHB8cHgEpZI92VVsrhazwiyQfecRlq3
	q2XfDbj1OwaQS5H3ipDtg1YiR6iVIV5+VHCmnONGNSi0IjmZ1O4KtP96OPLnyx86
	YolCeCNZkumz92sSN5aIdMF+CIu4n05asoEZA1OSBq6bfbbUHLdewaC0vq5MusRE
	juc+m5EWaqYLaYZEYhLYQFM2TLcfKCCRr1pjm4IK9UfkP4Tl6ErtsswdiPbdONav
	26gkwIPIvgDVSHlpz1d412zRcsTAohzVo2NGvzcEnHGgb8CgzBrnT9mqujDZTaE2
	j2s02w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb8ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936a796a23aso87829785a.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144030; x=1787748830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=;
        b=C7alH4rjdVJNbB5Qt4HADTINv/79GSe18BNjodBujhgpacgYwD8NHvdmYHyhl+SZwQ
         ap1VtgGh8S44dz4jAV18U/+W+J/NJXXU68Vox5t0acNvNxR4oWxP8MctOwSWbikjq6s6
         BhI6luh2N7rhLW11e9i4ofxXoPI+rKFU8w5DbeHVZgMqOpq6TqS978W8zc50HUQzaoXR
         6xIUpfLJWepeQQ0CfOdMmSzmQMERghR5J1roypNc0U+GvUHgT0phi0tc6KGScIfbiASb
         R92KairbzzeaMXfAUP25sOO64BddbcTZD4tz6l3eQwz66K/zeShRQu1D0toDB3ZYwczO
         Vs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144030; x=1787748830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=;
        b=hB6YdzObaqIfm1duSMTwGHrnxi7OLzvjDo8FWsQRy78sfQNZpJKIdWrYAaSxnLAFKX
         5V+6XGq06HI+lK9KaK+2hBedS6M68bZXacivfrlUJYD2OczsP0+ffI0oJM0kT120X6w7
         N92j4d2KVbyP7D2g2oI4dlYD0Q/A2QYAs3ZM++KyUmHEMQnhjpF2bjMGXtpADqA9ILeT
         y2Ps/Zlen9UeUigayiyaOBZ4qt11rH5pYy5YVmz5A5p/fDf2a2wVd9fiwFwf1UsRg30E
         yclR6TmLkyvj8y/VEj7xtJOEETYzKISrRqCmx6UP81ewbY3h/kXBxnhRwMZW/X5lfW34
         tu4A==
X-Forwarded-Encrypted: i=1; AHgh+Ro0OEdzBmbwxobDfsqvHZyWBWbF/VY9a3+EjdMnbjQQu7+bUsjF7K+UGNOfY9qE5xiv9QYD4eoQomA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Big6Maf3JNT62QtJDP9JlvdhgGFwstxvme9diCKbfnZZg9M8
	MnbGlK2hEk1utEv77e47uQXqgT01oyVjhQ6K6SA3gk1VmSS0fTyCnDONnfa57FUq/fBo9oQSL1h
	8vdhgmkG7PdflMp/2fiz7SgjNnyOPLYc4ljrVxIGwsB8o71qJwXQRx26hG/23SiQ=
X-Gm-Gg: AR+sD12BQEZr029IX7wEsPtGzaqHgw2vLsgTu0bm9CMarwMMs+hvzCYZ7HDNJilkvfa
	pIqpPYuHqtUcTJCze/nHR+CG8Z2LIopdq+97j4m7C0I1vjqM5s3DeCUL6yMHn7swicwEwgtU8/2
	kjPc4BLunSx/AJ26VY2P//KSHSZWknvhjLIS78nEhb37fNUv242/mAKfltNX0paUDq1WCWcpfEP
	iD9u/gcQ2Y1Tiq9ECK7wBzPjNOlZ7P/cNh6JYhQtoZ+WryhfGxE4/It894HcBsW16gwwHsOe0Op
	S83sb3+ZeDz+4aM2OSs3SLsEYCb3JpMt6L865bv7IVgu/hea685ASPyWQHtwMN6lnZZLhwCFvPf
	koWVZV7G2
X-Received: by 2002:a05:620a:414a:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-9371e678dafmr348878985a.32.1787144030198;
        Wed, 19 Aug 2026 05:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-9371e678dafmr348872985a.32.1787144029511;
        Wed, 19 Aug 2026 05:53:49 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:52:00 +0300
Subject: [PATCH 15/16] arm64: dts: qcom: kaanapali: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-15-840034124e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lRo3ALU80eN8NLOuV0UOQeuSVv9zf1v4drYuyPGYgDk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacuJl5k/5gtHuqN3D8RE8paN6hliA07HJq6r
 8euavzM5EWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnLgAKCRAbX0TJAJUV
 VoLaD/4nuGMbWI7OW63djbaG6+v/BmDy/5cdHu4K3Swt9y/UfsIF+OnfoK6t841HLXlvbclaiq+
 rDBnacaHNa1MHwICcGxj+13QVOSHBQVEJ7dZMATxTHEMCieN0Hl7Hj1QpwWRE364B5ByZfaGWRQ
 4brGQOi+zC7SeYZFukakIBxDBZqzmhhzRCVuQkPa70O6qVw5cH+FOvtsdfGwklhGJzPlAyKT8xt
 4K3qE8EpY0aT+QpTbq3nLM304xBf15T80ptXU4wIsa+r7bObkAhrF5Ub5yumDAZZc7VtuoFygpF
 X0WUW3mPKXWfKGq7a/eOD1os9cbyuxHgh/gRnr6AQQaqYvX+8RhgaoSKWtE+jqiW2uUKvWMgwKK
 YqBzIOiwkYdIvQ+dw9DJwtv2YywJCPQbB6zW2YYb5n4n3hUAp/1crT5gITjYiNIoyix1hj8y4uA
 HKcG/RiRjuTrIWa1pOi1r/geqLapIhjS1Sm8VdNmpMtpwYB6ry0Teb5XdVGbGKCUbTZpZusHaAc
 RTxep/GQWZYr2L9/PvsKosYnsffgfYb/+7tlOjMkPWHeclNdLevTFCnpNi9nL+HuSzy6tRneUgz
 YCqcJlrC3gx6T/JV4yLjWXMZ8NCK+MWexwEMY20bswTd/Ho7ckTSrzLnxAohDGshhuDDse3hf7a
 VrZDidkXVcilACA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX6llMkMX8AKEM
 9qHm5Te8qA2dVdO2QDjWdiptupc7qu67WYqvlXtwZAkVgYnhoeSk4rIGnvdGYzjqrqOumRveDkn
 STnT+66HFA3A07hKE1V+cRVhHY3WNjwljH6VXhDiGksQVNGLBB9B/a/7p5tmfy8JIp2DLpoXtQ0
 QKyLnppQ9U2w+GRXUi/TYGPxEB3rZDurP5Dzqr8AqeH8EXHkWthSOqG5YUfhiaUZqbt/B4J+PSW
 YUtuV4ethqZBjfG1r9k9kXTD/ge7LkF7GjZehsJxLr4jgxVXfcuvsC28upagOOA0UdBt4IlxQTm
 SxPCIu/sBVDl2GZ+EoIUoWj58n5r2Hxzm8ETu7eQ/mQlSFbS+haNZJEzRZV4aC2Pio7C5BJ86qt
 myflaC2Fw3trnG9zNVwp7XydasojhpxBB3skNNh6nrYD6Nu/BIN71RFiAGYL6ogzjZ7MBp1pFc8
 IupOeI4Tbf3BPUrYSGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX9y4ddif6rYHa
 wlfDMhD/7OyXmpOGr1o81zJh452tDkoP4v5z04vpcR9K3pwQq+lyIpy2Uq5UhvK+bVYpVGerrXS
 fOosrDB95j9Xj0fqBHB5lQYzQHLLNOg=
X-Proofpoint-GUID: 63208uJluGUbDdF7P0LkvHOwfVFbx5-V
X-Proofpoint-ORIG-GUID: 63208uJluGUbDdF7P0LkvHOwfVFbx5-V
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a85a75f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

