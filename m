Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F01D12E6;
	Sat, 31 Aug 2024 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725088751; cv=none; b=kZwnHDf8N8J6l4NZeCunVs+Om5+CW/fxdb+FZs73YiOCF+/jF82Wbve8H+8lyUgNz7iv7COvvPYMbvHYMYskHwA6f/hovzHt/yoywqLUVbHknf3BvWulW3yr6tknE1FNvYWRK2ZYOTBW/Rr587F2mf5kkgSs75PFPH6hD0zkq6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725088751; c=relaxed/simple;
	bh=FZvzmN2QmkFMKRZRjjhpM9mGeFi/KjKH6wH2YnfODb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pM2Axe3iyjD3Son2bYwF9GheOez0P4nLipzyor4YdmF4chGBeCw5NDJWp3/XVG/GS5ML11KIEQkdTaNqQAGEYT6KyzGBMhRwqhhW+XxBr8NkjVSk6xJgIMhnPj47iEAxqWVzh6KOpDzyqYBsiXUe6VVcHoUS5e58u/Yct9vgKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OV+5M4BZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OV+5M4BZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37329C4CEC0;
	Sat, 31 Aug 2024 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725088750;
	bh=FZvzmN2QmkFMKRZRjjhpM9mGeFi/KjKH6wH2YnfODb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OV+5M4BZU21KzagrraQ6xVHLG2SmRQsqOvq3zC7UXIlqZKJW/JfcX0yOR8/4ulTme
	 yPcVt0xc3qn5mIxw7LNx73DoD7eE2Ahp+5oOohmwlxGwvU+pWjPYujqqAHZsatdyOX
	 adJ1bImYmdLYeQe0ihJtLUdix+Bo53K4trJQQmoo679AQiEjsXzWSqid8QZVPc87+f
	 8e4jCsLJ76FeWXSwKIJFurvRb67JLn8bF4wnXDJCnx/OYqkAwZs0W484jCfUOdOILw
	 kwizjH4JEeupYv7MyKs4YOjzpN6LxaBvacrf/8quYippw2EFtJD2/f0fGeVq7qcm58
	 YtssG7AVznQ0Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 31 Aug 2024 09:18:43 +0200
Subject: [PATCH 1/7] dt-bindings: clock: airoha: update reg mapping for
 EN7581 SoC.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-clk-en7581-syscon-v1-1-5c2683541068@kernel.org>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
In-Reply-To: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
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
backward incompatibility since the dts for EN7581 SoC is not public yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml         | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 84353fd09428..ca426c328535 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -34,8 +34,8 @@ properties:
           - airoha,en7581-scu
 
   reg:
-    minItems: 2
-    maxItems: 4
+    minItems: 1
+    maxItems: 2
 
   "#clock-cells":
     description:
@@ -75,9 +75,6 @@ allOf:
         reg:
           items:
             - description: scu base address
-            - description: misc scu base address
-            - description: reset base address
-            - description: pb scu base address
 
 additionalProperties: false
 
@@ -98,10 +95,7 @@ examples:
 
       scuclk: clock-controller@1fa20000 {
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

