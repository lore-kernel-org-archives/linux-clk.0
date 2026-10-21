Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586408;
	b=tZmQTDFrhCbUHyHF0pWRN50v+9GbIw3xdJB7CyDcCyNGo/HM4ptChR5nt3cRnJj+GpSa
	 rU9TZ+tnYP82thJoqttGH4dSlAUrAZ/lUKvsyTtMqWTRHdjkDuCnQqlImlQNgPhy7RYdd
	 nQYLIA5NJRpT+9GIXSJzOIpSaX/Cvh8QtRQn68lJX6YvN+JloUtqWGLmMyzSE9YVrT8IO
	 JDShV5dBo86Zd3q9jRe4TvsuqRz3ijNm023QLoI+OheSHa7qdM9IdiSyApvgXVRz0XBpZ
	 O+i80cuH89+wCzjdd0Il7Z4c84S2wPuCCFfkBOUQkIUhGhud1tN+RdLWZTz84/Awczw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586408;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F/MVbWE/nzEllmJoCczHUTZ77HaNnAyLwGH51Z5xA14=;
	b=Q7aWozi/aUpWyAX3qwI5E6QqSCY9MIVi8mEeDGMesPZn1G7vJbW4Ro0lJ6Lg5dB8aWVb
	 P+beFOp2MiMWLmfNIdizo4oTLK2bMk5NrrOTl/bxSzL9ctxXgo3wS4c/+BMUwlyzkJFRB
	 5aAYj5+h8XYJdkfiYjNq+tbR64AInX4mKcoG8ocEAuvoAnTKKZ71utP5V1U7+8GBo5vrx
	 528PnQGH4qlYcFRt5e3od9NS3lilsFH3SFvkx+GW0i5qjfe2GA6m6jC5oiffNYE6vGx77
	 aCDlryCIewiAC3Qtg6iLnC2MXbJokmJ18BVK2YcAnTCmbRgNZhK9x+1CKaoqOoYhbvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZieLLyb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C878606A31A;
	Wed, 21 Oct 2026 12:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZieLLyb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792586408;
	b=qb9Ko0kO3I2UInLQ1t+H22ZzFNFtN3knHcr7NNQ4ooHfx664Z0N93PZ0NcXrjiK43I4f
	 mds8gjSShX+C8uqfJiHmKqfgS1FN9L2+ENwO55ikhNFO+ehW0J/L8iNfYoCauPFyVrAFq
	 4o3Z5KaGp4WIcLwmQe+kpg+QzQub2QlYkMiUMweAcmWyDMz2GBGselCEun8LwikH0PqyE
	 zq/HraJAmMTuHAmagKhXG4q5Oye97Goq6LtRJlNatKHwML2eZsc80tHHeATRAwAk+Vo8W
	 qPkzY18uJawhG9RWEdR/gafi/Sqw/RynQCoYKD9QlhzCVlJWgAgLbbOVPdmKuG9jUsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792586408;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F/MVbWE/nzEllmJoCczHUTZ77HaNnAyLwGH51Z5xA14=;
	b=iNXIF7iE3sNjCOipKrc1RuPJSVOu8/ycWug+Q7sX5DI3IRxvlq/tI9eyxZCmm03Sbj3Y
	 0kGzSoKzFkjwquOJeOa9DDOKJUtBe7d4xjIl2Xo2QMPTCuh7vb8SLBrAuxU3RgwMBUAry
	 KfHdSAQBgcYLtfhZV5j66y4PL/UbSkC09WYPM947dDbEMA0fsws+O2wWOfSP1GAh5Ssiu
	 1G/hT4JvfPzj2ngoPxrBhj+7BKx0U6EyPIBg64LLBFj4LjAS81NIiBj3a9b/X08VWBrKn
	 CjGn4V47grFCq4uL5y4c8q6Zj8IWiSablRyip+XVcMRlC6frZJSDIxC74mr4sA456NQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CEF91F000C4;
	Wed, 21 Oct 2026 12:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792586408;
	bh=F/MVbWE/nzEllmJoCczHUTZ77HaNnAyLwGH51Z5xA14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iZieLLybc2rwWa4ztzdPK92Bk64cl9WB88v4sj24+AMf6EIf+db5O3ciziMWMwWQR
	 C1yIpYhaSC48cA9GyPc6mdroS8tsr+g/sBjke5+brNKh0H6vFQ6yGscM7AOE6tOL+F
	 eeQH+1/huGm8ekTDt7Lbgyb266qogcKTXiW27/verh5UwlHjo/Vi8Uz+joTqTTsU67
	 PlNd3+WUXwQQyUYWa2v4bBfcEJJURFjI/jDH7BVWI0n2td+QIpJttvVZ0sE+ctfotf
	 oxUJzCDYNqWoEopPeLqdTAfBzNlUSRqDYuEzZTa/kk9LUUQnZYPkIPrj4AzWFVdPXn
	 q9nXmPPCpbKOg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CA8D34336D;
	Wed, 21 Oct 2026 12:40:06 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Wed, 21 Oct 2026 18:10:06 +0530
Subject: [PATCH v12 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
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
Message-Id: <20261021-master-v12-1-9b3df51fd1d7@oss.qualcomm.com>
References: <20261021-master-v12-0-9b3df51fd1d7@oss.qualcomm.com>
In-Reply-To: <20261021-master-v12-0-9b3df51fd1d7@oss.qualcomm.com>
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792586405; l=2721;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=DRay2zf2W+iUZ3uXswe/Ui/4wI7/rJwOyKRrUpLoIq0=;
 b=ioGahS+rg3HQYVXaDhtFFvTIwU+qi4uXqaOhvqxSzc0ll8ka6OkXPTPRCKYHB9Tzt5PLWwXtZ
 1v7eAlDoxHJBnN+9nI7wenvE+o2kzRslNIMMOQYzn8Mt/hjg6/iDrwb
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Add a binding for the Qualcomm LPASS VA CSR rate generator node that
exposes the lpass_heartbeat_pulse clock on Hawi.

The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
start of DMAs and Codec Interfaces for the audio usecase and can serve
as a periodic wakeup source for the DSP.

Require the LPASS LPR and audio vote clocks to access VA CSR register
space safely.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
new file mode 100644
index 000000000000..601da83add2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,hawi-lpass-va-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
+
+description:
+  The Hawi LPASS (Low Power Audio Subsystem) VA CSR block contains a
+  rate generator that produces a periodic HeartBeat Pulse, also known
+  as the RateGen Pulse. This pulse synchronizes the start of DMAs and
+  Codec Interfaces for audio usecases and can serve as a periodic wakeup
+  source for the DSP.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-lpass-va-csr
+
+  reg:
+    maxItems: 1
+    description: Address and size of the VA CSR register block.
+
+  clocks:
+    items:
+      - description: LPASS LPR (Low Power Resource) voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: lpr
+      - const: audio
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    clock-controller@7ee0000 {
+      compatible = "qcom,hawi-lpass-va-csr";
+      reg = <0x07ee0000 0xe000>;
+      clocks = <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+      clock-names = "lpr", "audio";
+      #clock-cells = <0>;
+    };

-- 
2.34.1


