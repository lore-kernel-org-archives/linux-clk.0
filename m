Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7124A078;
	Sun, 27 Sep 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521152; cv=none; b=oF1MWWu5WLTYyzUabrLafI5yT8e3YphPNKq0K/K5iBWSxjyNBZJCdOk0wwIEcH6Cf+WY+h16VErTpyZd2QL/3OaRrBv0jxeZcHtTCchEGB8VOBSb3m3KWTAZmpySdpMPgSN+QpnMx0XYUPWrp5UDoLGPoKdojnCzzBNqp620r5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521152; c=relaxed/simple;
	bh=4CdjaMnnxCi+iJoCysxPTH8MIfqmdKCJy6QHstiA5VM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eex80Tla6kiBMZn4xftg9LCrrSJ3Q28xJlFLKVGpBpnum4selGMdwoWtE7j7B030xp1MATMzAczKmRYannWtMmMM83qCZqyjmOUs3+xGEdhjVArAWMtbDukvZztVXxB4hsb6iIECH4GJi/xmnQYdDtO427J+dJzrmJ1Th5k04Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiPxr1St; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiPxr1St"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0BD8C2BCF4;
	Sun, 27 Sep 2026 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790521151;
	bh=4CdjaMnnxCi+iJoCysxPTH8MIfqmdKCJy6QHstiA5VM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JiPxr1StrUJfuGMHbqxCY2OaYSuSjI1PCWFWuw2fA1qVBRMPG0q/Ty6mR4IlzLYKy
	 NE3oTTuyOMY1t9cgfvHTFS8Ja0AtxRZeoYG7ozWRnVBfgPIfcPKXerOvT+ISv9tIlO
	 0Q13KFmjaXpaExOxCGLRWLyw+t9eI0KJDVpv6SaKwrTms2iDA/BZ1YFeX+9pwo+0Jp
	 cDej4YdHv/o7/pU5wkAGsGCL3zTTWYYN9LQv7VhvVjWm+a8vT6jVMPuGxJAtgWYnMu
	 mfC/B4EmpGbHWGDJopujvz5Gggm4dBJFlQGTpM8iR4l0Lc1MFA5EvF10XxuaTKpdM5
	 XYZ0um8pksj+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906EEC9832F;
	Sun, 27 Sep 2026 14:59:11 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sun, 27 Sep 2026 14:59:07 +0000
Subject: [PATCH v8 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-feature-clock-guard-v8-1-630938e302a1@bruker.com>
References: <20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com>
In-Reply-To: <20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790521150; l=2141;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=T/neAsVK3rkcpUxN8yoWulkpuO6b91ByHi9mx326cdY=;
 b=bwz+I4X4pa883WWftCeffgFoMJ8Xyp9Q6sIWvL73by2MM9eCj3GTQfD/lx4sCs8+ZjMyKtsWD
 QUyVSqISiUKAHzteKxqyAKAPq80L58pd7O/DUYzdvLK0TAk6cGLKkQX
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


