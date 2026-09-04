Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5944F30FC;
	Fri,  4 Sep 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537533; cv=none; b=ol5PL7DIjvsfYDNwUvNMjrjQkbr1c6COS1QRa1MthVPPliAEY2YNLYykIc8r3V9E24/kQmRqMBaYsfG0TzC7FmwjYVKalRCPqjcQ0qH09VEqyoUsVmFHmzSExQcrp39GJdZxNNcXlhvPGqrkBfwGs8DlfaDc44zZ6vp8PTbfmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537533; c=relaxed/simple;
	bh=3HvR2i0TeyW7ntE6wt26ah4Fl34lpJceNTjjoyWnRHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7DVgRGts6vrypOPm0RTvo8J72V1nzmtc9ZpuZWT72Bm/DttlLFvnTygPr9shg/yJzvYzik4uWKw/QZsUiHECAsF2zf04iwdyroKG/7bnSSlUiJAKLmu/4TWdYyPwhhIxSVPjDEBtqUAgPM+UVHcw8+Ll8+3IQD5FKSrsGyZ9rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F3m8Kujj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F3m8Kujj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537530;
	bh=3HvR2i0TeyW7ntE6wt26ah4Fl34lpJceNTjjoyWnRHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F3m8KujjfJNu0fwavo6x1ysLwaLG619sUz1zuNSWuvJhvjyK5R+ml9pL/8MV6tlLw
	 NKjSH4Ptfz3n+VtjCAKRvLuvQamc/9cFQzRygPxcYissnPLEphSOcbJDwhkaULt6OF
	 jC1md+yxFAXMBbWf64ehDFQY2sfs4+HC1c74ZI3oKNnIKxTFNAMbcUnYfEn5djNzN/
	 Wk8lVjGHj4UZeU/r75jlX+FPYhz4opfV0Zp2Apqyn9dcnrR8edledYY82SAinghUva
	 Xsp2BZEeeo/jClnnmuBSeJlMJ3pjQJqZc4p9XORCBS6WGf1ObXHahmkTyLFtkVhEll
	 AiEitpi5zsLZA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8A4617E0FAA;
	Fri, 04 Sep 2026 17:58:48 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:15 +0200
Subject: [PATCH v6 04/27] dt-bindings: clock: mediatek: reorder MT8186
 compatibles
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-4-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=2561;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=3HvR2i0TeyW7ntE6wt26ah4Fl34lpJceNTjjoyWnRHM=;
 b=JcSw7/T9WbgeIvjqLLJHHfsNPqiszR8pn1ru20c5LJ4e21e40j1MdE++e9MvdmX2hDSUeTTv+
 v+NVjpBs/3qA8/NKWx7FLGk3ymELYIhquT0AW71P9yetI/ZgmXOdVPn
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

In order to prepare regrouping several Mediatek SoC clock controller
dt-bindings files into the MT8186 ones, reorder the MT8186 clock
controller compatibles so they are sorted alphanumerically.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../bindings/clock/mediatek,mt8186-clock.yaml           | 17 +++++++++--------
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml       |  4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
index 539149c945d0..756b937bb7c4 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
@@ -23,18 +23,19 @@ properties:
   compatible:
     items:
       - enum:
-          - mediatek,mt8186-imp_iic_wrap
-          - mediatek,mt8186-mfgsys
-          - mediatek,mt8186-wpesys
-          - mediatek,mt8186-imgsys1
-          - mediatek,mt8186-imgsys2
-          - mediatek,mt8186-vdecsys
-          - mediatek,mt8186-vencsys
           - mediatek,mt8186-camsys
           - mediatek,mt8186-camsys_rawa
           - mediatek,mt8186-camsys_rawb
-          - mediatek,mt8186-mdpsys
+          - mediatek,mt8186-imgsys1
+          - mediatek,mt8186-imgsys2
+          - mediatek,mt8186-imp_iic_wrap
           - mediatek,mt8186-ipesys
+          - mediatek,mt8186-mdpsys
+          - mediatek,mt8186-mfgsys
+          - mediatek,mt8186-vdecsys
+          - mediatek,mt8186-vencsys
+          - mediatek,mt8186-wpesys
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index f8acc02cafee..6733dafbde16 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -27,10 +27,10 @@ properties:
   compatible:
     items:
       - enum:
+          - mediatek,mt8186-apmixedsys
+          - mediatek,mt8186-infracfg_ao
           - mediatek,mt8186-mcusys
           - mediatek,mt8186-topckgen
-          - mediatek,mt8186-infracfg_ao
-          - mediatek,mt8186-apmixedsys
       - const: syscon
 
   reg:

-- 
2.55.0

