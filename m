Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3AB47F2D4
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017406; cv=none; b=r1RTiYFC4MZ9Q7QoZI/Yrqd1fRcZEeSSbqI7U3qUDUZNRaJvV68uXhxoivljpTgm3RD8URxYfkD2tWDakBUsJjX090HJYKcrwPkfUJabTUoZCHG5TVJM7GGTbd13uGavwCZ8pwsQ3G1MQ8rRcRzDPqnwFUUXdQBzxTpYM9CPGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017406; c=relaxed/simple;
	bh=X7A8BvifHg9AJtoStT7CZzf1oH5NsdlyLLNOS9sNvUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2e6nu0ODAbEEm6E/hVlSXohEdqY3LfB1LLIAxk60Dc9x8tGJ0mzzA77iZTCANP6icSvu2j0oENdloYoPXZCUyjrcasJNw7VkZETDDN2dAAqI9DmT30ajAkgyBwwFy9qmxpPKebLNn9wrgNsOMF96m5xItuc6pm2y84zwNbs2l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1k7XNYv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwKTQya8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1k7XNYv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwKTQya8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaAX2706270
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=P1k7XNYvWkjAlAtm
	n4ayrXTq4wktwI9mgcGcvab+oAlzTpu82qdlvu+oqB2rbm5fKbOKUJ96ylfkKjbM
	ChUEQHmQCb5NNKixFLdOKUBiFRAyQ2zH9NT+m2J3lyfxMAmIFEAi61+XylEodkzu
	sz1pSHctu9SQcT0eJoZljjhFYh1VrQk3zWbC1JKWoA2qjE8A5Eau8oGsRP7gdEXR
	OalDIBkqZo5lfyDdjBh0wfyaRMtYiMJ6sg8oiH4OUYlWBj37H3OaBB60fGYmD7xe
	+XohJakXa6CRYlrDUMjPOdnQkZZKSlA0b1kEbAeUON/AIAv+zEyQiZuNE1UT5jcP
	C+hzCw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt1u9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 15:03:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84245e2bb00so5112809b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017403; x=1781622203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=DwKTQya8ozhVOnLyuEP9bH2FI0SMVMyD90qGtL64F9BYPE8m+WULsK9HAGG0t/jruN
         IUd4bEx62xh+SvnCjd05Bs39VkAwGOeB+493qGkWI1T7dVueZif1smCHVN8EUgk1IIsq
         Iou4pElpkcY5VvcXXUMmKiHQMBF1zTd7KROrnYlZqcsSIEJTMVp6buEkkGZNCuSx1mjJ
         mDtBAaNNkyOwT0tZ7yO10JYHp0U7quWARlPv4WrR5xeUI5HMgm8kyObO9Ks2CbKq9jZe
         4txWNDbO6DJPFXMgRDQ/cAjOVQUt5hXYPxqXjcUfkcQRpJ6+4rdJvpEuae8ImuFUm/sT
         2V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017403; x=1781622203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=QKBjGNnqnW+SruO/gXvAyj2bHBaWuG00R6Idou+KH2XFuI0wkNVcpe7Hj18SYHiWOI
         SGKujToSM5rVHC9lV7t8iZjTJZ+M1zkpsli8iTSgiTnW7jWHj/5/9mjS/YiGNtQvz6k+
         8tiMn5N21I0F+BBN6nsq6JLj29KEuA/YTKFTlRZguJGTBchGPQrwUMfYGq5lI5/klYqh
         t22yoqrG8Gvf6RyNhTvbeT9OF2bkyRfz+e9Y0uiZ2LkE6Qg/YgWQxk/pjdyIjhEzTy5y
         XN5bPXOGrqozD1aDpPkgb7SK2+Hs6sqd/WotpUqPZtoW6lxC4S4VTl2ForN24hozJfQs
         soWg==
X-Forwarded-Encrypted: i=1; AFNElJ+3PGnXo0+5RS5zbYkldymlAp6pOjO3c402N2RoQaoQEMlBTdfdiLChF2kK5cYtUUeZPPRsG42EM0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeNQHpFo9HL7JXmKzPgzvaBtkIBuZcUA8vqMX2OMmfCMSwb9Vu
	a94Mu3a9WoHCn1C03FhXANOMgomwFqiDgWAnY6UyI9kvwobDa83cv7Qwsii6NWDHIVoUN99V18w
	e02roj0cHKlr4RROrRlJyayY6Jt5Sz++T6JAPETZ3bqRQ4dXrB2RJznXgHrbgjyk=
X-Gm-Gg: Acq92OHc7QBLH+Qjw3O+d98/Wby3dVNSN1lm+duJ04nv0ADM4WYE5PCWOuhAOe0Yof3
	UBTsZni9QemLlGeEy0/8b1S1+j0Qag3Wl2cDm5SFIt7pbwYOKb5vKoLqXv5Xs4B/kffz1dbXsMw
	3BXuzoN6ZIm10gINzi6tOH0qO+Pc0JS+NXsjjrPr1VoLbET3PAuk7nmBPICauiRdyb0oLiNDR1H
	YbAgAGlvtHpJyyh8FMwnBTpNaIY7UP0m88l2780FV5MIW/tX3DNw0dS9+7VibIDXt49dlx6DxRl
	GCZV7ZdQw+7mMlRculIEICAS5wfXVnJqs+Xgz5069v9w/aH19Rypsu+Ceo4KxSAdWzKuKr0bsoX
	bTgq9W8hlDiTszu07h3au560k6rys5vwFfPn7FYFfxlWVzgtyyo9WHiTF
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-842b0e5d0ecmr22209073b3a.14.1781017402850;
        Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-842b0e5d0ecmr22208978b3a.14.1781017402222;
        Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:53 +0530
Subject: [PATCH v6 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-2-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: _VfpLMVqZf6m8KBIxs0lqFL3Hptsy3W5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX/aJSlK2sRudD
 HyCYRB9HFl49ildVXa6YOtmaF0BamuBxMC00UO0f9gWcKrpdkXmVBPJO8OqFoF4N13zYG1MSm9q
 SW9YQt64g41rsyAz84j2N20NhXkCHPWq9HT9i/ruFZn1NVNyAz4XZ8v4QvjTKZhFczYExfAfVnm
 EDQjUV6gkFWSJ6tQYkNqCpd9whkLaFzDe5xz+hQzdkLK3LiO2NTqDWRhNL+3NZN9UDvnEjzHlez
 tNmSDeE0Gu4AcFt8z3DH84ysIv9DSwWfFCBHm9My4k2NlY1MdAxtoZe9Xrbax0LZKJ7q0C420tW
 ix8ffNNrGIqwhXJtPWiuz682OuimOXxrk/4RuoQzXRNQOVxNEo1+f6Ty3DDpRJn+vKiF98ng2sN
 QMMrcx6OmRbUmXX/HwXUShJ3UDQAqtHQ3heaYQsqtvCplH96UY4e6tDGAh0VMVWFc13kKOm8dGC
 0gbuZr2RtCSvZHd6yIw==
X-Proofpoint-GUID: _VfpLMVqZf6m8KBIxs0lqFL3Hptsy3W5
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a282b3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1

