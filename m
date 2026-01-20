Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180EB43E48C;
	Tue, 20 Jan 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923911; cv=none; b=tzMyq9FQXsrw/3lBqPdzQ4q0sL65k722If6yrBZAd8GGmnNNemRGXAxjwMJndRPOnep7gWfNrOKSdaeKUS4XdCRABqM+JsYBDV/WUxX4Vpeg7jk5sPa7MIn32TlDoNWXs7JBkZdjrx1bYwJgWcTsP+mF2Y5zZt+H/lOfapGCc80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923911; c=relaxed/simple;
	bh=sP6bxisRgQO21vuo8BDh24FcFuEs3z6BApKLrPO2EN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugks7pypHW9hBY4zelXHad4IQ+nv2Vevucy5JBmnek3guLbC9Lnechn94/T7h6n6ANaDcT2Zvx5tIwka+lRiHFuxAnNcePg89vS4NZq6/nMpVfD/d6+dwlKJo0/mJaQb11GjE+Q0jAiLATUl+ifafmeNRIF8IHIVg1wRd0T3VHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=syCO/+ki; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="syCO/+ki"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2440148AD57;
	Tue, 20 Jan 2026 16:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768923908; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fyY4FMK1LscaLC9zpJmTzZ3DKssABxALVLPWwLcUGs8=;
	b=syCO/+ki/dOSE0g8IPNFi2uH12pLWKK+Y/8L9L1OgOZ69dH639ik9x0WKzdnmfyCNXspJV
	z96LZD/MVyZbXG8/5OPUbPN3EgJr+9387NSKnjWUCV77yPer3NvBSh3lDJJSOcWze80odD
	7xV/zw1mHWH6jsKSpBRD+WRCkCUK3/yu1uRFTrKyUKWP0qHpid8gYH3rH0Ei3a4Vu4XzGG
	nu+73509emfxdS93Ubit0DEwPaKGBcDXWsz/NpLRxBegMgmq4gVcR1KCiV7G3l9QqC6Rkl
	pLWsNCrwErL26LdkrQJ6sJfPoBvvaCePJz5t0Im+cUf0q0W2eeblO4J3CS/Iwg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required clocks
Date: Tue, 20 Jan 2026 16:44:43 +0100
Message-ID: <20260120154502.1280938-3-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The OTPC requires both the peripheral clock through PMC and the main RC
oscillator.  Seemed to work without explicitly enabling those clocks on
sama7g5 before, but did not on sam9x60.

Older datasheets were not clear and explicit about this, but recent are,
e.g. SAMA7G5 series datasheet (DS60001765B),
section 30.4.1 Power Management:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Removed clock-names (led to confusion, and not used by the driver anyways)
    - Removed redundant example
    
    v2:
    - new patch, not present in v1

 .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index 9a7aaf64eef32..847dfb67c6b72 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -29,6 +29,11 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: main rc oscillator
+      - description: otpc peripheral clock
+
 required:
   - compatible
   - reg
@@ -37,6 +42,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
     #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
     otpc: efuse@e8c00000 {
@@ -44,6 +51,7 @@ examples:
         reg = <0xe8c00000 0xec>;
         #address-cells = <1>;
         #size-cells = <1>;
+        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
 
         temperature_calib: calib@1 {
             reg = <OTP_PKT(1) 76>;
-- 
2.47.3

