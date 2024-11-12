Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E933F9;
	Tue, 12 Nov 2024 00:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731370175; cv=none; b=H/KY2DbgCZQO2cN4F8H/ViQ4E9ZPKYdoI/RB7d7Io+7moLqjODNmfKmKmoKMbo2udZ0WkVM53UV0piGsna/zTAo2SBtR0j2fJ0idbOTTaNGvdXdgS+TDoOm8p/QYJGcWy4WgEQPZAXO1pl/Vx1NTuiNJkbz10wy9fad/RGLxYJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731370175; c=relaxed/simple;
	bh=O4BlBK5ortkbTpACDTtrxOHXjUi4e/RFV4T0bXUuIpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6SQDD5/EJNquXH7xz0+opxozl5q5I01EMF8gXQ0E6v1kzqUvG3SOY/q1o8hA5nCxxDM8z4qDFHke63Zy1eGxs0WZUsAIgEeehGTnJJ7mH8lbaquPhVxuVA9eO9Pe2/bEUWA5rYFgYkMbQ4y73S+B5UrICgqLeNVyjWw2qWkl4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoZjLJJu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoZjLJJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986EBC4CECF;
	Tue, 12 Nov 2024 00:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370175;
	bh=O4BlBK5ortkbTpACDTtrxOHXjUi4e/RFV4T0bXUuIpY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MoZjLJJun/eGaE9oEyAkvEzm/5Cj4D0DMOFPE1W/2UdludZBq6GD6QwIvM1qEmD2b
	 LQWejKXq2dZ6HtreltGQlFltxfgh2CsOnTlV4VDG2hUmzoqFEkcrL+jcGHN/9tf9U0
	 xYd/SVG3zPwQZSwvplb93S0VGrCXBcos90dju/kll+xm+0w9hQ+7rocaiVhDRxn0CP
	 O+8yLmIdjAp38MsAGd/woBUBnKG7WimDsSX0/xN8RR8QAfRbCEzfcYIkohMrQJ+Lye
	 /x296qf0gtjXVwPmrSpoNWSV5UTx6EH8y0q9udA7HyWurSg94o3eLOdzu8zy8Q07ZV
	 /NXmvvWWxWLxg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:48 +0100
Subject: [PATCH RESEND v2 1/7] dt-bindings: clock: airoha: Update reg
 mapping for EN7581 SoC.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
In-Reply-To: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2

clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
while it is configuring the chip-scu one via a syscon. Update the reg
mapping definition for this device. This patch does not introduce any
backward incompatibility since the dts for EN7581 SoC is not upstream
yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/clock/airoha,en7523-scu.yaml          | 23 ++++++++--------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 84353fd09428f4c9af6a1e39c04b5abdee602a55..fe2c5c1baf4332984369fdf0271a95fce7ee5f85 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -34,8 +34,10 @@ properties:
           - airoha,en7581-scu
 
   reg:
-    minItems: 2
-    maxItems: 4
+    items:
+      - description: scu base address
+      - description: misc scu base address
+    minItems: 1
 
   "#clock-cells":
     description:
@@ -60,9 +62,7 @@ allOf:
     then:
       properties:
         reg:
-          items:
-            - description: scu base address
-            - description: misc scu base address
+          minItems: 2
 
         '#reset-cells': false
 
@@ -73,11 +73,7 @@ allOf:
     then:
       properties:
         reg:
-          items:
-            - description: scu base address
-            - description: misc scu base address
-            - description: reset base address
-            - description: pb scu base address
+          maxItems: 1
 
 additionalProperties: false
 
@@ -96,12 +92,9 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
 
-      scuclk: clock-controller@1fa20000 {
+      scuclk: clock-controller@1fb00000 {
         compatible = "airoha,en7581-scu";
-        reg = <0x0 0x1fa20000 0x0 0x400>,
-              <0x0 0x1fb00000 0x0 0x90>,
-              <0x0 0x1fb00830 0x0 0x8>,
-              <0x0 0x1fbe3400 0x0 0xfc>;
+        reg = <0x0 0x1fb00000 0x0 0x970>;
               #clock-cells = <1>;
               #reset-cells = <1>;
       };

-- 
2.47.0

