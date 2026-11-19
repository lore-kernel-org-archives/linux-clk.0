Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111101;
	b=mIkA25tftRPkQZD7QG7veQKBtVFxnUcBMY0NuztGXQIRJNcZSH4Wfr307aUw9m2NmsW9
	 8gz5IUz4cl18XZFXmWL85gzahI2tbrfBZ/NdBcp7BvnoqoTYbXLKbwnDj1XsfanDeOxyx
	 8l/RofAq2CgSlVNA3DqpccwFgluoqUHjLjraJ8/j5vQlJi1fCzF+44wMZknACQaVRY32h
	 77kdSdb60PVxs/v9F9gkuce/WptZQy9U8979TkjLFuTySxsUnahf+VRly2V1VN6yRR+oe
	 Q7deLt2BRsLbtA0G+12zn05CoeLI5ynzP1vQIZ/NPxfCZRr1f12rcqSHkJlZyDeDfEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111101;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9MeXZf7a9pHOPr4Z6rl5HuBDnFRLSgRPq/7r6sHSwKA=;
	b=sgcAcUu+BpcfpnVY0mxVZbhtPUPt3+DEuiDPKaP08ROOs2DjP0DRLrlibSssugPQ7/Nb
	 /jvtBOVVvEAiQ+9XM1YS+h8ORj801G1uiNA+Rwg3MekyFACF2m26eKfFw3zWBNDWkQ5Us
	 pHICFfvFj8QJ2YtfRsLrolZeySvzPDYQFPTnDzHZHTq8LmuUUBAtLXlEnGYUF6pp3UEvV
	 lgP+bTY9US42Fhm4HXVOqYB3WyBVYT95spBA/BjBj/139R0LZoBfmQqKqMLyEgMa6qbL0
	 C9wLcnMBAwa/a7abMW9VLx6sbXezAeC+NN3sjoKcl9K2HhX6SkiJwV+odlBl5t+ftiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAEU5t7g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB260A2633;
	Thu, 19 Nov 2026 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAEU5t7g
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795111101;
	b=jXJDmk/itXX+U01T1bG67tzbGOJoJnpbnRmRfFzdo4QTjgP7GoqGKlbBoIpjB6pOT+5G
	 ODt9xG4HEl+f3BtOykRETaVe7lzobXtgAEUKcusl1w8BmvOHp8KpZURnvdOGnt4V2EmGt
	 eH3izOtSiiH+Qa5IFS4cp9KU06FcqY+4LdG0n7b6OWlO32VjUAvG+kC6Eo23eFojYYrj0
	 SuGSCKmIg7OMBDbr5zvNADjhTKzcLE+h5J6nKf4gxt1BhpgJYqYrxhyhDOnA1KPH8OuHW
	 aWfn54q08lbixsrg0JOalM5UWDmHu66rcVTrfbfySmfXqNEw+vz6VtoKvjwRYkcgaVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795111101;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9MeXZf7a9pHOPr4Z6rl5HuBDnFRLSgRPq/7r6sHSwKA=;
	b=afC36IxfxMijgxBD3wSHgAZ4UxEPenPHu6otI+sM/H3Fh6/sEPDYBmrtaG95PRnWoRsE
	 Gssmn4e9E2Bf/0rnuj0Y4XZTpnEUfo88SuQH/P2FEjq4KZVIrwHQZQlSHb0bplqw9wag6
	 IJz/a2ns8Eb5N31FMfLw6e5lEk/gDzUIcvUXFbR84W4TLfR2o0Wg9bKJuRCWi57QqbSFN
	 TP+YZ2MMLl7UdpgBhFCWLNGe6SB9C9b8Sup9hDF0oGnnzTAnQK4hsL9xcQhI8/uQ/RQJP
	 3eS9dDrRlsTr1jPwsciWct7kwQ7tURNaD6OgLtTAeVA6AlXPhP2K3fWZST+mSTFeNGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA4851F000C8;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111100;
	bh=9MeXZf7a9pHOPr4Z6rl5HuBDnFRLSgRPq/7r6sHSwKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RAEU5t7geDNa0MnThZHRYXca9C3JZEgkkb/+rj+DYnPSOMuGsMENJrfggg2Hn4mIX
	 rHIuP7kau5ikjmr3yJRRbOg2lGpc+cwVtcDfIoho0o8CLGVY6U2GGcHay3c0VZLKYA
	 bdtUv0Pb++u9SBC3zTGeFPlJx8wLZxjbzeNaC7ikEdYMuCqgWt0kWeKLlJTyrAmmkN
	 /oTBa/avUe9HxaGhRAXBK7DAazMafLNIQYnvY1XlmAj46jbPi6MPnfrzTHryeAFmIH
	 nxgZA39MEIeH6ThbCh1VmBGuOSirH+iVr6ELM/0yeWRU5o3BtEPf8ezGsV9LzOM1Xx
	 Qi087gPPhjdSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7589A4B3AE;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 19 Nov 2026 09:57:46 -0800
Subject: [PATCH 4/6] dt-bindings: net: pcs: renesas,rzn1-miic: Document
 rzn1 resets
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-rzn1-miic-resets-v1-4-feee2bb28bb4@reliablecontrols.com>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
In-Reply-To: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111097; l=2616;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=PAIui0Aho2AWZzvhSSgY1N1LI3WhMjZNRuY98EDHUQ4=;
 b=WEFqo0naEx9FThy7uJU731dKz7sgG0WjVv0r2Z4aaycc41QLjtWsjBAHfOKZHPQiY1XbGzSZR
 8oO0O7SU9f3BgjXoogxK/wWJ9QETBTUqqU9tWke0s14XxqsKutEFRiZ
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

On the rzn1, there are two resets for the miic. Add documentation for them.

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 .../bindings/net/pcs/renesas,rzn1-miic.yaml        | 36 +++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
index f9d39114e667..d0d820f86da6 100644
--- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
@@ -51,14 +51,12 @@ properties:
       - const: hclk
 
   resets:
-    items:
-      - description: Converter register reset
-      - description: Converter reset
+    minItems: 2
+    maxItems: 2
 
   reset-names:
-    items:
-      - const: rst
-      - const: crst
+    minItems: 2
+    maxItems: 2
 
   renesas,miic-switch-portin:
     description: MII Switch PORTIN configuration. This value should use one of
@@ -109,8 +107,14 @@ allOf:
       properties:
         renesas,miic-switch-portin:
           enum: [1, 2]
-        resets: false
-        reset-names: false
+        resets:
+          items:
+            - description: Timestamp selector reset
+            - description: Converter reset
+        reset-names:
+          items:
+            - const: rst_ts
+            - const: rst_miic
       patternProperties:
         "^mii-conv@[0-5]$":
           properties:
@@ -161,9 +165,14 @@ allOf:
       properties:
         renesas,miic-switch-portin:
           const: 0
-      required:
-        - resets
-        - reset-names
+        resets:
+          items:
+            - description: Converter register reset
+            - description: Converter reset
+        reset-names:
+          items:
+            - const: rst
+            - const: crst
       patternProperties:
         "^mii-conv@[0-5]$":
           properties:
@@ -210,6 +219,8 @@ required:
   - reg
   - clocks
   - clock-names
+  - resets
+  - reset-names
   - power-domains
 
 additionalProperties: false
@@ -229,6 +240,9 @@ examples:
               <&sysctrl R9A06G032_CLK_RMII_REF>,
               <&sysctrl R9A06G032_HCLK_SWITCH_RG>;
       clock-names = "mii_ref", "rgmii_ref", "rmii_ref", "hclk";
+      resets = <&sysctrl R9A06G032_RST_TS>,
+              <&sysctrl R9A06G032_RST_MIIC>;
+      reset-names = "rst_ts", "rst_miic";
       renesas,miic-switch-portin = <MIIC_GMAC2_PORT>;
       power-domains = <&sysctrl>;
 

-- 
2.53.0


