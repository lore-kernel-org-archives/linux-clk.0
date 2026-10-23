Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792750216;
	b=4+K6YtOazhfhmfUgkbLl/gZKev5mMsh6p4+SkXjSnKzcd8jsnLj/Vo3S6mYaUUPnHf8A
	 xB+xRDiKOW2qmz3bbWUDc6Kwy04llYpiGV4H1GniHAJ3Zj+fcGVNu1StSA/W5Z3cowuwQ
	 HQy5e0uYPvTXr4LLCeErw9Z2FbKFZ2wUB2NVVlIXkP2McTY4Ls3zrkGKqwIc+waukzplN
	 R/T4GXJ5JXe1r6r7+SfT6bf2CeurIL+NS6dglqHuNfAdA8e4ShXCXMYTRoCBzxtnhFe0U
	 xf/PlW7ZVjIVKZqS5WTq0C1YhW1+7kYNBlYFi7wMPl9/e6qaEOk3bf79O0eVNeSQTBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750216;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GIjcJbhiZCM8A/Ohjw3DKcZtoKida5YLpCeOLFvQ9aQ=;
	b=c7EqLKFhgjRTsIaIZ21fbVvFuAgopriUbz0U1r3EugPAsoP7kjiUkz0VS/E97AacKel8
	 lVkg1RfJZODfEvTEDKLC0yG9im3xuIvl//5+UmQlvk3WZowdc85o7IB5zqYJ1ul5Xm9OM
	 qNEZNWQodHTyPnKDw1ixDFOfrmoEZDKTWBqwjmI2O0MHmL8xyI3Ei7VITEyAlmiE7HNqb
	 Xu6XRW0MUAd60rznf+Tzudp/qeECqec+M6+dtncRd87EqCFn0Oizr/AjlbeWPrwa6VtuO
	 8UGtj52GFxc12HqQ3xR5am7NNHDiff07UQL6JAbPM+IumE6COBrZVl/PvPv7o7D0hRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a+XuSZCR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D6606A31B;
	Fri, 23 Oct 2026 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a+XuSZCR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792750214;
	b=rs6E0FVVg4vJpBpZszAnD+G2auV+90G1UYeis7G3tQRFjWQmS5ZMriCIn8KJMWPQeNoG
	 rvw4mWq+8u9Dh2+RZNbbhtG/h9XP3ea94C0hmmpl0/EnPzS7qlubNxrxDaMka9o3fPFL4
	 jiAJFkEPbAi08zsF6sScb2q5cXwJgjmoKRQ11YWsEnuMLYOzg75cAqTea57oAeZoEr0In
	 SHB7HJi2dtgoYrto5ZJEoEsUwJCHEVN6ZpJAtFXsC9LhfEkpnjRdgz9wtn0wE1/zPxqOx
	 lQrMnUvgzQhrhHYaTQTgWBKAJLQYFeyRaBT4D6tZULZgAErkSXmo3edoEDwq6XvoMfQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792750214;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GIjcJbhiZCM8A/Ohjw3DKcZtoKida5YLpCeOLFvQ9aQ=;
	b=cpzHJFMkUyWT7t7hAkYI1DsOTxpVLW5q4ZCcAa0j3x/VcjoEdK/m82PxPnHwqNim3th+
	 t5tMguOkwUjSz4f5N60c9xQgJjgU1GqJojrJr6x1GSyafWDSd+oookfgvqsZovhDQ7A+P
	 xkUEOXCHxr+HLdV59bkj5ZuozZPgIJ+OCm9MyW+a3wvmuNEbyuq9AQAs9vMjMscuW1phL
	 hTpRGi4Qstby/HK5ApggmOtMsXQ2y7lMjCr9nBvJ0gM5jHP1e012eDGV9REKtnRemhxLy
	 IKMrBqe474YhcELKNXBsUzfOwAGYsjlVHCSRSGbbJf2PZVAbaqytMHNs2oYjNN4w6dw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63E4D1F031E0;
	Fri, 23 Oct 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750214;
	bh=GIjcJbhiZCM8A/Ohjw3DKcZtoKida5YLpCeOLFvQ9aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=a+XuSZCRMFTUp8TfGOC6tmlkKgnvlS+wa36rCGL7MsMybpcCqOOY+5zPfXrl8vZW0
	 SWlJixPfYZ0sAeomnQMBkPQ+xlCGW08nzAmDdZnkeNJzbj2IFlFMAxufkCs4izsUst
	 tToHVZptpd7AotXNUXkcQWFGDj5xhD8oND+Cw0PIEYkj83vk2Ixt4ZQJwDnDpzm3Cj
	 EgghMbuC06ilYB60qZuznjRb5aiqI4YF8DGvdtPd6mhdEI2u/G+ySp2fz91qKmiY6z
	 YzEJxye5QL+rRtuqCczVwFLy0pk+UKVf987QOX+39xKh940/6YqEgJeMTcKVkAmV4w
	 5GYnCufyCP0xQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D815544499;
	Fri, 23 Oct 2026 10:10:13 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 23 Oct 2026 15:40:08 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add SM7250 graphics clock
 controller
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
Message-Id: <20261023-gpucc-sm7250-v1-1-d9149cece8be@brar.si>
References: <20261023-gpucc-sm7250-v1-0-d9149cece8be@brar.si>
In-Reply-To: <20261023-gpucc-sm7250-v1-0-d9149cece8be@brar.si>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792750212; l=2751;
 i=patches@brar.si; h=from:subject:message-id;
 bh=zNYJpd8CGDe4+jLuKQsFoERznSdYKLOwrl2HcMSC/Jw=;
 b=IWiL+WuU0aMzyFIDvNG6CyKEglNpi6iwZrVN+QBjuih/cd0siKsRB0IauF0wv2nTvBZ4f9iN9
 FUvwMdYxp40D8C9cnVj9LxlOpNMB4mDU3rltRFDrZZd617bQKUXMtjb
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

Assisted-by: Claude
Signed-off-by: Ishu Brar <patches@brar.si>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |  2 ++
 include/dt-bindings/clock/qcom,gpucc-sm7250.h      | 36 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 3ac441900..d262455f3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -21,6 +21,7 @@ description: |
     include/dt-bindings/clock/qcom,gpucc-sc7280.h
     include/dt-bindings/clock/qcom,gpucc-sc8280xp.h
     include/dt-bindings/clock/qcom,gpucc-sm6350.h
+    include/dt-bindings/clock/qcom,gpucc-sm7250.h
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
diff --git a/include/dt-bindings/clock/qcom,gpucc-sm7250.h b/include/dt-bindings/clock/qcom,gpucc-sm7250.h
new file mode 100644
index 000000000..f4536808d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sm7250.h
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
2.56.0


