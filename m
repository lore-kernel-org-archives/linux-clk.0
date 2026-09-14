Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CB6489FA9
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390189; cv=none; b=A6XA42zkzSCENklA9JORbWVCOFiaWJ6TyO298IZZOnYCVKIpwHenTs/hLgS+ha1AmYLMR01vxRn7fsId5iCmd+uIP9J+fvkbVA77nNgB7zaL5X+FVFm/jscIphWDMU26jof3mS3eE+4CgBFtJQAoPQ1mW4B5s8xxqhNs/dgzbIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390189; c=relaxed/simple;
	bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuugO5YBghQez6SgXT/4yjT0YHVglyoocC78iEXo93qW4IIsCSG17ui834pMWzeaZDX66rFeceBZktVJ/6gG33Nd+MaaOJAU/yu97Y0iY0X55M/qoUstn7NEFi5b5P4aD/XdIgf7yfpgToWIMJkncnuURre1B7VxMIuh8ylHr/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqfXL3Wu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVDHUknf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqfXL3Wu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVDHUknf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7lu3291532
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=; b=mqfXL3WuNfTJan95
	0zEfCtCSR2SCfcngDxorQm40zSxOoNNzsOo3d15Oxo+oF9i8HV5K/8Tu60CaA8te
	saTApPnq8v3IymDZDJqiyuHThzvHs49pnPgB07s27plW5tFWGqx9WD5Y1fYssnbJ
	jkB3jmKjn3pRmDKsyohGAqxWlX5Fyfzf0fuVPSMco4od7zsSaCq5D4gV9fbkRc6g
	j3CAzB9Yg+5+W0ZKTbnRPYprHwn2XR79v+dIs7xhDmeaQVWiTW24PcIJ77sJtF51
	ZCQbO0JX6ezy3J8Ttn5tDGKkLzurDi8cQ10GcZJOXNzp7APJ6W4fBodm1Vn+2er6
	eizdaw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8nnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso414641241.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390186; x=1789994986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=SVDHUknfhMVmbgHAIAKKsP5DkQDF+zyGziT8zEn+YXu8ECtkjw3tV5mo+DY7rzgMX8
         zYgpy6m04ivVjBFbvvwH/gmSZ7IuASnKAOu356mPTZjY0hmBP8noDs6jJNVzftd1Q8Pi
         94r00oJO72r/s2GCfhPkqqAm9T0Yr/8Ptef0YQ15d6y9cueTogfIck8V8M4thKPENCn6
         EU6oYWOMTiLhOv3jffYVD6H+D7FVUh0+itDHHzpGx0K2NubFM/zMrskCLgaU6AmRdUZz
         06t/bORS75frB0M4sf6KlJuhEciGnkS3tfic1ZS5zBYWeH/9Rh4aDUReNGB6uwWeaY74
         HuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390186; x=1789994986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=sPVzeatu8MNYdiNKl0hIK6wOHQpGUBbAZfH/C08nWgm/sPgq//YRICvau/27d4zQQh
         rzxcuMzq31/Mh0AePooY6rQnIu+br5AN04AscWcQAxuYPQlcSgvUHyat/JqWKJu5e2ik
         mNiISDm8qxd9Kk+RgO3xj3n11S5r2v18KRYq/7qxO+2Ur+jCdsgpnfpmEwHd8dgIVPSw
         nxdnyoiBogVyB7I1DyijD77S2UoqsZpOegRiYvGI+BqUT/LcBZFwpRp6XQBj1/62uFk8
         ZUX6lURfhu/DRtqBInPxPd+EcDS68fsKyUxowlOVpZBlLYCla/9rOtNgNpUmrCOMS2VQ
         Hnbg==
X-Forwarded-Encrypted: i=1; AKwUvBxXKJFyaOXPlSCPOCDaoY+NbNaCq7tQgJBfn6IVeybowXMVWSh8QELGhhWRy3nGh1S034tvMdcguZI=@vger.kernel.org
X-Gm-Message-State: AFuF++n2siq9pjrFezMbHW1ICXmEMWgqZYY05hVec5lThgwWpnWdSyYg
	727tnIQPG+d2LPhRop/I84KEDN9Yn37ZrzZhQp5s8cBEt0sx3ySEkywLUnqyg96kuPmg/DPpxhH
	xtIQJrsEh3tFSvyHJi9bjKOmHXLyeD8IwdOlVmQECT24PgvQQv0GaGN6TdGxQPFI=
X-Gm-Gg: AYBFou1gr9KsYRaIwMGZX2r8gfGi+MAwaTB0ZH6PJEZdcYXdt8N8ZOYBPQq4kZwAxLj
	sldb7FjB/6odtd1R+h8967gr0Q5CiZbzvnfIVK5oLvcVXVWJdB4WQaG1Z6wmwR5dIMKTc/LCJLj
	zYrIiWZ1p02kBBClmG1HZIXumY1mAy9QK2E2Gq4ws/DqE/a+Ka5aqSjiBH+H0NxHVP6w0HMEOo9
	xif06EO+fY1drTFC8b1oEMzzKSFAj+mCW74OCm+M94Fs+oPAQ0ulXlfiaj0CP1PcfkWEpXc746D
	Zwmd7/23pp5H5/aIkpEvA1Kst072xGLZkQkdAZLsRR4lVILUmQYBywoyjGDwv+PqApMxyZuiMeE
	RASLyDXxG
X-Received: by 2002:a05:6102:5b:b0:79b:99d2:9cb1 with SMTP id ada2fe7eead31-79b99d2a141mr1030573137.2.1789390186242;
        Mon, 14 Sep 2026 05:49:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5b:b0:79b:99d2:9cb1 with SMTP id ada2fe7eead31-79b99d2a141mr1030543137.2.1789390185668;
        Mon, 14 Sep 2026 05:49:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:38 +0300
Subject: [PATCH v4 39/52] arm64: dts: qcom: qdu1000: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-39-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zxJSxO7ERYqtGyj7fN2IDdPiwOFWv5pGud9
 E9RP59TzFOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8QAKCRAbX0TJAJUV
 Vu6gEADK+ZnLlsirt79+r2rHNUFSIyIdKSzliw0T9VVTxSZQg/YcDmXxbBRgcyPciztWvuzsNRc
 A9AqBs9zRv/SzjOf7LhY9bkQeuQ41lWNOaijRi7RUk62F6y9WkMESXTKcbjv8diQn20OP/htCnE
 thhXO/CawaLrWWLFWG+PflSCw1wsTbrO8AgGvuxeh1lcXqP8tHApuGeg/1QGf72wGiEsDCM//uJ
 PRPOSe6W4xwPsSO03TuZuBdsW2gKeRcD+Es4kDzgZwUtUYSA/mBSFYGZpVwkMLA4Bo6iG0YDVVH
 Or1REhoyOYeWjnt8NM9A2gLL9UjDAv2u3skL5RN7OPNp+OQZHIlmt0dSGGKQ66/zQtcOa54rk7/
 qx360t6svzgVV89k/46/F1Hrw5OFRnlFcvw+NbQ/lOhznpngDENJOzQ0ovrlWCVTyB+haespzmu
 sYAnjGUwahewVRaMxPKmqP0sWiMWNZ6dDgJmDjh//akP1g0PZoWItxefCbytWCdhqgxSY25+Xfh
 ZHScAmHkk++D1Hz9kftR5y0p4cD6mv0wSepWWx7OkTvqbQk8+xr+tBuJPkU8YJPGUI2XXL+7GPH
 VLal4DGVdTNLFmTO2zWvy3gdOchIMDrh0yOMsalSOaz1ajUrZXJRxYZqSz5vwunZuLZNMywS9AB
 4XE9OXUw4azug1w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed6b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=frXxnpyXSSLf7P61oFUA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: YktwSTwWhFAacJzo8BfWntR2QDhregRO
X-Proofpoint-ORIG-GUID: YktwSTwWhFAacJzo8BfWntR2QDhregRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXzEQZvP/w9PzV
 9tVNHd1s9p0UPJg4rs94RWCfyCTppdIdDiyiYuWvGCCvzrPI+gTQcXG7N0YbvwwZZpXIPBd0gfO
 i2FT2IftmV/G02Z99McHHmfSZ6ftCFu35/LQ5vCjOPUxkX4zxa+k4RRu/atuZmEvqb37VJgAcoR
 G7sCY1SQdYzdqnYamPtzxFkIwDOyjqMvcDy/n0ZL5iTUE/rVt5brpvXAO1OBSKpHWmUaWQ4vzkh
 7LBX8c/HCf2BQyDLsIgDzxl4Jp1aFAb1UFzq55VlA30Td2iANGq9f665U5GEZreD77gS2MHcX/J
 7K+YGfmnlRFbvGv/0AAmgUHy/GNc1kxyzw797dpSPIsqNm07lHXygZskQKtNTMHVgClu6A6rqhm
 6GKadb3rJ+i+i9vRcW0pgFkaQCZRiBhFJqwRdRZMwCUvmrYAskY3XDImIEzVLRtsAHENtVLjfw8
 1EmBMD2hbGUkTJSbXLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX4CwEWBQW07af
 xA17I1Y1We2q45pdNRYVSJsXlA82U30f5Ld++ikfi6gsZZnpc1GvQfjH1tJxV0+4+Sg4yKEvF3/
 42LT39nCMiDfMKfG13ZCipQQh4PciAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on QDU1000 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index af106aebd30d..accb4b989655 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -396,6 +396,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd QDU1000_CX>;
 		};
 
 		ecpricc: clock-controller@280000 {

-- 
2.54.0

