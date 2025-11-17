Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D64527A477;
	Mon, 17 Nov 2025 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393770; cv=none; b=Qksi6K/i2THwDi7MVZL0eoW9P8tPM6sZc5uoc9vfQoooG97oPmEMPNjbx/LTnHxR0ETpF+Sk/EWsercaTzRllLlcU6oxWHWwyZyhjScMIfYtfcPhcVf15SalGHPGkWxWwxpfqOAIea/ENd7VVjyrxBomG+TquUbC8d8rU9p07CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393770; c=relaxed/simple;
	bh=pB0/QFXI5t2Hw+5qhGB5FGEiMP1+/MSOOtSe9mwKqU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kN6ubTE/2sVPyNFXMC/LLLOBxrS18ASrRHwpxyOkZOPMrHFe674wumIqjY3XUhlLr/kUfYNZCKskKzSTOiOihslq3Q2jg2zjYX1Byq2h4kh8A6h00AgYscRV7ZLCOKvuj5wiMVQW3HzeKQcKWTEeR6Z8zD4nTEIyiwglmoiJTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmLKt3O9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmLKt3O9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316CAC19424;
	Mon, 17 Nov 2025 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393769;
	bh=pB0/QFXI5t2Hw+5qhGB5FGEiMP1+/MSOOtSe9mwKqU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GmLKt3O9GluH2JCDClqfyVVbozY56xU8N3PrQMMZP+p2nNCG7KXH4CT/5Qq6crEuN
	 kBMKxSO3+EXbpCtDjOuay8xqcnK5qmdsfjsQSbTG4ffYiy4cKBUOmyRPJxTRIR+/vG
	 6JWfrl9EwmYP34Kcsniswxm7ktPbzQiGDUjqDtnpSROAdwOyTjN5s/WDK4s81i6HEH
	 /0OjETijdTwHs4kDPU4BGQdTpXbvgJpM1RY6mXqvbrF95TXRtQL0n5x6ZrpNSPdmLE
	 Ytoku7Fg3td/BOyBDc54tdKsXf/r1GrOQllSbvJTPZ8voeqZTonZvVRCfZMCAjML9Y
	 9bj6M2EJpgxiA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v1 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility
Date: Mon, 17 Nov 2025 15:35:20 +0000
Message-ID: <20251117-depth-sage-ee0829c71c25@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-shadow-police-56aba5d855a3@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=awEf+2y/PPPNa2uwhs4VTzsAEfJWcc8DTYHHNv4fdl0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSDlsuJ/xiPbid7V/MKQGOogOqL4+diLvR9ebqxqUrJ waXbetl6ihlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE8sQZGc6cOLY35m36o5P/ 4q5ckmJl83/HG9Ezb4Pmgcni0et3Odsx/NPYsTe6g+vh5nwx2Yvu8kcvRnovbIhKCuqV3H3OPUA yihcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
the deprecated configuration that was never supported for this SoC.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-clkcfg.yaml     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index ee4f31596d97..f111bed16f15 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-clkcfg
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-clkcfg
+          - const: microchip,mpfs-clkcfg
+      - const: microchip,mpfs-clkcfg
 
   reg:
     oneOf:
@@ -69,6 +73,15 @@ required:
   - clocks
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: microchip,pic64gx-clkcfg
+then:
+  reg:
+    maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.51.0

