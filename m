Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B82E7F25;
	Sun, 19 Apr 2026 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776627466; cv=none; b=fwm2EWxG7NmyokXsB71vRnH401/t9xkcTY8KJelyHH1q6R65zSUvGcb1EGZ0U09k5O6vQ+/sWbyi+U8+3KusXL1CB3H+M2qpKsTlSDtK1bhOJvwGxYDgN7yBt/gxpcYdqmXOLNbDQBoDqc62chzOuYL7vG3dvtxtU3VWxVtdXjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776627466; c=relaxed/simple;
	bh=e/zIjhtJ0wqnJsBlzEBgizOdEcWJCRwP8qy4bK/MuiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SsE/51EkDwv3Xz41+acmTOVB46c9T69b6h3NHt3WGPCovdQVl6ap5nir5sGUnMTrk6BCvQZMhtYHrhE00Br4Z7dwYrI6/4OF0NXVIBfOO7RUArOJUrEm6BeVGzdC+XIp27DZat4X19MgMXqlumSCJr11ynx86u/iqoWGenuplr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=O0PmMt4D; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wB/1YqEA; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="O0PmMt4D";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wB/1YqEA"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fzJmk6dvKz9t5g;
	Sun, 19 Apr 2026 21:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ul4vtfJrnCYcj67+NDL3mVHLoFRebvNfzSLU8CLsGNM=;
	b=O0PmMt4DQ+I+/OvpommvGM4ZESMz5va3fkEandR8zJ5Yg4hT4iaU/ZwJUlS0PRcgJaf74K
	lLwyNYO1tVb3ATMOcgZOpWAxHlrsukLB3QQpwsQDLG0wVlXwkycvTbZ7AFmeqiAzEDcm1c
	b5qe8upfe2f9uJNOwJXTEB9joIMMyZYuR6lORVy4jnOH0ZNi5itmVn/6e08DUp7iiSoOzX
	eT63rR2bo5ALajdOs3I5Gdy/ZYbiLb5Y1NAWzVY+rv91PpX5rUk29Zgw2aLOBkiLUajHWC
	gPHZceWIowBfAQkGExIzIcNfhOaxjj210xT4z8tPw2POb6D9iXl/0nKzBwpmcw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="wB/1YqEA";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ul4vtfJrnCYcj67+NDL3mVHLoFRebvNfzSLU8CLsGNM=;
	b=wB/1YqEA4+GxkbkMtwwwRb83rd6+kbAVr4S3jPyg2AbRK6KXUr9F3QBwdN1V/FnCu/fdoP
	WBzYat/NcqkyUXYzHY5XpCXp8p2ycXnTqRjHI68IOeGv+XrPUC1cc9NfroLpb3soYsFNIx
	ACag1059lRLGw3rk6Dl785HiU7KTG4oiA/K++X76mEaTiDPl4gjZRf1v7UosDJFDr5jOTj
	/ASGk0MM3f3sclPPn2A6RKlWlszM6GrNr9n1OMRATi2JFEuP/lKbxQHQF17UyHdK3QLohg
	1uKdYUSXygzt9OfMKqlSxrPf2wXX3RQQb/eCQXgqbxgVehJYSNesB09i/k9+pQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas R-Car R8A779MD M3Le
Date: Sun, 19 Apr 2026 21:35:32 +0200
Message-ID: <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xy9ojek1u7fxxgq9bipk4xkiipws6ie4
X-MBO-RS-ID: 6da638516961848de2c
X-Rspamd-Queue-Id: 4fzJmk6dvKz9t5g

Extend the Renesas DU display bindings to support the Renesas R-Car
R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
except the HDMI port@1 is not present.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../bindings/display/renesas,du.yaml          | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c27dfea7fc622..3c3667ff4a27f 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -42,6 +42,7 @@ properties:
       - renesas,du-r8a779a0 # for R-Car V3U compatible DU
       - renesas,du-r8a779g0 # for R-Car V4H compatible DU
       - renesas,du-r8a779h0 # for R-Car V4M compatible DU
+      - renesas,du-r8a779md # for R-Car M3Le compatible DU
 
   reg:
     maxItems: 1
@@ -890,6 +891,75 @@ allOf:
         - reset-names
         - renesas,vsps
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a779md
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU3
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN3 input clock
+
+        clock-names:
+          minItems: 3
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.3
+            - pattern: '^dclkin\.[013]$'
+            - pattern: '^dclkin\.[013]$'
+            - pattern: '^dclkin\.[013]$'
+
+        interrupts:
+          minItems: 3
+          maxItems: 3
+
+        resets:
+          minItems: 2
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: du.0
+            - const: du.3
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1: false
+            port@2:
+              description: LVDS 0
+            port@3: false
+
+          required:
+            - port@0
+            - port@2
+
+        renesas,cmms:
+          minItems: 3
+          maxItems: 3
+
+        renesas,vsps:
+          minItems: 3
+          maxItems: 3
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

