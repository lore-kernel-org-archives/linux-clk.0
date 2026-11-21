Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795267753;
	b=FAVRJ4nd8HFO9kzcYTgtCJM4PexrnQOIuWPr87dCEbsRPMKRoOojRGRtdWXzeBgCkhxS
	 9fXciasW0UHveELnrFqSOPSgnG1QVyaAzY7l0CwGTrJyXXwT3PP6kIN+svHKIFfNdAh8d
	 Hkuyr56uiyBqKOXWoKR2ctMz/gE2fhvJbyrYD5PXNt0/LgDYBuPGMRi9PSGwbCqzk2C1h
	 rB4TZeXtrNTYLEa1/yAqAslgE8B7xcelJrPwWkGaFWneOGiFseFVxOlFTXmsHu60ONCtx
	 ncxUYcMwu99VeOSbsL4v8pOonyf3vFkP6pGZPXQRWf4drKzQ3uew4jo3BQGQrt85o4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267753;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+ZOEQuS7xesMhb/aW5nh1HEJR6SjC6cprTjYlnqdZ5U=;
	b=NMCcNy2t+afv5z6CYCPbfQKYQwOjyl2LHwQAV9EJd4mwrUlLTjif3hnhYEeRgOQy/G0b
	 Hv2k9m8WHNg3ybSeu8jCLCb3+TzH3ibiPnREgQNak0o8cC5Y9tt5pcdeNKl+O2F5MM+J9
	 DADFahcIj5CsJWjK5qjY/o3Eo7giOEW5EBN8xPgKxGKKr4qC/0WABJs1UirCSxjajncfR
	 /5koNw0b9jsTWAJHqJ8CBo8aSk/vWIajN91B03mNULHkYXTA0OQeZcE+KjxFSsXbvox6Z
	 jrElfgRadaNkH8zW0JbwqLggaFQuraOvRKyzDnneHiLw0SR6axEaiviR/M0Zf5tcObg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egjJhwRc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F434606A320;
	Sat, 21 Nov 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egjJhwRc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795267753;
	b=wQMCAHww4Np3C7pZzLMO2BPkK137pjaI9uG7RTWDtTrUN2K6sRYJ916r2vpw4NjmhzVr
	 4/3K7AyEXvWuAuFLQmCGTdUIY7GjEsYGLRQsmYrLqsvD/g0FnbpKYUPs6HwPvAw9mi4qv
	 T8T5MlVchFPFk2KzuxCjXK/WSDSFtqiExPtf5LyBTi2s+YW6GFxkO9++3w0vR0I8j2STl
	 kgGPemUkGo0NvHA36CLHMjLYe1FJs1h0y+Gs9k535FV6e1kk3v+s8g3l+VCJO+lTy1oDf
	 y9lFccwUnklcCkPgm19iCIA4h2n5Ka8jaaAqzyiqBV5YSyGyfMaO9w5mWMLb2BIfn9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795267753;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+ZOEQuS7xesMhb/aW5nh1HEJR6SjC6cprTjYlnqdZ5U=;
	b=HGSEbgnmnKVb8qsI710mk/7bpMhmzMGWsL/Pv0KVKaw5h9MWKcb7bkO0co68nHVbUjOG
	 k3FIsE3ovbJRW6SyONYiUE5En5OjgDq8uBGGVI2KOiP70VY0NZXubbetAnEjiBObT8wp1
	 lFABGmgAqTdxnLDwry/yd/c4pA1kb03D6XaJ8Yy/iXosT9mMltfdjFEob+vh6P3PI3kv0
	 tt36y0hj0xFM0N2XjaTAGsNGenC0hKt0pPqFKksKrOp9A3yeUsiSTF5X0QqXAqXM+PxYV
	 PsPmT2SB3BfuH0UQOn54tReB33OzmwaxWxB0nkMXQxytE85S/OtWXMOWALB8CGXzoTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98D1B1F000C4;
	Sat, 21 Nov 2026 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267753;
	bh=+ZOEQuS7xesMhb/aW5nh1HEJR6SjC6cprTjYlnqdZ5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=egjJhwRcOLN90YiqTCq2hBfOWUFjUPTajYqUyN+RMNbwuoA4/hD8Nx9szR1pGknel
	 6UK254CzvHqo1CqLdq/kBBl1U91JGW8ue/c99lg/t9c0E/xZXTaUCuIhF0IjxRobNF
	 iuxFC9yHdmDNpInUQjrwgHkuLJoivRPv8gXnwSW1XsGErlSMwb3WlInDCvcOWq4PDp
	 gpHSpwBAiemX0urIW9MGcZWLxQMfO5/2bgovIcF0DIzYvpIWYybj08Bruuo1KCx+LW
	 nsrZ4TWv3Z502cYldyz4gfBC+PawnsoPlQDHuGam6sMOrxECc8kD+W+RwDhlVuxCBf
	 hd6TMKBJWZUmw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 15E864BC83;
	Sat, 21 Nov 2026 13:29:12 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sat, 21 Nov 2026 13:29:10 +0000
Subject: [PATCH v11 1/2] dt-bindings: clock: Add gpio-enabled-clock
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
Message-Id: <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
References: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
In-Reply-To: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795267751; l=2434;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=L/yx9dJKtGg0GjfAwYLswzXF3aI/lmNqd+9Ff+w6nJc=;
 b=tS6mRP0Ng/2822ikO24q6RInVSbb6kWtJ763ZtH8q/ubRMPNAyzU28ikNhptImNj433FgnmmZ
 +aZDho1dteXBEFHrQYRB9wn7g/89V1qLxlGdPGW7wKQRrANHfkEwA0X
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com
Content-Transfer-Encoding: 7bit

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

Some clocks are switched on and off by hardware outside software
control, which reports through a GPIO whether the clock is currently
running. Software cannot enable such a clock, but its consumers must
not use it before the GPIO indicates that it is running.

Add a binding for a clock that passes its parent clock through
unchanged and is considered enabled only while a GPIO signal is
asserted. The parent clock determines the rate. The status GPIO is
given by enabled-gpios, and poll-timeout-us bounds how long a consumer
waits for the clock to become available.

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Our use case: peripheral clocks generated by FPGA PLLs, with the
PLL-lock signals routed to GPIOs of the SoC.
---
 .../bindings/clock/gpio-enabled-clock.yaml         | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
new file mode 100644
index 000000000000..4861c87ae5e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/gpio-enabled-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO Enabled Clock
+
+maintainers:
+  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+
+properties:
+  compatible:
+    const: gpio-enabled-clock
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  enabled-gpios:
+    description: GPIO that indicates whether the clock is enabled or disabled.
+    maxItems: 1
+
+  poll-timeout-us:
+    description: Timeout in microseconds for waiting for a GPIO signal.
+    default: 10
+    minimum: 10
+    maximum: 1000
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-output-names
+  - enabled-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    clock {
+        compatible = "gpio-enabled-clock";
+        #clock-cells = <0>;
+        clocks = <&pll>;
+        clock-output-names = "gpio-enabled-clock";
+        enabled-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+        poll-timeout-us = <20>;
+    };

-- 
2.34.1


