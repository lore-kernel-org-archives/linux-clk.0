Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346E43DDB1D
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273565; cv=none; b=VRcEXxYtqBxl5eW2Gn+YNPfVtmu0OFGD0GDAB1sTZKFIk8fFLDNVqESnAanFWWUKNJlzTjY0plGlHgxgZrG1N1FkhTg4ePXcTlVsdyQtxJKJh5RKfo5RQAqhc9FYKdmt1A2pOjc/G+DqzV0dk6kX9UKeO3yHsYwE/k2rBvAV44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273565; c=relaxed/simple;
	bh=X7A8BvifHg9AJtoStT7CZzf1oH5NsdlyLLNOS9sNvUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ioNF7EAsPc+yzdOofspuXkWnktXi357hutmrZXyLzm33aJe6TIDoasqO+4teiqn0QGrkD+gvyRmmmeN0bR0EIKzVHkTrTMVisQOIu3WVqWjyhV5X1AR3MQSISb0shQVNHOgqfZNXujgYLhuDvx+oncs5qNxLf5FyrtkfOnP4YcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTTYbCgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWtZ/lsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTTYbCgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWtZ/lsZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cJMb2098601
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=XTTYbCgyV4m11uvU
	Bxm23sW3tw9cP3ktjMtgutrpnBnHceoqV4fIYPWQ5JXvnrOjJ9h3JbIRwYrROJmO
	MQ6Ozs70rRXKRnYeqDUOoth0mhTZr0UqhMfr34ZKjSvGVF3gn8ZG/A9qUEJhD3wt
	Xm16u27tUnpZI7E8FjtgqsiOrp2WsUH9XRsUgiV4vqc3YdJbeKQVCtOFl0xWvIle
	MTMMAYRKOAxZJetughhykVtarfuJGS8DakbEP4vk2mA6Knlu2rERY8YxEmi8vjKv
	CzMSmvYRTma1DWdT4z+l20Dk8UgxDYEDdQ0J8KeUFlL2rms7wXKQPabe6JAZfX+4
	7gPchQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jk60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso56369895ad.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273552; x=1784878352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=aWtZ/lsZIhUYw3FVaXm5f65Qjh8N6Yi7q4VrpYqH1UQtTOXAGZpB40XaDL68npdKFa
         HIrebrYFBwZPK1R7NTgGqVzXR3XGv8aoFyolhjrXc8FSCW5GZDG6YMddHXwa7EjOCntC
         3juk96K2rH/5NvpjfHr444TWMEaoXf2EQwe9qxfWXh7ZVlq4aPgY87uSwZ+E2Ofork1b
         bB9aze58PMxAQe/Nx8YzptOHZWZqf8Dhu9H9GeaycXkeVjLHIxCT6YzZoiNN+3jzXiUy
         +ZuQj6aG2eqlKyewEggrheqyQFAzRTWYzQAJW5K16htl6BL8Zbn7wHRQVMlect9nRntp
         Mq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273552; x=1784878352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=LnzqwANQm7t4KqIQRTZd6+1Be5jRpe9B7llzCBu8bh94IuYR0ydWpipUEX87qtBunk
         H73LH/GXnpzJgkp3DSQEfytQ2iYSIdedxXg+HUpa5gUghmQZqP9jnmo26QxH5y82WJxl
         03fikPUfyCyLC63pml8GfkgetfqhDHgrnN0Af2fkSrU8M4vkiWa4E+ZWgwVBLxQWho4/
         ihWO/hpYv+sgdyU/Gj53UC0I2BOIfYpxDkDuTClgkG/D/ra3Kol0f/qkL336DuJuVhoJ
         z0Gp31W8adnZGYNYygV2pVzisBzPP/YKaIrRlDGEBPXBEiUhi7mXNB6bNbx3o7Wm8q5p
         EZVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC+ht39bJQGOQtsimi1W3fxZAw21nG43/CgRoM12sUA9O1MH1kBEQ8eod96DK9a+DJI+PvRwgqR5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJblPxTt32ylOX5aJVEb2MzFwl8ly1IZ2uXyrcN8yJkHj7lRd
	h70DXmxjMpL7vX3TR6MJizTYyyEmf++jiRw7EGAxAuNy2px9uXkbhFu2uaom/X85l9O0QBucFL5
	ukxfGDdGWExYwwLj1YmKfLlgL2Ap6iSuFYABWoi3lf1sUZesqseRo6mR1d8k+WRM=
X-Gm-Gg: AfdE7cnRUnMz7+pw35rTVbsTWgeq7+07k83kxfFhbNRbM//fCRp13RIMGpdOPxgquw6
	HF5UySy91gI/Uxs4P2uc9xrU9KDIHDMdgt35sErP6oTwA8UtIx3zxf1TLM7R0xpydHppRf38WVh
	qxMNMbGeibCUVUAVjWDhVlUFMTQ5Il+jp31QUx2zYRLKQmB/u7aXrosb/1/6SbSy/j0ZWq4kNZz
	TpOeTwRJ5PwoRsyP5mLNElS1N+jQq/wDde32AD8qN8WxvVGBSoaEXZeJj3BpYtkMcd+vr78s9ub
	xeyg+fSjphtNlD5hKKoKg34gsUkoQhgwMTmvC8af44BsEWuxb5EBv/dDNbtZfb8lfWMc88hb1R1
	5TnqpX6oMEFXPnEioW2nwkErk
X-Received: by 2002:a17:902:c401:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cf3484726dmr15951935ad.2.1784273552378;
        Fri, 17 Jul 2026 00:32:32 -0700 (PDT)
X-Received: by 2002:a17:902:c401:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cf3484726dmr15951625ad.2.1784273551875;
        Fri, 17 Jul 2026 00:32:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:31 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:49 +0530
Subject: [PATCH v8 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-5-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX/T9Nk3v0OI5h
 VusaCL3SDIvmgXY5uXCFQW/S3RuGhnEtTirwWOKmVQySQ21Nm9jw+Ba4EpYIwl30L1D0KJ6TYOf
 kUeXJwCtLrB8u18JXtB4wo0y1VAQ+4gzOCkID50crW8MB0RwHsIc8iXyPCYyxDBLE+dAf0nFL38
 byNUay5tJkteu2b6PrwExpkNx2B6vJcO3filI5FZ8AEyBKJ5cF+6gU7hjnqaCRffxKExAKDo6mw
 j18n62eiLIQddYU+hEVwXzatC12zxJtCNvqBu5Q+6/wlEo29WjmbtVKD+c8IGylpmckaydk47+I
 ls1GFq7mKQKF8gw2S5dJIBBsWp9iBhxAjQho/iS6hxGbruqamd6TjwWghTEn5a5/Mnnf7yaZShC
 TwToXmwlFmmNt0W20bTRL51hfHrEtF8oaoEY/vGUwSe4xPiFz5Xhx5m7QTefpnUm1AAc2VsyxAK
 iALe8lv9ZAbCc5rExqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX0RpHvnVKXMzr
 iM4NJWfCma1Ga2V1Y87mBpVb5MNDTCXGevc5Z77P6nVkVl3ge3z0llZmVF/KmD4X02gN8jHUNeX
 fmtYsDjYU3uDNlvhmE0fedsuTk+8+Io=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59da91 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: lIGQFqepG_y5YI6V29lahc_lq6Vl_TaF
X-Proofpoint-ORIG-GUID: lIGQFqepG_y5YI6V29lahc_lq6Vl_TaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

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

