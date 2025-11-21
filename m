Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BAB34E75E;
	Fri, 21 Nov 2025 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732656; cv=none; b=quNC8FMyP9FQWw+oVwNwRs/SeQBGX7zvFja/4YBTWxRPjYk9lzkRdHfDo5brceFWIt9PSYBrD+eliBfBelx5eJ/2jcxf42A7iWuYolEVAsPj8nl8zDOJdIOVBolGLhxhBtSVBIt8yCeSx1uUnBN28Oic3HWHhbVJchA+AThH1yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732656; c=relaxed/simple;
	bh=0+J1Q5CKVMTP2xhn6YpjpspBi2tj6Gjjxk8nh8alXSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpKM/hL7SIsjQm6V8ygo9V1c8GVb34Dxi6PnbsXbQ0Lt9bxUQXmWN8TP3Ubw7W/n0OSDQA3v+/UoSGqCGfqGXKhVeQnazQigA2at/vE4IASBw4SR4ExpOGjGTIoRhV8py+55VvgfaSdyTgHTyg7BLGIghBJvBnhK5o3VbU7zu8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrcXdDJf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrcXdDJf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B69C4CEFB;
	Fri, 21 Nov 2025 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732656;
	bh=0+J1Q5CKVMTP2xhn6YpjpspBi2tj6Gjjxk8nh8alXSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MrcXdDJfyvU/I3meVg/ArtkEdEJx5REMlOb+eK7jKHWiSdBCUuRvZm5Eda3nnwROr
	 tM58qKQjtrApyMD6gWUjO4pcmzRjUXsDdDaLGyyuHGlDi0pv+x3VmG623BS0d5zvpJ
	 FKYpJblG+oBsMVYEETH3cbQ79tLlnCXx/rQ7fpmAlhYRoMXZteLfdTgd5bFwXaWUg5
	 x4/F6y2j2UgxFMTXfRQGhcQNC309vIDGWSJ+JsVchrLEAi76LXGcoXKsuJxuPjKkUV
	 q9PoYR7va2W052QLZpCrXc47d3E9i0qZyPZYUPVJ/Rw1kE5gqmYrVsPh2UUDkSJMv8
	 fUotfhTBuhOog==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v2 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility
Date: Fri, 21 Nov 2025 13:44:02 +0000
Message-ID: <20251121-unclip-shabby-a7a16e865146@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121-tartar-drew-ba31c5ec9192@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=BAqYmh3+kZOKEzACbZi5m6qzBFcZG08zjLdoiX1jvnQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkKOfMTLvxZIKvxR3R3ZPbj37b/pu479/R0njDjUV29i ObZk5LvdJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiaiYM/yxqF7nGc1v1pHDq ZZ763J5xM7IyYm3eebWswNroeTZ6zxl+s3Z7KBlM0oj+8Kf41vkdukI1vaGnXjoV7BM62F574BI vKwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
the deprecated configuration that was never supported for this SoC.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-clkcfg.yaml    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index ee4f31596d97..a23703c281d1 100644
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
@@ -69,6 +73,16 @@ required:
   - clocks
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: microchip,pic64gx-clkcfg
+then:
+  properties:
+    reg:
+      maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.51.0

