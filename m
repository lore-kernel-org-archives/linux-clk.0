Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793075711;
	b=n0yggmBUU1JMr/K7WA4vLkVWDONcOJAE6aBVy9u2IfBqXwKw6/GLyffnRLkidKmgIZOD
	 V2rDZVebxsGhFuj345xx5ZPfXw5ip3AkV0JwdL0q4mZiSi3xY6hE1wqnOK9DDotxhpahJ
	 uiaZX77d/ElxYDSc5TbiqFGMWq8Yil8OCcS/p7v1naZd1H5zuqMdXyp8yI3wP8Qd2qQjn
	 X7b3wBd6xs93MWiAnnasJPXcT528vkxdywOL/44Ef3oLv+enn1uNuOjXDZgh7zZhqT0lG
	 ZXA4wHUu1U+XZrTYdun8in2XJiGWIn1fPvmekIlOUik2G3OW49XXdqi5fxFMUPnUa3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075711;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V9Ntqo346qzMImZTzSh8DdvT9SawvOj4TJ2OvRn5cI0=;
	b=C1SY9ZjG0s3+UfsUlPiA0yZNrGpnEDy5Q2hHMWfB0W0U+lfjcIUz2RIdnOVRcgoLJuKb
	 YfB3qtFMMpeek7cKM7m4EFNbzXIVReIwUssjcapvaPUIt3RTF5fx4EhtixZemH5p92VHT
	 LqF3bE7JO3Eqc1l5P0QLyMk/LlQnv/yXToEofrDdYi1TlgeRGyolJdjoaE5fDvZ19tToo
	 WCMQRdeZrCtDCFIm88F4aTGpUxD2eS5iG/WhBjFKDHxIzPEVdudYKC/jv3ql0Ay7l8m0W
	 uk/6RZRC15V0hRTSTynTGbrfNU2EuQp7eR579NaEyFeYAqVQNd+f1lNakMJIp8b7bJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmH6h7xX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA3F606A31A;
	Tue, 27 Oct 2026 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmH6h7xX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793075711;
	b=DZsJhRTEr8DORPfwzzVPKvynw/SeLF8Hr0m2TsDfMjDpxaxp9RhJXnlNu67deQGmVJ6T
	 e5TAX/y3BCHOUVbJo0HlFuaKmQp1bU4CXLrQ/QDz1w46I/dGgMSwQEFNhpSDsU68GvPch
	 L+Jjm+73YDNJmB072GDkMPFBlhKFkV/Jpup39KwM/Dv0U6l1xcJNHrLQ0OSEebPUKFc2B
	 fDR5nchFgNUFHhvMFg9tHrjwjsYlt4v7w7g+1kEfBYWMJ160xeq6LT0WbV0ztLsYS8jha
	 cqX4+Tf35rFlqnUJqwJmnklG3m5hZHhA9+FVVN3ahrGnKHPlbOObM3lpamtSNTsBqYA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793075711;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V9Ntqo346qzMImZTzSh8DdvT9SawvOj4TJ2OvRn5cI0=;
	b=29eIVk14CqKh9S+ubBx9mckOHlRirxJBT/9Momu0nc2HQQIHghRmdSGmh441b8JMnIi4
	 nEVLpsPxeeAMh5dPbMrxBdUUuqc+wge6gYiKJXhhR6iYhezSx+4khpPfvIyfa+OogtiSk
	 QfIsyTmZQwi0r0+GQ6ltP+MqfZyUv911eksiG9RRi/sYmgr8nG1f+ZlIDIrb9FwLAvIMF
	 kPlEnY6EU8gnjlZrRJDHTyHfLl4Kz+F9nmhRP9FFuFhLfdNFFrauGTetfX6tdKpOG3dE8
	 DnYRa8LvbOW+ysXSdohAJRKVteawZeFsbZEm4oDl6KHYtkt2AflxWysY0i1PHLSPIHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A4671F01828;
	Tue, 27 Oct 2026 04:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793075710;
	bh=V9Ntqo346qzMImZTzSh8DdvT9SawvOj4TJ2OvRn5cI0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WmH6h7xXl/O1f8pl/dlUPpj6R+LnVaigUrAT9GuV2tpu5Nmr2RjCYFF5rDgTc1Uzt
	 SCDk0ffh2BV7AK8o1pTnUAQIwhxekVG0CuVjqTms+VFkdHVdBwnBCYajb6wdXm2Jnn
	 vjcIIb8RIzfzxT2SBiIt3pbkwjaaBigo2BPftsi6pw7pDxIWHtTkDR6VvwLvLsueSj
	 NHhbAHOGO3F7zPASptY64gilaJJp4sDMPXB9l76uGZPLozhvCy2yiTHuYhjShqs35w
	 3gqp4PrqqVuUrAJvRVLmdR1XgR57Z6NJ2REqSvP+CwUsvFPS8rS+U4g8QNOzR0Dh1r
	 DdP5yfxBZ1pAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F306144FA4;
	Tue, 27 Oct 2026 04:35:09 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Tue, 27 Oct 2026 10:05:01 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add SM7250 graphics clock
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
Message-Id: <20261027-gpucc-sm7250-v2-1-773056e4043e@brar.si>
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
In-Reply-To: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793075708; l=2742;
 i=patches@brar.si; h=from:subject:message-id;
 bh=tY6hDzRQJRYOBlf/fKmeYB3tja46AJ3bHbMAdIz48VU=;
 b=nKR54osy3eiFYONTpGXLaw/ILpqcoB/ulyBr1v3sMCGYYPwzXiFCyZAf2dKpMrdLV8aulyxC7
 S/t6gZqv3MYCF1x5ap1cLsdIHHhqGuDPJhmYrMTUNzd1+pr0PtjtEWj
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
2.56.0


