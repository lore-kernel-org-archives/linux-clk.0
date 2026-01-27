Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC262D593C
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498325; cv=none; b=F2G7GDK9Wrt7rz29GW+Av7pkBUj462HjQ++YXBlgQGePUjsGB19hvg3dzf+VCWvW0Azdm5FZRkddDx8cUrCA43Wst0LSr1K++JCu8qzoFHu2GH84NIksIY4f9AIOLVOBhSmj4nLYbfFK2jiRzmsRYE644aEyrGjv/m1ilTze6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498325; c=relaxed/simple;
	bh=u/gcLJpfpJxT/pi95+CXFpFlJBn2QF6Kqdv8Rf0Lsk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuvIn90Cf68xg/3gsnV4JTa8OmgMk3ZuUVRwlChM5FbeWfXQji1fGooaTP+WlKut2aTOoyMI0CrgafAiuoMSszZ7QSLYiXVWpD5cEMPZuB462mF9pYmdljRAybpqdpRE77743r5oa7RsGW/JrDqE9XN0hWkDwRX8qtJ722k2Wd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7HZ+8Cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baQMd4e8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7HZ+8Cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baQMd4e8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UMGc700315
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Tsmmop7/zsQC4lFClI1UApD+zoiGQHA8odp8ezZQZI=; b=p7HZ+8CzaI3rXbfw
	1LgBZoUi6z94UUq3plrhy4VC1Aoasq+n8UdVD3n2KNPT3P4H97jveFvNA7PjDdlG
	VGXwVADM4LEZITQdSVjveHc0phVobC6BamvBiImSX4RQb/Ofs2Gc/WRrgExdEpNj
	7xLJm1ZobvlHwbRvQylA5ZkIqjGWum1Ht28r52KyY+7EHhEP4STQABojyn2t/78n
	YSdHxin0A5hVnYfyLsMVIgP24cj1g1VFj67B66l1Xfd0ll/MeJKZ8o8wcANgSPIl
	+PQLERY7AlREumJTXalRT2toQWTqUq1Oskn3lLhj5vm9z8A5Vtdbt4ss8BCrXpp7
	MnAGEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3sq4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a8c465c1so33419125ad.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 23:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769498322; x=1770103122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Tsmmop7/zsQC4lFClI1UApD+zoiGQHA8odp8ezZQZI=;
        b=baQMd4e8XJVNl/RBg2lvgizrvDGmPzwbB1d+QLEewSu4mVeUlHC9J8BgVok67W3Cvz
         GorVw8isRuxbKv5JLNG+ORSzZWrltWCDyR/tM0OdKE3nXqPgFISAIwKz4GI3Bd1H3E4D
         lQ1K1KbLXru5FOy2IxCOvPKYwg9PLB3S7ZltU3O1io1oQOAQ5KaTqpuSaN0hQC5+AQOt
         vFGxS/EMP5sgZ226yum5Nwe+fYo05QBjV53h7eYjDAUwP70x9mhChaR7NM+4jwmTDXjn
         ZWbcTdpGYLIaku7kjB4zxkPpaasMva8rudEMq+Anzvfy+pO5RQEcNtyA7vJprEkrxYSF
         diGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498322; x=1770103122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Tsmmop7/zsQC4lFClI1UApD+zoiGQHA8odp8ezZQZI=;
        b=FB+Ny6Ih/f9+j6FCrWNMhlly2r5fEZ2mKtDrmTu46rpfM5/xUomtHIbw+Y3uGOCRzO
         J3v/Y5lFSoiqFExpry4YKOsT72cgTbHWK1UoC9iRVUES9mIdNgZPqyH0HwnRuPEzwIP9
         6UuXi5FtVcURZLu0fGZ1O9zAXZm6nREW6akOgct3FK1LC6fV/BE+269wl3vLRkNs+o7W
         J11V7xWmMDc4xxw/hNwkbm8KzVEXWWfaPIPyzMnW7n768w9G4ZUGr3Oo4feDnnhtch+8
         2OqSYFFRarXwjbF5dACnFTTVqPsxHL4gSJJgZs+/38uiE6cHDgkJdiD0Vq6kLzLD98tD
         qC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtxNCG/3nxDCC3EKZk2mm55/wbg7DXamb8M873+ZN7djotCliqmmZiLOEQp18gnIoeky12MERq4/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxerNJpulLUK1YKCxVi9afONDAjJ4M4hW5YwxqTmrWuip/7YCm3
	makAvcyAsfbXudNwnWUBhkujkz2TPv5/dcSZ+D8KjCYE8pid7b6kpQvGQ2Oe+56b4iCuU8cN/4A
	l3WUtUAgZVfwxIyRXJyP8yJk5FuEpqidvTpU2tZgTynKF44fjvLZlpyoj5AMRckw=
X-Gm-Gg: AZuq6aL/XxGgs0RBee1POvH6xsIaXUyrVOiKvtzNU2GpzVdMxQmsyX30I3Qg17AUAUl
	OGItliedfyTnWKVEGCVh4IIhklT8YpeN2PrZcUEx7xQ0miIGqThTHZQVmhU19mtBLHlUWglozWi
	69sh+v0oEFwQvOjHDvWGGu1nNEkFKe2kxq1mZm5EFZmWfJaP5vBw8u7PQkPNUgGIuY+AmztLw8a
	HkDJI18YH2UsVCiRxgKanmWIbIyONgiusrjFwKpLUXBPn0V2JcPBaZbVuBQrKQpJZo23+tenbPF
	KHEKHobJuPnLt21PRRsu85symyfYSnbWPDD+eaNoqUV7DcSo46Mvs1EhVPNfvrHAQFTr4fCW1HL
	t3Zw3zEihFz5DFFertEcfiAWj34QSn/u0NA==
X-Received: by 2002:a17:902:cf09:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a871272221mr8527175ad.10.1769498321725;
        Mon, 26 Jan 2026 23:18:41 -0800 (PST)
X-Received: by 2002:a17:902:cf09:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a871272221mr8526945ad.10.1769498321147;
        Mon, 26 Jan 2026 23:18:41 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a817f21707sm88084525ad.28.2026.01.26.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:18:40 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:45:49 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: document the Glymur GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-glymur_gpucc-v1-1-547334c81ba2@oss.qualcomm.com>
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: _WHbmphdlVyrKeX4vpD8tFK4GDmarwLq
X-Proofpoint-GUID: _WHbmphdlVyrKeX4vpD8tFK4GDmarwLq
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=697866d2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ybfv-g1EFY7sfChbOUEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1OCBTYWx0ZWRfX/1G6kNYEkkGn
 W0+9zh7gxyBpd48Wxc+UsFqHJBVvEgQKxsmUjVRmkBJUerdgewntiH5M2KgPhnfLx8XeWFjJVxf
 Fk/oJi/VpAqywnlI/Q7ZHtdZrpZQx2OjcyLUTW8MrEjKKMEiv13BxJLLkFvD5CBxF3IU0vd+YA5
 dq6Vy+E/4ypHnld+8ARGXsUo1wurwKpIeJqZgiSW11tSFvPeOrwKC7eXif1DeMo2omQmfqo7Sn/
 Nz1Wn19cMjs0/ewRRbBb+C9qKJALMlVkpeelAEWsMd9xj3odNMrmZLwEfm/JctD4RsRqHkOokaP
 wTLUWLobBv9ws/24rOAn4vMxGQtTRQ2ybEZqe7OTbcy5CJfgyZYsEqg019LplqxQ/LA9OE4vyQE
 hP2jgdiP5O/7W+bv9kEOxrLxCiGU39UF/8pG4stZI6Ja9sCgm9XwPlyp931fXlJmL2lBmaET71w
 CXv7aBphl1jy5E/YSpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270058

Glymur SoC has Qualcomm GX(graphics) clock controller and also the
Graphics clock controller. The GX graphics clock controller helps in the
recovery of the Graphics subsystem.

Add bindings documentation for the Glymur Graphics Clock and Graphics
power domain Controller for Glymur SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  4 +-
 include/dt-bindings/clock/qcom,glymur-gpucc.h      | 51 ++++++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index 5490a975f3db7d253a17cc13a67f6c44e0d47ef3..55bf3f8110171e9d14a2d0f7ba8e0089a31177cc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-gxclkctl
       - qcom,kaanapali-gxclkctl
 
   power-domains:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 6feaa32569f9a852c2049fee00ee7a2e2aefb558..5993804c91fa564b29f8dd0650c9efad498f543d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -13,7 +13,8 @@ description: |
   Qualcomm graphics clock control module provides the clocks, resets and power
   domains on Qualcomm SoCs.
 
-  See also::
+  See also:
+    include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
@@ -27,6 +28,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
       - qcom,sar2130p-gpucc
diff --git a/include/dt-bindings/clock/qcom,glymur-gpucc.h b/include/dt-bindings/clock/qcom,glymur-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..35f5abb848fd0349137e2eb5b4c58bbf095a821a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_GLYMUR_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DPM_CLK						8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_GX_ACCU_SHIFT_CLK				13
+#define GPU_CC_GX_ACD_AHB_FF_CLK				14
+#define GPU_CC_GX_AHB_FF_CLK					15
+#define GPU_CC_GX_GMU_CLK					16
+#define GPU_CC_GX_RCG_AHB_FF_CLK				17
+#define GPU_CC_HUB_AON_CLK					18
+#define GPU_CC_HUB_CLK_SRC					19
+#define GPU_CC_HUB_CX_INT_CLK					20
+#define GPU_CC_HUB_DIV_CLK_SRC					21
+#define GPU_CC_MEMNOC_GFX_CLK					22
+#define GPU_CC_PLL0						23
+#define GPU_CC_PLL0_OUT_EVEN					24
+#define GPU_CC_RSCC_HUB_AON_CLK					25
+#define GPU_CC_RSCC_XO_AON_CLK					26
+#define GPU_CC_SLEEP_CLK					27
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_FF_BCR						3
+#define GPU_CC_GMU_BCR						4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif

-- 
2.34.1

