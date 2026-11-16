Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810110;
	b=TquThk3g6z3I5SBmTVpqpUFEqMrBM/bNUNjy/H6McfimKpebAdvImfzxsUTCoBhqGfc0
	 iVFqWV9HlO8NxomciqCGRX6uf6sHufc7CQov4FHPlAOT6zPJHvVH+B32uZ1Vy9ZEoIhde
	 U/cl3+ORrN7gB2t9os8twqE5YOVSF9HsOq8bGS8Ot2vWIsUWWxTeom+X9gAPvE9fyc4GM
	 fvM5/8DfLcg7nO3tRAbkB7vlCvZye7wQIt+Cisp//1JiRqSpEWuCLtw7LnmJwPmZT123n
	 PKPSnjVngZHJJK9AmkFZq7oLpn7Dh2NJgAvCxrcQ26/n/ncxkOC28XX0YLt8Ndm3jPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810110;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RrRlNaKDw3lqoWr2bRm4+2M2WPJ+R45REBK+M1MdOcg=;
	b=3ZFxui1VIaYl2TaQI0Sto7iYWsfxIDLtj5vCCkadAYxvuJIxIF1k6usW3RkRL9oEgtef
	 4v4vSNVPfMX84NCeejTG0xglyNHytRuOQFWOLvWGh0kkS/odm4iA7VWLiInYqSvq+vNOK
	 G/gSfqcK39lLVXpgLpod3KEB7o0i2m8mmP33k41SK0/2HQtjHCMykta5NM48wZ2ZsNZam
	 IeT448TxyMvka249hrlQNV3+2tJtjf75r9vZL/3hMB4mavrkBaPvS8n8YGKSgkuqUwz1p
	 PAyaLs5h+YZOpkiAJ3CRahohwQTQXA95MprJea+Ip96tnPujpR7iDCRZ17UUw9U+PeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8Ic7mir;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDDD606A32F;
	Mon, 16 Nov 2026 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8Ic7mir
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794810110;
	b=FNRRXmXDhoTJNgJd3Q2thJIUgSZJMdNL4MDihzvb0wFc5I6eDXOj3nYhihRTGlwh7otl
	 Sq2Ftv2ZaDN+bwTpYHtXQCZkKjGfTxPuFM8q5vkgPAVIbc1rOFuH4luIYrD/q4b7U4rh0
	 L3lhczyYL2VEIfWBoDKrF+r/XkjSSapraFA9C2OBdEIVoG0nXdjPCXMUVJ7Sv2YaWcotK
	 X28DLr9lTLRXpXQ3SCeG22kmujh28PP+XopN+Nj5ufTSnSyO2TRDA5h8bqJ7T+ip39Xpg
	 lCAI6M8Xp9TNb4uPqtWXI4XAJ9oQIh7tfanCzsGF7EbRhNwM/1zaEKajIJhZllwXkxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794810110;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RrRlNaKDw3lqoWr2bRm4+2M2WPJ+R45REBK+M1MdOcg=;
	b=eKGuZTX4D3hARgAoywsB2no1sN7IWy9hMF9tU/rQ+9A0nFSzXUzI0kcWQL+AV6JlMhvH
	 Gwk+jkP9QPUjgnkE6PQPVQbotXVFDPAFo5y1Y1+GiAUm/WgwJjDAEy58rR2ONCisNq6RV
	 2aM/0zlElygYgnUXbDI2BFAyO8aRTptVdMnfaAItk2rAloHo7HnePQymzI5dP+16ad3YQ
	 WoFyQm2PxxyKe1gJkfn1531W9oTF0NbVqkiQ7rNxlQ3sMu9cPLJ6kBq4qlG3V5L7Yr87B
	 +36Xvwtwcupddli27zZFryF6J4Ntf2K4joSd8mRtGEW6hwZCiYvJ6HpJSEIuDGO1auQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D8141F000C5;
	Mon, 16 Nov 2026 06:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794810110;
	bh=RrRlNaKDw3lqoWr2bRm4+2M2WPJ+R45REBK+M1MdOcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=a8Ic7miro1AmouYpRzZ0ADaIGM9WV5nF1hBfR9t7UYTObz/0Kn0FiqTL8MSWZonSW
	 /yprO9StQjiB7uoT5hdXbXhD8dOsZHpe8E7YMi4oh2w5dpybjbMkKD032WEhZfpBVu
	 TiEinHEscjNPcta8kB9VnoGNFotuTCoV7S6askSDzN+bpvz3siIw0oVGq195pEEihd
	 p50ITxspltjih0KJvU2bgUJQH217aA5RuuRE5MtLNmiNnDGkQthOnFOm9S+qcVLLVj
	 gBds8tIOitZClhMqaL67kV+cLiBCdUHtleo5kdq4a0N98+XlIktGI7RS2K4TKOG6Wi
	 R36fK90IPSl9g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0DD834A347;
	Mon, 16 Nov 2026 06:21:49 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Mon, 16 Nov 2026 11:51:32 +0530
Subject: [PATCH RESEND v3 1/2] dt-bindings: clock: qcom: Add SM7250
 graphics clock controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-gpucc-sm7250-v3-1-df68449f0e36@brar.si>
References: <20261116-gpucc-sm7250-v3-0-df68449f0e36@brar.si>
In-Reply-To: <20261116-gpucc-sm7250-v3-0-df68449f0e36@brar.si>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794810107; l=2815;
 i=patches@brar.si; h=from:subject:message-id;
 bh=/m3X7feB3glBQsDaikVR00KHiwSBK04jEo5m5JeK04s=;
 b=O0srdmk7HPlkzzC6MVerBjjABVwBWjznplsRCg8sWSFhxUK/KZEwEK/fnp7NxNAGZ9a4/d9de
 tevtQBTV5jdAEtoJtEn5ShzSyOjelUN7ccP3o06gzF+2ZD/0W8FLgyw
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add the compatible for the graphics clock controller (GPU_CC) of the
Qualcomm SM7250 SoC (Snapdragon 765/765G/768G), and the header with its
clock, reset and GDSC indices. The clock inputs are the same as on
SM8250, so the existing clock and clock-names constraints apply unchanged.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ishu Brar <patches@brar.si>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |  2 ++
 include/dt-bindings/clock/qcom,sm7250-gpucc.h      | 36 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 3ac4419009a9..262c0345836f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -21,6 +21,7 @@ description: |
     include/dt-bindings/clock/qcom,gpucc-sc7280.h
     include/dt-bindings/clock/qcom,gpucc-sc8280xp.h
     include/dt-bindings/clock/qcom,gpucc-sm6350.h
+    include/dt-bindings/clock/qcom,sm7250-gpucc.h
     include/dt-bindings/clock/qcom,gpucc-sm8150.h
     include/dt-bindings/clock/qcom,gpucc-sm8250.h
     include/dt-bindings/clock/qcom,gpucc-sm8350.h
@@ -37,6 +38,7 @@ properties:
       - qcom,sc8180x-gpucc
       - qcom,sc8280xp-gpucc
       - qcom,sm6350-gpucc
+      - qcom,sm7250-gpucc
       - qcom,sm8150-gpucc
       - qcom,sm8250-gpucc
       - qcom,sm8350-gpucc
diff --git a/include/dt-bindings/clock/qcom,sm7250-gpucc.h b/include/dt-bindings/clock/qcom,sm7250-gpucc.h
new file mode 100644
index 000000000000..f4536808d4fc
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7250-gpucc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM7250_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM7250_H
+
+/* GPU_CC clock registers */
+#define GPU_CC_AHB_CLK				0
+#define GPU_CC_CRC_AHB_CLK			1
+#define GPU_CC_CX_APB_CLK			2
+#define GPU_CC_CX_GMU_CLK			3
+#define GPU_CC_CX_SNOC_DVM_CLK			4
+#define GPU_CC_CXO_AON_CLK			5
+#define GPU_CC_CXO_CLK				6
+#define GPU_CC_GMU_CLK_SRC			7
+#define GPU_CC_GX_GMU_CLK			8
+#define GPU_CC_GX_VSENSE_CLK			9
+#define GPU_CC_PLL1				10
+#define GPU_CC_SLEEP_CLK			11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		12
+
+/* GPU_CC Resets */
+#define GPUCC_GPU_CC_ACD_BCR			0
+#define GPUCC_GPU_CC_CX_BCR			1
+#define GPUCC_GPU_CC_GFX3D_AON_BCR		2
+#define GPUCC_GPU_CC_GMU_BCR			3
+#define GPUCC_GPU_CC_GX_BCR			4
+#define GPUCC_GPU_CC_XO_BCR			5
+
+/* GPU_CC GDSCRs */
+#define GPU_CX_GDSC				0
+#define GPU_GX_GDSC				1
+
+#endif

-- 
2.56.1


