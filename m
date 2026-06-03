Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DC6331203;
	Wed,  3 Jun 2026 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485408; cv=none; b=V7CXbdn6FIZ1/XpCyIOHMOznEXj3H6hs/kZ+WtzIPyMdeG6NsLbbOwUIg5E8GOTOYlreuAMbtefSz+Hsf2YUWPwTGcr6Mo57x2lZreElqxEh/n1upAs8DM5q8cTvtCpvNVSJXxwmRn6FcE9d2R7dd6864VQZwdU2dgL7JQZPC3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485408; c=relaxed/simple;
	bh=0YKayESYLdoep8fZ/BpdE1Gj/VtDT+F/VawTAY27mXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cl5ayQpz6WwItyDYp6ATzx9Jh6vb5z6X4Y+3takuBp/7Dloh/4UrZ/Tg2+ZZ08MDgi/9Rc1eoAz0YjRG7QA2wRe5YU23JHZZK4v+8E3A+AHOR/nlybGjaU4p2xA100sO1ikkDXchVvhE+YvXdI2yjNc91n7pcBT1U905w1Vc1js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FX2xBByG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FX2xBByG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59568C2BCC6;
	Wed,  3 Jun 2026 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780485408;
	bh=0YKayESYLdoep8fZ/BpdE1Gj/VtDT+F/VawTAY27mXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FX2xBByGjJ6PekC/oy72//l+GlJItcJnUGN32ej1Dubso8psW+vG4uSes8IkiqyVo
	 mQ8gbwPfT9uXKGHRt6VyR6C4czkK0pTZl0hMyhzE5rJh5W/jcEp56TlW3PFwKebiQX
	 EXk6kgOgbhn+24xNfyl1KbIGMEpPhr4nMgICjZVa1NpKJw4fZgveqnTC+HaDLNBY8d
	 TgIvQL7Q7G/cirPuP/fleGJAb9V4c5MNqRM+fason9bpEhnrJClnc++2ARnhQlBGnx
	 vcUfRQuWJEO1Hq5WA92QDc0sa8L3tlbt3IILPAMeAxJpG4ImwtjEfe01OahJxEZf3O
	 zrV9No7HsRDNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43216CD6E56;
	Wed,  3 Jun 2026 11:16:48 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Wed, 03 Jun 2026 11:16:42 +0000
Subject: [PATCH v3 1/2] dt-bindings: Add GPIO-locked fixed clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-feature-clock-guard-v3-1-01cca0aa04a5@bruker.com>
References: <20260603-feature-clock-guard-v3-0-01cca0aa04a5@bruker.com>
In-Reply-To: <20260603-feature-clock-guard-v3-0-01cca0aa04a5@bruker.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780485407; l=2817;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=iHRb7fBmSmETe2+oHkt2rJtsp8K/mu9bMS++HcMLWAg=;
 b=QAyCwjFnk+SBMikLZQpp4n32gxXiduFG9py82nppOle736/Uj92YJIgBQRfBaBjJBc30x7nhN
 Ncc45wc2udUCbx6jx75NmVFbGdvH0HgRoPW2gjGjX0C0YvFikkfoiA2
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
 .../bindings/clock/gpio-locked-fixed-clock.yaml    | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
new file mode 100644
index 000000000000..9106b800b673
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
@@ -0,0 +1,70 @@
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
+description: |
+  Provides a clock output whose availability depends on a set of
+  prerequisite conditions. These conditions include the presence of
+  one or more parent clocks and the asserted state of one or more
+  GPIO lock indicators. An example of such clocks is FPGA clock that
+  are outside CPU control, with the lock status exposed through GPIO
+  signal.
+
+  The output clock is considered available only when all configured
+  prerequisites are satisfied.
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


