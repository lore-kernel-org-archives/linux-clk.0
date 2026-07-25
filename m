Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1E2FE56E;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955084; cv=none; b=M7C+jWNo94kOLgPqDWnGd8B4eL1Mpezgp7BJpjdk8Z8c9sN4Me1B9Fm15CgKNFpedS9MU4/807IVSdxOT1Fjv0U5ZSrhK2UrJTQOX5sL/9XKbUCWPO93pjEaqyLMX8MVdH0BDKV1Fh9TX/KanYD35BuT8qW5GRO/prkJIJzqqs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955084; c=relaxed/simple;
	bh=NE5pnwgEYXmw9dka1kEONCacx9bBT/Qa1Xqatoy7Md8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbun43EsU/I7+5nX8UcB8VYWvUEUo+Ipf6eRbmEVU69DwjpcWROTjeNG2s5FUPtoq5K5tcuuM6iL9fsM9mGcBcFPwWyNK/bzxVl/CRzKvwXUg1hlcXD52ht7ZsKN9O4SIEqaACEkN+aORCNtEvJm/vV6kFV6dW0RgWn78hK5dkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9awtHJ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9awtHJ/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3713FC2BCFD;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955084;
	bh=NE5pnwgEYXmw9dka1kEONCacx9bBT/Qa1Xqatoy7Md8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q9awtHJ/yVKgNlLSoquK2C5prnLB/0/QX/EgXpSZAUPt2WJsx9AY3ZXG35mcboqld
	 fQ7Hf/NrGtrqVnaI7IC8pQyhwir97v73tzfUe2LtC+ENZwaudCWqxKPwDCByTfzu8U
	 J0LonOK0ZGDJ0K8d2DxKEIFqyJJzrDMUV7vpRjbbK014vZLg3PA4YBWhM2TtWvvRNr
	 KUyeu7XfpJKxsrpvxcjH3dfZy58HQK0yU3e26vENXagf3n9IbecfFN5DrdkovqnDAM
	 UknsT0z5F7OCHh3XjiEorY2dlUmVGLznoAffVh2Jx160PD4TVkY+zIPuPa/E14BDO0
	 SUEb05dDCM+iA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18906C53209;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:11 -0400
Subject: [PATCH RESEND 02/17] dt-bindings: phy: add SpacemiT K3 Innosilicon
 DP PHY
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-k3-display-v1-2-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
In-Reply-To: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=2331;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=xr0oQcfFPCJzaAeEJhH42CRWzbYWKnP3e2i7y0AjEKQ=;
 b=5SvNVVr58XiRYnVJORW96i5uRgcBnJtyJxdzAgLmdpTlgOoI4aHgXlZ/gGLz1ej06AA6XrI4E
 Rhnuba+0KFGD2QOWi+v4UrsLzPVvHeTHKjWsn/RZ8PasuwLQLQFcrIm
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang.hk@gmail.com>

The SpacemiT K3 DisplayPort controller drives its four transmit lanes
through an integrated Innosilicon DP PHY, one PHY per controller. Add a
binding so the controller can reference its transmit PHY and the pixel
clock the PHY's PLL sources.

The PHY's registers are interleaved with its parent controller's inside
one MMIO window, so it owns neither a reg nor a reset and is modelled as
a child of the controller.

It exposes its PLL-generated pixel clock through #clock-cells, so the
APMU pixel-clock mux can select it as a parent through the clock
framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
new file mode 100644
index 000000000000..f8f1ef372951
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort PHY
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon four-lane DisplayPort transmit PHY integrated in the SpacemiT
+  K3 SoC, one per DisplayPort controller. Its registers are interleaved with
+  the controller's own inside a single register window, so it is described as
+  a child of the controller and owns neither a reg nor a reset.
+
+  The PHY provides the pixel clock its PLL generates, which the APMU
+  pixel-clock mux takes as one of its inputs.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp-phy
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy {
+        compatible = "spacemit,k3-inno-dp-phy";
+        #phy-cells = <0>;
+        #clock-cells = <0>;
+        clock-output-names = "edp0_pll_pxclk";
+    };

-- 
2.43.0


