Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED15135F162;
	Thu,  2 Apr 2026 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120943; cv=none; b=qGnar2PANdoZ+JsRCb+QRTaBQWP9i+WrONU9QeP2NJY7C4DeBgVRrWCKv6udYfOWLmtWvX4qdh1VQddo1rvGq41PiT49xbIxjh2/etm+mhJX3zEBuybvgm2O7BxD0pvFrthlviaKciJpZmQtQGGiOLIS3Z5f6LqjJT1Xnl8jsYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120943; c=relaxed/simple;
	bh=PfxHz/3OmVJLxTGCi4rHOMcpMvxJjUvGT5gZiMm3IhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQP4QpJJen5kaNmRwearxsTiZKFBVKiGds0FndhRg1/g5EdXKwCX63gvFTavtWdibcDZzbp8JArAldxUiB6TN8/B8FUQD5S+s3yBj3IGKXbESGII8l86sYjZcq9WEMIw3UXuSwywsRczEHSCExCnhx2Wpa6cysuzug+jZHLBwDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Lb7lRzlBSbKWtViuUn9qgQ==
X-CSE-MsgGUID: r5fDyts4TWiuSnhH0aekdg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2026 18:09:01 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.136])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 24A64413EABB;
	Thu,  2 Apr 2026 18:08:52 +0900 (JST)
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
Subject: [PATCH v2 13/24] ASoC: rsnd: Add ADG reset support for RZ/G3E
Date: Thu,  2 Apr 2026 11:05:12 +0200
Message-ID: <20260402090524.9137-14-john.madieu.xa@bp.renesas.com>
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

RZ/G3E requires the ADG reset line to be deasserted for the audio
subsystem to operate. The ADG module clock is already managed via
rsnd_adg_clk_enable/disable() through adg->adg, so no additional
clock handling is needed.

Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

changes:

v2: No changes

 sound/soc/renesas/rcar/adg.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 0105c60a144e..cbb5c4432a2d 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct rsnd_adg *adg;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
@@ -779,8 +780,13 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (!adg)
 		return -ENOMEM;
 
+	rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc),
+				     "failed to get adg reset\n");
+
 	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, NULL, 0, 0);
+		      NULL, rstc, 0, 0);
 	if (ret)
 		return ret;
 
-- 
2.25.1

