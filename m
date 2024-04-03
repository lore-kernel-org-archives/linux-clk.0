Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDC1947E;
	Wed,  3 Apr 2024 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712161277; cv=none; b=BD4qV6ZE+qi0HKoH43W6+0c8GK8eft1R7eh+lgpPv8J/6DDjuJkaxez7osTbvIx5QzDDSFDT67zLn7l8naS0f2VpRbGEOlu4Agx5QnUEdRZdDCGQDxfdcZS3xBPqHcG3mdXYBoMzd8Cd/7iqwt1jnHjEPHMlwSraKXCXMjg1TPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712161277; c=relaxed/simple;
	bh=ApYku/UQWHP6QcJ1ZCGRDlt+UdyUoz7YXy/dLNfRNUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVN91zEsO4YelDGPfY69ceDGlNVEWXAabYYsbDEpqc/d5B5sRF/NmiVriccmQhDE5g1VmjIM6bB0UNJJT9e9dBk3BCBTdORLMz7hZtdizf7j0UgmkD5/FKLyuo3Jak9I8PUE/iCObsC/Nj85Dn6fjgyj3lcliVIvvund5EeS/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKzAGxh1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKzAGxh1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E48C433F1;
	Wed,  3 Apr 2024 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712161276;
	bh=ApYku/UQWHP6QcJ1ZCGRDlt+UdyUoz7YXy/dLNfRNUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKzAGxh1Ouatt2vFZ0eNRCrEtRJ7z44vZ1M0+SKF4HMZMQKl9QbRlQ0Pu9oOpinKU
	 cN8/Tkup1puf8bhqPnxPGDUv/w/S6muTy4bPKGhCe10i3FDPxOVEUj+6GRibFzcqLX
	 bqCzft92Nbprx0DP4A9YHXzb1aulN0mRy9djhOYQdX+XVEy2t4XJslr4maE4mUlOGh
	 Vbvq2t9fM52JmOuDAlyYhcptbjYMiWZVlK6x17x/TAr7cxZhNItbunNMNaBDvURR3J
	 2YXEmRzvgbIYRNI5fU0no7ULmoFx+p0ILBbYJXtAoGqatbpMm1MRDxWYPvlpYjWO54
	 Xi8BoUKVA2c+A==
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
Subject: [PATCH 1/4] dt-bindings: clock: airoha: add EN7581 binding
Date: Wed,  3 Apr 2024 18:20:42 +0200
Message-ID: <1988a4460ed327bea7841f6a0f3a756dd7cec4bb.1712160869.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712160869.git.lorenzo@kernel.org>
References: <cover.1712160869.git.lorenzo@kernel.org>
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
 .../bindings/clock/airoha,en7523-scu.yaml     | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 79b0752faa91..cf893d4c74cd 100644
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
@@ -45,6 +48,25 @@ required:
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
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          const: airoha,en7581-scu
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.44.0

