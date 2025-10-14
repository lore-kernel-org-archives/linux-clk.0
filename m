Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF17238C1B;
	Tue, 14 Oct 2025 22:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760479350; cv=none; b=iCXSfU5viNQyC96BUbqC+d7iPgx2S1N1k4xHYZDZomAU1NAEUJzUTWncxMEGuhScN5pDHuzIdRps7D/yenrJ3P10bX91WG99tuUFnlfXNbk9twgusivqRt/NOT4VN+nUInrVNC/aJduFW1yOuX/nt5RSZUCu5X8g/eF3fheRx5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760479350; c=relaxed/simple;
	bh=XfIc1r/PCOCXLGO9FZBzqcjIUZlAjMuyGaBP2nqAMD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffBRGbRNR+OHMrXQCXjNhCEdn5GdxII6Kq+Z6zM0XJogwvzrT/KrEmTGj5+59cHKJSMl7gXy8qLjgNAIPI1k6wPLfmmkhre1c38MkCz/1ziHiDni7J92y6d0QvTGtgVaIFu//UDOKiPwv/BBg4lio1B/YfSLiWpThzpfNTFITDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pqGTjn9G; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jYljFWqp; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pqGTjn9G";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jYljFWqp"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmSr30yTYz9v66;
	Wed, 15 Oct 2025 00:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760479347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lPgDJG19uD+UwQsZcxedRfUkkElV6axdMkHjGLQeNXQ=;
	b=pqGTjn9Go9x8pauWON8+B7VuSIqmGAiMFBE6gTQQCYIKrdgo488cy750a09fMAb5SXwRBl
	93CzIUPBaOuDXRv+ZshMcnlUg4umt7SfWbOpwAWD3g8zWOM2Hi3Wlf0Y6GGfa7IstXT3e6
	VnJw2CozNDP4vI+95uP88uKB6kqThSo+vsIGmWQ+buNDELQIE+NwZPlhA+oKHWH1idEzoN
	jZ85fZzB1udUzWniO/FVEwkBNsDJiyEC3bVc2Fa1bpNYF70un89WgamXFewys/4kbUjv01
	kWv6WMx7kY+rIi+YO8nFdI913VKVpFh9XALaKhY6CjOoJsAYr8Xj4NamF7y7rQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=jYljFWqp;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760479345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lPgDJG19uD+UwQsZcxedRfUkkElV6axdMkHjGLQeNXQ=;
	b=jYljFWqp3/52RnOJhcbvIrDu3+1xiO4hfUb3BABBiBk3G2dr//VZABFBUiy1AuFOgvGiiu
	eaEvJT1EVhq0kVSTRwUK9IG4InX9V3rX3O79Do9pLICTV+oGO8FBo1mZbnT97o0NWl6ula
	3b2drcBSWc8J92VG+A4ynZ/LGqeWhE91OmCg3+28C2gF5vEmlhM9Gkkn9Q+9gqUPD18DVY
	jOMMF/GjAGCTW2mSKj9oobcgeEYrvNI4ePYealUMrBenAyk2CCyXl+ccofLwtTCnEwRlYf
	lVdFQ+wqz0mixVHzTFHEfCiCwl/1PF1gorw/c4ZOrTK6Hm7uuCxu7QmeTxIvUA==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clk: si522xx: Clock driver for Skyworks Si522xx I2C PCIe clock generators
Date: Wed, 15 Oct 2025 00:01:43 +0200
Message-ID: <20251014220206.52470-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: efafe1a11f5b6c5f290
X-MBO-RS-META: e67fjufnuuozwmefbx4sa5hakmrposyz
X-Rspamd-Queue-Id: 4cmSr30yTYz9v66

Document the Skyworks Si522xx PCIe clock generators. Supported models are
Si52202/Si52204/Si52208/Si52212. While chip is similar to Si521xx, it also
contains many subtle differences to justify separate driver.

The Si522xx has different register and bit layout, supports spread spectrum
clocking and slew rate settings, and no longer contains the old BC Byte Count
configuration register. Instead, the I2C protocol is yet again very slightly
different, but this time at least compatible with regmap.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
V2: - Fix the DIF pattern match and description, update example to validate this
    - Rename the YAML file to skyworks,si52212.yaml
---
 .../bindings/clock/skyworks,si52212.yaml      | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/skyworks,si52212.yaml

diff --git a/Documentation/devicetree/bindings/clock/skyworks,si52212.yaml b/Documentation/devicetree/bindings/clock/skyworks,si52212.yaml
new file mode 100644
index 0000000000000..f5c551d63a014
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/skyworks,si52212.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/skyworks,si52212.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Skyworks Si522xx I2C PCIe clock generators
+
+description: |
+  The Skyworks Si522xx are I2C PCIe clock generators providing
+  from 2 to 12 output clocks.
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+properties:
+  compatible:
+    enum:
+      - skyworks,si52202
+      - skyworks,si52204
+      - skyworks,si52208
+      - skyworks,si52212
+
+  reg:
+    const: 0x6a
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: XTal input clock
+
+  skyworks,out-amplitude-microvolt:
+    enum: [ 600000, 650000, 700000, 750000, 800000, 850000 ]
+    description: Output clock signal amplitude
+
+  skyworks,out-spread-spectrum:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 100000, 99750, 99500 ]
+    description: Output clock down spread in pcm (1/1000 of percent)
+
+patternProperties:
+  "^DIFF([0-9]|1[0-1])$":
+    type: object
+    description:
+      Description of one of the outputs (DIFF0..DIFF11).
+
+    properties:
+      skyworks,slew-rate:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 1900000, 2400000 ]
+        description: Output clock slew rate select in V/ns
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-generator@6a {
+            compatible = "skyworks,si52212";
+            reg = <0x6a>;
+            #clock-cells = <1>;
+            clocks = <&ref25m>;
+
+            DIFF0 {
+                skyworks,slew-rate = <2400000>;
+            };
+
+            DIFF4 {
+                skyworks,slew-rate = <1900000>;
+            };
+
+            DIFF11 {
+                skyworks,slew-rate = <2400000>;
+            };
+        };
+    };
+
+...
-- 
2.51.0

