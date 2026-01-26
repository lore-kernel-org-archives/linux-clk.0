Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA0722F74A;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769407329; cv=none; b=WVNyJWT/iuUTOFUfmhCReDoMDgBOgAsXfHJ8ZqIOCGh5sjG8LVnhfsHwW7+5v7x14PhPxp3696Sov9mMWzoJyR413n6vyNc3HIsEWX+FF5lNZ90ljWTTwxg3vk7fz2yPKNAdseNXZh9woar73GTqowYXt3Xoio3Mj3jyfrg7Bfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769407329; c=relaxed/simple;
	bh=BrhkKB6HmcoErJBgY91N9xBBRXQmOjBv4hptw7osCQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQt/0g0Ww1332nj0JwMkeazjR9Wctci/XXZW59DY/WRhpAdxo+JCyyNwf94w9phaHCwHbcUzeqXvBD79OzUYgSOqtynCU2LN9L6kqHSlUfSYVUg3PnccENa7ppWwyNFbVIaDivaXYlInEVfb83PSWAM+BKwwjLQ0BltEiW/R/Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjGHUeOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjGHUeOA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB2F6C19425;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769407328;
	bh=BrhkKB6HmcoErJBgY91N9xBBRXQmOjBv4hptw7osCQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XjGHUeOAuJBndy5IA2twsmAdEhN6c8RZhnyAtidCEEatGKrhIMuv4NSO4ANlNGSEi
	 OFTtPcS14hy7XfXBKhp5iTq2ezBPIZDkL3nHPPzo/Vtkp9Si/h4I33ITYVYkbKXXbm
	 sxVU0IhBUzzHm27jjXaijzGxM7QphqDgifvGehicgcD4MJKZkUHwUKZzWKkuA62SMw
	 A+q2sqOUXJ9rFxAyJ7M/+rEB+iSPT+UtQ3zf/XbI+CZe9lAlwvsDs0m5S1V0llQg/N
	 JTBMEDpn/F3nJr9+WEBazuzZmFLauN7o2PiSl1HIaZ5VuTYusbROYD5ZnlDmVogyh/
	 9SXg+xIU6tJtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA66C88E4A;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Mon, 26 Jan 2026 06:01:42 +0000
Subject: [PATCH v6 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-audio_drvier-v6-1-99e350855bc2@amlogic.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769407326; l=1646;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=6xMGlQVRnvNr+HsMV5CJO4QIQGLb0IjOxYc1JtOCi88=;
 b=w8tEvILb0hHB/6DvWewpbF1lzzl0s7YS496kAxyxmfxGSiLWpA8TEOwgYiX+oaT3sHOyHQEfo
 ziTCp0wYllVCkqezBVVqun/ZpuK7kJv535HAsHQpnC7jEPf/SH22Uc+
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com

From: Jiebing Chen <jiebing.chen@amlogic.com>

The audio power domain has been found on S4 device.
It must be enabled prior to audio operations.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..1cd9a99e5ff3 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -99,7 +100,8 @@ properties:
 
   resets:
     description: internal reset line
-
+  power-domains:
+    maxItems: 1
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +117,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,7 +125,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
-
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 additionalProperties: false
 
 examples:

-- 
2.52.0


