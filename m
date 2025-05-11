Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AD419CC1C;
	Sun, 11 May 2025 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746960147; cv=none; b=PWz729q9OI56ZGIjQrUWvp2bJO1H0NSXJTL00tNEaqSLWMYNfalBXuLWVZe4tf/ClQ80jYBoQKAcQtgrB8JF4K4cj54Yuq4aq7MZJ+VxsdTTBFvoXiqeQ9oS6Yiopx+5Sbpr4SHjSwhGKbBfKU4ozdoEbr52S3+299SYxf8qSQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746960147; c=relaxed/simple;
	bh=u9yAWs8ly8btJaiCo4QjqbOAzx6QSoSWO6DC/WG9o0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uY8OqYqRDchTP3x1ojGnOmDpUQLaz4EsxA1j+z2/vBhe5xrD9HwkOTaTMLeE47Qw6wW3oDmiBFX318/ax9yjd0fcmz8Svk9VQtJmCxQcgA5nWZzrSpaZw+BbfnRLBmy7WGGIlYqzEUC1nfvkgC7g+mTlmOBhMRU7PKlWspPgypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=M01oXFiW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K94EJKWR; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="M01oXFiW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K94EJKWR"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AE1E825400E7;
	Sun, 11 May 2025 06:42:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 11 May 2025 06:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1746960144; x=
	1747046544; bh=PzEHIm4bKoKdzYX8Q4jvAynfM+lt7x+AAPrVUNXnDqs=; b=M
	01oXFiWYsYtfeBr7BJvTKnn/T71GaoaN2NdpOp6a3yjxoJnOL4u0nNZpkOYDcPG/
	kklCscVmrypvdgRzg6H59z9Epn8JGofpGBFLJIurKr+yNcqiI3ymVamtFezM91+r
	jJ8aw9xz/wRRreAoXa8EsvVunT7GdgCjCAtNIAuZeMB8CrVvYyqqH3XEu0NuZ2lZ
	Yzw3zYrOsCbtGaZkJzwYu3jzI7KeCIrhXHH0yuTM45nbKJMgWphh8GDWpyd+UQFp
	c4wqoZVN0bLFkENfPegIx8b3vx6k40HxAPx2PfCtmZCcJa1pB+E9Fc4qo6NYZj1T
	mDdxClhxcc5t4gig0BvGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746960144; x=1747046544; bh=P
	zEHIm4bKoKdzYX8Q4jvAynfM+lt7x+AAPrVUNXnDqs=; b=K94EJKWRKSP8vLuh9
	9EbxD/NZUiOjTRsLgZyhKLMEkMdYbG/m2AzyzNkIBQA5zPP0mjSJtmqDBAzNtcC2
	ftF1+twBQk7FEIa1shFmx5rdTLFi5F69PuWnJ5GvTpM9hUa4qiJkschVRK9r3QuY
	65498HsJ9mjbC8Qnagg6UJ8Hsogq8/AURgbK8TYg6nRc9ej35nd2SjdkRkFdSIU+
	PDSoMHICZSfcQz4zaCk35a2GUijlbUecdyvHLUv0yJ2HqV0mSrfmJR1rNs7u0xiF
	FoCHj7OUxlDx4F3TD85ofrUzbzVhSJ4r94UzfcGxA7cpw/JrkEE5Axzwm4OWhNT/
	ti53Q==
X-ME-Sender: <xms:EH8gaFdBFI_Hsh1iHHkWBQRr9CyyYtWtJzUieXuZkJUPuwUhdi0cyg>
    <xme:EH8gaDMYfhSF8O4BxzREku4Rit62ftqY3z5cRchd3KmijRqmFVaW_wmtZi4w1DpYv
    JN3x-_WBT5oZ__2ZQ>
X-ME-Received: <xmr:EH8gaOh30oPmhnY8uJrkzvojQR-PZE5yQ0QgV_-MJPqPbb89U6xPqrH9nbZz_0loV-G50vTorfaNDEOkp0eTZBdDZ8t9g7-669v0i-hpV9QI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:EH8gaO_pGjeGluCadeq4mwBrUBeDY9NHfEX2-X4UxyVLU8XmwaGOIg>
    <xmx:EH8gaBsZOss57lMLGBWSxHLPyczU8fp3ZStPxabyYbL64x1rYJ0fNg>
    <xmx:EH8gaNGOFcoJJVXP-jasAMBYgmu0-24an2DsbZqKoUGworDO_Tm-fQ>
    <xmx:EH8gaIMmx8JM9ty1Owx0bw1skZrWBBfQYdo1SgTJErvV5ORac0MWiA>
    <xmx:EH8gaHlpcAdwQVjorRSopjds-sujxB-34g2rITDBJbjZ2HJ4cMy_maBB>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:42:17 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v10 08/11] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Date: Sun, 11 May 2025 22:31:17 +1200
Message-ID: <20250511104042.24249-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

The DE33 in the H616 has mixer0 and writeback units. The clocks
and resets required are identical to the H3 and H5 respectively, so use
those existing structs for the H616 description.

There are two additional 32-bit registers (at offsets 0x24 and 0x28)
which require clearing and setting respectively to bring up the
hardware. The function of these registers is currently unknown, and the
values are taken from the out-of-tree driver.

Add the required clock description struct and compatible string to the
DE2 driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v2..v3:
- Lowercase hex value

Changelog v2..v3:
- Correct #include for writel()

Changelog v4..v5:
- Whitespace fix
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index f2aa71206bc2..a6cd0f988859 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -239,6 +240,16 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
+	.ccu_clks	= sun8i_de2_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
+
+	.hw_clks	= &sun8i_h3_de2_hw_clks,
+
+	.resets		= sun50i_h5_de2_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -291,6 +302,16 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		goto err_disable_mod_clk;
 	}
 
+	/*
+	 * The DE33 requires these additional (unknown) registers set
+	 * during initialisation.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun50i-h616-de33-clk")) {
+		writel(0, reg + 0x24);
+		writel(0x0000a980, reg + 0x28);
+	}
+
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
 	if (ret)
 		goto err_assert_reset;
@@ -335,6 +356,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.compatible = "allwinner,sun50i-h6-de3-clk",
 		.data = &sun50i_h5_de2_clk_desc,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-clk",
+		.data = &sun50i_h616_de33_clk_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_de2_clk_ids);
-- 
2.49.0

