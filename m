Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0AD47534E
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390227; cv=none; b=dtdRvYAhRm8vFBgMH4cHARymNU9WsqcFAcmriz6xgSraa1M+7ifi1jaDS8tfCuwgFlsnMGWKRiMYq6Nr9ucHVar88M3/Ep2oRBy9VdzoOi1Us9jdyGqj8Tknx22PpWhRvkEcxGDukgnJ5nMqE+Ee43pB6GHB1ICLQ/dfKrF8eAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390227; c=relaxed/simple;
	bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUwoJRbr91hj43LPew48XC5/MoJO1zfzEOBArgyAyN0/eURSYAl+CNDUXTrDb7/P91lpdVnj9toVTV8Eh57BzjqBJHRnr8TfpIf2TCSiKoa1I6vR9p9bw1LMJ+qIEV0CiCsQkv1JNFhXOoR6V2K95KmczgHR0SsnJncOTGLLFD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceXaywzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXjWjJR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceXaywzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXjWjJR2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNUSY432082
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=; b=ceXaywzIh6R1jIJP
	UFiNZsonKkg5zt1wexhmFMC5/jVxOYKpJbraPf6xkGVucuIyjVtfuTRTcobFs6T9
	ysJXr7hIxUdtrM/OkAvcBQtS3HKR4x7iQN85BfIxkq/xrza5g/OG91cIlN6cHrdR
	57DVCPJYc5gO1mpmgjkQgNchC6BF+lK0HqDoLQ9aCKpwRAvRi0mRY+LgXWGKIV9n
	nIrvBJV5Cuy9hscq2sSJUakn4z73TheeL1KJKxyWMy5y+1NGq80UZAy0cNPcLBLd
	lDO9XTcDnUCJpXcF9upp+AkPYWPaTEIPTRnSnsKQh6yx+w4Hi3yOWsAPb8w7qjG+
	d+nbXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso359023685a.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390221; x=1789995021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=KXjWjJR2Y2avb4KMFFJ8xehP89QmLmWrJdJNxU3TGXTvHTxREnJx24htxAjRNlaHOG
         fHIa5ZB9cXlP9pglVrKsoSHYOmgCtFF9qMWeThOXjOaaJj9EfP1gESGb7WxPnvcLEm33
         wkdHaQmfbMjo5fq27rCG5eI121xw56hQt1d9uXfT3FmVbYHZKY7sH4+fRvn9L37n3+4S
         CiWIFy2RqFvwYV1P547XtMMYXlptx7yogMcYLVR+IlK47Zr297k9UpydG2+vHpoMAB5f
         k3khcERLoh4ilHuzyphpyYiiN5uTkbZb8kSChGgDql7xJs5AXxv9MRmpwwdeYMLOX/ZW
         wzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390221; x=1789995021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=o7abxQNt/LKFjVQWx1cO6PieAI1lB/l2PTcLxnwah0vH+k5KkRknwbCstUCalVLjSa
         xSOXe3muQ4VornwpCNc5oQg+a9JBCLPdGlXFXM7G21Lod4sOdRz6pGbnBhcbVAVuxO8m
         aneo6LuXzJLeFoWdArLRJQHmgVH+V68W2ofcIhqgTiOR+sbhTYcq7JMBqFG5/RBmcF0Q
         bFF/i10rDuXn4FG5d0N7OWI2XRQBiiiQnsNu2xqtcFTaFkHP2KXZ+vPSl4t8ZtvTZKgZ
         oblw4onA42AlPOoGeZ0grhL47y5jOjzVPzJHxb8x3fGBWbxn9uboImZmXaxQ7i5NZa2e
         t+XA==
X-Forwarded-Encrypted: i=1; AKwUvBx2FT2CBsNSlEZ+1NxFNorxWeRM9SbVn7gW0nzEqjq+RU++MO3tLfxYKPVt3MpXlemj3zm4a+aI3rA=@vger.kernel.org
X-Gm-Message-State: AFuF++kK9C0b+9S/st1rD3oaubjyycxAaP3z+R9DHwk0HvKVHKxWqgZc
	Na6KbrkppE+0grOdvSBvyxV8vIzzdrKja/fnzzCrs9NgHosuMLNWYIRTWvvQBPiiexp12CM9z+v
	+hz4RiOAq9bVMLnck0onmIXEWagBT8hgvdfm/U17PrlFy51sy8OyCeKvyEby6gxg=
X-Gm-Gg: AYBFou1w6KdVK1eTVVucm+Aj5mR/3ZlZ1VuJyPQuqL7XuTZBb252kdpKIpPLAUCD5Rk
	13CcczZe/g7YtB+Llt2K6KwlLq2/3imRinysVQF36YU8qut/PIqwaK4Wa38corQxgCR22ohW1HP
	wgYT7nPYD6dp5jSvMIq170gE0U6Q4HUkYz5MlJbiT3gpZbgWlucxYfo96pbxG4qfWBEIgdZczS4
	f15mN8OZRIO2xaDaJNCaw7SMyKsJvYHizexTc35i+w5or6njrGnUIBrBZxXkIHO/LPLfgV+WSEV
	bgbL24t/zb6g7+ZbC8oLaXYI5SHECP/NOXjRLM3HeOBrg4pC6sifvR6t36D6+5ir1SUQkvYFYKc
	KwF8R38Tv
X-Received: by 2002:a05:620a:170b:b0:92e:e559:fe6b with SMTP id af79cd13be357-93a297e904emr328332085a.7.1789390220968;
        Mon, 14 Sep 2026 05:50:20 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:92e:e559:fe6b with SMTP id af79cd13be357-93a297e904emr328322585a.7.1789390220145;
        Mon, 14 Sep 2026 05:50:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:51 +0300
Subject: [PATCH v4 52/52] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-52-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z+OmJx+PqFZf6u4EjFnsf8uru9IyGCiqaYO
 pVC5ZN5b/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/gAKCRAbX0TJAJUV
 VncdD/sHJiMHTA/yytuKmvV8g9Ltx3AmWpGo8uRqI6hppvjBnnbrhciliYWbGPcPF2GWEoJzVMl
 GJS7yXUqdhhF2KW/b+t8xXoj2wRBQhcjPYPmlDoqDt+K+/8KhMmLCIKYbNtncQ6bLQx5/s9kRiD
 6eZm/Wpt1iOpldSRc7OGOPtMiG5REfUWKo7I3RkB7SUpLddJlDAtEOvJHG+BC74mYLxR4lRZhsY
 yBvTKkgExgFlPENRPWx01KRgedmKlW3Pr3cT0nqBlDe4cV+GVZeVXGr38EVv5CmswCsWnzks6Nb
 9evnjhMm3Sk0dpvYv8Xu3pC5EVVoUpQjA9uATiv1rraC6P5y8vUn4Gm4ODfqCVzfF7kCktWVGIt
 y/TMCxGmqWZX+tlzJS9092g6J5zQ0feMsP+HHi108YKka6nXxrrfeVYorByE2Q6yUFBeY9ZP7iW
 EWbKpYWTtnWBLJPbZfebiPz3/E49tjIFj6IktqLX8YeAyKW9BPILpJA8A808oasnV0qW5tzS6V6
 c9rD4J1gajttpdDVgctcjg42HuhdK0Jw/tcvlUaj34NE3VRdcV6qOGe9xeHOXEXUyzLWw9AV1oK
 R3npk1PqmM+N1irkQfFkD33pJWAjdI5A75O2QRXGJxK5UDa4GJi1/Pzmpe2VAE46kpurYHv1djS
 /OX9p332JloHFFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX0B4gnEN3DdfL
 pyBrXzFxTS7rVHlwkxTkpq6L5W5LoWyE72xZNolLOc3Jl82DM+saNGOXagdf8Cu/GWEyWf5TArR
 qmV4sJyNN2awyQyEpOe7CXu/OFsWOOQ13hSJkAQomHdRSIen5VCoPrlaq3mBoE2poiFhZVO3XQ+
 LcaVCL+Mmb1wfFksFR9wZCNNVV+cxzIlgvmxzXsTGlNsJRxeZydNzVQW+7Gla79UATfxnZklbWR
 lygsBY3a6IzCwSP1zDmoUtfqu5FWQQdsJI/gv2f3yulAd8LgC3+sfBdIDVTub4uGKkxewDg2vtI
 ENMz1Dz4n/LpAGwxQF+NGWXLB8tEKGHGj4tfbK7Ie7zr3Lc4JAS4tykNVbeg5E/5CbkG7Y6NR0p
 nNBFNynm2j+PoJTuQys3adg2+V5t/viSttYFSxhcZP6vU5gkc+MTg1Nee7JMnbaXnarcGJGPSsI
 LntDdX74cwobsiwAXKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXw19g91tkbXo+
 hsJUVPwkNf1dAnsWCNGcfzUymOdV6PDLFwyb5pbKyFfr+xmWM1p6b/OtXb+aHi9InEMXD0sbBlY
 IWzlBwv4wAp+h9OUTJm8WtiOyxmXsaM=
X-Proofpoint-ORIG-GUID: V0P-NqvGYplETuMt0bgKGiWitM07wmnk
X-Proofpoint-GUID: V0P-NqvGYplETuMt0bgKGiWitM07wmnk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 531cf41b94dc..860673697f1a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -705,6 +705,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

