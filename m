Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05425364040;
	Thu,  2 Apr 2026 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120907; cv=none; b=VZySKZbd+6KH+CxIG54vtyg/dpCdtg9LqsJmYZKL4PFWOGjMX+yq2NgX/5ddiILFvEPG8s/TDZ0d5yB+VwpqRNhvprRP0jlH80aek4CGDi+IYnugGVxr92+9YmYp2K9329pk/hx4H+t0J1EqyNseBm1xlJGwy7ngoD6vAsiLRvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120907; c=relaxed/simple;
	bh=9HblN03S34AnqQye90gymdZFqengw3VNNi9YQTnoQFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7H72HUCzgHBv815816BrzCny6Gjt5rq5GA+jIuyDNxSO+35Td/cunfL9rfTsM4f5mfI1mdhi6RiMnrxc9PaM2l8wdnbDZYkxF43sW1zuyUxsSV+zFasRHwIwvUVQmM+n8VSaRcfqywK0CIKS7LwR/eBJl946AREc3u3evuo+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: dnC6y3nLQTKYPUx2/ACxCw==
X-CSE-MsgGUID: JhXdlNasQRyf3R3fFpUosA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2026 18:08:25 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.136])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6556A413EA85;
	Thu,  2 Apr 2026 18:08:17 +0900 (JST)
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
Subject: [PATCH v2 09/24] ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
Date: Thu,  2 Apr 2026 11:05:08 +0200
Message-ID: <20260402090524.9137-10-john.madieu.xa@bp.renesas.com>
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

RZ/G3E requires additional audmapp clock and reset lines for
Audio DMA-PP operation.

Add global audmacpp clock/reset management in rsnd_dma_probe()
using optional APIs to remain transparent to other platforms.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v2: New patch

 sound/soc/renesas/rcar/dma.c  | 14 ++++++++++++++
 sound/soc/renesas/rcar/rsnd.h |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 68c859897e68..0afe4636b005 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -864,6 +864,20 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	if (rsnd_is_gen4(priv))
 		goto audmapp_end;
 
+	/* for RZ/G3E */
+	priv->audmapp_rstc =
+		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
+	if (IS_ERR(priv->audmapp_rstc)) {
+		return dev_err_probe(dev, PTR_ERR(priv->audmapp_rstc),
+				     "failed to get audmapp reset\n");
+	}
+
+	priv->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
+	if (IS_ERR(priv->audmapp_clk)) {
+		return dev_err_probe(dev, PTR_ERR(priv->audmapp_clk),
+				     "failed to get audmapp clock\n");
+	}
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audmapp");
 	if (!res) {
 		dev_err(dev, "lack of audmapp in DT\n");
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 7c5eb575209c..4ff410a96336 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -623,6 +623,13 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
 struct rsnd_priv {
 
 	struct platform_device *pdev;
+
+	/*
+	 * below value will be filled on rsnd_dma_probe()
+	 */
+	struct clk *audmapp_clk;
+	struct reset_control *audmapp_rstc;
+
 	spinlock_t lock;
 	unsigned long flags;
 #define RSND_GEN_MASK	(0xF << 0)
-- 
2.25.1

