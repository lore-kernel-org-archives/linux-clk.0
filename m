Received: from mx1.bren.win (mx1.bren.win [51.81.56.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4DC23EA83;
	Sat, 17 Oct 2026 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.56.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792264226; cv=none; b=fqABI1zuHS0nec3T2TKAYc15qnkEudLfLfrgx2EHJMcTHo8oMnTaTxTUii/a3kC+4ZlL/K2bsOxhwGycNgi8u+r8jtXNa3ZcNCsR5izAqA4/oSe/NWW0Wx0RWganiO3mB5kaG6X7IDv9tkJpQsXSTqojIIPVOvG6D6zasgCv8Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792264226; c=relaxed/simple;
	bh=Djy41uqofoQIiPfaTR/WPLCuispKlr76tIFJoN03GgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ENGeDN+5/xw/UYxAjtrq+pTeSnqUsjW9JHSwQGAgRKVW9awhgErdMifL/14MRn8Bdf4R5COIdYwTUYdBIzAKch9BdYpmvc7X82bUcUufQJ87+tZaZ6kUF4a5TpwDwTQqEtA6qILnoQcUSCU8E2ZE4ynzPCGs7jMxJ1hJR2+/BcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bren.win; spf=pass smtp.mailfrom=bren.win; dkim=permerror (0-bit key) header.d=bren.win header.i=@bren.win header.b=6VSXbn9z; dkim=pass (2048-bit key) header.d=bren.win header.i=@bren.win header.b=b5Y2yPgI; arc=none smtp.client-ip=51.81.56.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bren.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bren.win
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=bren.win header.i=@bren.win header.b="6VSXbn9z";
	dkim=pass (2048-bit key) header.d=bren.win header.i=@bren.win header.b="b5Y2yPgI"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1792264070; bh=U6lrfKYxwRPk81meP9A1UQN
	vKzgaV9NKcjqP9C72Qg0=; b=6VSXbn9zmlKqPvyuha3tXjweH3xGw6uzee0+jvMNiV2Y5nqTiO
	Y9h7miJ3XTmx+fJFK+CW4dMoa8fQ5i8y5bBA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1792264070; bh=U6lrfKYxwRPk81meP9A1UQN
	vKzgaV9NKcjqP9C72Qg0=; b=b5Y2yPgImc3oIYV6sK50cp+LyuH+CUrY0FqqVqeMju4RoK4a3Z
	3q2A6hc6a/Ja39Xzhm9pcyuSQfa1DHvOSk4m8021AuF8tDv9RL9itTQkomXP7vsVKoh4tp4/eNq
	aiTUw65IBZ9DGGJ8fuzF1btorUIgKYHouMYBs+xjiM3dq5tMuWWvKVz0J/9D5o3yKmaGQ4ZQKHG
	7330HGO3SO+ZnXwGTqcAPk33c5jnK6Kxqnz8S/h6KlbFjHCXx+zX+7Ydi/fPu2CfNgeh5mss2l0
	91/lakndh+YicPVHIi5rC74odgL56QrF5UTulMkcru7j/g2os7ThyosOxGtLWH2bR5w==;
From: "Brendon C." <bren@bren.win>
To: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH] clk: mediatek: mt7981: feed MSDC from emmc_208m, not emmc_400m
Date: Sat, 17 Oct 2026 14:07:29 -0500
Message-ID: <20261017190729.1369302-1-bren@bren.win>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT7981B datasheet specifies the storage interface as "eMMC v4.5 @52
MHz 3.3V", MediaTek's SDK kernel parents CLK_INFRA_MSDC_CK from
emmc_208m, and both the SDK and U-Boot device trees hand the controller
CK_TOP_EMMC_208M as its "source" clock with max-frequency 52 MHz (52 =
208/4). Mainline parents the gate from emmc_400m instead. mtk-sd derives
its divider, the reported actual_clock and its data timeouts from that
source rate, so with a device tree asking for 26 MHz it programs CKDIV=4
and believes the bus runs at 25 MHz while the real bus clock is 13 MHz,
and every clock-derived timeout is sized for a bus twice as fast as the
real one.

On a GL.iNet GL-X3000 (Samsung 8GTF4R eMMC, 8-bit, 3.3 V, HS) this shows
up as msdc_track_cmd_data write data errors (host->error=0x4) on
roughly every 40 MB written, escalating under sustained multi-segment
writes to exhausted retries, "I/O error, dev mmcblk0", lost page writes
and a stopped f2fs overlay. Raw direct reads top out at 11 MB/s where
the vendor kernel reaches 23 MB/s on the same card.

With the correct parent the same device tree yields a real 26 MHz bus,
23 MB/s reads, and four rounds of a 1.4 GB mixed direct/buffered write
stress complete with zero retries and zero I/O errors, matching the
vendor firmware.

Signed-off-by: Brendon C. <bren@bren.win>
---
 drivers/clk/mediatek/clk-mt7981-infracfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7981-infracfg.c b/drivers/clk/mediatek/clk-mt7981-infracfg.c
index 68a102d..3d98bff 100644
--- a/drivers/clk/mediatek/clk-mt7981-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7981-infracfg.c
@@ -157,7 +157,7 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA1(CLK_INFRA_SPI1_HCK_CK, "infra_spi1_hck", "infra_66m_mck",
 		    14),
 	GATE_INFRA1(CLK_INFRA_FRTC_CK, "infra_frtc", "cb_rtc_32k", 15),
-	GATE_INFRA1(CLK_INFRA_MSDC_CK, "infra_msdc", "emmc_400m", 16),
+	GATE_INFRA1(CLK_INFRA_MSDC_CK, "infra_msdc", "emmc_208m", 16),
 	GATE_INFRA1(CLK_INFRA_MSDC_HCK_CK, "infra_msdc_hck", "emmc_208m", 17),
 	GATE_INFRA1(CLK_INFRA_MSDC_133M_CK, "infra_msdc_133m", "sysaxi", 18),
 	GATE_INFRA1(CLK_INFRA_MSDC_66M_CK, "infra_msdc_66m", "sysaxi", 19),

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0


