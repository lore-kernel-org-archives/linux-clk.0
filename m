Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAC9489FAB;
	Mon, 21 Sep 2026 23:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033302; cv=none; b=LPcfcsM2I0uxrOwBt/2hRjZdM8bBp/NMI8EPI5lQqhlvKFpNK+Fa54HsWDbv5fKylP++UaaoBMZ7m6XOepEvIuDKj/EF1m+bVgxFAe8gVGZv/Gx3Wm8Qrv6NoYvXYWlb11Zl71wyEF2tvgS1pjGHrRWYFH9ynUX+ZIAsK4B/GvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033302; c=relaxed/simple;
	bh=+AO/v9nGlpiWxBEyyBhfU0XYgqE2xZJnTRMqOr3Gqfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YpioePWhfDrbXkm9wcTVH0zQZ0wvNiQI4buc9Z9TZN03kiAQz9qcoktVlW2FqDl7B3hCbzDNwzBWeegtzcUl8hL4pt+CrlUDDr3wMaCSJIJgE0PQArqojZLmUb0A4EFtZp5ECZLONhfmRl+AKLSvK1391zZ7+oWDzBwkhSBrrhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVBRn4HA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVBRn4HA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C956F1F000FF;
	Mon, 21 Sep 2026 23:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033291;
	bh=s9i/ToZsbA5iXctbYEYVjf65fydob/mr01EsHElgSTk=;
	h=From:To:Cc:Subject:Date;
	b=XVBRn4HAER+wIB/E1iVk+dVgAHu83sRTjn6y74APepGBQ1VZ6N+hHkfvdjHVgdiLU
	 J/LRnQ4ScTBfL+ekBqAafSEEuJ6co4rYknZEwK5+woBeM5s7SyTrp0tvH5h3LAMO37
	 UM89JozSTA+pvcbol3QHFY+V8Otsz5aQBJSTVUnnFjoSvmUCVQfv4ikou3XYUQXcNq
	 OyZ6hYfM613SOlbK6nSqhTb5rBX/3hGQPvBHsX4Th4yS/rgzmkiedmEzdD/z/Vn0Vt
	 eIkgWdBpMnVmK/TeRzYlLfOdl/QTdrgNknxCOxyeFHxFnkRnO+WMddXzvFqJkuThw1
	 bXZQjn7aqx1iw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: clock: mediatek: Add MT8516 fallbacks
Date: Mon, 21 Sep 2026 18:28:06 -0500
Message-ID: <20260921232807.3137010-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT8516 topckgen and apmixedsys nodes use the common syscon fallback
form. Add the MT8516 compatibles to the branches that allow the
syscon fallback.

Fixes: cd9fdd06b0e8 ("dt-bindings: arm: mediatek: topckgen: Convert to DT schema")
Fixes: 16a146735df3 ("dt-bindings: arm: mediatek: apmixedsys: Convert to DT schema")
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/clock/mediatek,apmixedsys.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
index 591a9e862c7d..438723d25320 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -26,7 +26,6 @@ properties:
           - mediatek,mt7988-apmixedsys
           - mediatek,mt8135-apmixedsys
           - mediatek,mt8173-apmixedsys
-          - mediatek,mt8516-apmixedsys
       - items:
           - const: mediatek,mt7623-apmixedsys
           - const: mediatek,mt2701-apmixedsys
@@ -42,6 +41,7 @@ properties:
               - mediatek,mt7629-apmixedsys
               - mediatek,mt8167-apmixedsys
               - mediatek,mt8183-apmixedsys
+              - mediatek,mt8516-apmixedsys
           - const: syscon
 
   reg:
diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
index c080fb0a1618..6594d491e215 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
@@ -23,7 +23,6 @@ properties:
           - mediatek,mt7622-topckgen
           - mediatek,mt8135-topckgen
           - mediatek,mt8173-topckgen
-          - mediatek,mt8516-topckgen
       - items:
           - const: mediatek,mt7623-topckgen
           - const: mediatek,mt2701-topckgen
@@ -43,6 +42,7 @@ properties:
               - mediatek,mt7988-topckgen
               - mediatek,mt8167-topckgen
               - mediatek,mt8183-topckgen
+              - mediatek,mt8516-topckgen
           - const: syscon
 
   reg:
-- 
2.53.0

