Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34F3B14B8;
	Mon, 31 Aug 2026 06:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157983; cv=none; b=BHlHSQDjd3C7pZPXesJ8FbDxwga5tNLRcxW6edpRK+fJSQPgqEFwK3a69z8C30np5cw6hBlT38aFUz70jOQaqumF7TGzLnEjrquSmHW84K2TPBqdISthy5LwUCpJOOSPUdJJ1MfacOJfVN9EnF9kFjg9ajk8n+tZBo1O7MtE5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157983; c=relaxed/simple;
	bh=CvQ+YEq/ATbO9+iTa4L4nQndg/7a70rnRyw93dsjyK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iq/uium5bYdGgrRZ+tEMW8IqVYU8hbBLzwTfT5t4pV0Khoq3VGbHFjwnMPDF1vEV+bDJysxzj2XEFCqsuCJ23kJKDV/9j9h2Jhf3rUcc3jCwmxEqCWcfzLXjAzDpsm0fC7aTAQh4MVnLDFpYQkxY9up9sND+skunNsBBpfpkcjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GClwpBwb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GClwpBwb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15975C2BCFA;
	Mon, 31 Aug 2026 06:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788157983;
	bh=CvQ+YEq/ATbO9+iTa4L4nQndg/7a70rnRyw93dsjyK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GClwpBwbHP+sfW0apmpQzwsF0PaZlsiQyGCEy9nd79Eb7huxu+94P8rM6R7Et11hQ
	 L1DIko8BPgeFWxMFNCaTGJEDE8ltWbc6Nsq1Afy7d8A35dsJSbs5QpdNH2bAvlDU+x
	 HWHegGm732+PIQPRfX60HeEhAADpSUgGBdZgpFraTrZKUu8CbyfwOQOzpdov7nTku2
	 aFp9ch4zc17xzB9U0Gls3E8CAuY8HBmw3Yptfgy+KL4p9oJdLiSTg+aCoOdoWkqnPx
	 OO6f8kzfQ/3Gg86rMchWKO8p+CFwZbxo6LvWO06WyYf8QZzQV0uMkfNqWmwGIgDzQ5
	 2SSP0ilCe2IYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58A3C624A5;
	Mon, 31 Aug 2026 06:33:02 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Mon, 31 Aug 2026 12:03:01 +0530
Subject: [PATCH v7 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-heartbeat-v7-next-20260828-v7-1-e3ffeac46a51@oss.qualcomm.com>
References: <20260831-heartbeat-v7-next-20260828-v7-0-e3ffeac46a51@oss.qualcomm.com>
In-Reply-To: <20260831-heartbeat-v7-next-20260828-v7-0-e3ffeac46a51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>, 
 prasad.kumpatla@oss.qualcomm.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788157981; l=2151;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=5DgYRL2d+tr5ENMkYeTnCE9rjgsWEYIKZ5OrVRuZXu4=;
 b=tFB8+8cWhYakiaJEtSe6EXgdn+9QblGG9P/sa1Ejygdd26H3V4nRZpP1SMv9a4cbhAA81RikO
 IHFUn8H43m4D8U7zW5fEEEjdK31TmWuQm9a57ta3Zhmzwh65tGdSBHL
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Add a binding for the Qualcomm LPASS VA CSR rate generator node that
exposes the lpass_heartbeat_pulse clock on Hawi.

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecase and can
serve as a periodic wakeup source for the DSP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
new file mode 100644
index 000000000000..bd3554f5c99c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
@@ -0,0 +1,45 @@
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
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@7ee0000 {
+      compatible = "qcom,hawi-lpass-va-csr";
+      reg = <0x07ee0000 0xe000>;
+      #clock-cells = <0>;
+    };

-- 
2.34.1


