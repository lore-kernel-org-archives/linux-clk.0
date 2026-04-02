Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA7C35CB6A;
	Thu,  2 Apr 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120836; cv=none; b=InVZ07Hg5Uv7G5uvhepWzTyPKxnNS2l29H51BIpRE4Syy0LGSRKn85dQUaJGetgXxJE8hsmp0YmC1qD/yGntUANnQI0DWMkYjSYgEeCvVRmlxyfCJfyqWbNU6zeMATGi2mFlbRr6fnhVp6oHhiNWn9dv24mPLlQXpyk1l8IZxO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120836; c=relaxed/simple;
	bh=X37XDUHdWRw5TvK1a2T1hccGb5D60ivpW8gq3u11GPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOzugD2/QKjutydj4eKOGANLHs75A2nuC4hC7HA36h0GR5B8SmJX3ACmgudJpX4mAhDzGWHh0+R3qkO2itZzILO1y9cbAjvC8J87173Ers+qk8Fo1zk1OgCahdNGq/RP0G2XQ5xaTQ29PmuL1tOhbusE/y6ZKmcVHbZTl1I1Ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: mXO/D9kgS6Kkl54iLs19cQ==
X-CSE-MsgGUID: QSjdhNOOTS6CIk4s6BuhyQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2026 18:07:14 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.136])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 99AFA413EA85;
	Thu,  2 Apr 2026 18:07:05 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	John Madieu <john.madieu@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v2 01/24] dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
Date: Thu,  2 Apr 2026 11:05:00 +0200
Message-ID: <20260402090524.9137-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com>
References: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/V2H, RZ/V2N, and RZ/G3E support external audio clock inputs
(AUDIO_CLKA, AUDIO_CLKB, AUDIO_CLKC) that can be used by the Audio Clock
Generator (ADG) to derive internal audio clocks. These clocks are optional
and their frequencies are set by the board.

Update the bindings to allow these optional clocks for all RZ/V2H family
SoCs.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v2: Remove maxItems as it not needed with items lists.

 .../devicetree/bindings/clock/renesas,rzv2h-cpg.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index f261445bf341..d9cf62f5224e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -26,16 +26,24 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: AUDIO_EXTAL clock input
       - description: RTXIN clock input
       - description: QEXTAL clock input
+      - description: AUDIO_CLKA clock input
+      - description: AUDIO_CLKB clock input
+      - description: AUDIO_CLKC clock input
 
   clock-names:
+    minItems: 3
     items:
       - const: audio_extal
       - const: rtxin
       - const: qextal
+      - const: audio_clka
+      - const: audio_clkb
+      - const: audio_clkc
 
   '#clock-cells':
     description: |
-- 
2.25.1

