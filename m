Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9013DD50C;
	Thu, 19 Mar 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935837; cv=none; b=Xa2ulCvjv72kUYxxi7wkGDl2+rBJUSvSFDPAc1nGlIPQu/egYHdsINhDcOmxZBIq6NaUsTNHmkYtIMeAIbFA53CJceCQgKkHzBntLLybsZOSul5/m7p1Ncn8unsD05VbVVH3FHvcmGgq/OuVD5DBbRScbYbibeRiNFy0e2gYad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935837; c=relaxed/simple;
	bh=oC3zyeBxhmAjtLYxKjJSz5zaw0Nnjo0hvRlG4CCzvxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjNrVEfXXve2kfJ7D4cAv0j29EPYEwWuzkfH6XDGIBZ6JAvdSiftkz5Dk+Rn+EmpaWkvNPQmUlN1d8tiCnm3I2+TQGTYGrvbaxeHCvtnJS0krrRcFuOr1VbLAg/lUs/N6VmYIsATkfu2SokPfG1gQPk/Xcxj5oP9SLziAqNPCI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: a1j2HT1ZTRG6zlBKKFVOeg==
X-CSE-MsgGUID: doTmm7BPS42rZVj1ZggEdQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Mar 2026 00:57:14 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.35])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 01DFE401BC51;
	Fri, 20 Mar 2026 00:57:05 +0900 (JST)
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
Subject: [PATCH 16/22] ASoC: rsnd: Export module getters for PM support
Date: Thu, 19 Mar 2026 16:53:28 +0100
Message-ID: <20260319155334.51278-17-john.madieu.xa@bp.renesas.com>
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

Export rsnd_adg_mod_get() and rsnd_ssiu_mod_get() to make them
accessible from core.c.

This is preparation for system suspend/resume support, where the PM
callbacks need to iterate over all modules to save and restore their
clock and reset state. Other modules (SSI, SRC, CTU, MIX, DVC) already
have their getters exported.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 sound/soc/renesas/rcar/adg.c  | 10 ++++++++++
 sound/soc/renesas/rcar/rsnd.h |  2 ++
 sound/soc/renesas/rcar/ssiu.c |  2 +-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 131a60689f6d..d73f29bc9de7 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -906,6 +906,16 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	return 0;
 }
 
+struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+
+	if (!adg)
+		return NULL;
+
+	return rsnd_mod_get(adg);
+}
+
 void rsnd_adg_remove(struct rsnd_priv *priv)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index a803c0f03665..2cee5c2aa7d7 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -628,6 +628,7 @@ int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *cmd_mod,
 #define rsnd_adg_clk_disable(priv)	rsnd_adg_clk_control(priv, 0)
 int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable);
 void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
+struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv);
 
 /*
  *	R-Car sound priv
@@ -824,6 +825,7 @@ int rsnd_ssi_is_dma_mode(struct rsnd_mod *mod);
 int __rsnd_ssi_is_pin_sharing(struct rsnd_mod *mod);
 
 #define rsnd_ssi_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_SSI)
+struct rsnd_mod *rsnd_ssiu_mod_get(struct rsnd_priv *priv, int id);
 void rsnd_parse_connect_ssi(struct rsnd_dai *rdai,
 			    struct device_node *playback,
 			    struct device_node *capture);
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index f377d9414633..1462f02c2a7f 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -434,7 +434,7 @@ static struct rsnd_mod_ops rsnd_ssiu_ops_gen2 = {
 	DEBUG_INFO
 };
 
-static struct rsnd_mod *rsnd_ssiu_mod_get(struct rsnd_priv *priv, int id)
+struct rsnd_mod *rsnd_ssiu_mod_get(struct rsnd_priv *priv, int id)
 {
 	if (WARN_ON(id < 0 || id >= rsnd_ssiu_nr(priv)))
 		id = 0;
-- 
2.25.1

