Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFDA3290AA
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132343; cv=none; b=rdKDWksTUE27IgLSCC4ojTD/PSe1eoQOzUw7gglWnRtlwPgQpJMWaCS22t90w86b1RTULHK3TY72QqT+9k8aaN+5fOk9Y+4N4/Xlq+3mMtTCDZYeZNAKT9MXcbd9gGvkb7odrTp+BMCdicK6BKQ3nnuUJPgXr6l8vvLRxaM5WS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132343; c=relaxed/simple;
	bh=lyO+hk8kt2i0G/vKlS7Khc05+qw6hrcZ6upbhob8yAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMhTvHBBExFLy80EusYNo1Nk9gwDHsfF51lItg27oLNe/SHejyRxg2Kb99U49YK0VY9nUIr80T6NSotr+7Hk2SwYrnjIn4EYE/xY/qppMaOVi7ZVg3GFeHLKy/oWOG2U19BSl0btDcbs03+f+/eiBQ9irATTcZ+VMESiZz/DfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8+IG58N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw9w3x7O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8+IG58N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw9w3x7O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646Jr6do3036474
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 05:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=; b=X8+IG58NqrBTCH22
	tHYBVMwUvFedaBdkj+jPp2A6Z5VSTbEXNAjRhLofOI8/DNs02laf9dYtPXHgwAvv
	M5WJV8sAdFwKWi7xxM3c4MQDoqPTO1X7cmv8m/qMAflSEL2gziOkj4kQRqgWu4/G
	ibsuSNAW6NnK9Yd6FdS6+nC0/u780+ik+KZGXOitv81kuK2j7aKuJvcFx8BxH+w+
	ZGXBjVYBcbwPoQJx13pXg6d0zXy39NPf1MODDHVvTGBKDMA/IX598RxQ7qzh75Ea
	ZgmKteF0+Mi0xhjwwJShi0a97KPnsc8ioT+d0TQVClfvcLOZSuhWdMiCrBANAwW0
	FKdEJA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf3bp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:39:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835423c69ffso269285b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 22:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132340; x=1778737140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=iw9w3x7OktBC0jahlvqB2NO2yyQ0LS3lvAHaZq/p8CA7D43E6k1bld9D/9A3wXmaEc
         u4plxZWDx4aWM02KNVtNEsufl6jeYg2Hbj9uGDq0jF3XWEUtWqqV3+4Gjjo2ftRyYApq
         2Obt7nfFGHFZ/8F2YyWlUAzROATEQj+N2n64M8iLYnyHLAStwdOvr5znrLhwX64DMQs2
         vOb8F+6PaNTkZ6B4Gfi644qhRM6ZSPaqBzCV1XjcyZPJhU9ZcdE0czNNkTFJZneNjfkO
         4Wbj5TfWA9eVvFd9ysNUGhtuFE7yelhmBuPucYPSS8eLHiLQIo1Mg1183rvp/kRTtj10
         ioVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132340; x=1778737140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=FLb8P1FT65Bwru4tPtpP3zmfqhGFiut3zhxn6owFMZG2PyU9f5PnT8R4mucFH/fMxR
         I7VAdzuPcL/0ujnHJfBtJ7vX8UstX/oYwSpMaxGKuvpXH7NjnKLNqaQVGzFQpmMLUTCO
         qPs6RL9vdnO5cuz+dPLoihbuPo9/g5/Ei7NCKJe80BKZheGJ34ZT4gj44Q6PdL1aglmf
         Crmc/0ig2+4z2fmtWAE69SrbSAmm2VKpmncvIJgoYDHEF29kNih8Dkq2wDLs0RrY++u0
         XYsu444Dd+yFy6JqeiE+LfLkImG4qQHTbc5l6WydNw21aUw2XXAJ5Qdca0GdOUjyb0bP
         GY9g==
X-Forwarded-Encrypted: i=1; AFNElJ8iH2r0je6pKfWnipDdz5+3K7J7r5Y3Ey+f/khJs0iSFcd/sr8Xvza0IbNpg2MS7xHJDv3+GbgpSdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMPCWfmFHjl3NVpMWIRxCjkiBrCLV978AFC1SmOSzVWDUooIlh
	G6O7nSkOtg4BiiPatOQC3z4+Pwi7/ZMu1/h5/s6EHNea02814fI5oQaMZEA/sMNNIEuOu+nQtgI
	r77IMCdAppGhjqmhAK6J+qdqIg7YpD5wJ6+vVYg58g6/F53EVcSbfqzGh5mpesHE=
X-Gm-Gg: AeBDieut6zq9B7m30qFG6cC1Vhp8KiUZAAPwIc18Qozl114KWzCI5ERgMnJbve2lajZ
	YZtiffBEIl8Xf6QmSzoge21VwRCkvA1Ck2qH5MWgfb+A6oKZ6bKMlAyFPel+PS3z/ylAx6cqudH
	8K7AwGsmzIYVuvxsZrjBo37HFE9DosB39VROvoMbsG9ewcmUzhkjqBIH8tM9sDhXB2tWign+jom
	erh7eSEL9gNQB21y5apWALXkIFyC7/iyq6ZLW3iEV0h1NfsDyD/YHD08Cligqt0y5HZ7YSHc5JN
	97AAjODxrFWGUd141OPgnEOoYHrcAPTuru7VzEh0bqAUPdGCDh+KGWkem8z4vekw2Sqpanlikqt
	HX4/dpikFba3dWUhCbxpnXEf9Ri4eka69bQKZs0pLFDXvGauYi0nogRUYRVBNR68=
X-Received: by 2002:a05:6a00:a381:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-83a5c0c51b3mr6243977b3a.22.1778132339760;
        Wed, 06 May 2026 22:38:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:a381:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-83a5c0c51b3mr6243923b3a.22.1778132338834;
        Wed, 06 May 2026 22:38:58 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:38:58 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:27 +0530
Subject: [PATCH v5 2/6] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-2-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX8dXFWINNJqRQ
 G8jtG/eEtuprEf4uGItibfk5yLQ4j3JsWgjBc1MVp/kNIxJbMWy9i4cOSzDOy5FIH+bKU8VYSrH
 5zItCXnmmcvJrioKoob3guYV4x4SXQCoQGUqqUWXETcD5kkkr1MjbjtMxLCAWWiE355LHlHWYQK
 rPBLbo0Dlk1m9wZZ9jkqkcsGPvRMpuzWsUUA3caVgbRHcGLAiN5eJziD18+XqayIXvpNciQpwoC
 at34ATIicxydl6vbFiboXjHk2f7mhOq/uB8EqKY5j4RNCqCJISKMz6WzmEdpyolj2uPzSSr+JvP
 YyccWqXgeD/2GGHhbkuy2trrYuYsNegwlIW5ue5SbqA6zDSlAE5IIDDCqaaeVlQYFOMkpiN9jem
 BvxL5Po+MpRgoGVA9kewqBGOy+jwJ82/wxQbAZKwPknbYMKlnPwc/z2WGMEvI93y8xe2kNtzYRP
 NyKT3mfOtQ33FNX4XZg==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fc2574 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: saBK-O1AnNwXYtmTowX33n0TbLkWu9qg
X-Proofpoint-ORIG-GUID: saBK-O1AnNwXYtmTowX33n0TbLkWu9qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070052

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

