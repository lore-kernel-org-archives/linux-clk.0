Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDF3F44E4;
	Sun, 27 Sep 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517606; cv=none; b=JV2uWKEJ+yipYWVZjJrgF3Yor9JeA5ao88mvrvc1nPiWO573bYGIA8aVvtLgnkJRr3sXxwrr1EGcPL/uL1vFQUcBgHfpcKpQElimkKQsIt4ehu4dfDgmSH4vim8kN1UCooW9mYfRmPehZDOWVbrUa3ZX+0d2XPXSvZp4v6Nkzgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517606; c=relaxed/simple;
	bh=4CdjaMnnxCi+iJoCysxPTH8MIfqmdKCJy6QHstiA5VM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qo9fORkY2At5GaAdZTZPhkZaJm5+MKDLcUuodLSIwAKS6qZp95ZPjT8+GEQpt9oT1NheUJAsV9u/Bg/XjGVQG2j1zV3Bp5YNBfmrJCPE+ILddzzcnj0ezOAqgB4m9pfZhqTK8QEnCgVvdGkyigLeUd4eNp0H/NgxicK94+weQkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ot7/ZOHX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ot7/ZOHX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97C07C4AF13;
	Sun, 27 Sep 2026 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790517605;
	bh=4CdjaMnnxCi+iJoCysxPTH8MIfqmdKCJy6QHstiA5VM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ot7/ZOHXPUsSDY14bwey6I2UHGJMcP4qgTx2jRQuWonox741GtLYS3nN8VOWA6i7g
	 wLoVIzoCbpnqx0TIm2qczHVrjybEgmqcd663Qk78FuqWKY7HBlRR7Eb4DCoNDO/Kdx
	 5W0FGKa20dCSTDpA9f+qKn8k9T2MCxmD0RdpEicbI8beOcccGF2EHv0cjnumb1fTyX
	 VLFDvXrz/Y6z+quaGmRvNJrGPwx70SX63DJxnaqYRu743rmlv9i2b387dFAuGvZbYv
	 oPqBkYb2R5Y0Cp9WQYpUS/i6QVHvSW9YZcfMpo0S5NmG3YiE47HApv47AiASF0rWh0
	 lovwDhsEggp2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7847AC9830E;
	Sun, 27 Sep 2026 14:00:05 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sun, 27 Sep 2026 14:00:00 +0000
Subject: [PATCH v7 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-feature-clock-guard-v7-1-8dd19568d9a2@bruker.com>
References: <20260927-feature-clock-guard-v7-0-8dd19568d9a2@bruker.com>
In-Reply-To: <20260927-feature-clock-guard-v7-0-8dd19568d9a2@bruker.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790517604; l=2141;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=T/neAsVK3rkcpUxN8yoWulkpuO6b91ByHi9mx326cdY=;
 b=W4cUxw1zuPFT+ji+tEzAJxAyTF6JOisgJ4uqJno1Mv36+zIraqvKmozr2q3Z+xX/e9sx49fca
 h1NmKsJCvM6B7GvyBijIQ30a/PB7i5ZHh4H92FeNGc4WW1kyKaS5ATb
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

Extend the binding to be used also for gpio-locked-fixed-clock.
A GPIO-locked fixed clock provider exposes a fixed-rate clock whose
availability depends on one or more GPIO lock-status signals.

Some hardware designs provide fixed-frequency clocks generated outside
software control, such as by FPGA-resident PLLs. While the clock rate is
fixed, a separate GPIO signal indicates whether the clock source is
locked and producing a valid output.

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 .../devicetree/bindings/clock/gpio-gate-clock.yaml | 32 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
index d09d0e3f0c6e..1ad87c8b36b9 100644
--- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: gpio-gate-clock
+    enum:
+      - gpio-gate-clock
+      - gpio-locked-clock
 
   clocks:
     maxItems: 1
@@ -23,10 +25,29 @@ properties:
     description: GPIO reference for enabling and disabling the clock.
     maxItems: 1
 
+  enabled-gpios:
+    description: GPIO that indicates whether the clock is enabled or disabled.
+    maxItems: 1
+
 required:
   - compatible
   - '#clock-cells'
-  - enable-gpios
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: gpio-gate-clock
+    then:
+      required:
+        - enable-gpios
+  - if:
+      properties:
+        compatible:
+          const: gpio-locked-clock
+    then:
+      required:
+        - enabled-gpios
 
 additionalProperties: false
 
@@ -40,3 +61,10 @@ examples:
         #clock-cells = <0>;
         enable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
     };
+
+    clk_gpio_locked {
+        compatible = "gpio-locked-clock";
+        #clock-cells = <0>;
+        clocks = <&pll>;
+        enabled-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.34.1


