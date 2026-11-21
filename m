Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795266973;
	b=bLQFYjChVRMzDdZBrdvW2E/MTo3BKBwVhNsIIkdhZuO0nuGiRYm/dWRd9QaS7MV3xDyU
	 h2/E3UFJbiyOSL9R206FJ2i8TLF0TwsPLK38ubqXHr8eo5OVYGq01qRu6kIrWm1MI+/fV
	 fic10baEBPYQd109eTglnAyzLxmlyh8OdrRu8qTkxp9zUfVr9fVtEwk9qD7AVkeI3YXVX
	 4m6jYiUt1H+mw2cEALuK6upakLfUI0M3yzsI7sTX02kdpthURdCGimDHoZNDV/2pa41Mz
	 nhHuGeC/xYdup3H+GHNad2m5igZABlUkyvL3LwhS2VSrPMu/kkV1d/Gx8E6eJKcOq3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266973;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2rjHx0npkNlQCl5Q3rzIWUxsAZs79EZZOBMmAFuK5Eo=;
	b=LWyVNpZXx2sCno0+FFi+AUPi4WFydgNUZfnjmY3A86yAK8ZiyHlVEno6tQ86RKWCL7MV
	 EPa/6JvWRbnz7ayYFwu8XA3vFFlMksSt6AfVEDpU5LkvGggulX6NBERZqKVpsb2ERWTVM
	 rPdjCIA7wxG+uLrIENY/nh7G9pds30TJpA4TwZdJx9swJpCuFpnMyYlYZ04UdZakLoZ39
	 H609GB7S1qn61Jf3rr7u8IpS3k2cPIbVoUPWVcHWjBbErBGvb+otauEefpoZM62xUMEr1
	 3iFKRrvlPPFde1gh0BpIbdm+Tb28DcBLIS3U/rTwKVvXBx41ps/Pui3mlKQtTPyjDgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9vg81Ne;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD6606A32C;
	Sat, 21 Nov 2026 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9vg81Ne
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795266972;
	b=m5tIxbONI029vDSXgXsNTaJvoeGyPfulVDizEFWolKgG1M8mxBHWQYOzcKGmBKCokr3y
	 pfbsK9PFtklvWSjL/LYww0lNLjbBrGCkTAjdpujP/HPH8KTgjTn5YRUfptXgjALud8mf8
	 waDj5SM4mYqtNX5DI2LOMGtMdi4Zsz9Yn4O16S7u4Qa3WzWd5rZ8HEpvlcP+dulSY4tEA
	 m5VKQxb4++sShr44UzrLvxQKoWfNG+KqzjbwWl2PcTWN7JFS+7UZlDmXP94lsV8KussTz
	 lTHmswB1xWKK8eWRgo2h/QD3tTFbsi49BcnF8EoJCrc6Ed2znDEzJ690Ex5xjjUqPfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795266972;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2rjHx0npkNlQCl5Q3rzIWUxsAZs79EZZOBMmAFuK5Eo=;
	b=ylGPd1ZTtxDgzjfBzFdDqfi9CUhzPA4c1sT9LNUFYScqkRy80OytWYEE+DZZMKtnam7X
	 RIktLdTVHWJMJotb0SWfnI0+J+Vg2Ji9NGbASMYgg3m3TTw+50v28pZuEXs3hzycLzCg+
	 aWyNlsHkRzdF/ZrvDihr73I9IFHsOH6PZwtKEOCdsTsETvY5jzgFbwEzkZahMyRQVk2gY
	 cFrX7Fue6Av9ZPATz+HzrAkeCo0Wt5toPm7tsNKL+oV5HdUscJbGDVgvgP/AqZC2kwTu7
	 nVPl/bGjQqMcCEHZYmbigJGcE3zUt0+CjvvC+eY5R1UEwbvrLo997WJOyYctpukq2cQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D11B1F000C4;
	Sat, 21 Nov 2026 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795266972;
	bh=2rjHx0npkNlQCl5Q3rzIWUxsAZs79EZZOBMmAFuK5Eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n9vg81NefybWSjSVRtOrYaeBy0MeTcJjoJyAiA94s+94xc9eTqqYDwsUb45DEu9jL
	 I1WbCx/phmJ8felDzRnUN9h53ejNfKUQZYWV2KriWCNjG9NEAsQnmAuPCMOgkuKSIr
	 ObvnVIMzmnuNq9BZl8Q5sBJmArhuOlgYLiGVdB+bM7xEE2wTV6wK9tjc7Oa8hljjs6
	 qpMgFBWcOeJ/w0jGRK56uEYnJlB8tnBwkIuKNl7uzOKZx7PqvXVJvPRgYVvfeOJ2IP
	 BdZoUTQDjaVrVVngQjRnfFCWto85yKjJbK2I0A3QAyFDSI8TUh8hsbaf/Mtq9i9ugQ
	 VOgzarwF8jjDA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BE8AF4BC74;
	Sat, 21 Nov 2026 13:16:11 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sat, 21 Nov 2026 13:16:08 +0000
Subject: [PATCH v10 1/2] dt-bindings: clock: Add gpio-enabled-clock
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
Message-Id: <20261121-feature-clock-guard-v10-1-5d449739bb8c@bruker.com>
References: <20261121-feature-clock-guard-v10-0-5d449739bb8c@bruker.com>
In-Reply-To: <20261121-feature-clock-guard-v10-0-5d449739bb8c@bruker.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795266970; l=2434;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=f2PidYUyBCdaFNNQ/BVDjkj78Q6/18FvhAsIhyBPoqs=;
 b=vgFxCE6QHrKkg/j54aiPLhL0g1OfACPu4/bea/ppMvC/e3XKHbJnFjRqG5BCwJbAZQWRlWu7P
 hlawHWPlvmbAHfXz9lkrQWQcJhFtGnBZpOQ1tgaRjAb4R58wAS9wWo5
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
index 000000000000..76c1425931d2
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
+  - clocks
+  - "#clock-cells"
+  - enabled-gpios
+  - clock-output-names
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


