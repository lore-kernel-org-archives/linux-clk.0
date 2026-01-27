Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF62E9ED8;
	Tue, 27 Jan 2026 23:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557661; cv=none; b=V+3L6tHjZrtBLAkC3TcJBbFQKQqShGfgNPoJn46N7YJfx+blTXkitafiF+C5pZA42ziHPAIld0U4OpxV30bhaBQxhWKbUU8MVKiC4oe3eQEeE4zj+2NnCaJ+TtQOCGZdmmdXrw5hV0AQIiZC79D434dny52kwqKSlrxWtiS//X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557661; c=relaxed/simple;
	bh=q/u/XvKL68HmLo5r1RpDGCfqD4LAY62ICsaF9xos+gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G2uCjFCJyaur7WWWNrRMG7nvjNFX1s89E2557mz50+QLEPncbYkA5gcTI1SIVwPOizUcbyBXjY0eDQdEcvs1ZxmfmQXf67PKLhc9HoavkrtRB5QruIgP6BjMLyPqF2mOR7jihCRyj6DbV1W9a0JnTzmhf0ObTJ2ww/IWNgEqa2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=fXXKijDg; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="fXXKijDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1769557657; bh=q/u/XvKL68HmLo5r1RpDGCfqD4LAY62ICsaF9xos+gw=;
	h=From:Date:Subject:To:Cc;
	b=fXXKijDgKK18ydT0YumguA+J5t7LNz5e4baaNkn0fJgBJjhU44jUapTvlxtP4Vs/a
	 2/lUf8UgBpEY/2J7NFkl/Th/Op7JPy56CychATWLl91oWX/T2z6gmCEpvsiUCQMZPy
	 WD9SIAqvfTgBqlv9wlPBZXBz4R720vEqgW8hzFupUdZ+H9+5Wet7+pIlMnPWrOX2Xx
	 VgUuvedmX8cjhFCzqj0vVO/v5RSM1/9oArHq4yvSRR83hLBJp+mDF9hUbAV2BZN532
	 pnOZvMjqon+rKBkqcFRgT7UnZ4H1nKwkbRiWUdptC4pFbEuz6NSrTfQgbsdNKd6lG7
	 8ITM/hBjE3aCQ==
Received: from pliszka.localdomain (79.184.64.12.ipv4.supernova.orange.pl [79.184.64.12])
	by ms.puri.sm (Postfix) with ESMTPSA id 69A4F1FA50;
	Tue, 27 Jan 2026 15:47:35 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Wed, 28 Jan 2026 00:47:21 +0100
Subject: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQ6CMAyA4VchPdu4LQSJr2I8lK1II5vaqiEhv
 LuT43f4/xWMVdjg3Kyg/BWTR6nwhwbiROXGKKkaggud86FHyUufXxhNMM53DIlcbE+t59RBjZ7
 Koyz78HKtHsgYB6USp/9mlvKxYyZ7s8K2/QDoX+YSfwAAAA==
X-Change-ID: 20260128-imx8mq-csi-clk-2da0c4741ed6
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Anson Huang <anson.huang@nxp.com>
Cc: Bai Ping <ping.bai@nxp.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=q/u/XvKL68HmLo5r1RpDGCfqD4LAY62ICsaF9xos+gw=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpeU6WtyTpjZs6uJHcey9jsZGEaddvA6jQcQpof
 ncHAeKVEImJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaXlOlgAKCRDo8jXPO9vD
 /0p5EACJkHOwOGYB1sSTxHb2HgBICPP52RNTWB/yqyURlIj1TXcMDJm8RWld679wa7i3zt7N3LE
 G5pp2nZ3S4K51i79jluWMjGPbwjv22TTsXryMAdumb/+dn72QtlEBoJwu6bzIdA9tbLmDr/3eCh
 4+4sZdYK59LiPvykinFGU0hqeQkp1S7QMtHY7b108/kVRWrwC7JUkAsQPWcU5Il69Merh4uI/Qm
 6ER6/ktB0XyNA9f9bv0NLCIbv5bVQ1bm98h7IqV/7kNdcHnCM0R/DC5dldPCoBwMEkP1h9XsMNn
 MaxQ3eteKuGQAav83/tNKPJy0avIJJwqqDT1dYl/IIDnkWvu+MLTNzzxuAmAwcDDKxrVHppAPg4
 /GrMvGBljLuYdM+/+D1+Xfd9yUbgwSPrKAIJEZevoeFXYBn6t8u9rr7kQaA0W7zKnnIX3i4+l0u
 Q4fu7GRdi0xKSpFhVLLl28dIb02nYrmy1ZyLKVLMTV/hMp5NXlRNhyr9NNoHnumgCgsYgpVqrpD
 6hiczHO2NAyEVXKbI71RTyr/9c2KbZK1vHnSy5WG9ziSrJIJn4mwlPunzZszhTLx9sYY3gZL0rS
 b4Exnmu5aU4MFBeLJXi1ooCezBG/tEYxGHlYaziJVhNoaYzj5BtRaCmae4uOEaUd6tDUfs/nZIC
 CQix4jkVejlP5eQ==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

According to i.MX 8M Quad Reference Manual (Section 5.1.2 Table 5-1)
MIPI_CSI1_PHY_REF_CLK_ROOT and MIPI_CSI2_PHY_REF_CLK_ROOT have
SYSTEM_PLL2_DIV3 available as their second source, which corresponds
to sys2_pll_333m rather than sys2_pll_125m.

Fixes: b80522040cd3 ("clk: imx: Add clock driver for i.MX8MQ CCM")
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 drivers/clk/imx/clk-imx8mq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index f70ed231b92d..cedc8a02aa1f 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -237,7 +237,7 @@ static const char * const imx8mq_dsi_esc_sels[] = {"osc_25m", "sys2_pll_100m", "
 static const char * const imx8mq_csi1_core_sels[] = {"osc_25m", "sys1_pll_266m", "sys2_pll_250m", "sys1_pll_800m",
 					      "sys2_pll_1000m", "sys3_pll_out", "audio_pll2_out", "video_pll1_out", };
 
-static const char * const imx8mq_csi1_phy_sels[] = {"osc_25m", "sys2_pll_125m", "sys2_pll_100m", "sys1_pll_800m",
+static const char * const imx8mq_csi1_phy_sels[] = {"osc_25m", "sys2_pll_333m", "sys2_pll_100m", "sys1_pll_800m",
 					     "sys2_pll_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
 
 static const char * const imx8mq_csi1_esc_sels[] = {"osc_25m", "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_800m",
@@ -246,7 +246,7 @@ static const char * const imx8mq_csi1_esc_sels[] = {"osc_25m", "sys2_pll_100m",
 static const char * const imx8mq_csi2_core_sels[] = {"osc_25m", "sys1_pll_266m", "sys2_pll_250m", "sys1_pll_800m",
 					      "sys2_pll_1000m", "sys3_pll_out", "audio_pll2_out", "video_pll1_out", };
 
-static const char * const imx8mq_csi2_phy_sels[] = {"osc_25m", "sys2_pll_125m", "sys2_pll_100m", "sys1_pll_800m",
+static const char * const imx8mq_csi2_phy_sels[] = {"osc_25m", "sys2_pll_333m", "sys2_pll_100m", "sys1_pll_800m",
 					     "sys2_pll_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
 
 static const char * const imx8mq_csi2_esc_sels[] = {"osc_25m", "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_800m",

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-imx8mq-csi-clk-2da0c4741ed6

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

