Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09616200DB;
	Sat,  6 Apr 2024 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712400242; cv=none; b=Cw9owxRNdHmOvKEJpipAQD8f4WTkgxWG6obC3qi+bBAZAUc2U/FNeby7Fs/KWwTUsHZqXEZ29IfKtzh9Ne8uBW4WiVdCbfgeaeVCbH5HwwwZM01lGPImGzw0cfaa3EMbymwQpjnJN18JDMOe0m5XNiFRb5f27hs6l3djn3MZ2+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712400242; c=relaxed/simple;
	bh=jE8EUhhV3ismuvxfBhAmiN6ZtxbNvZYl2Z6H1eFdV1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFZOuDHJy7m/SaM92Sjv2LN9XX/66JwezBLztU3yu1PKfdNvE1TritwWtHSgdRtEuU9shpdOmoDFfYoDPoSd0Z00/0K6eoub0+XnKLV7c/tOHBFfLeHwtMErV3dgT318rDng49W/iR8PVsjNha1TDEhGGMEDDq0Q38vFgz45FCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm79dVgp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fm79dVgp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAAAC433C7;
	Sat,  6 Apr 2024 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712400241;
	bh=jE8EUhhV3ismuvxfBhAmiN6ZtxbNvZYl2Z6H1eFdV1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fm79dVgpuZ6dO9+A4sO5rXn3oeb4KmTTFud83IwFB0t83Sxj5knIp1aZj5wJ5MCwk
	 g5H7fpLHyjhX4r1HTDCNk1TFK3X3JBZWyUX5mh7TQQnH6V+pNU6XV459Z5g2gvDqOK
	 5vjzmY18FFj8HSTMTcwcBUVekccQ3cZ6xFNxm+PWN49OJm1Okhp9qroV1+ub7bRYTM
	 PJcA0OVMf4Nyp5DhCnlXGqm/t6Q1mmo9qW7dFFtKxTfvXTFAnlEVNSMFqNtceFdD5M
	 IJw1OQhUUbB0Gv7Q4MihIp/DYyxWV/uC/BKTg/2FkhdT2zvo3O4eCjxzt4IuqoE5qg
	 FQQrst4esH99w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v2 1/4] dt-bindings: clock: airoha: add EN7581 binding
Date: Sat,  6 Apr 2024 12:43:41 +0200
Message-ID: <99734deb28889e685a764da94418f68b55ee3bdc.1712399981.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712399980.git.lorenzo@kernel.org>
References: <cover.1712399980.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce Airoha EN7581 entry in Airoha EN7523 clock binding

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 79b0752faa91..3f4266637733 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -29,10 +29,13 @@ description: |
 properties:
   compatible:
     items:
-      - const: airoha,en7523-scu
+      - enum:
+          - airoha,en7523-scu
+          - airoha,en7581-scu
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   "#clock-cells":
     description:
@@ -45,6 +48,30 @@ required:
   - reg
   - '#clock-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: airoha,en7523-scu
+    then:
+      properties:
+        reg:
+          items:
+            - description: scu base address
+            - description: misc scu base address
+
+  - if:
+      properties:
+        compatible:
+          const: airoha,en7581-scu
+    then:
+      properties:
+        reg:
+          items:
+            - description: scu base address
+            - description: misc scu base address
+            - description: pb scu base address
+
 additionalProperties: false
 
 examples:
-- 
2.44.0

