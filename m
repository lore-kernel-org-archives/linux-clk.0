Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB151632DA;
	Sun, 16 Feb 2025 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696319; cv=none; b=qE08uT4i9VMi0uHxfEX2NEpTibK6QcjzfYnyZU3I4XluQ18zuoEHYwiuB6V9k4G3pCa6Ais3GNYB5D9Nsw1HortEXMz51iTymk/6PuckafAobIMmsMNG29b7hxlcYDrPCuyorgOu9TAUCVmVllUXl7qcndq2OJcJrL7k+6BWFhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696319; c=relaxed/simple;
	bh=YANJjXJrDkAnZMQ65C65OOP+gY38Q+Hekj0ZV50V5WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSzrUDpoG78/ea9kC/tPqJun0bBOZPLrXTPlUzIjUmeuAxktIsVE4CFIzpRVRSgC2yB7FcII48eCNSyGvCJAXdDdtBIE1aGXJWhxpXmSdP6b3V0CsiZ1/HaBlJVwjISiINKcX6RTMTxBRJjzNd8lmbHRhjw7HWaR8jZ4xIfXIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=YAXxDaUH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p4gk55Kr; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="YAXxDaUH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p4gk55Kr"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.stl.internal (Postfix) with ESMTP id D7F931140136;
	Sun, 16 Feb 2025 03:58:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Sun, 16 Feb 2025 03:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696316; x=
	1739782716; bh=OtGWG9y1AsSlSEynEhNVYtoJVgdMgxP49x1/jztGSxA=; b=Y
	AXxDaUHm1J2tHAXJlvAdyfHbIRnCS1Sf2WExvCmvjtN9mHDa/wJO+flPwCiTj6zi
	73mZrqG5mDX7kjYGipAD444VFlXktADjg7Tu/jj57BhaafIsBcaMdYF5MDbLLFK6
	qS0/L02j20/FJstwUIMOyQE+jvj8FCjApaQ/IGgcMrTlVEV64FCI2rHN3SLkP7io
	ek2UifP7Cpj7ITD/iF6lzZtXhKLutXMn3KtJX3CGNreWjSRRshxX6KEbKvYjvk1R
	MoBE7jXqhqXaNMA2AUdgcoftT9HQA5nXj0zjWPmdDwyP7BaEpdF0EZZkVSoxKG5K
	v6neYFvUG6zYoyxKuhTIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696316; x=1739782716; bh=O
	tGWG9y1AsSlSEynEhNVYtoJVgdMgxP49x1/jztGSxA=; b=p4gk55KrPydCCLHe4
	OPF4UQmTkeLMuHQtIZMzp8A3sZFzk+DiXNOVRFY8XrLiTpooOHxbiW84Km7muZFf
	VTtprku3PGwxplbwwpsgsMmspNDJbmdYvkJnyVHu6XUxmupbHiasMTJh3AxFueI+
	wCVaUdt2jrirgHyDNHS8YwZYFP9Qy+8Bl8X0im0+DoOYl73ptY4H++UBvmQfITvj
	aoQtuC7YM56pFDUYoqxHCb79SvtIHbKPI1snyj7vmquW7js9qkgVGdfWgitFgik4
	CpqgWH9dBRURZqAcxBOPe/LF53HXzDSBixU7cxBGPOJbvX8x0iiYH9vWte4P35Ce
	J8TqQ==
X-ME-Sender: <xms:vKixZ0F-05NVOxsviSuo-IMifP0U3UNSz8tFDwv1GJDh2sv4-GTkYQ>
    <xme:vKixZ9VDXf4BHuiYUQe5xAMRs-v-pQH1Pcw2idT2sHoy7Inw56oQHZS5Mq6NpKHma
    8hIW5y4GqEyMwBSSg>
X-ME-Received: <xmr:vKixZ-KXY06jX_SfsdDKJCI_EnoyMGFG9Zj9hfT7ege2WGBMysdGYg8JrdeUXexDkyK-M3qhhNWOOGJI22Yt1itXgNZqC4eamwKuSdlhTIHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:vKixZ2EjGCChKtpdSUWgvZb7PfRNDFeDN8jQ3NUUG0oMfjVwitHqFA>
    <xmx:vKixZ6X6v1Gz5JVDprXBRVBF0N3KAgXX45YHcxydhW0yfgYLAF-z1g>
    <xmx:vKixZ5OS8PCAQMQ4NzMvNsMP1LiJQgJKgp8GQSaNV2JU6KJqE_A_CQ>
    <xmx:vKixZx0MQMbT0fRQpvAIFIJSg0w7idSK9lqvIqcwTFQdobga9oR1Mw>
    <xmx:vKixZwkTLoAAGKshRu18mRaq4nMHn72wBcU0oHfG0kbV631Bs95Ts3_s>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:30 -0500 (EST)
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
Subject: [PATCH v6 23/27] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Date: Sun, 16 Feb 2025 21:50:54 +1300
Message-ID: <20250216085432.6373-25-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
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
index f2aa71206bc20..a6cd0f988859d 100644
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
2.48.1

