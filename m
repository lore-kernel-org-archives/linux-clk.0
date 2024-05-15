Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20BB85286;
	Wed, 15 May 2024 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777946; cv=none; b=t25C7g3iHg4zifcJQEPHmB1WNaQK8pV9eARPMS241SJo+GDbDguGXy2njIBSNkuosGJBcFsE9Nq4VSnMqZqbLHwaUyNovIlHAMsDpRLBtwTUVP82KX0OkLbJbD5MGjuqv/EyBCPxw+YetrDFVS0HvGqHDB0EIyHGtDCJQEhS4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777946; c=relaxed/simple;
	bh=GI2IWdF3zL4xqby+72i7WuWwWRZ0BXl3G3oCRRITxeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEj1h3/XhRn1S+K9yXNM0Jv1n5iRdy5ngL87mAJi7XOgIpBOBeK1Kkl6YBzvhGFbRrwz21E7S5ske0UVHumctEihrblASDyoYS6c97bqH7/oq8gwKkuAmHE7id9D3/ZBmslm0szGESFLio2Ay+E3I5s+To3WHy9tcfAtSG/6yXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny8C95y7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny8C95y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FDDC116B1;
	Wed, 15 May 2024 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715777945;
	bh=GI2IWdF3zL4xqby+72i7WuWwWRZ0BXl3G3oCRRITxeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ny8C95y75+Z0AZEbmCoJbAIG/tJC5kH81PkVknncJ/LLelmKXg9dSnEOYaT34aQzf
	 RxIJwcjSqZ9of+u2gGw62h5VJxpDhO6fVbiZ0IlDtyj+vo4ksfe9bR+tO/G8Q3MYiV
	 xwyNuscVgkni0V30Gv3hqw9t70V1qZo0/52gWQ8Mi/Pkn32fu2c7yUZ4udvnOZ9eZl
	 gG9xEYlut4U95FGJvM0yVcsPehEBBPV7gpcpSZm4TbHNnjlbZLSlkr3lIkywQahe9E
	 Eg5lQ3fswOCXokYUCT5P2yjW41BqYD+km6G49kw292kKauLfsXT0t3mxRmJ1FIgS+1
	 64zwupkHaokNg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	conor@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 1/5] dt-bindings: clock: airoha: Add reset support to EN7581 clock binding
Date: Wed, 15 May 2024 14:58:47 +0200
Message-ID: <faaa220be22abcedecb0a63d5734f821167eb8b7.1715777643.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715777643.git.lorenzo@kernel.org>
References: <cover.1715777643.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset capability to EN7581 device-tree clock binding
documentation.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 3f4266637733..22eee1ae90d5 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -43,6 +43,10 @@ properties:
       clocks.
     const: 1
 
+  '#reset-cells':
+    description: ID of the controller reset line
+    const: 1
+
 required:
   - compatible
   - reg
@@ -60,6 +64,8 @@ allOf:
             - description: scu base address
             - description: misc scu base address
 
+        '#reset-cells': false
+
   - if:
       properties:
         compatible:
@@ -83,3 +89,18 @@ examples:
             <0x1fb00000 0x1000>;
       #clock-cells = <1>;
     };
+
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      scuclk: clock-controller@1fa20000 {
+        compatible = "airoha,en7581-scu";
+        reg = <0x0 0x1fa20000 0x0 0x400>,
+              <0x0 0x1fb00000 0x0 0x1000>,
+              <0x0 0x1fbe3400 0x0 0xfc>;
+              #clock-cells = <1>;
+              #reset-cells = <1>;
+      };
+    };
-- 
2.45.0

