Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D181364EB9
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848114; cv=none; b=rJX10dFi+Y+h6EJ21gxi4zhaLYCitNhf3lSVKFkn6C8q1LolqLuhw1o5JyiMxtQh2P6v+SjT7WPSmqk89471U5s16KLNwpcaXneLwIKuMoUArd/y5ncXbqJ6nEUmI7L8XF7PKE5BOl763gJNclGV6znXWIhWuSsbDRnSvbb0TF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848114; c=relaxed/simple;
	bh=MC8/r8OBBAdipabYPIwBN1AMhOJKFqaLc9XDWF/LQqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFxwoZcA1jS654MZZ0FU6OPWP3iRNye/Rn02b1YVqgEsxTbQUf4Nd8NRWLuOZMCy0AYXog7v/zZtbXvv3NB/ZhVr6/5/bITUwJW2NYfFt6Y51pOWLBwqA571aRJ4UTN3jIpWq/27idaFn/9/YPXf3HUNnAx/9yPTEZrgfiilCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LywRyeWW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csmKDAt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LywRyeWW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csmKDAt/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9ooms2783699
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+WISHSySHdZWaSGGLRaIiT3gB3EjuCiu+oHw8QKHa8=; b=LywRyeWWh9ITXecj
	j7XoVJ+7Q50FIalOOEfCnwh7sIxgUXciL7t+FV80JHVZLJE3KEpn0riBZqHjDCxn
	zjfeayWm+0k9c2+UY9vWLCZZmctYt2mZPrpa4JNO5rVbzT9BLAM8N+QA9xO8FqUC
	q/NKHguv5PH0dto9Fs3RtTbksyNrCTcMPhP5oXIhxJqHcSl6P+A2dgoyGbHyJeRQ
	Cln40KfxZ6l7Pc5IRaImJAp+WNSNXtKM+tJSON9myIPAPh/xvgPlo4yPX5xZ+unH
	OUN6G+znt3ehUcIn5kuVRX3TtuRtqNggbp8a8R/RFnniknrj6P6E2THoOleEkR+p
	Q/MRbw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgvp3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:52 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45f11f18a89so58802330b6e.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 04:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848111; x=1772452911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+WISHSySHdZWaSGGLRaIiT3gB3EjuCiu+oHw8QKHa8=;
        b=csmKDAt/rFbfTKaHtpPc5vpCpeBQ1H5ZCNTwx3R61u2kbuKsIFfQ0khowOzAi5jN7L
         0YNSYP5dPzF3Wl7eOwYGSAKbCppjC96D4V+LoCw3iRMTx0/lTTL9kXcqocsWwYFr0cr6
         ZqIiX5hchhwMa56Pe5C77cHwkvGgNojSMUTOBlA6+VbWGXnmiNo6eU3+lkrQ4GoSaIhf
         zXIvBMvqKfyGI1cp03ArUxG5pQXfZEzKCSi4WhVlkCkwVjtR5ztFOdU9IciWPHSKFXrn
         czIpfVY3jZkeHmg4WJRjBf6pb0LiCjxfQp5Nm11MsS7skIFLlOKhqG/2QxgMkOl+3Qb2
         rvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848111; x=1772452911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+WISHSySHdZWaSGGLRaIiT3gB3EjuCiu+oHw8QKHa8=;
        b=MAwBfzNvNjn1FgYDRSbk+Cz/m9Uoj+7ZAKglz8rA9txbiLuzHlayfD2BGKWX7jUZ1E
         l84XsAkD2N7/lb22lg3XKA6ps5kluuVt7ggp5Eo8wuActgosWjqWAOTyMihPtUwbLrP0
         JEmb7FMm/qgY7etSx4atq6nmbavmYUlSsnmwZsfcWyw2AwshJ/hWzESsAdUQHAjrQUeC
         AMmAGbrBeINGU9QHLONLdW12yyNnuO6ypi+TeN5RXE3utzq+5M8AqEpiCpHvYJ7kTTDQ
         Vcd6ZhyuYH3yfBvu4NvIem2MWRgje3aWj6x2sEA+V0Vl7cMkAmSB3fx8hWHwUL/+kB89
         cNQA==
X-Forwarded-Encrypted: i=1; AJvYcCWwb7ifX1krC+HkgKKm8UF0MIsGQ9LBOTXdth9lrrX+TQAqeVTaaJT4huHty5K/aYTsbh8rGZnxmzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSeFFRcKPMuUEA7B4h5rJVTW1TyUaQb/ab+Z/cLlizV+GLLtq
	5aDo6Q0/ltcsUhaO80F7uWSnDv3bJC7wo7SVDzFVl97FIrzqEtQdoGYnKlr2C4/H6VrPxhLyRXB
	wDHri7qzsOyw3jsymFCNe1+C2NWCpQE8vXCRTHYN31jvvyfMG/mA/hVw+ZEfeXfWkw3mHQAE=
X-Gm-Gg: AZuq6aIDGkT1vC9l+9S3MXazrQLG4r655Zb2aBWyUk75D3DPcIy8foq1y8JAJLghtdE
	ypepdq74xsgZmmO6Z0EzpaIRmUvx9eiK7lJZbbgJ/0ll6paQMpMgzCogGk8sd5byWG5J1yATs13
	13jxtlhpQuyIvbvKrKicval9cmP2VApPJfd9RuPUR1+aSeNLPxdV60uymtHG8EI8iSIKfPb9DSn
	LkrlA1wIismQpIYSPgLAOWg2N7SRDUhJ+XZrZXXnXc3ZLopm5iOnZVUnty5EslnJEq/5XvaPiCS
	G9/654KqfBtnu5FTbl6CqeM/s0ijstT+gWu81NAqGrllwJ4qTIjb309bXwQerfouz29RDE9qOZi
	bX9+5CaUBE4w3iAETncfIQ1rfk2Qx/Q==
X-Received: by 2002:a05:6808:2512:b0:45c:93ea:1188 with SMTP id 5614622812f47-46446361423mr3353470b6e.43.1771848110760;
        Mon, 23 Feb 2026 04:01:50 -0800 (PST)
X-Received: by 2002:a05:6808:2512:b0:45c:93ea:1188 with SMTP id 5614622812f47-46446361423mr3353448b6e.43.1771848110131;
        Mon, 23 Feb 2026 04:01:50 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:49 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:01:18 +0200
Subject: [PATCH v5 1/6] dt-bindings: clock: qcom: document the Eliza Global
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-clocks-v5-1-dcc66df713c3@oss.qualcomm.com>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10051;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJC+QtVSgpdSYEsefj7EU5h/fOx6+JlQTbxdPuwyAcI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGdFMTTFvQU1sOD+DmlkDKdN2txg/KHQxzX1
 oELOlAkLu+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBnQAKCRAbX0TJAJUV
 Vg71EAC78KhJ83IheFa7tcheg039JRz/r7D1nDC4JxkL4UF1Uy+ns7UxGfaKDQaT4qf4h+Tcp3a
 1WGHlsUOTAqFdeLUIdzNMBHHU1TDH39N8nctPjh90mDCWyEiQCa6exTxcejeEql+DgNSY4v5ys+
 x/707+BdoKC1zHQiB333wjwQc48adj2XYcD93jFEIn6veAButabAq9OTDJKIPDhS4Ud1woQWgZg
 dWsGjwTXGJKxc/Iby9E9uvcLB/pB7DPzd7Bz5mSVrs1fmp1MtN1ON0TDP6d2VdhB3kuBlfaNesO
 fQ/t6IGMg6TybpAnddu2wTWjAlPs2zBbV7+PLA9NwFqdcNuFmZ8EjNWuMQ1XssZkzpua35qST0i
 sBvU7yqX2s+hdm1i5sAyurGU9uf7XW1LRy9UUrnKOdRn/Qc3Isdua0knuS6ZwxVoqf7HMcg+5E0
 jrTZqzEXSvsMY50QfnZL4lGsgIGmHOpmkXPX8iWly2dKbeIKzaj0n044hDfAKcn+O6k5EDuJ++p
 UhC/3MDyIrcA2zYSeRyHSLv0bQ7LdJObo3dFfzqm2+0m5nWF+3KjvghCE4H8y5ZG27MMEfDH3MW
 Uw6/0pN3gr2xH769mjOQ1Wv54Vh/BFlC4/qtVOKj3IwMsNQ0vRTdOjPBC9DsrRbwlTBbRZU681w
 JXcyUJVIWBDN9LA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX6gqKZ0uFf/ju
 fZvUczG7Oky3S8PGnI9XhFe2FiGSA0bUUTeXgBdShww7pRADfHqtgb9Jee2T+lACcNtChxnjKZv
 sP/r/lzPltvYQ3jZC8Jw67nI3/bRAD9VpO4KEN2wSnrX4th2y9VJ7/cdZbHX6qINXm9IaLU1NvH
 3pSKYtifp9kxSFEpa6tO2rIoQnluGO2/M22vfBeoCt937KFkRs+8u0/nGBymbiph0U7Xk6F1i+M
 bFJkTlOWJneze6Vkljf3FnUWQtJKV3njlGGDbVqivW4PilUgbtK+8AJSk9Jcb2tO6DRaXI3ALC6
 0Pbvi9KvQcX4AogyeZpMglJLE41IrcJWRkuuvlmUDdXv35TuBSutSfPlNflb/v6E8e1nufHNgmL
 Zh7EjG8sn5Wy8hqTXXwx93qtHIFEMjJEyscAR8rG69dZs5SKo3O0GuNMXtO7W3HW1njLSjOyLxH
 VC1dCkOiMWnYvxpnXlw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c41b0 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=QumFvB_LMSHuJXskJCsA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: x7hrDZ-cVbcmcuUiYEA3dalQax8PY-hW
X-Proofpoint-ORIG-GUID: x7hrDZ-cVbcmcuUiYEA3dalQax8PY-hW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for the Global Clock Controller on Qualcomm
Eliza SoC. Reuse the Milos bindings schema since the controller resources
are exactly the same, even though the controllers are incompatible between
them.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
 include/dt-bindings/clock/qcom,eliza-gcc.h         | 214 +++++++++++++++++++++
 2 files changed, 221 insertions(+), 2 deletions(-)

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
index 000000000000..e94d3df1739f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gcc.h
@@ -0,0 +1,214 @@
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
+#define GCC_CAMERA_HF_AXI_SLP_STG_ARES				37
+#define GCC_CAMERA_SF_AXI_SLP_STG_ARES				38
+#define GCC_CAMERA_HF_AXI_SEL_SLP_STG_ARES			39
+#define GCC_CAMERA_SF_AXI_SEL_SLP_STG_ARES			40
+
+#endif

-- 
2.48.1

