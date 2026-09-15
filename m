Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A559477E31;
	Tue, 15 Sep 2026 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464469; cv=none; b=kXthvHs4gVwcaIJloVoAsmnncWE2FuOD2DMtdF4fFTUh0Zi86xtOYa4bqC6twTBh5d7y48vWA2yoMQcYsM97OxPqdf91w90FCc7wVMqM6vxqvLOPGN8mESWQmRcjQ8U35j4WuEZIwEG3Pt8PYQeTDechqpcvx+QVhvyK52VJBxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464469; c=relaxed/simple;
	bh=odcCNyf7PcXS68WqtcnWEjwkNRLyCddGH8lSworambA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THsxrL2trxPnxk8FrJAOeUgShr5o0kgDvhexnuDEED+PsGZFPcx9HVVXMGGzYqJS91nfiKHFDGEVL+XcMNj9D6o1XGzZ8Z9vm39iYSGr+zqz9a/zVGE3x7B+fTeWvEjD8iTWwMlnPH72rAo7gimWP8+Uyf4jxw5Lf9A3L1k69qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdFcVsRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdFcVsRo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBD3BC2BCF5;
	Tue, 15 Sep 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789464468;
	bh=odcCNyf7PcXS68WqtcnWEjwkNRLyCddGH8lSworambA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tdFcVsRoJdFpkzlfyZ76lQK6HDrffz5rsuXCPrLCl47HsGAqAoa+CTvpfvmAaGbmS
	 rLt33j9l0zfKZFQkE2oQvLFFn2uKA0UASN4qxODL2arDK/3HEnl1JclfGFOVXfbBUN
	 92BT8s4+Mu2DRpZGZPQt7n5c4tOv4fAyE156dhuUBMLfnVaRjyuyicTRv9Si1P5mXM
	 DkBD7OXG4Wh0aNVvoKbinOYsAru2EReW9sWs0wQKG1B2aa56cZv4hidiwa3tHTOp+o
	 Ro5zoMaR7dNj+BViMTz2divqeFw0I+VPvTX6+4/jJBW66C9wGSwhRTKN95h+mgxhgY
	 yhRrUwJC6LJ9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5ADC88E53;
	Tue, 15 Sep 2026 09:27:48 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Tue, 15 Sep 2026 09:27:39 +0000
Subject: [PATCH v5 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-feature-clock-guard-v5-1-42ab5dc3a6aa@bruker.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
In-Reply-To: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464467; l=2156;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=+Z3o2j7TIGPq1Yg1qwgwdTLZRZQ6YcSqs5TlIzdLf/Q=;
 b=EwRD4rUTicVcprAmfvHxI9OFBGVYGOxSroX/YRmh+Zf/fBZ8m93BPNo5fGphQsheiqjXWET0R
 Tr8dJZHNRfcADsaZuxdzJkHVuS4bCgEGDXlE6q6tuIWfEjWgRHDe030
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
index d09d0e3f0c6e..00cf2ad66dd0 100644
--- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: gpio-gate-clock
+    enum:
+      - gpio-gate-clock
+      - gpio-locked-fixed-clock
 
   clocks:
     maxItems: 1
@@ -23,10 +25,29 @@ properties:
     description: GPIO reference for enabling and disabling the clock.
     maxItems: 1
 
+  locked-gpios:
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
+          const: gpio-locked-fixed-clock
+    then:
+      required:
+        - locked-gpios
 
 additionalProperties: false
 
@@ -40,3 +61,10 @@ examples:
         #clock-cells = <0>;
         enable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
     };
+
+    clk_gpio_locked {
+        compatible = "gpio-locked-fixed-clock";
+        #clock-cells = <0>;
+        clocks = <&pll>;
+        locked-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.34.1


