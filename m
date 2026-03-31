Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D92F1FD0
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934690; cv=none; b=r2UsFMAhCV95wH+xMVeSszBPhxyc3o/o7aOp33bEAr1OyNmID4bPsfdHHlGlGgmYhWK3brgfaLXiSOvZ2kum0aE62tz9uTRzpJG1WrFpmuTIQXyGn6Cm4GxxGUs8Rx4WpVkJDnR91BHqssk12rQ4cOXMuz59Ulphk4CQuSXLAgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934690; c=relaxed/simple;
	bh=lyO+hk8kt2i0G/vKlS7Khc05+qw6hrcZ6upbhob8yAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkZwvVfaGtNml/SaHoJ+fiHze4U4wtKQdz7S+lo++7+3uuQnIDplTMbAAfUgusTcuRTBEOe9oa1mZHCQgm9RMvUVKsjaWXB0ZYdmb/nyQzFN0/RxkcQBaX9Ztptr4PXfPcYD3IJUO5A9J3t/bXeCnFw/HHdb5/nyEQbw9hcD/EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BL5yWUg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVpeXFd0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BL5yWUg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVpeXFd0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V3lNaC843021
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=; b=BL5yWUg2QiOy1RwS
	pa74dz76NlVHOqWz/jKeNQVAGne7nZqCWNJbzbAWZWGlqcG2DfzQwJgqFQommool
	zOg3DPyixnTbja5avRiRTARWH9vlHl8JnTo3G2wjLMR/g/qQ/9LbZsM5PQ5NC3Eo
	Xi8/3F0Unpej6I2vQkvmFxzIlC3mJYPvgmS58Yxpdavse9u30QenJOiluIYgT9jL
	QBvK8SFGmR5tgzWkrm54Uu0AwWOmcLoMp22gRe1nQ07JYjsgq7HhH7VRwNB26kht
	6sO2RNahCh7mpzo3lvGjmR3WEgubAZudfZuCTyjtT/YGvJxYa4WaROE+qn4ie0Qm
	spm3WA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt89bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:24:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a77f807e4so8831706b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 22:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934688; x=1775539488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=fVpeXFd0+ZWos1viFN6X36Y+HRVJ5oRBytIdCqMFaODmm2qlcgOzZEbwPBRinx80mN
         9QXzp38y4n0w8yAgdQkrQn1zZ2lsetR9melBu8yaGCJK32DHL0NwcXfQQ61ABFoedh5X
         SALtEbiR0cGs8FZ/EIEoc3DSl4Q2M2h0fmpOqEhHudZCsfFH/51KSH2p/MmeU8ipxHUX
         5dwI8FvykQUo2s9EiH0ySnry6oMi/25a4dQW9mKR4vllH2BhDJWQxMQsDU/8cg3Xbymg
         2u6nfms3b3zMV4DgnMxH5CJbaLVCqRF+52lEB/SC3Dy//8fGHcjgbT2B9c6/MIv83cGB
         xPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934688; x=1775539488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=shj7pIx0HW8JnEX2AtrxvtiajNKJBFaAvK74obltUnewkZ7sZ1JhIYhomsA3yvVbdz
         PRz47kz0RFlOsushZxjgvUXUjnbnkiWK9HF9rjLSAeIhmNH/sxhRjDit1OHrEHY6SXKp
         uK8p9e9536SzZ8k5ozM8Bnz+2L5JrFpvJRcXmjf03/5ypVb1JG0qHCfC2lXdfhvlmYUm
         nmqfNf+/oooBrFxMxzccmfmyNrMt8FpYHdvv3hHCxnZqKKKbU/LK18KhbINiDJpChdEi
         wvFegXl9fmUug5ueh78X1X4+793Z4olh03YBZVaOXWWGB3/VYIkJpxQwKKmht6N0mmHF
         xTXw==
X-Forwarded-Encrypted: i=1; AJvYcCVwHetnuvmitGENL5/6/i6pBWcDOupNMQ0jVArd11RAk8RKoj70DnTdHx02HOH33qJMkgMowaqJcZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvUJ77vapttzeEx3XQ/JGmYn9LgOhILHaT/HiiNS5CZmrXqx13
	yMcSfeHmhLwipxYqcIl6mWJZOkk2onZLKPM/ipJ6ftDWLm+klJEVj1I6BafY9vhmJe5pTg0dSp9
	+ebodrA4mGrepGJZpDZ+xDAlaLYX1FOxV3dxS9DXG87xDdc/TuENkTWcNqyj4ASg=
X-Gm-Gg: ATEYQzxgB8kad+wOxgJskoIYFir54pL9BBYfr96yf/W844pX+SME4XTdpoOEFYGEB1S
	OqoRCYE+y9J/YWU9S51UzQuDE1+V2aPfyGMx8CUBrTbuiGTXun4GjN+kbLYX3Whn+YtxLLScnlT
	9gr0mWTRSh/j6m2f/nkKyixvG9vADeccIf8oBTRVXx8SPPKqmgnZU+YExU+N317vS5A3KMgt9kw
	VmZU3QG4TJQpYTOossx+uM2RdsmilQ35Hdvtcwu6GX/b0m0BAQqjxFY42vkWaaGYR5QWTG26x2X
	H1sMUAvk+TdqT0NuPkS7yiWpvUT/Jr+tihESOtlI1iwAmQf1Xg1HgSg68nOp8QsP08FfNzu1/rY
	pCwbVENFX0myvSzSF9+PBi+h+xOD7LuLgblxkVD6qLJByS/5F9mUe
X-Received: by 2002:a05:6a00:6e47:b0:82c:a59c:5ec4 with SMTP id d2e1a72fcca58-82ca59c5f21mr8144435b3a.3.1774934688411;
        Mon, 30 Mar 2026 22:24:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:6e47:b0:82c:a59c:5ec4 with SMTP id d2e1a72fcca58-82ca59c5f21mr8144412b3a.3.1774934687769;
        Mon, 30 Mar 2026 22:24:47 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:47 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:11 +0530
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-2-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: AfYPXKp8QoGK1zsve-KMBJ0_fvmJduUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfXxL6QkPJR5kiN
 4fJfP6WqxkXaLHHNzZ/3NXlq+CejDZCNaD+y/xqewaes8PtaaTh19LdlEyGW2sA8kmmbWiKjkvT
 pkUrjx+9SmbKDsD3DFjkYm8gD7wfWu9UmCSAhq5tqA8KsIB/6aVUd3oXQJQ/fKiALJTA0lqbKSk
 AmOxIfFp6NBcBQv9TzvI4RjMkZixBI6zMzgycAV3m+Qv43mD4Mhxgp+pzC+SHOfmIlFV0esKmfo
 KZvw910GeVyojaFtZSeHMYOxQTDYz0Ue+oX+VhgapdfZBtnhswP9byYXTayGSZWguiiLjCNe71T
 BeQXOFt8/0KN4KiCl0QYgbCpquYv23WVpjLpZMvcDS8T0IcbF9Z6/vI60cfXLaFkJR7zViuq1tk
 TVa/1/+tN0dPvkDBL9WUap2K0AvUKOzwVZJtfAz8f1BkD/TJW+dyERHxB3Q4rf25QJmy2Cyf8Nz
 KMtn39VBT1Frbz0zP7Q==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cb5aa1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: AfYPXKp8QoGK1zsve-KMBJ0_fvmJduUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310048

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both X1E80100
and X1P42100 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1

