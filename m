Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777071EBFFF;
	Tue,  3 Sep 2024 21:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399614; cv=none; b=JJqFl6I0FfKDL3HFhkwRVWHID9Wfu9AZvtLLi47DTIcAKs53+CqDCaU2nqEEv4eTNRtYkVuK4gYnRIYeccqM9rlwcuyAVeQn3rkuo0neEV0O+DvH3HUYuoFbhogpkzwhFQqwtwg4Bfqb6AeCbgdKtppejOBMAyF8NAupaNE3Gzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399614; c=relaxed/simple;
	bh=a9yzvBt3h24feKE6Zv0c1siWavObQsYicuqNnNEBo9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9lsNWC0a0ZyGOvY3lmtPGVIDijs9i5z+TsX093W49ZYbJIK9zs0vLfCuEUstsFTvcxBU6vPWuGsuu9gOA29SBMbiS28f5jlPtCG6kFh4Gopca8rOVsJ6P7FGOd2ywhOx/bZTX4bCQDnPAK+ogAupLtsmDnwvWCcR93Y9jGqGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjmtt2WD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjmtt2WD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDA3C4CEC7;
	Tue,  3 Sep 2024 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725399613;
	bh=a9yzvBt3h24feKE6Zv0c1siWavObQsYicuqNnNEBo9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cjmtt2WDxYabR7hsfVrnspvFYsFEjhGgJw+yltVbTUqTU+rJDhankxTS/j5R9R/bW
	 J7iEnJu4BpakAzTk7r9SD3BZmaRG7UEfDhgxgWXtZ8LUVL9zQKJ3b8jlx+LVGmRUxr
	 ODOQPGObwQuYLycN1F/XAGvqIUlp06n2nFR8vY/cWe+CkdwM3mt94/owQunt0iPNfz
	 gosylxGOk+meEP+6UNmPb5xYWNII5hkuMmGEmk26QxVL0gR7vgzRLu+CYM1Z81+M6F
	 ks16YAMW6y25mricRbK1Z5eHWo3yjhJdwT0Z3naAdj7HDCL7KZhspFbqCI5HyLKdZu
	 ALVX0qHH0cnpQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 03 Sep 2024 23:39:45 +0200
Subject: [PATCH v2 1/7] dt-bindings: clock: airoha: Update reg mapping for
 EN7581 SoC.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-clk-en7581-syscon-v2-1-86fbe2fc15c3@kernel.org>
References: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
In-Reply-To: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.1

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
index 84353fd09428..fe2c5c1baf43 100644
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
2.46.0

