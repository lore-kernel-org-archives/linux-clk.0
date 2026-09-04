Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB314F0549;
	Fri,  4 Sep 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537529; cv=none; b=jf2RIRLVIMInSf7Jf70h8Hmm1bnonZkcQPK8wCxzg2lx9LfUsHgMTz0noXMAMxszzmGx5dRVM0zHb5DqU/o3isLSARMXdKl41e0Ipj7Y56UgmKBMV1cc+VlQzLwsetkSuzHTkxVRQJE30+xOu+ZZsdnuQ3Mb/wBIJj5UtW7Bn+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537529; c=relaxed/simple;
	bh=rp96vQvpmzcYQQQawuTsiCW9FJPQfixEXB6+OjlKWjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLAUqVaZ5M02vvHeaG8XPyPOX6WUdre4nAkMlRt6zvNIowcfWg1zDMtP55RFqL7g0+uLFYGoFKJlXrk6LBFDktLNcp/WgSVHBAzATLRvg1NMjP/4XIgKQPieIbxXU+FVCRkBEgImqz6QQEaatAhO4tISL3Em7rhMKEB4Rg3zIYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hNseR17M; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hNseR17M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537525;
	bh=rp96vQvpmzcYQQQawuTsiCW9FJPQfixEXB6+OjlKWjQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hNseR17Mr2FEeb7vpRS4ghWeyaEZjje7ZpG+YOxpbJTmU1zP4NKbrmqlmPx2ZCRTA
	 3vngaPHvBQTXjJFi1e59utE3AHU7iWD+J42nEKpLxqkq1Smh8zpKTdIDhQNDHwNov5
	 zBAnJj2zyT/jlGB26ZrEZx3AQcder/2vIa+oWS/r8n/OBwTolMgVdqYxuAxZJA6yIH
	 74Y6grh7tQOyZQ4CjUCLk15kpPZgxB3GmjoGEu+hfl08bRdQcVlsXWR/7tbP7X6OAE
	 klkkS3i04YpYjWXKVtXgdj3tobPxxWo92c+Gq+S1sNgQlWT4cdLgyRBEPLSLMoUcwf
	 Xez8zkb/TNOLA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7102D17E092E;
	Fri, 04 Sep 2026 17:58:44 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:12 +0200
Subject: [PATCH v6 01/27] dt-bindings: clock: mediatek: Make '#clock-cells'
 required for MT8186
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-1-5df247f56938@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=1753;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rp96vQvpmzcYQQQawuTsiCW9FJPQfixEXB6+OjlKWjQ=;
 b=8SAycckJbljlA++tM8/Zl3D8xPkyBNXedGFYjp8uxZtL1/v5djl2j5jekJ2JZYRPWnY85izZx
 MipjenfHAVCAx0UrhOhBDIMqs1i/2JhwfQ9aPs2CgMeBIA5MDEZ3pwB
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Both MT8186 clock controllers dt-bindings (clock and sys-clock)
document the '#clock-cells' property but do not enforce it as required
property.
As clock provider nodes should define this property in devicetrees, add
it to the required property list in both its dt-bindings files.

Fixes: f113a51aa2cf ("dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml     | 1 +
 Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
index f4e58bfa504f..539149c945d0 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
@@ -44,6 +44,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index 1c446fbc5108..f8acc02cafee 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -45,6 +45,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 

-- 
2.55.0

