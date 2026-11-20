Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163810;
	b=PoQIJ5xfchLbdIzCswFxi5GcbW71aT9HVglsIFhBHX2uqd9pTp5sSiqidtrbfHSiciSY
	 5jSGLV92ERgrP2lUW1nks2RQfG27qSIJS/qF30AK8kZP36z8DLkTrPpW02j/QX/I9PjMJ
	 erTSKyyHc7K24BEOIA+TLc/4PVdhZ0sA0NauBTJichqyzbGfjG7XaI/CTLQw/WVPDFdFK
	 CJIr2YbUE1EikgRBaLAen/5RyI465Aal0lj+0DCE9FxSZOIUr2S/xOeX5JhFxhvOVNcvM
	 FXmz/MIlWgGZNqyWE60tyYa5wdpvfC1GqLJfO9siH1/P3MJA13OH+XSrWpkHrix2RRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163810;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iCCjP6jYFmDEcc9O8GHhh9cPQdFQjCnCW6Okg4bAJbE=;
	b=4UMsuWxRQ1J3wVj8ROeX0GX2Yy0rWZrKN9ldcsOHf6+JBkpO+ZNg4NzRffEw9ozwKO1n
	 Q+3cIdRJIQf/LNW6dhiUD839JlRebCFYnLr7iupkb3ti+rIUl94S+Yeh5X0DZB8X8SRuD
	 /bAuou9eN+44d8gS2Sjx6fvYxPd9UA27TroUXqFIJ/Q4ri0Dhoh4zkjamaCv/H3pPNrpV
	 D84qCUdBjD6SS9Qu9QKB5l8WZ90Qacmozr134WZHe2jdIDcM6jop9t1TKRfpTKyOy9/Z7
	 P5NoTI+axs3SfnEvAxpfjihfw+tQFGV+kghX5oMrlmgsmVI3crBg5Y146/I0kih2PEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csIwaDsj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9F606A320;
	Fri, 20 Nov 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csIwaDsj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795163809;
	b=c/WqY47WmkZqKsJQeCR3258MvXrlfqoItbbXHUZscMueX6aRMzkG6M2lIeRoBH2eC7Nr
	 2yBiEjh4oAn4fckbRG/XjxRSg2yWUGW9B87meXvi6fkdB1aIRsMBXXFh/lyCIkFQfcu6R
	 afRMBXqm7kkvAgUNJWh3JrZjB5C7Y78VnnIqnEQAtO7YAd9BhrcLeAB9t+hvJZgjr/i4U
	 jN06iB/biEdzuYIP7swmizduiDo8hhZTpOpH4IpTCx7dhNCO2zPeODrGwgJ95Ke2saKU/
	 MV8FIurAOwSBvW98DjEGFJ/XPQUXnjDSp6dXKnoamDB05hEtE4YRyJzVCeqdGTdWBpg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795163809;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iCCjP6jYFmDEcc9O8GHhh9cPQdFQjCnCW6Okg4bAJbE=;
	b=tU8SKX3DCtgHxCKaBtEOgXMtYH2R8u3G82oU/0fwNeJB6jcReKdRwaRAIXqSwOKzGRfD
	 u49j6tnv1S5r1bQ7epcfqCVg/E0LlQnxNXYNJAESmrksVW7AFsTquFBbDCIzukQvGlXTB
	 P6EkKNxmscHMJABJMwmgCfjjkBpCXH+RjHBQljdTsm9xk70Vx3ZGPLnUDDRV4PmW0YnNe
	 EwbT9CvAKZVE28oMYs51FPRP5CuMhJrMAGi0IJi/ak/kqwgNwnMtR4YaFWi0CqN6MzKGt
	 71B3dV3G1gu/H72H48O1JZro7Yx734x3eQ+9GHCB1VDJc6qXZ4kA/As5NSxXNWIN3lw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FDB21F000CA;
	Fri, 20 Nov 2026 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795163809;
	bh=iCCjP6jYFmDEcc9O8GHhh9cPQdFQjCnCW6Okg4bAJbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=csIwaDsjAxU1ycS4B2QucVOijmrN7AzN/M9C9TaCfvUP4phuZz2aqu4cdoOhc86Lw
	 wtSJofyWmH2J/8dsCzI3Kn7IOh4UokXXL03FZajNMWmy3XbuawdD6teJMM1AH8PFQo
	 TxRn/jmPWDqatjyanQb2tdi8EusiwPHzKerfci0EL1KKmTWZqp/xGym8MblnAf3nKI
	 30TaQFUmcFFJxgBYWse+fnJ0UNbEpj+m50QcRGmsLX1PYyuTtpWkzHnp7gpFFDMRSq
	 o+CPGUZ61vYu+T4yaBnIMHnodHkIPQgiGigKJsUXNuAMhr5+9u8M8sG6tBzSzpYnC7
	 LtVU8kfS7cBYg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 91C1E49784;
	Fri, 20 Nov 2026 08:36:48 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Fri, 20 Nov 2026 14:06:47 +0530
Subject: [PATCH v14 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
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
Message-Id: <20261120-master-v14-1-112cfd63438d@oss.qualcomm.com>
References: <20261120-master-v14-0-112cfd63438d@oss.qualcomm.com>
In-Reply-To: <20261120-master-v14-0-112cfd63438d@oss.qualcomm.com>
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795163807; l=2849;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=pW8hso4nf9LvKry00I3CiRR3R1aM8imCfO15fq6aF3E=;
 b=hzCLPJ/Rl0VkBfwBKBlrel8zXUlEFv0J5t3nUKmLaBuHY5Uorsy0j6SOj795Dqq7JJJAPVKQl
 BknFkSETJE+ANlVQ+mLeeM7i1CciZvMmNmc4kua5htDVfr1HhXz3+ZI
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
Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
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


