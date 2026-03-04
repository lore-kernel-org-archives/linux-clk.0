Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBF93C6A44
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 17:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646081; cv=none; b=A+ddduWLL2EDcj7/u8nmHWsb15ih9ulHOugZQAHU+qJUzdoDIp9esx5KlQjafGxEF0ttDTMg0PqE4/AU44UO2YFt+FBHAg7ef00CYhCMY/fjlqHmDtMfGajPccLobiDLfXx6NZ4oMQpim6otONugVKzS+cc3rhUBvHHX4UxG1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646081; c=relaxed/simple;
	bh=AnG05lo05UKYLZiQW9JcG2T899MXZCA5VZJh9xmrkyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ku5aeGbwPNQ3AolhFNRfApDwan6mx5GW4uloNM5og/YWRef+1LfeOJCv6ayBHNISirkQ+lxjqdBQaxUN9q/73F1sK7LgjZScjnjXkxuStX4AA/r8AO8LOwkj1asw81bt17vlFO/wF3cxywBaypi/K1jKTfPvXTBw+7QlA1bkOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAtTThED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIhNsVjI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAtTThED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIhNsVjI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHnsm2612150
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 17:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/54ciGxBJeuckQMxKs/2VGcMctRAnTW7UpWd4xQqjM=; b=mAtTThEDCIxE1ZsC
	hw/EBHMaIi3zGytjlHknDYJt0b+2E2Y1kb9Zr6nGx4vmGQ/aJLva5/HH94tw1Tpu
	26C20xeaWn47OkD1O1tpXkxr/eMLVxhPmxsrNc1t1ksBW9td8eSTgeFFKktsBpGh
	p3XFg9TYqQVGjCa1RRUIVuodTngy8q31ihW6SkPv5zItKXdHsDFXGu2qmYYnpgcI
	6YM4bNbQ7viIVnCd0BcMFdY+6zz57zrTLvA6NETZEx1Kb5sLlSP2PEsUi95573GC
	TwbauE0ZvQdBKok+ow+mysMdLURDUWy9OkVkP83n8RmEB6CkdZk4nV3r8WODOh0Y
	RlsT/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w825g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 17:41:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35641c14663so7403583a91.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 09:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646078; x=1773250878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/54ciGxBJeuckQMxKs/2VGcMctRAnTW7UpWd4xQqjM=;
        b=CIhNsVjIEfhlyAyAqLJ/ttMAj2asDOntIOEGfhlVqb3vYSNr41HY59cNl9xsv/vrQ8
         ZW9oh310ZIg6PqkThQBm4ngTTgBrKYK3TMc+g0icUYFLfaE7w4qFx95qUyvn5bHvnsg9
         LZC5Nz6pYbWQOJbGi09ZINWLmOie0yWvZgXQtWqerEENWS10IB16WHHXRvA5xRY2ZFAX
         sAbMB2Qp8JOuTM99jloxH5pxxaM1N6BM9g5uApmptYoyTfiLoGQ6P/1H4acHkLBzKXz4
         ZMPaPTIjTSP2j8zgNRaw4dM+vBvh6o1a8Y9eVD3mP14S3R8T73E0Ln1XVg4hCbeI0HEe
         bmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646078; x=1773250878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o/54ciGxBJeuckQMxKs/2VGcMctRAnTW7UpWd4xQqjM=;
        b=YmasMtuQVBJNKxHXcsECB9x9u/a6heULjEnBk3UtU08RqtfBOnwHB/Bmc4YNN0qi7Q
         FiF7ibQ+aMYxS9yczDGpXGOsJ/yoZ41NdCP00d/TaDEU958mOGUlgychchd9nLHMGb8X
         wGpvh/Qt3W0mwIoqHUeLWijBKCR8g84n0pGCJ4WGtYyC4U7JCHYihLvVfDHhtUEWmlJa
         nkREcOZacnpYvLQqc1PwqbeSrb4CWIkxA0rVIWfecNTJBs/bpnptPlCOXocFDLyMesxT
         EVT8dZgcuGtP/38ofpX9q7MS8VLIYhLXVDGC33mkHT/6ecjkwoCfJ/8wk24f+WwERgQu
         0/9A==
X-Forwarded-Encrypted: i=1; AJvYcCXfKRnOOrBDDgccc7+IxGnT4E0RHoQ6S41I7oi5ix+S3b3ELsemMk+xVOh7OMbhv244xaYZbINuGXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxunyxAXa/ySFT2EAX0cKhRILbBJHoK/EPeHsrTqVMlYw1ure9V
	qeU07Gfypyojs5jXZw9LmbMRCpjOVYtBGjqz2I6ZnDfUuXbIaRvZbVf6DNVVF+LeQmxuW9OI7ky
	YnI8TLeXzffaKctLTYrsiCgoy4aNquo8es3SnlI7iXBnSN0lvcKSmFOuP6T1dOiM=
X-Gm-Gg: ATEYQzxABRJnjrpzEzZ4j+BFpcfLJyUm8eBH7GjZVl21HCFhUeg2g9b5Ky0j9EQEl4H
	BVrhq4KzdSLEH24PT49lFzDcZYGbp7UHPoRAbhuYgxA6VLz5ITau/+u58vANKsDwIZcjorafGTL
	Xil2ltwlmssU3CJ/2IdoU/z/WZh/wyoack+AkjaC+feS6/ZZS8SdxCVDo/J1eNxoFayM0CQ2y9Q
	0SjzOKCoFohIxeKz/lWF8P3dCbIRPSRYNbwCmPCZOe0U/R+ROd+mu0WQ8xkRLqjH4NY2cefdaTi
	KBrvEuyj0nObTy74UaxhXbUi+w/oWX/nvhZutnQaJp97oF63lmKsOfzgdNftrO+ITW5aOgk5wNw
	UtVoAN5MvH6mNgZyHI+f1HiD4IjMsEfsfMyP//rdYUWeYN6dvxqJM
X-Received: by 2002:a05:6a21:e90:b0:394:625f:c565 with SMTP id adf61e73a8af0-3982debb82emr2734168637.30.1772646077959;
        Wed, 04 Mar 2026 09:41:17 -0800 (PST)
X-Received: by 2002:a05:6a21:e90:b0:394:625f:c565 with SMTP id adf61e73a8af0-3982debb82emr2734140637.30.1772646077370;
        Wed, 04 Mar 2026 09:41:17 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:16 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:52 +0530
Subject: [PATCH v2 2/7] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-2-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: NFYJhaxHJV8mU40gOC0AbsJ3w1_vIURX
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a86ebe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX/ivxVOFUMyeM
 1XWU8suHE8IZkKg1XCMYccxmCG2oMn5ATCqVwGWJSd5UDJTnISKY0zT/6bUdNM7QJRKEtix1HBG
 S1/qPHjtdKXS7QkKWRRnljer+y1ICCeBl1lDAnuPfZI7bmCX3+MzMSIXScSXVIdwG7bEC1/0sR/
 pba5vxFA58fYnUdmvCoA5Te9YW7y05mnNsZguU4kbLH2jg0f5MSgbygIlUk82pi9bY0Kl3eOp/X
 02k/DWIyH2yyPk54EOI/13dYcxr1n0/6uw4Nc1vg3qb3l8BE73CqTUtJobBbCD8/M99Wzz9IMq8
 BzjRx9AcxVJbZhydVbrJlcFR7vTvQTzUhkazOlJFYdLovk8Q7m0TDmgwx+R/12/ooPJlZlPoA/k
 Rr3kq85Bz0LbIQQ/jE9YF/lL08t02uYyn4j7YvjK3inUg/C9OIJWDO6G0j3iCkcUXtU3jOCZZ4g
 3GI7NX6FUIwZAkLX+0w==
X-Proofpoint-ORIG-GUID: NFYJhaxHJV8mU40gOC0AbsJ3w1_vIURX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both
X1E80100 and X1P42100 platforms.

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

