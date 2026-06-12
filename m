Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61743845AE;
	Fri, 12 Jun 2026 21:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301179; cv=none; b=Mu+KrRWCdKrMeRXB11YSgqWaOTz+ryRdgi0ni53+WRK48sblX6INI3GAFpegQguPse7/2ripmBk4ArQr6b3x5GNIcAQPqEEUaaC1il8p9KuLhknWRYBqoMGjFRdGmF3LyrmSB1txujpZk0za99yuOEvToW23mrgW9YvBQz+AYMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301179; c=relaxed/simple;
	bh=kgDpMZ/cqT/fELgesiyMYovAsnG4qpX9d9NHPHCCZx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMRZuYXHJ6pkfzzYVpTvmyHhlw7EU0xI+lCNoORfoi6b+OlSOgcjFtC03Piunqu7xrjxYH1xB53AojULJg26wVRCwMkxjYLzoBIHLAe9JIVM+/0WwH/vI3TY7r8y8qY87zQU/89Nj7v5vzTYPWO2BEfrStOhwXMVixjwzAkVzpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTPbg0tN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTPbg0tN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBA01F000E9;
	Fri, 12 Jun 2026 21:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301178;
	bh=tniivSBTBfHmSVBUMCG/poEjwuMIXoYdwTE1p96lgEs=;
	h=From:To:Cc:Subject:Date;
	b=XTPbg0tNroWotaCOdjMyiUYu7nMJ1wfEW1nerXr9C/omILHm+zRKuN0iuC/mFgE87
	 sriKxkrC1QF2sr4L7zVzz5MdmkkB10K/oMpDm57EI68j2BLa+NGxHauq+zUBxSdGju
	 odRHc8JOMmjRKiJlfTTo8U+UEXBy1J/CS31BRcYAadRHLHTLQC1qq/6AvxAL5ILOZX
	 /1vpribp1D4lCBDA2xfGaa0aJL0yOTnXxbrvFAgrPsvwT/EGGxSf9dXhUSmTtjNgZm
	 51wVvPGCA7l8R+bNdonDQimGXlOg/7eiaLiLGF6qOxsm/n90ZCYi4MSUINDvtlhROx
	 8cDokE2KpZpvg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: at91: Read "reg" with helper
Date: Fri, 12 Jun 2026 16:52:51 -0500
Message-ID: <20260612215251.1888345-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "reg" property is an address-sized DT cell property. The AT91
compat clock parser only uses a small bus id from it, but reading it
with the u8 helper does not match the property encoding.

Use of_property_read_reg() so the code goes through the helper for
"reg" properties, then keep the existing range check before passing
the bus id to the clock registration code.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/clk/at91/dt-compat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 5d543e807843..dad26dd5e71d 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -2,6 +2,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/at91_pmc.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -217,7 +218,7 @@ CLK_OF_DECLARE(of_sama5d4_clk_h32mx_setup, "atmel,sama5d4-clk-h32mx",
 static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 {
 	struct regmap *regmap_sfr;
-	u8 bus_id;
+	u64 bus_id;
 	const char *parent_names[2];
 	struct device_node *i2s_mux_np;
 	struct clk_hw *hw;
@@ -228,7 +229,7 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 		return;
 
 	for_each_child_of_node(np, i2s_mux_np) {
-		if (of_property_read_u8(i2s_mux_np, "reg", &bus_id))
+		if (of_property_read_reg(i2s_mux_np, 0, &bus_id, NULL))
 			continue;
 
 		if (bus_id > I2S_BUS_NR)
-- 
2.53.0

