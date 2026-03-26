Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F50336883;
	Thu, 26 Mar 2026 05:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501854; cv=none; b=X9qUYRQjbihLXcQO3+02hV8mK0yFmHRvHaj7Ac+mo9IjH8IsHcKG0aiIYJrcppsnt/PEgMh+BL9w1InUZcZMc5JhTRmcXu8PUYAqobKEtHDsmAWeuaFT9FOtDesr6V2I4dnRISsb1MI+9qSwHyxHhyonFWI/cglAPeZPWXNUdds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501854; c=relaxed/simple;
	bh=k5E4d/WPb//He4xdWSS9UbRRyIhyYdKf/DoxrETBbJ8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPI6z8kbqPcGSB9IUNr0A3ij09utcEkYX7kXKqBIJMxcu5BC7FcqsPQm8d7Ylsx55wr1CdZmVrLaoBEPfyyEA/QSMbtW5/sMFCvildLA0TfIxHp1EzT7Yjsarr9J5icJG2en5W+AbKTMufZRIgdsh/sAy9VDSMT/RQtPgHHGatE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w5cza-000000006qv-0vim;
	Thu, 26 Mar 2026 05:10:50 +0000
Date: Thu, 26 Mar 2026 05:10:47 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Ikjoon Jang <ikjn@chromium.org>, Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] clk: mediatek: mt8192: use MUX_CLR_SET
Message-ID: <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774499536.git.daniel@makrotopia.org>

The mfg_pll_sel mux has neither a clock gate nor an update register,
and upd_ofs is stored as u32, so the -1 truncates to 0xFFFFFFFF.

While upd_shift being -1 (as s8) prevents the update path from
executing at runtime, the bogus upd_ofs value is still stored in the
struct.

Use MUX_CLR_SET to avoid passing sentinel values to wrongly-typed
fields.

Fixes: 710573dee31b4 ("clk: mediatek: Add MT8192 basic clocks support")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt8192.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 50b43807c60cf..6413619880483 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -579,8 +579,8 @@ static const struct mtk_mux top_mtk_muxes[] = {
 			     dsp7_parents, 0x050, 0x054, 0x058, 0, 3, 7, 0x004, 16),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
 			     mfg_ref_parents, 0x050, 0x054, 0x058, 16, 2, 23, 0x004, 18),
-	MUX_CLR_SET_UPD(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel",
-			mfg_pll_parents, 0x050, 0x054, 0x058, 18, 1, -1, -1),
+	MUX_CLR_SET(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel", mfg_pll_parents,
+		   0x050, 0x054, 0x058, 18, 1),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG_SEL, "camtg_sel",
 			     camtg_parents, 0x050, 0x054, 0x058, 24, 3, 31, 0x004, 19),
 	/* CLK_CFG_5 */
-- 
2.53.0
