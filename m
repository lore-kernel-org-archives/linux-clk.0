Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470671;
	b=BbT4N1A2BqljPtWoAvxPbmA4DzdpZl8wIeAYr0sfAsbQsNr5qtEYBSgQ4/KKttRO+2EI
	 aWnW7AiBUMDvL2BHovtNNolk5jb72UWgj8KwPitjtIMNIg3lKc4Wmmj0vObQpEktGbxPx
	 yN04jsdlpxQ00s/ebBJJQH76ychEb5FSrFc7d4x5UasF/uWPRbl0kkYpJT845o13GhuRw
	 UdeVR+o9y3qQcgY842tRXKBhoZ9oB21KKwOIICKdsmthW1ySmlAzbG7R5wdx5KD9i8GO0
	 hbzkC9RE08kVUJ/uhlFwWwm0jBCYavLiVq9BpweZYeguQwCr6ranyD6BXJ22X9ulHVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470671;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t+FOp9DCq8PwbPSQQPKOP0UE+T4Wr9a4DcQWSA7fMIA=;
	b=5QHNWzk90z+LL/gChyCWpgCQ8EW4+e/vMXpVahsm+Iuy2rN93yBt/i7gDKAspLDn1UpY
	 MO+hIawrnHx3Bfn0fRe8XvKipnJOc1vFMJFx69Sev2lqVFO9AhD1Kyv6SiUEu9UMr1AjM
	 P8yfHsPcS2Zyli4sPOTN5uSawJU0ArNqEZwk6A4aGkdwobE9R21ACAnU7OIOjgShQDFE1
	 Eq7/GYMVZZpHoZqua8CHt8+hi6i/0VSkswu0aTRWz3sscfqjjFJD8ooI7/lzc326iCsPu
	 wpQcrJ5R4en+d+exHw28QztafNgBmXaLzUefGXEe9DW67JqKMug1w4BeqAwOF0ZPN6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWSYysNq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB771606A333;
	Mon, 23 Nov 2026 21:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWSYysNq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795470671;
	b=0WlQw0A1ArtUXJmcIrqPoNnYvqt2a6DtNowYReNAKpjfrShOUWFzwc8BsJzeXq9mT4mc
	 XXF3o6Jqb933zIDOonTJY4dEH8DHVBMzx9HEyvkVPqYnJJq2O6v7oTD2QK2fw9qsrj6j9
	 pKPYVrr2GxHk9raBGxzUSo5bx/vn6H2f/XIyo1FCuetNd5UonzKE71RD/ZeLfU2C8i/S3
	 HNHOuBjlo3p7BAj81vDxJrXIxnRTYHDFTfMoDOSvyXhqhTDcAc98hT/bLM+TIG7VaGQt/
	 PVAXOxM9n8I3NNZZw5V3YdAli8pppj1Qt/fl25fBEHkft5YjCHQ39K1PO6u8zKxD3cQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795470671;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t+FOp9DCq8PwbPSQQPKOP0UE+T4Wr9a4DcQWSA7fMIA=;
	b=EGlLvt5S0YsJTyod1kILKPSTvSlTN82DgUaVEV9bymyQ1eNd80GuXEDgIPyiFLOju516
	 oL0H0ZjP5ESqgY8w0/aP/xfvZ63BMzwOU0aj1hxUBk3lPP7q0OijYd89TB2XILSTvrs3V
	 tMHrQ2SpBVOgTDrldiR8YpQmbVQPMr9mIQHIULcJknRIBC3gS3knrPTUqU8eVf4j1DBtj
	 Kq5vXGpLg0vShVo6JT3cepSCRREAnlsoYUsLLBJtZvdH2zrpa77F9JIfal9+1nRedObnk
	 IqsJdU8fR5YqnEjd5xM/tQx+K+/CSvR3+k8Bietld+S5qwHFIVSaMpg3fRd928L0NxA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 338C81F000D3;
	Mon, 23 Nov 2026 21:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470671;
	bh=t+FOp9DCq8PwbPSQQPKOP0UE+T4Wr9a4DcQWSA7fMIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aWSYysNqGwsQZ9SHgcHxcvSUEzZIw0eNDU5T7+RJdXZyTCOW3L7GL3oBH1kOeL/7H
	 dLg9c5wbmHf4tEKt4ofxvZ1axhDseV/Wty9Ec4QjIRf76AmBZHyXF1l/u/sB3v7XdX
	 Tw329eZH7kN+xCX8OeU53zfFWT0lpGXQhCsb+OTihY59dsBfxlPgynq7OKCD/rOeGa
	 8iP90HF+lRYw3BLwUZu8c5HFDwW9mGDbAtS6dL8oTL0TYjZtzra8Oh4eaLV1DkK/Nh
	 lwOspnJD5c8P+zBq/HUdl4FpDfYWY1JkLZySq7IcW35CQcjYzRmOjOQ+J22yFvF7YO
	 PJ1EH16kGFcJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B6C5F4C77F;
	Mon, 23 Nov 2026 21:50:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 00:50:58 +0300
Subject: [PATCH 1/3] dt-bindings: soc: Describe CS7542 global gates and
 reset domains
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
Message-Id: <20261124-b4-cs7542-global-controls-v1-1-12548785df2c@gmail.com>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
In-Reply-To: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795470657; l=3633;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=n/z0ljwGjp/3VFKQErO4wbHMgKIiXYh7j3B5tNIJnUo=;
 b=Q9HYthlORc5L0xu0ndiFe+2NOZiLVjcykhEDFU4Zs1cGK0rkrmFEHwoNu1R5doyVM+WP85Kds
 O7nCXMCEafLB93uxR26YcbG5YA+XcXKNWTIAeMsYL6uIbm1R73pFnYK
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Expose PCIe gates and resets and the exclusive network engine composite
reset on the existing global syscon node. Preserve clock indices 0..2,
add PCIe clock indices 3..5 and reset indices 0..2, and give the NE domain
index 3. No virtual control child is required. The optional reset-cells
property preserves compatibility with clock-only users.

AI assistance: Codex prepared this draft from the posted CS7542 series.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/soc/cortina/cortina,cs7542-syscon.yaml        | 14 ++++++++++++--
 include/dt-bindings/clock/cortina,cs7542-clock.h           |  4 ++++
 include/dt-bindings/reset/cortina,cs7542-reset.h           | 12 ++++++++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
index fb074de87..12f750dab 100644
--- a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -12,8 +12,14 @@ maintainers:
 description:
   The global control block contains the boot strap status, GPIO/peripheral
   mux registers, reset controls and the secondary CPU release register.
-  It provides the APB, CPU and AXI clock rates selected by the boot straps.
-  The clock specifiers are defined in dt-bindings/clock/cortina,cs7542-clock.h.
+  It provides the APB, CPU and AXI clock rates selected by the boot straps,
+  and the three PCIe clock gates and controller reset lines. The network
+  engine reset domain covers NI, FE, TM, scheduler, QM, NI XRAM and the
+  entire DMA block (LSO and SSP). It excludes SDRAM. The network engine
+  consumer must own this complete domain exclusively; it cannot run
+  concurrently with a separate SSP DMA user.
+  Clock specifiers are defined in dt-bindings/clock/cortina,cs7542-clock.h;
+  reset specifiers are defined in dt-bindings/reset/cortina,cs7542-reset.h.
   The pin controller uses the same register map through its parent syscon.
 
 properties:
@@ -29,6 +35,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  "#reset-cells":
+    const: 1
+
   pinctrl:
     type: object
     $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
@@ -46,4 +55,5 @@ examples:
         compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
         reg = <0xf0000000 0x100>;
         #clock-cells = <1>;
+        #reset-cells = <1>;
     };
diff --git a/include/dt-bindings/clock/cortina,cs7542-clock.h b/include/dt-bindings/clock/cortina,cs7542-clock.h
index 34d544238..c68c6ba20 100644
--- a/include/dt-bindings/clock/cortina,cs7542-clock.h
+++ b/include/dt-bindings/clock/cortina,cs7542-clock.h
@@ -6,4 +6,8 @@
 #define CS7542_CLK_CPU	1
 #define CS7542_CLK_AXI	2
 
+#define CS7542_CLK_PCIE0	3
+#define CS7542_CLK_PCIE1	4
+#define CS7542_CLK_PCIE2	5
+
 #endif
diff --git a/include/dt-bindings/reset/cortina,cs7542-reset.h b/include/dt-bindings/reset/cortina,cs7542-reset.h
new file mode 100644
index 000000000..546e643a3
--- /dev/null
+++ b/include/dt-bindings/reset/cortina,cs7542-reset.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_RESET_CORTINA_CS7542_H
+#define _DT_BINDINGS_RESET_CORTINA_CS7542_H
+
+#define CS7542_RESET_PCIE0	0
+#define CS7542_RESET_PCIE1	1
+#define CS7542_RESET_PCIE2	2
+
+/* NI, FE, TM, scheduler, QM, NI XRAM and DMA-LSO/SSP, excluding SDRAM. */
+#define CS7542_RESET_NE		3
+
+#endif

-- 
2.53.0


