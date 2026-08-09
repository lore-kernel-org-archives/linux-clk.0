Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586D2BD58A;
	Sun,  9 Aug 2026 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281322; cv=none; b=BU9M61lGazNUfCXMWnUl/zIom1eHvV3SlEOkQfl2qPi8eKpNdgFnPrz+GGc+2ZxnK9L3/pRfysp+F7NYdstU27n/Xa0+ByPcpLVqBiRFEZnzbpVYwvKm0+mBuF5XF2MksTDL1iXWk2mgCu8NQOEXsFqyfYFxIB5iz3N/aW/0UhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281322; c=relaxed/simple;
	bh=4OU6Od8el7QzsKN2rqPzw6rTUFmkgSbklP0M50hiEXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcuDDFZDFKxMMrlxO5Rfe69BDnoRWSGnq26S8GdsP8xMl50nNIxLzKCfXqiFkL7zC1OdBFF0MRrD6RjeoxbX/EiPUWpIU0FBs7ZaXHlpF3vhwTnRnDDhW8lkKcoeE179lg7MBhXsm2J3N1VOixTGBZE9Mx8hM71s+MArqiuWu3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+m6ZLjK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+m6ZLjK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79245C2BD01;
	Sun,  9 Aug 2026 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786281320;
	bh=4OU6Od8el7QzsKN2rqPzw6rTUFmkgSbklP0M50hiEXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K+m6ZLjKe1Jn7Ok0Exl2WTg03ARqZvJK25znyWryDMYsDLTpRBLQnGI1eWdIndTr7
	 w2CaJYPHgKRUL6FVM/BQCFVnse02D+Ewv1CwAz/iFit3c69xcqExsHPTerW35jmSwQ
	 RGy9b0asT+0oggCTkGFzYiorSj3b0W853GUirj5yZpBE2VDxFhysqzOgujblD2j3At
	 dhkcf7PF0rJBkH+yZ7csduGnM/0ePfTMrIXpih564RJzF2Y8FbM3wDsKEg4OZV9zio
	 Sp8uCT1GjnwfxaIEqRMUUu4Et0aU3VcUC9NyPMaf7stHw5oqq3aRGPOoPN2We6P2Qd
	 8p6K/FobUzBPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B26C5AD6A;
	Sun,  9 Aug 2026 13:15:20 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sun, 09 Aug 2026 21:14:13 +0800
Subject: [PATCH v2 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY PLL
 pixel clocks on K3 APMU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-k3-display-v2-4-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
In-Reply-To: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
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
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786281298; l=1913;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=XIXdh8tM1nuisKWRso6HNY0wYA1fsQzlAJKbSvbCocs=;
 b=ZL1gtNAJ4clzcCfAX4wu5YkJYSmn8UV14NVeaPo5RRhKJCeJA0cgvPk+y1y+V0zqhhft+IuII
 HXqR64HqL3tDmZ+AnT4xjeisv3x891Vekpy0Vs56fjQPZA9o3Vf8Iu2
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang.hk@gmail.com>

The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
K3 syscon takes two clock inputs the other variants do not have.

Gate them behind the K3 compatible instead of widening the shared clock
list, so a non-K3 syscon cannot silently accept clocks it has no mux for.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>

---
v2:
- drop the redundant minItems: 4; four is already the minimum
  (Rob Herring)
---
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml   | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index d3a7c93c3c54f..a6ef456fe14be 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -31,14 +31,18 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: osc
       - const: vctcxo_1m
       - const: vctcxo_3m
       - const: vctcxo_24m
+      - const: edp0_pll_pxclk
+      - const: edp1_pll_pxclk
 
   "#clock-cells":
     const: 1
@@ -95,6 +99,21 @@ allOf:
         - clocks
         - clock-names
         - "#clock-cells"
+  # Only the K3 APMU exposes the two eDP/DP PHY PLL pixel clocks as extra
+  # inputs (parents of its eDP pixel-clock muxes); every other variant has
+  # the four base oscillator inputs only.
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: spacemit,k3-syscon-apmu
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
 
 additionalProperties: false
 

-- 
2.43.0


