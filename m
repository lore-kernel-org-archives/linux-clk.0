Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A69E3264FC
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504138; cv=none; b=Y2ozqw7ZtR8NPC96aJb+X5Qvduc4gjZJmoUpxYgHhke6kgMX2bQF1jxz/77i4vJ9PMsqzZe48Ao92sh4ItyDMPcMsibx62JMJarb0OK5HBUqhP4bhyDEm2SoBRk4UMFOyhG0EaILAfcs5Mx+wSHE08Ni3H1ca1tbakYqr54PnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504138; c=relaxed/simple;
	bh=DUCkIYN7PQkTM1Z9PLNYL/td1wrOWsEdF8BGqnRG1II=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHlcrGiA8WAQZTSJK/pwBgEAJhoyfx0wuHkjnHE8BSPA9KtWRDYw2Z75LxrwVXeE5tY4yS24q9EclM9CDOHr9y6RwHLFujkKqm06BXMC78EAlXdURnCl8TjMh3yLyaTUx/CsI8QEuPPqUKhCGbK8M+jSVN1J89OC+BVXC1u7Cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xmr/u2CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dH+9r5uG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xmr/u2CV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dH+9r5uG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668895TQ2070552
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 09:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=; b=Xmr/u2CV7AYMxoIO
	NcpABX5ooZNdazgBQQgNK7M7obN3e7QUPg45MfKpiczO3QKeRrVvsji04B0RJc3g
	aaZSQzoKIiJFT0uaFbsRNUSn5sbgCmj+qxCbEThpUeurFltPLJzNj8gW0G74XOrO
	Sub8Me9gtv3WQY01yyI5uuKOIgPmI4b/439iL7hJUO6/2Kz9ObX2yoWowABmVKiP
	hcODWJRUBsWHKCGNbUqyoHs0Tx8w5rWGJQ29LKMmgDn+o2Q8jeMcj09hm8x/9jFl
	WtI2VHgDImivocqr330lcRVpWpZoAD5FY1KaXlJShcvmP+lW6fTfpnZIrSGKq77B
	RQDZtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5a1t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 09:48:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso9822031cf.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504135; x=1784108935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=;
        b=dH+9r5uG6svTgI7IMUrwqWRJutre8OCDR6JxUGd5Sa6yH2kZe+NA4U3FdBBnARD97y
         N8vEKIB2QdyPsFZ/DCdlV/x6X+XQU8h6pbuT7pfJgNtB9j591dp+oAn7UTqhYw572xti
         bWOljiKPYu6wwfHsGWmJCio40lb9gBMfAb2bUdA3Nk9NNbUaksnlyM/5Z0v073VMcwmD
         VllmaGNTrdeGfLD71W7MRhew4189lKjri51piOlEXWoPbuyIvWNA8Ru1Z5jy2f6ceGZ+
         0Y9yoDg6m98VsYxaSl/64cCqKLdHJJtz87aCJ8WxVptK+xxGdOVCwXqDooF6o+pVR8F1
         qNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504135; x=1784108935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=;
        b=WUuOEx4cX/YAKOXCyxBUiR1atm9onE15Ea/x8SU436xCMv01QcR1gNU40b28+lc3uW
         pwyJacx9YPyUQzpK+7UkPuNbg09TM3LmlY2dzjbfykQqVZLJfxTxs9UsKzmLTje1sgL4
         OK3x74fCbBBazuxK3PM8ni2uLlejd8ZSzJiS+ttficuNTxPgt/3b/muudVPlId6+7u5j
         Reg9tIUiRfYHTWZ1AoxAeh8lsz/YnSdVPxRdt0KlUc7yLpGetdTQX0bdiVNXQ0upmYuS
         u1ZqXSyCjNYvLLJdAeUt+TH3xjOKA72KsoEle37RoTzr1WpFv50Htq4oGVI4+IyZZYAj
         PsAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3RHtNRYDkkgBeHHmO1dlbsoaz7kLc0Zv6iEUJOKAMe071HXumQa0EjZaTExkq3C/80Uey9weMM0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2A7wxWhT41chbxK94cVU32BWM1v8jITjUsIJBvi6aIkUEGje7
	N5LL85LLHuG8dVVKBGTRabAsX2SCGq7QF7OE1QrzHxWKh0awKVxMkIn5gq3izJ8/lsJyD/b9eAK
	gVienMvV+JLWfAkOvvr+UbV7ULppVBO8PTY9+vEpwGNThhM9ZdYJdhJylZrg/0m8=
X-Gm-Gg: AfdE7ckkpe+znkyL+z1v2makifcn15d3b6gSg1JJsu9TX2+hQG4a5cWDY3+hJm7HqcX
	agAsEBlMgYBDQOmWJHbm5hD1L1GIMaazaiZfEnyA7mXryYR4WKTQAyUAKo8hhGKIIvPwgIeOz/e
	K4JLQZAfP9/rkKUydkNQTZciGkKVNLZlMvo7DFWeszHvUiL4ElsktVzjxFvFzddTcVdRXBXTI1h
	z+HtvzkgbCBf/AzIXKJ7GuS/ArKSaBBf9JCS68ywotkP87Hf2ZIJi4k1K13k0PMztWwY85q+5MN
	bu6iXQh5JM8d6vORcOkXVJhxC+qG6vKox5236xOTa7I9wFHQbo/pZCyqFQnuPmsCUXdjtVJm7FW
	OMV1sUXcUa0FeReegGAjRjBUTB2EBUevtvws=
X-Received: by 2002:ac8:7d8b:0:b0:51c:7b12:5fd7 with SMTP id d75a77b69052e-51c8b438724mr17568131cf.83.1783504135628;
        Wed, 08 Jul 2026 02:48:55 -0700 (PDT)
X-Received: by 2002:ac8:7d8b:0:b0:51c:7b12:5fd7 with SMTP id d75a77b69052e-51c8b438724mr17567941cf.83.1783504135213;
        Wed, 08 Jul 2026 02:48:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:48:40 +0200
Subject: [PATCH 2/3] dt-bindings: clock: qcom,sm8450-camcc: Require
 required-opps on SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-2-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUCkIYN7PQkTM1Z9PLNYL/td1wrOWsEdF8BGqnRG1II=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz84lfe5YIROdN1BkCabPVaylWxdjZk8huJk
 GAQiw4ed7OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c/AAKCRDBN2bmhouD
 10LqD/9EmH31v0Aydhx1ojz+rGogtFufmKVPX/qiw0CFJ55LtN32yqnEPTdkMLzMWby6WXtuof4
 6ANqHckjMiE5xQVQEG3KjhBWSLGhkyle821xM+L4GhLZux1g53gs5lxNntEEy3WN052nifX+MDJ
 +A/AbvEr89rsUyrp2A/v0UMzcZdLGC8z6PFgkPhDnCKzwixPl+aBeqenIbGWo5iq6/9QcjDbeP1
 UUL+w7VBd7SUMpyu50Q2Kix/DxSZk8NfgHZ+iGQuh+sC3ojzwG4N4ymMi7rhx3Bqpq99bwx/wBc
 S1LObrsa5TxLxHjNluGIVRjEyR463uQyRFSgbr/JPpL3Q/QI8SrGMVCnSnsv7eppkCWrxzlGQWh
 oJd5EK5wQ0kr6FqdwzSfq1WodACqhqiFnZQY6FRpg9D5L0J8xMfFh8TJIMQeegS0OPKDKuORXcC
 KTxX836gN3R/t8t9vAUl2ONdiBlSQY6ML5Fa9jqSpZuW9Zews2dl/9COaDFAIZAmepxdPqWyD+5
 iVZU9qFmBLbdOprBOk9nDxYb7MW69RFe0/y/CAnLy9WZ6EZ5c9v0/kY7iq5y9YBqmIeVNfbmJo0
 D3DHQSlAojj8USu89YqOfeFzb3qhhtbqmFoemr9mOsRDmElHIbT4Tj/vQ4F6Z72T52BaaLLI0Bp
 WjOGkvm0Z2rZHyw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e1d08 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-4LXpn4-ZKuGKnfTux4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX6IC1N6s1vwDa
 C7Ahs5pn/78x5+ZzaRjhMZ7nj1zYb/XLby85nSc1LxgC3pPwiX3f1jL3A8U4aODX4VTl5MuS+Vb
 jY+RW05jXk/l0Mjti+Gxsa3jxyaJlKU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX1txLzqYgQ3nV
 ax7McxionNF9bPlbieUUtPQTExlRUiIHkTflKFtCn1NgUzlO7RQG9vQwn4gq9lm+EvnHScgg0R2
 lTUEXNBkkTPtIm6V2meXSstw/HVSbnbsHK7PLTkh4nSDFkaPiwQKrptCZj86oqhKrTeNWm+Fkaq
 hLXmqtzOnw0rXQIwO5L+SNEexDoD/2D8VZDRrh7dLBeuZhyKIsA/RZZbqzZMYWvHTUEU7OcbB1f
 Pz6pXs6jaGLA9yEI8g15j226SasirBGNaMqezXGpsBsG4sYcxDt298VgLuYaYT5FHqTEmLLsrlF
 /H2h9CHBry/frhFoo+I2s+aDKJb3Pp1IOSjflqvAbEuQkVrLEihSxpqnS02P15Pzn3bb0lOOwlS
 udYwu0BCv8XifrQ82tr/8ub3Xq1R8vcFKTwYpCJuMTNZmYsy8NElIIVE4fTh/DRA2wFIVNggxv6
 0a60qZNjiSli+4j/iqA==
X-Proofpoint-ORIG-GUID: hppi76jFF6Dj368CC29B27AavuD8L24t
X-Proofpoint-GUID: hppi76jFF6Dj368CC29B27AavuD8L24t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094

Reverse the logic within "if:then:" when expecting "required-opps"
property to have negative list of only variants which do not require
these.  CAMCC on SM8650 does not need "required-opps" as explained in
the commit db30c1160ca5 ("dt-bindings: clock: qcom: Drop required-opps
in required on SM8650 camcc").  Requirement on CAMCC on SM8475 is not
known.

Reverting the logic in "if:" part has two impacts:

1. Adds requirement of "required-opps" on CAMCC on SM8750 to match
   hardware expectation, because it needs minimum voltage levels of MMCX
   rail (already expressed in DTS).

2. Reduces the chances of forgetting to update constraints when adding
   new compatibles (like for SM8750).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e6ffacc81d0a..b41247b257b1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -70,12 +70,11 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - qcom,kaanapali-cambistmclkcc
-              - qcom,kaanapali-camcc
-              - qcom,sm8450-camcc
-              - qcom,sm8550-camcc
+          not:
+            contains:
+              enum:
+                - qcom,sm8475-camcc
+                - qcom,sm8650-camcc
     then:
       required:
         - required-opps

-- 
2.53.0

