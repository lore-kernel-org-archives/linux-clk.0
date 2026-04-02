Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0943630AE;
	Thu,  2 Apr 2026 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120982; cv=none; b=NaNR9QS9JLDOfFBQMIrRQJ6YGAI6sWJ7cZEmSRfMin6uGlM9niP5MIZGnE1F/GCox2kEa6xYgoKI3jNB2t0gVJvAoGe7TG3mZNFFm/T600yef2vUh0kXGQtK51mLms73pugk5eny2pvwahE+cCKy6Tj03Xwvc5vCbphv7k07loQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120982; c=relaxed/simple;
	bh=Pct10WFRLkBZGJP+C1MLBfIUnU9TWoUjNms62a7TZV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uexjnBT66J1RWR+H79pUWAP+XWyBpSTs25w+hwsqTLkLyZPYrBfa6m6Z3djQGmkV9RPepzih6Tb9z8Xr3DhvJlXYsNCXAm77hyTNgfIv/kupRngIMvV9L+Autn8XQTqF2m0x6FN8VndptoicaKA035sVZvImtgklCETxbd1gBjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: u8brfoCQSJOwT+JC7I2M1g==
X-CSE-MsgGUID: CJleIU+LToKUCyIBLJZHKA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2026 18:09:39 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.136])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7F072413EABB;
	Thu,  2 Apr 2026 18:09:30 +0900 (JST)
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
Subject: [PATCH v2 17/24] ASoC: rsnd: Export rsnd_ssiu_mod_get() for PM support
Date: Thu,  2 Apr 2026 11:05:16 +0200
Message-ID: <20260402090524.9137-18-john.madieu.xa@bp.renesas.com>
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

Remove the static qualifier from rsnd_ssiu_mod_get() and export it
via rsnd.h.

This is preparation for system suspend/resume support, where the PM
callbacks need to access SSIU modules to manage their clock and reset
state.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v2: New patch, resulting from a split of the previous one

 sound/soc/renesas/rcar/rsnd.h | 1 +
 sound/soc/renesas/rcar/ssiu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 3860e1c4943f..ddaac350a049 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -815,6 +815,7 @@ int rsnd_ssi_is_dma_mode(struct rsnd_mod *mod);
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

