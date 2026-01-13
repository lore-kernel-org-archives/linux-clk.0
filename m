Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47934354AC7;
	Tue, 13 Jan 2026 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342328; cv=none; b=cId1sOHGHeV+WTusWwvh5yjL5vpHIKNpaKjucBrIFHW7cbqBASxD6xaQlGxPIq7Pbf3Elu5Ae8O4NmZ6UzayY6aeIlXPWZ+l/JfIyPPvJN2Jps17WYvagVMdMAOuJbiAT0M2aLwHQf5ucgwQ6klsJyYcOT6+44P9ZTqf/dJy2As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342328; c=relaxed/simple;
	bh=hhOL3Ebuv8HCu7aFlXPxRjmRk8hM7W0i6or4f1TWUtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEsFJy2kFA3G8U7GGKsxS69N7ut/rP9Prrj7b1a5fnIRJwKvulvLnFOtipwamCjNASZKm1L7ys1v9nSt5t1mV79eqSyZ156AiWDoXmYwzE07ycklPdl4X5/D2PKQK3C9efWKIsR7y/PcXl3VwR8bgi1aigqnqdXCNBUZd2BFSFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mro7RMsw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mro7RMsw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BADC116C6;
	Tue, 13 Jan 2026 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342328;
	bh=hhOL3Ebuv8HCu7aFlXPxRjmRk8hM7W0i6or4f1TWUtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mro7RMswWNzVyH+/XdlrD54TiCu+5sASSEfsPTgeDoI+wRdDE0JL6HJDGL/rqfkFt
	 w6dRRyAYyoVB/RUp1VGxKYH6dHJIMUW8fusKVebBIQGqN3LOXJ5bUyl5/a2bmEAz8F
	 CMFfF95FO650X/I6JMatPOqLtRPwrc0tgkf6KPc9TPoz4GxojnBw0eXHWhWlYn9vTb
	 A9OahDAVZ0X5YWb23xzZlYkGR4HkpAwVSdCS949kdbcUxB3+wEIHcJMJnCQ7jSOh5t
	 ZWN1YtlcM8Bw1Dy4AH2uvHNeqZcWrbASITp1kHZrYwPIuLHPqlG9Ywlds4SLhHDhb0
	 JAe0KtCnu74lg==
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
Subject: [PATCH v3 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
Date: Tue, 13 Jan 2026 22:11:46 +0000
Message-ID: <20260113-guise-conceded-88030697b831@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113-snagged-blemish-52af3d00d88e@spud>
References: <20260113-snagged-blemish-52af3d00d88e@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Z6twspJZK67KIShOCoO30te6Ga2fX6fNsTohld1qusQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlph9WzZwpa/heOv37H891523KfKjZh5QQmZs3bDDOMM vZJ/XnbUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInYczEyPI9xnn2sxPZQ3Eop +TS9j6GT7fqqXqU6/buYIvmqm8t6BcP/WqmNkrU3GKrvBimlrFZ5bPxcdeuzmVIHWleLBXb2+X5 hBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx SoC Clock Conditioning Circuitry is compatibles
with the Polarfire SoC

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
index f1770360798f..9a6b50527c42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -17,7 +17,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-ccc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-ccc
+          - const: microchip,mpfs-ccc
+      - const: microchip,mpfs-ccc
 
   reg:
     items:
-- 
2.51.0

