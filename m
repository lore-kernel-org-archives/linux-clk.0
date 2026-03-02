Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB035AC01
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448825; cv=none; b=lNwH1cOPRRO/CijX1t4870PubvR6iePwgVVNBx5efrBwMMtlvVBCEniUmxStEJck7Amsuag52z1DhRgCuvgs2+MtSeh0oQwNLh7ZR76OxIo2/p7ctIrnpaPQ7cKjAX6CkIEbzBvUx4BwC6SLX36AxNYT9vgp5eZZ1UIp0Zd/oy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448825; c=relaxed/simple;
	bh=I/+CRpce1XiriRnEG9k0CUVvP2dGm+/iz+eD3GjQGuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnaZdSwR8anxKjuUA0bUN5por0dYrpUUNqnINqFOJup7c1IJUuH58r6ShJ5Zskf6H7eIJFUF6bQyM43xiWUGn21OKOJrUHQX0juI6n5KpiC2gLLAwEMMADMHpQpt+9YgmiZVlcvSsbcjZ78vqD+WVD6zSYtx6+6jquL2aVcfGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeKy0eeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGk1Z9Tc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeKy0eeA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGk1Z9Tc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226hGQ62504783
	for <linux-clk@vger.kernel.org>; Mon, 2 Mar 2026 10:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yOzFGp4JNyhYJP0AxtK8kPu6dVoCUhZdvr5f+DHYtl4=; b=oeKy0eeAYm6V1wKz
	/+Kcag4SNMyFuW5ijh84MKCZZwcJrAi1dAO3DndaBZJZEqNSe5ThVqrzTCPHOeJu
	f4ON8lQvlBc521x++hwG7zUKVeHL83LVfoUtLJ/I/FYkFA7lYgTeMJdUM4WkkuaV
	EL/jfvR12HzlSgbTH3fVUciFLQ6zLVR1yj64nlsx98FTi5Cv/ozU2goHY9OuOI9G
	i6TqC29b+6xQbEkXul2BH76FxzYtLMiBU0wcjRoNgDDqaziTifTG0KnZ6s0aYJGd
	AtsG8TaKKsIXZTegspLx0EaEXA0uga/ZDb3xcz6/pMuv0ctKyvYB6nDLO1q1qN3R
	3PdpDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5herwpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 10:53:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71156fe09so3201574985a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448822; x=1773053622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOzFGp4JNyhYJP0AxtK8kPu6dVoCUhZdvr5f+DHYtl4=;
        b=AGk1Z9Tcg94tK1BpfdO/ROCHCNclRREE2KV0ESNIdSGVpsj86tOkF/wfhMGlEGSNYx
         XZWtF8a/8u9v7EUekkp1RHBjKUIWFPITRlGJK37trkQ4idPjy4T/hbsXfRdefCB8xURS
         j2V0248sdty7nSs+FJ3BuZVfcvXMMvrGQCHF35ATbtC8I2dEYIGzIXO6lzZqw/kVqP8A
         rahymn+H7I3MXXkATzIouX3ig5SKDa/GPidwXtY1WCG79e4w1E2XSf4BAN+ttl9amtfd
         fsZONF06ckIhyCxt9KmpP/ZNTeG0iVnlWIctYinf88CQRmYLokWg2oOv21Iw+KskZQLb
         3yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448822; x=1773053622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOzFGp4JNyhYJP0AxtK8kPu6dVoCUhZdvr5f+DHYtl4=;
        b=dBrKXG8IM7VCxBaLpc1qLsypAD/90iKXUxwSBReVu4ZAl7mLthXOEhiiHELc4XK/Gx
         wjzRLIahsf4oEWhH28Jj6djx3mRaAcPIUlJvYqURc+tQwEtt+MFuds1rpAPwSIOj6TGb
         sct0WGnpzrOrXKh2wuwSFcI0umzq8N4oV7MjV5kwaZF5iFLkXQ8Gyp/RoQUWdCVQlHna
         1ZPxH9Q2tsgEJWGRB+vY7ovr6FhTRYRbSoiPJyiXd5BcgFeGdu8mMyqWTHaX30BfoZBS
         J0i/+0aJ6Mf+BVHNRkGsOscAxddaL8e/qfVNt0I3b3xAaE/SM3D/+7rD9dgvLRIBw6Vy
         QPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+/jzZTi0CMdu5AfTiPgzfQuoBQc3KsRjXQfsRtPpQ4mMEXGHRn1NPDBO6zoPrUkPrB0KrTq6c8Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tcAMjNmmBcMD2aQqOgTXOOHoNPD3SJimNR9cOap/zWlOHfOW
	Pyyr5jWMz2kbxXah38FXK193sqjDc5c1WyqSAa7Un7GuUh+S1YNG/aKGlJXmACrB+XOrwdORGar
	q2wOcPFY4Oulyv7M3hDsxhzcIbNMQsDZIp8v7epN3OAHBuAUTMzmPaIAUAyjfMKI=
X-Gm-Gg: ATEYQzzqTSwgvvIgqzgy+Mk3h4ZzdxKgsT6Cg1/MJNguorDZKa8Zby4/u72rFv3Bnjo
	KtGFNPPrXn7pXnZY+ZiFd5D4gU0+HTndYpE9A9auzsUFjJILCF0MJeQwp7w1uHo45Yn14hMjpVG
	z7G62xJA8Lg2rfoalSRwDFC3xqLFetElDgpFTvynMMo+mqsAdQ0jnaFjQFUN37qQa77QQsiLPlR
	hAUrn4un9m3rJ5OU+CO1W9yXK0PI2Cot0QBDhO8xLVAtYwlScAxzckmeyIirIcG43Z1htLkh5o1
	uOSY1JTV5Kr9CQq95cG+WYwGAfYlqECZ5UMJftA8IXBhVEnqzgWW3uIfFaiumJpn2AST5rnKyNp
	I3VKyhhQb2y2Hl8r4Dg/1ZqKAOoCiYQ==
X-Received: by 2002:a05:620a:690d:b0:8ca:2086:a148 with SMTP id af79cd13be357-8cbc8d9aef0mr1537756885a.28.1772448822427;
        Mon, 02 Mar 2026 02:53:42 -0800 (PST)
X-Received: by 2002:a05:620a:690d:b0:8ca:2086:a148 with SMTP id af79cd13be357-8cbc8d9aef0mr1537755285a.28.1772448821918;
        Mon, 02 Mar 2026 02:53:41 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:41 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:29 +0200
Subject: [PATCH v6 1/6] dt-bindings: clock: qcom: document the Eliza Global
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-1-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=9930;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=j9DYzOsnDGdpwgJbOPis1A0xVmxQC+mYTY2zHyH88h8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwrUnNYccdAh99PQrh0daipb+k+hvP7jUe3B
 d5XUELbvUiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsKwAKCRAbX0TJAJUV
 VujAD/4ienKgkPcZH7MrX9Z82xeUTU8wBGs8VGge7eXkyewqWseYnHeOUKuRpO7HPCBUOp/93jy
 F3188QrJR6w5FzbnRs1UFMpAdX//q+bTPgWTiXKB7a24HV8nauvkz5VVK4pt1GgScg/SB8WNfXP
 UQWKTdyCfPQJQmej49K2o63/0rZ0iWSGevMPMa0s0+syV8HU5OUyWLHnScChPOGP1GBjdJIKi3/
 /5aWh17PaDLD3BnUSwc2Y3GM5kfZ0VJLzec5G51kVFoHHqlVXyYa0cZsm0S0LFNP89mcdnbsioI
 eAHyAePSjbzoiVWJdxkvWAwto6IqJAkFnZCqRH/Yc1lfcgCfvX8NjdwoYhg8pdBZc9yslp4IcEQ
 JE3PprRpXH3XyrFCXcdxs7vviHLbyH/952X6ZicwmQLej6OOqu+TqjmkKbM7ZhuRFXYK3wm6mpM
 Gml8qC+K98jzcr5M6fV6ppgAUJDidJ6Mdoar8LfCb1DANkgLL5uRcvomOx63E8NSpQgf2SwRrPv
 LngRYqpxbxsaIg5b3X6E9WzaoUXN9mhFeYQ2QSRfEAqVM8Nzhn/DOD+itgXbKKPjGwtO72fgse/
 kQSaxL69/ZvbBkQqDFLNBSECw9sO6dVKVG23uGW9QP6zIiIRA/EmzUsHt9lHXzcnwNH9JthCGLu
 EItCw5Cq2w6LyTQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a56c37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=QumFvB_LMSHuJXskJCsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: tCc-4aOVCA1dqA669dhJCpjG863jvv0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OSBTYWx0ZWRfX1c9jkLkzzTPA
 FYMC9s8xJ9q1WDILVotU1xlgx/YNeZvWbbBz5MjejxcHM9jx7yiBTuq07F8u3Io4XfLe41S1Ke2
 0a5z70RVH2by1XlHGko7N/L1X5zVg5rMlmGlduhUGThZgGB/qD2QuyUmVln3GZInpth5uZ3+AJr
 bdtWHXyr8SI1axccdhCItL/LLLGdKkylE84JdRF0DTZvOZ6fvrj73hQRNiuvZLwy6/Ag8/UFYXo
 t/zGfx2yR1By5G9qIseqz2oycptP6FIf1gNvdc//eAH0Wqmm1LlRzsPqVtPNWlbJdq32M7WVq1F
 OUN+tIj2cFdBkY95dFkvIOLUWbQF28kEkJzOtjqMLrPXgZGOawk6A4oswFNaUb4YokqA0yjyoC4
 0lHGqa/7W0FBkf5Mma0G22VWff/zf4tgmWUjk2mwDA8Isaxq6Np5uUUiDq4nR/bEa629m536I95
 DjcmR5Mm2WdSni8PHlw==
X-Proofpoint-ORIG-GUID: tCc-4aOVCA1dqA669dhJCpjG863jvv0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020089

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for the Global Clock Controller on Qualcomm
Eliza SoC. Reuse the Milos bindings schema since the controller resources
are exactly the same, even though the controllers are incompatible between
them.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
 include/dt-bindings/clock/qcom,eliza-gcc.h         | 210 +++++++++++++++++++++
 2 files changed, 217 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
index cf244c155f9a..60f1c8ca2c13 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-gcc.h
+  See also:
+   - include/dt-bindings/clock/qcom,eliza-gcc.h
+   - include/dt-bindings/clock/qcom,milos-gcc.h
 
 properties:
   compatible:
-    const: qcom,milos-gcc
+    enum:
+      - qcom,eliza-gcc
+      - qcom,milos-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,eliza-gcc.h b/include/dt-bindings/clock/qcom,eliza-gcc.h
new file mode 100644
index 000000000000..4d27b329ae99
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gcc.h
@@ -0,0 +1,210 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_ELIZA_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK				0
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				1
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				2
+#define GCC_BOOT_ROM_AHB_CLK					3
+#define GCC_CAM_BIST_MCLK_AHB_CLK				4
+#define GCC_CAMERA_AHB_CLK					5
+#define GCC_CAMERA_HF_AXI_CLK					6
+#define GCC_CAMERA_SF_AXI_CLK					7
+#define GCC_CAMERA_XO_CLK					8
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				9
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				10
+#define GCC_CNOC_PCIE_SF_AXI_CLK				11
+#define GCC_DDRSS_GPU_AXI_CLK					12
+#define GCC_DDRSS_PCIE_SF_QTB_CLK				13
+#define GCC_DISP_AHB_CLK					14
+#define GCC_DISP_HF_AXI_CLK					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_GPLL0						22
+#define GCC_GPLL0_OUT_EVEN					23
+#define GCC_GPLL4						24
+#define GCC_GPLL7						25
+#define GCC_GPLL8						26
+#define GCC_GPLL9						27
+#define GCC_GPU_CFG_AHB_CLK					28
+#define GCC_GPU_GEMNOC_GFX_CLK					29
+#define GCC_GPU_GPLL0_CPH_CLK_SRC				30
+#define GCC_GPU_GPLL0_DIV_CPH_CLK_SRC				31
+#define GCC_GPU_SMMU_VOTE_CLK					32
+#define GCC_MMU_TCU_VOTE_CLK					33
+#define GCC_PCIE_0_AUX_CLK					34
+#define GCC_PCIE_0_AUX_CLK_SRC					35
+#define GCC_PCIE_0_CFG_AHB_CLK					36
+#define GCC_PCIE_0_MSTR_AXI_CLK					37
+#define GCC_PCIE_0_PHY_RCHNG_CLK				38
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				39
+#define GCC_PCIE_0_PIPE_CLK					40
+#define GCC_PCIE_0_PIPE_CLK_SRC					41
+#define GCC_PCIE_0_PIPE_DIV2_CLK				42
+#define GCC_PCIE_0_PIPE_DIV2_CLK_SRC				43
+#define GCC_PCIE_0_SLV_AXI_CLK					44
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				45
+#define GCC_PCIE_1_AUX_CLK					46
+#define GCC_PCIE_1_AUX_CLK_SRC					47
+#define GCC_PCIE_1_CFG_AHB_CLK					48
+#define GCC_PCIE_1_MSTR_AXI_CLK					49
+#define GCC_PCIE_1_PHY_RCHNG_CLK				50
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				51
+#define GCC_PCIE_1_PIPE_CLK					52
+#define GCC_PCIE_1_PIPE_CLK_SRC					53
+#define GCC_PCIE_1_PIPE_DIV2_CLK				54
+#define GCC_PCIE_1_PIPE_DIV2_CLK_SRC				55
+#define GCC_PCIE_1_SLV_AXI_CLK					56
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				57
+#define GCC_PCIE_RSCC_CFG_AHB_CLK				58
+#define GCC_PCIE_RSCC_XO_CLK					59
+#define GCC_PDM2_CLK						60
+#define GCC_PDM2_CLK_SRC					61
+#define GCC_PDM_AHB_CLK						62
+#define GCC_PDM_XO4_CLK						63
+#define GCC_QMIP_CAMERA_CMD_AHB_CLK				64
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				65
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				66
+#define GCC_QMIP_GPU_AHB_CLK					67
+#define GCC_QMIP_PCIE_AHB_CLK					68
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				69
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				70
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				71
+#define GCC_QUPV3_WRAP1_CORE_CLK				72
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK				73
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC			74
+#define GCC_QUPV3_WRAP1_S0_CLK					75
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				76
+#define GCC_QUPV3_WRAP1_S1_CLK					77
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				78
+#define GCC_QUPV3_WRAP1_S2_CLK					79
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				80
+#define GCC_QUPV3_WRAP1_S3_CLK					81
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				82
+#define GCC_QUPV3_WRAP1_S4_CLK					83
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				84
+#define GCC_QUPV3_WRAP1_S5_CLK					85
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				86
+#define GCC_QUPV3_WRAP1_S6_CLK					87
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				88
+#define GCC_QUPV3_WRAP1_S7_CLK					89
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				90
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				91
+#define GCC_QUPV3_WRAP2_CORE_CLK				92
+#define GCC_QUPV3_WRAP2_S0_CLK					93
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				94
+#define GCC_QUPV3_WRAP2_S1_CLK					95
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				96
+#define GCC_QUPV3_WRAP2_S2_CLK					97
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				98
+#define GCC_QUPV3_WRAP2_S3_CLK					99
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				100
+#define GCC_QUPV3_WRAP2_S4_CLK					101
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				102
+#define GCC_QUPV3_WRAP2_S5_CLK					103
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				104
+#define GCC_QUPV3_WRAP2_S6_CLK					105
+#define GCC_QUPV3_WRAP2_S6_CLK_SRC				106
+#define GCC_QUPV3_WRAP2_S7_CLK					107
+#define GCC_QUPV3_WRAP2_S7_CLK_SRC				108
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				109
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				110
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				111
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				112
+#define GCC_SDCC1_AHB_CLK					113
+#define GCC_SDCC1_APPS_CLK					114
+#define GCC_SDCC1_APPS_CLK_SRC					115
+#define GCC_SDCC1_ICE_CORE_CLK					116
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				117
+#define GCC_SDCC2_AHB_CLK					118
+#define GCC_SDCC2_APPS_CLK					119
+#define GCC_SDCC2_APPS_CLK_SRC					120
+#define GCC_UFS_PHY_AHB_CLK					121
+#define GCC_UFS_PHY_AXI_CLK					122
+#define GCC_UFS_PHY_AXI_CLK_SRC					123
+#define GCC_UFS_PHY_ICE_CORE_CLK				124
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				125
+#define GCC_UFS_PHY_PHY_AUX_CLK					126
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				127
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				128
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				129
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				130
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				131
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				132
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				133
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				134
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				135
+#define GCC_USB30_PRIM_ATB_CLK					136
+#define GCC_USB30_PRIM_MASTER_CLK				137
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				138
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				139
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			140
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		141
+#define GCC_USB30_PRIM_SLEEP_CLK				142
+#define GCC_USB3_PRIM_PHY_AUX_CLK				143
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				144
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				145
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				146
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				147
+#define GCC_VIDEO_AHB_CLK					148
+#define GCC_VIDEO_AXI0_CLK					149
+#define GCC_VIDEO_AXI1_CLK					150
+#define GCC_VIDEO_XO_CLK					151
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC						0
+#define GCC_PCIE_0_PHY_GDSC					1
+#define GCC_PCIE_1_GDSC						2
+#define GCC_PCIE_1_PHY_GDSC					3
+#define GCC_UFS_MEM_PHY_GDSC					4
+#define GCC_UFS_PHY_GDSC					5
+#define GCC_USB30_PRIM_GDSC					6
+#define GCC_USB3_PHY_GDSC					7
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_PCIE_0_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_1_BCR						8
+#define GCC_PCIE_1_LINK_DOWN_BCR				9
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				10
+#define GCC_PCIE_1_PHY_BCR					11
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			12
+#define GCC_PCIE_PHY_BCR					13
+#define GCC_PCIE_PHY_CFG_AHB_BCR				14
+#define GCC_PCIE_PHY_COM_BCR					15
+#define GCC_PCIE_RSCC_BCR					16
+#define GCC_PDM_BCR						17
+#define GCC_QUPV3_WRAPPER_1_BCR					18
+#define GCC_QUPV3_WRAPPER_2_BCR					19
+#define GCC_QUSB2PHY_PRIM_BCR					20
+#define GCC_QUSB2PHY_SEC_BCR					21
+#define GCC_SDCC1_BCR						22
+#define GCC_SDCC2_BCR						23
+#define GCC_UFS_PHY_BCR						24
+#define GCC_USB30_PRIM_BCR					25
+#define GCC_USB3_DP_PHY_PRIM_BCR				26
+#define GCC_USB3_DP_PHY_SEC_BCR					27
+#define GCC_USB3_PHY_PRIM_BCR					28
+#define GCC_USB3_PHY_SEC_BCR					29
+#define GCC_USB3PHY_PHY_PRIM_BCR				30
+#define GCC_USB3PHY_PHY_SEC_BCR					31
+#define GCC_VIDEO_AXI0_CLK_ARES					32
+#define GCC_VIDEO_AXI1_CLK_ARES					33
+#define GCC_VIDEO_BCR						34
+
+#endif

-- 
2.48.1

