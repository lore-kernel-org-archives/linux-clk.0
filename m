Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13272E22B5;
	Sun, 27 Sep 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790516074; cv=none; b=bu746lFTVN9X2G0Bc7U21W+aUyYhBHebq4WA4AjATTdgtOK8aQ6oCc+wHlfeiaGniFmGFfrYCepi6Gz/eb7+NYr/fV5wFewULCqNkdxUjAxB3xjYhAj4NoEsnAyPJ74QUEATUk/d+sUXvsVir/qs0BuRyL9jtDzMcGRlfJDgGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790516074; c=relaxed/simple;
	bh=Bn14/JurZJPFk7cOKmRMMQh36caIFywkAbvboRcoBUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzHTVu4xVRZBAj7V4jld9xsB9892G9YgBCYxDxItoWWqcPxVzVkMBHCP1qh9NwHG7Un4i1BxuWaeXpcF70fx8rWYJJ8tSKsXfkNNeVxHNlxrfLbjtjG5buwMVEngcuuko1+5rN2jan5/YlTak+aGI9EkEOgDH3wkSooj0A3PNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWBWqOX4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWBWqOX4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BE57C2BCF6;
	Sun, 27 Sep 2026 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790516074;
	bh=Bn14/JurZJPFk7cOKmRMMQh36caIFywkAbvboRcoBUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qWBWqOX4opSXGGkAHE0y6SPAoXQfxu8Q7evDYlOK7jpPxBPXpKjHy7ZXHC6ipiHxH
	 IF9f16l8Yrwb99+TgiTzDv8X9q0e49DNLXjQ/LeVcMTOWmWC3Bg+P/IoC4jqDxHFYF
	 EX0ZRJFCf7czK5gSj4DqqhZ5ml97dHNzzvpaG9DwKBAOakCUpSLuM1IM3sUvTww3H/
	 8FaLh92OdJ63rDQojLx9yOe2LfvtHMiSixlLoSybK1V481+C1hUO4rtRnHxuC+MbDU
	 I3vsjU17FDRdIGZVm4lfW2qMO48MwHNxKBUs+i4ASytNs302+TP6TCqsfhWhikuD5v
	 DU07FAwu386ZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E135C9832F;
	Sun, 27 Sep 2026 13:34:34 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sun, 27 Sep 2026 13:34:10 +0000
Subject: [PATCH v6 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-feature-clock-guard-v6-1-007983b13ec2@bruker.com>
References: <20260927-feature-clock-guard-v6-0-007983b13ec2@bruker.com>
In-Reply-To: <20260927-feature-clock-guard-v6-0-007983b13ec2@bruker.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790516073; l=2153;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=/auOVxVpI1n0vDpsXiJjZdpu5juHDMl8VQVp4N4HZRA=;
 b=ObmO5TdkJOc7hwuUZLzPF1JqvWQxKdZQ3WaqsqcapZIYnfboyiMXsXtLVbnh1WHTDtGybtV8T
 mK6bizeXCPMBAAaucG6eRJSX2v6LczpKc1XjbwcM3GwZ56l+BEznJ4z
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
index d09d0e3f0c6e..f44fdb17b627 100644
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
+          const: gpio-locked-fixed-clock
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
+        compatible = "gpio-locked-fixed-clock";
+        #clock-cells = <0>;
+        clocks = <&pll>;
+        enabled-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.34.1


