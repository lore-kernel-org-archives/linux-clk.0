Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5B03E8C60;
	Thu, 19 Mar 2026 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935809; cv=none; b=HyN6iOVLrTKovob4nycfiebLS3Zo6VR2X0vx42HUxpOXE7KV6TUh/gDpsfJBZKQo6wD7Ux9o6SndzJq2ZuAYc2tTAw93EXTOwAxfOSg0AtVhnmdQ0lSQvWdVxRp39gNM96kLfoyk4V6uijddYogxP26NjoCQrnmDquNeSA54lxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935809; c=relaxed/simple;
	bh=978rvv5RyDO4c6uSVUDf09DjXhUxKQgKHDcwAqwip4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZdSaTwy+2nx/MEXpWiBouymwN+euW/rHQSHQwFmcHCNgpPGWMtTZcik0p24p3K0KJ8IDOEpwBrvLVZkExbbthVnMG7nt1WVuNNflPeVCnUpQW0/7i5bpP3YlsuWobmgeX42+/yi1hvSR084GuWtexVRt10wx+ai2w8KGMG3css=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: AM4xPiU7QlqJXXIjp/293w==
X-CSE-MsgGUID: OBOzu5uPTVuFPZedGTBsOA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Mar 2026 00:56:46 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.35])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0BB7A401B652;
	Fri, 20 Mar 2026 00:56:37 +0900 (JST)
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
Subject: [PATCH 13/22] ASoC: rsnd: Add ADG reset support for RZ/G3E
Date: Thu, 19 Mar 2026 16:53:25 +0100
Message-ID: <20260319155334.51278-14-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
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

