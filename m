Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2D34D38E;
	Fri, 21 Nov 2025 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732653; cv=none; b=K3kL4sbOOgLEHpwl/k+9qOPKZaXAWY3JzeGPDcXXBE5LqMXAtMiZ1BIEH9bGnQJ8/5uwi4aEX5VzHc3OzdjSi6liFipZs9ku/KKVM8RFnpaFRCOJs01k9HlCPLoZZZyV1OGj9r2PalLeWuRTJQhLsAIKhRfD+kwBEaLBe2Og2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732653; c=relaxed/simple;
	bh=/v1QAlCCWNbMx8wdrlD6B9enfAEnlVlEnoMDUomq2iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TUKjQ4sCkrdHbHMRCTLQtqKbuU9hwmdROjck7JNaPMYO+/OOTFY8lB5nj0TuwJQ66/c0hBR4dQtMJUMFEugQwGDmskfvAYnnDQmBbNHA7jGvG/9WwlcunCrSOywH2o901aGM+hUrdepWHhwJb5YISNOvixKTdZjuFQHIvNlhkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol/gUFQM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol/gUFQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4313C4CEF1;
	Fri, 21 Nov 2025 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732653;
	bh=/v1QAlCCWNbMx8wdrlD6B9enfAEnlVlEnoMDUomq2iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ol/gUFQMczSrgF4dRYg+nQikDPq38qhKah68ijPzBb9d3Y2CCyFjY5jc+AYaYj+H5
	 8m+xYq7jgfeA3ukeVAH04lzhon4UHa8zmUDaEMPvqNhE36DOSGXSH1skt5cxPYydSN
	 3d4bwn+kA1N3/NeQsH/cLqXq90D/PAk8pv+qTCBTX/VjHJIZjJshfyaLJYofvS3cQA
	 LJiOHt9lzGBypP54svXdLPiOW8+MBjbwhbJPAUrwPbDtgBSOfbzcCMrOfSgUkjkp7/
	 L9VguOhd8Grjkf82EmhnmFFeIgt6LAoZlLUp02saR4N0ybn+YgIa0ZyI6hhbjjPQX/
	 5MyCG3gbgaXTg==
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
Subject: [PATCH v2 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
Date: Fri, 21 Nov 2025 13:44:01 +0000
Message-ID: <20251121-trade-slacked-5fc7c1139cb2@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121-tartar-drew-ba31c5ec9192@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6u/MVsorAWOBiuYW/sM6Lc9tNpUToYIrlt3K2vcU0zQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkKOfMz906riTc7xdT856JynvxRZbZp8tvWTz5RKr9o8 ZxdSz2XdZSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAivsUM/xRktZm5fr7iXed4 ZJbyffkL5z5emWB6f/8qlW1tbYXVu30ZGV4Er1sTmKh0IJJnv2Cc5Edt7qdXubY07GqPZW3L6Z6 7hAcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx SoC Clock Conditioning Circuitry is compatibles
with the Polarfire SoC

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

