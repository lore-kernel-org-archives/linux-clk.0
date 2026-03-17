Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D96B3F65EF
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767698; cv=none; b=uWLYyEmLIg5ugG6UqmT+WWqfUoLB+yahPxlNFswwQODTOmLGGL7/j68P1bb1SEQAksEQpJJ2ROQCRMuxTLF0vl/lLqrR9lmOodhzXYKbcZbSECMz4cC9VLYMoVBXEXAJP7fOzFq2BAAXQpKzsL0otGpXHJuQeNyxXDaurKiVvlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767698; c=relaxed/simple;
	bh=4pHAiCPa/I4+70l4WTTxBfo7ZLYJXjIsYdQ2M+8BWJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXW2aC7XMRglCgYB0McUX9zzEpS15cdEuLeZvcBECe9C7EeoslrkBxW2dwz/646iOZ7A5bG8fJnVP69Nggwl+B97fO9YRaUCtc2ZkiHmeTCVtNYg4mKaLge3WLCKAz+4bLYbU5SJmi4pjhnTGt0Z8a29OMZLWwFhIvNLj5BSJvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyKXgEM0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kINpopc5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyKXgEM0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kINpopc5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HEHpXS2188398
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=eyKXgEM0zh7blzXR
	SHJm3B+Mn799uS8qpnMberp7gCI+VvfvCiEzMVhovFwnjIbYYqF6HX0ygmAQ8t7A
	rGedOd7x0B96e/LwdClJwthk0ybiLp82Ph0mK7Lk57WERIsqqMfylT0AORBuFq7s
	MdW+ZCQ1s2QI0P5KOI70te7hWZ/rdf1Xom0g0xspnYu7DluUnM5xK/P0qRQc0oe3
	rLOZOYoQpjKP59F6geaEq7rDxng9CIJleW8dJ+4RR0F1+8t7Z+4b0RPlXNFPlPB9
	QCjhN03fAHm8fuFuLqm0sKaaGU3/09q0ir8YKUre08eVwVa1XHNabo4yiQurZot6
	H/Q/yw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjrqba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b9894f9ceso3226163a91.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767695; x=1774372495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=kINpopc5o6Hjg1nytf0tPMcsUdmTnENkaShT3kiT6ssuNFJO0Z6/ULBTUWdlEutWsO
         Hcp+1hp0IWuBhAthORu6KWI/yZg9ESESUPpBmHzbe2XhUW09CzgpvB4ZoVMwk4TMm2ZG
         5YdnoXwgwNRa2OQx4o1zkVxCJvavfdO428TYfA8XtbXrw8El0UH1u5mVLnXYCjwRvM27
         X5yQz0DrRDW1qt7P6HKI88LcdLLEiQfL088Fu8L62aZ4GdiHpZFfy2I/CLsQIr6E2z0l
         CNHBWV9sDFzLvXBZRGviBVE8scVCnuELzb36W/xiiIds8gdhm/0pU1pKDJLgBLumEZ9I
         8bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767695; x=1774372495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=gK3l25awvydemPrmNMQgDuK0bdyd8Mte9AlAFphtKLkp0rGz/0/BOTh/OI/Gd/ODYf
         biHc8HxSVoCkn9akZH869IuCL7mHqJLHTIWexvjldXk5ESrBApQNR1K6/ivtqahdp2PO
         ACkCFkDIzT6hhZbZt79pVJdEhA1p47hAag5gxmHqyNFail/PO/V/ZMSdx/1JdP1z8Fzm
         PFOCC083DVIHMaYQtSZwDcmAgfSVVPZLeCmAbRshtb2GmdUZkBHFZzbsP5jpeSc+MNwz
         snvDqnKfZnT9HBxaR4wjvwIq/owj8B08uePWosAwG6OIs9BvPu0xyhCJQiN6H/ihzVBf
         TYJA==
X-Forwarded-Encrypted: i=1; AJvYcCUyZgihVuVvlRwBn6xLVA7MsKYZuOxy7Av0bi/nm/xTi4ZlXU1vHS6kqI7LAFKufkkacBkxbagHT+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfvQfuyZ2f6Fqu5QnyXjfMvGd2Bh7PgymWYOLdz0HVa7aurXgQ
	aqhEOi1zJIH0jIC4BqnmlT3UO0eZutCqDgUu3xC6cVdzak1K4+5R80Bk8S8UFMjqHim6rY0CBtC
	ZBXotjd+2qSZQljRWy/T9ZAThjHjNL0g7JJIpkuiv1M6i1JTpy2cvq9NmIoV9UHI=
X-Gm-Gg: ATEYQzxwKzv7AgFjJgxhAzfjMDSh51NygyXvhiWNq6+wXOOqRnI5BLQMhHQQlCHG2yh
	9dzs3E1rtoFCdVQTvZjOVC0vx5YZnk5g5VaHtLakBZFjCgTmAh4VgXOYqr6wuwgyyAwuKPYxwcX
	sFrp29Q5Ntx40ubDn/jCHd6mLt8B87nmaMKRJA4xieTAnIQeIUDb6ZLvdDoT+vsgwfczy6nwbkw
	XXDITlx0kk+rtHoHNby+kSfqZiy7ua0KqQ5JaNHUW0YhbZPfSL6Asxs8ChiyzBy7h7tKrGZol9k
	demhQqYZ2brcDinsvxHQmQd0RGqraiQo7L5qAoq9B4aHJVppO8NkFI9kHSnEXB8+nDcy9NgNb9h
	dFSJku2tFSjQtw1LkFDApbLp4wy04frMiicdpMsNx+lDXXw==
X-Received: by 2002:a17:90b:2f84:b0:359:8c01:674 with SMTP id 98e67ed59e1d1-35bb9ef5f24mr191411a91.22.1773767695183;
        Tue, 17 Mar 2026 10:14:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2f84:b0:359:8c01:674 with SMTP id 98e67ed59e1d1-35bb9ef5f24mr191376a91.22.1773767694568;
        Tue, 17 Mar 2026 10:14:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:14:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 22:44:23 +0530
Subject: [PATCH 2/7] dt-bindings: clock: qcom: document the Eliza GPU Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-2-4696eeda8cfb@oss.qualcomm.com>
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfXx3RFt9Xxhyqq
 Rt/OdYojVhI3s+znDJXuoiEDEehr5cqYUKrhu0N1VWC8j9rE/PR6wGO2PKLGLqMD9Uo8s1ElSvb
 p/YsEGQRkqQdO0p/brIElVyQW6fXQVl53TV5Le4KpOxbA9s0ZeG3i8if7UPNBuKvNFb2rkETyyl
 7JkKqsWfJXBgLngKLWru/rP8CLlmbulk/zrn89m1dh/3ihRtZpRqBZ8JV8BPsBVqr6l50n3MJiv
 iO1ztEsxIq5AaU/2fMRPFrEGLHHfe2BZycaq6G9TdsYve4BaC+Xliqf3c1y8pwVZQqJ9naAE7xU
 KmyaSQaICyn2yXUtQD9nRbqKOZ0YjWVhcZlBXVU3HhSY9ViXz0qPH52L7rRtiH4Gmm7YDpOlqGe
 bu1xtxm4FPXsNUjFyzxAEZ9lsdLDTCnDLXX9jyPW6bVcen4ZvVZkAiRS1+y+69zWqIm1oKNXYua
 MB6522C13zOhaR23wPw==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69b98c10 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZS2JxP11c8-gySkZsx8qvxQrHFkfXhZa
X-Proofpoint-GUID: ZS2JxP11c8-gySkZsx8qvxQrHFkfXhZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170152

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 52 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

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
index 0000000000000000000000000000000000000000..706e1c93240a8234dd8017ee181d19e58091fd6d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,52 @@
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
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_MEMNOC_GFX_CLK					17
+#define GPU_CC_MND1X_0_GFX3D_CLK				18
+#define GPU_CC_MND1X_1_GFX3D_CLK				19
+#define GPU_CC_PLL0						20
+#define GPU_CC_PLL1						21
+#define GPU_CC_SLEEP_CLK					22
+#define GPU_CC_XO_CLK_SRC					23
+#define GPU_CC_XO_DIV_CLK_SRC					24
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

