Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51619239E8B;
	Sat, 11 Oct 2025 22:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760222359; cv=none; b=tC/igjrWN/pVue0H2bWaj3AzGLKQ1NV9VLHw4RAlmoFDmEFgz+0offzgorAj+iGu+ug2wvb2ySq6A85uUvhHgea6wsFBVTxsnad6Mi2A091fJ2w4T/X7ssql5sced3Lqbfb8J9/xhWsxud0icevsTwhA4/u1bZPkU5Gd9sHwTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760222359; c=relaxed/simple;
	bh=Ire0SEM1n4sStZPmB5F6KBjBZX9zBv051O23Ok5loSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7sgr5VvXrBK9oy/4nMDU5afbSKmoulU3TahRTa3rMlfsQ2C3t++r2xCytMOj/FRA56xXP8Tza4dOIIatt3uvv5X62KUFA5V67iUxkmb+SQHf89nUjqxX9XvfFJHqUY/GjMCEHp3Vo1NygQQk3qn45P4x3t+XfTi3aHw1boIkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Yik7e1N1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=U0Q1a1ZM; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Yik7e1N1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="U0Q1a1ZM"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckdnv16Jvz9slx;
	Sun, 12 Oct 2025 00:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760222355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hTHxUTPK4PXa1n3rmLg9JAn1+iiklLkUzRB2ctLXbmw=;
	b=Yik7e1N17tsOwWcqOQyS4Ce8GWq0AEJ+fBM1ajVQ7ijzDcHvaLRQUwIu/pTPCwdKzgKQrC
	dMkxCm6HcV4G+ww/NuBxFP+UflpW0og5+QS1g2ROMCrdfHQq7XyxY20VS8EGC9kg2XwnLc
	kDujHw7fk6kpKGBovw4YLVGwPt2IqbRq7oaqzHpo2MbAhHD6Z/voLA4jjrgQE4qP4g4jwQ
	D9EC3EeBE7bYdAumVKVceMZPCI8U5IosV/d0Yxhau5u827ebVhgF/zsxASPDJI8aiSx4Km
	/DREyKB+amfQEbLEds6FO61VVqLo0L4kbKM9XzAHuC0ekUBdS3Rz72/ZN56cGg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=U0Q1a1ZM;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760222353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hTHxUTPK4PXa1n3rmLg9JAn1+iiklLkUzRB2ctLXbmw=;
	b=U0Q1a1ZMfGCz0EzEvdvxVi5KZBkuLyKMbycR26j6bH/z+/PZfz2jHB87edyjLkumLaWhGZ
	HJ6cB5u33Z6vwRQBsrhZx3+YrV6AgAV6ymLfrINSvXvfU+vutF/72hY7HraNy3ze4ojHQJ
	QYVweEvioWoJtNJNHtiupDEP/0ZF6XAWDHMjaQgT7jTrSYCJuSeGLmfV4LB+OJ4zIU4mC5
	g2OgAbB2D0TXJcMaGHoTUWR8s9rxij8WA+VG0ihOnhGfxf9aY3lG1wv2MSGeLt0EmreH1G
	erj5hV4Hltio9jtnB9ifkTYNI/stY+B9rR9xhQtwUMqYXI4JHd7ydTK/0uTQww==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: si522xx: Clock driver for Skyworks Si522xx I2C PCIe clock generators
Date: Sun, 12 Oct 2025 00:35:59 +0200
Message-ID: <20251011223846.261652-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7973c2b98d5d9c188fe
X-MBO-RS-META: i8jfhtjdm1548zbzz9e6sdq1ags3ds9j
X-Rspamd-Queue-Id: 4ckdnv16Jvz9slx

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
 .../bindings/clock/skyworks,si522xx.yaml      | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml

diff --git a/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml b/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml
new file mode 100644
index 0000000000000..6ad26543f9d21
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/skyworks,si522xx.yaml#
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
+  "^DIFF[0-11]$":
+    type: object
+    description:
+      Description of one of the outputs (DIFF0..DIF11).
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
+            compatible = "skyworks,si52202";
+            reg = <0x6a>;
+            #clock-cells = <1>;
+            clocks = <&ref25m>;
+        };
+    };
+
+...
-- 
2.51.0

