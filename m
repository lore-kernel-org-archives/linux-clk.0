Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2495D3D953D;
	Sun, 26 Jul 2026 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087631; cv=none; b=cqZ4x25ZopzwDqdsaa4s6gqyLwARymIsIqDrSLRILaPsPvJfRRKV4aUm+rYpxFXtv9WnOLIE6noHGlcG9xf7qdJ4jUCsfBxtkI9/Nzlgo55YVNhUabyDP49Ekso3XQcIUv81eanFtRuIshUo7BffU9r8R4QdnoCBf19lPD1xv0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087631; c=relaxed/simple;
	bh=evQSmCFIJoG6zk3B805Y1pKDcHj9eKi75SgQUg+z8C8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r10ty+xXhJo306T7sZApTdz834wi6n2b9rOvidKvA58yfsMeHgtqBPxWbk35aGU2DPQrk2KkIriY5fsdaIO1jgdmazg+QYnhDG7P/+ckaagLDMD33jQ8lKm2IDSoKbKdNgUQw0i6xBUPbYZteRaGUM5qPDf5aOaCcNM57/eLu7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgRO6P5P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgRO6P5P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD7B7C2BCC6;
	Sun, 26 Jul 2026 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785087630;
	bh=evQSmCFIJoG6zk3B805Y1pKDcHj9eKi75SgQUg+z8C8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZgRO6P5PaqnmnrWqVTEGNvrEf0u1LXqx4fUPj9ZM/dGC2QnDd5s9J9lceBB6fqY2d
	 pjMy9PksH9jlVkXP8UlO8//MOJ3ljJ/zVeGHJHthcnMZDMXoKV+N6z8VZbPnTQjIm2
	 M1pjV14cSbtmyhKhvvc4ng7xJFzijz+KWHrsXpfuY0ffRt4Nm+Ifj4hIUlSMRKOE3H
	 Wlylm0STXOH5Yo9pckkwfc1TlntwufwC/VwvunlUfKL3mVPp+LelbhDEBwybZgGbRO
	 w4aXdomQ7cmKdeUErgPgJaANOfQBoYohD8mIbhknpL/iOt0+0B7H/ZdfI21DiSUuyE
	 rMWOo68HEbZnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D282C53200;
	Sun, 26 Jul 2026 17:40:30 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sun, 26 Jul 2026 17:40:24 +0000
Subject: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
In-Reply-To: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785087629; l=2332;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=lEBBaq3E08r1z3XCBu4u0DwQeFjgZxqKA/fT/ORUbSw=;
 b=GLa/f5iqOYIqXGwqg0b+hes392rQs7icNjvSOzhfMLLYcXgEjweC4PeQ4JXMenBHP8B2Gadlp
 OoAxaI4pPhmBIc0D2RVoN5R4/Yty63jmGnxDJSH/jcu2paCjvKoXWVA
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

Some hardware designs provide fixed-frequency clocks generated outside
software control, such as by FPGA-resident PLLs. While the clock rate is
fixed, a separate GPIO signal indicates whether the clock source is
locked and producing a valid output.

Describe a GPIO-locked fixed clock provider that exposes a fixed-rate
clock whose availability depends on one or more GPIO lock-status
signals.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 .../bindings/clock/gpio-locked-fixed-clock.yaml    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
new file mode 100644
index 000000000000..4d17889c51ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/gpio-locked-fixed-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO Locked Fixed Clock
+
+maintainers:
+  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+
+properties:
+  compatible:
+    const: gpio-locked-fixed-clock
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    description: Input clocks whose validity is monitored by this provider.
+
+  clock-output-names:
+    description: Names of the clock provided by this controller.
+    maxItems: 1
+
+  locked-gpios:
+    description: |
+      GPIOs to check the lock state.
+    minItems: 1
+    maxItems: 32
+
+required:
+  - compatible
+  - "#clock-cells"
+
+anyOf:
+  - required:
+      - clocks
+  - required:
+      - locked-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    clk_gpio_locked: gpio-locked-fixed-clock {
+        compatible = "gpio-locked-fixed-clock";
+        #clock-cells = <0>;
+
+        clocks = <&clk0 0>, <&pll 0>;
+
+        locked-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>,
+                <&gpio0 5 GPIO_ACTIVE_HIGH>,
+                <&gpio1 2 GPIO_ACTIVE_LOW>;
+
+        clock-output-names = "clkout0";
+    };

-- 
2.34.1


