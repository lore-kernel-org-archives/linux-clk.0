Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5535D5E1
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526237; cv=none; b=ayokQYeeOuQQF644s3IWahzHggx9ro5UYgPmbjCaJ+mNskhA0/LFORWD380vPX+kLa2d19Wb+WZTH3BL4E7fdI0DvPPsE8ioCG5cmRvVQCfKcxdmyyTT9l69VT6u/sBGBEZzKn2a9v3bW82GK112u2IAELz8sjDJCf//irirMfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526237; c=relaxed/simple;
	bh=TXhrdFbeddVzdxJSPpc0JsHd7W0RNI6taFa1JQtw2Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=liSG8E0neBeIlJiRNlIisrA+id0a+clZXvPvc+JhXvk7b7nn1TCD3wZp5Uh4/lgGEWZbOQg3qPJweeokKDN5t1iOmSA1muhaRX4orQW4mxlhw3o60ixZKJHfTrW3xEKUpqlFExYBBJhK9m+/yR+UK8CBg8plC/XqHlRiUvdJ498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+1M+Kuw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzETJHhU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+1M+Kuw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzETJHhU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9qZOu171364
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=; b=E+1M+KuwKk9/1Y/H
	aspobEv2MDCb8azGJUc+0JuTyGv2FAc1/7ghtKu35j4piOts4blZwlL8sBC6nDHR
	VdSfIWfANB4cC2am566fS5u7VQCVo0q3S2gtzO9sZj5KrmZjK+crkIIFZpFLS7J/
	Dxi+JROufmbh/INQ6imHEOwmPNsMlTskJNwp5ZvYuDClL/yjMEkt/J5WsyViZGiz
	BXhwNagLWi3OdqUR5fIuBKQWdzFbwd4/PV7JxRrUbU0YW7UVqmz9IeeFqAj+t2Xs
	a2DIlFTJV94OA4RooA4JY0w8Ir6DHeoOAIiu+JFV4xNOpbblxTleuqlJ/uvy59Jq
	HHotJA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a38c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:54 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5634ecb51a2so5705676e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769526234; x=1770131034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=;
        b=NzETJHhUIfLpT1U+E7GeFbqOiPh6R9n9GtRQ3BZaoUGOdxLRxDCvpdIZDTu6/aoR/x
         lZTdbxjbop+ptijogC53NJ8rAYWGK4LGaYqNMz23H6+2AxfeFNWHLX6bL/xTOe4+SVuo
         KMkskAuRppcvHNkRgni8ycgD5Un8agvf6z0gykjkzbRbvVmu0maea+O5OL2W8kscIrmL
         xfBCUnWKTSzjk4EUiOpelKAGu0g1DUc/WmD2XEyqcQGCfzi5y2h2bgCIXIejNoRXQmJb
         VOjUe9D+uE/UnuxOylot7ZrmwiQb72+G05hg2wZ3dLa5Ro9aRi6ovvqIsbEMcgrs4plI
         gj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526234; x=1770131034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=;
        b=mLAndVMuhPNDraSvp/u1A/RfNc4QOR9sm49CAb7geXeeVyz3PUUKhwW1lhmd9EhJLd
         0uLxR3W5FoLmVQE9I/K1GQMiJ4X9exMc8Az9+FZrY773bawn0bOnFRGYFLV6mgEx9Ndi
         mJcA8pomSGjxdC+k2toYiKztRMAWNVrN7Hf4R0oQfvuUbJo4iPh8YrBzVjwVV3dxeC45
         ngmRjjep3/MJsP4YJLsKNg6MyEcDT/628+KQdhoX7K9QFk2n9lFdAzZfCr83xYJWGe5g
         gQWWJnDF44vgpZ3W9+NnYAWzlka9ToBZiUjOAzaVQg3/1g9SXNbUWOKldfvHGMjQfybC
         78oA==
X-Forwarded-Encrypted: i=1; AJvYcCWn+hLL0jxqyGAiMWA54b3URjhOUcatNISbm4fufcmMkXvLAlDLpWU5t6YikeXKHJBtXYfWZL6JoCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0xvi06qIRnq3oZb2tTm+SSrd6LR69KTvXX9XkJnhJOKZiggI
	1EQoCZvs/ByjuMqDCx4ZwhuJ1yy6eiuwoK7T9muAMl1UCYQpGUvzZBvFORPc+GzmSyZc9OgmyEe
	wcjfLkq+e/9c400MZ4ZiSqy5Z+Ggpz6bb3nKsQ7s6ZYoXokoJA+j1mm3TWS/3I1I=
X-Gm-Gg: AZuq6aLSw/j0AJtL/EU0md+VVvbAp9bu8FF+vmKXpvP2xowG0WpKSxB2CsNoOjaYU6h
	YzuTUXCAngJ03UKfoqaliIcw5JqF7Bc7y230mFh28Mw+mGFKd++cHGDrOdpHLoPqau/uk1Ity7X
	3KA5w54cswGR57vm0hQAa/jPPUIPo5/N8w4cJOv9oKksvXl9sawCO0t1GfmNFMmj9jObWYmpuPV
	UoKHpFUIDU/5B6tbxF0JmM9K4ljKPvrexEFjZqXM4WQ4iRl6JUvE+CrzH4wDSke2139jDw1Zunn
	amYFwKxpG5cD1Csu7Jeiu53QwRMKBWFb9KUbn2VhEbL/zmuNX1ynU5GlMvFIN4IDmvs5AIrBva0
	+QHpDvaR8C/sStOAGiQ==
X-Received: by 2002:a05:6122:3d12:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-5667955331fmr606594e0c.5.1769526233575;
        Tue, 27 Jan 2026 07:03:53 -0800 (PST)
X-Received: by 2002:a05:6122:3d12:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-5667955331fmr606505e0c.5.1769526232948;
        Tue, 27 Jan 2026 07:03:52 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm36895097f8f.8.2026.01.27.07.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:03:52 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:03:21 +0200
Subject: [PATCH v2 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-eliza-clocks-v2-3-ccee9438b5c8@oss.qualcomm.com>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
In-Reply-To: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bCIXMNVOJjQxQPQTzx/P3Zuxeig/F3AxRLL0jD2jhYU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeNPNyQOWYUKaRb0NayzR25nHoATCx63h65d99
 +HXFdLoQB+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjTzQAKCRAbX0TJAJUV
 Vhm7D/4x9NYwxilpuCTTE6VxAJFVCVWskNbl5fQuiGty9dBqXmFePjcKN3JrT0WOVKmZ/RqJsa2
 4Qa3vhFJxYMJeRFHLrC2f+EyEDu4CDKyg/yF6uBHmobTe5qtNHlOheka+A4kr8VgKEhwp8GYYhn
 7ruQ2x2MbfZpfyjep9zI5UDvbNjVkP+qgAgGejHAG+6Ud9UIUVdOGX0bxdxnZPXSXddsD0TtcJR
 OOHbnd+HRgX/Pl+NB+JwHhZoAGsD7IcH1HsB/wuKcG6gNRSzNogVo9HDbS+oonHpIrCm41Qjmak
 lAdmTZIoJjPeFkEDzUvmohKbTkyamFPxfUknOJCmRaJUibgnbLMMciJM8X7c95bYkLXtgEKDAjs
 uo+pwJeZvw9e2PpzSgBv1jZ/kRwVrdas3WIO6R99p2l3RlHBKBJw9jP1driQdxG91tn4+2eooXo
 9saNNu7kvRf//yRSswJIu0JMP6cVDRQQEPepYaDPXQJpcjjSy/KH2o+kU9Zakhp0tRAzKEqbotk
 YGzY8fs1Wlnrg8IJewixrVUhzNQBfQIkmUvQ8f8t76iHVo6t5CbA8BG9l/UXCu7H01k+PHxzstS
 H7YPwoLY8XltM0QCpHbcvia6BpFFqrAnSrt/xVFaNtBvWKNwctRUyBrtklx+hsbEp6ajxY0GCMa
 6laWVsdDATnrLsQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfXzNAcz0ruwB3b
 xmKr/ywFd2VatdIiWfmY6yz69qVNx05GvV305osIuwk2NBKvqqDiG8H5R+/qX4XDUlcI8myYcYD
 qBfD7iR7EwV/0hQ2+oKJQRtsQWucJqzXEcYvkfPqkYGqyiUmSDL6AMrFcfldYPh4lUQp8HfAo3w
 7FCiYX/ohleIw3bJWkCcs1BQtpBoCPgyVjeQ+U8r2jDKI1CfP1xrPslybuy1WhBOl6HocF75/CS
 N8WpkNGQguC6Q2jkv9dR7ZYeWK8tSqJSD20Hyih5XoNDd4rntRGyZSgOb1koW0j2XUmHFsWD0TV
 1zqTAgHuMs7SFJMz3Bv0MhYthHqn8S56hbTgrhisTR6nmiJ2KYjUVh8zZR8kKiEjN0Fqun82KCY
 J4o/OxwwdI3GfuXY34M5qffxer5a2l1Cx4if44wtGmxL8IbQHx8StmmARp8tiXRa9FZvUqGa93h
 otw/aeGyWExDfdNJHhw==
X-Proofpoint-ORIG-GUID: Lo4vHZwKEVScU9LZI8BSJgZk5xF_LIFo
X-Proofpoint-GUID: Lo4vHZwKEVScU9LZI8BSJgZk5xF_LIFo
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978d3da cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1

