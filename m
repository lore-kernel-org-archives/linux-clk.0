Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671EE2248A6;
	Mon, 10 Mar 2025 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598710; cv=none; b=rvKJFp/8euCsf8rJZuP5sjcsTlL6HoGNdOc2EMzsCQOjhW/obANefhkHz6DCSOhWHn91TCYeSsB7Nfo8RvD2JGf4iw0yT7SfMXvKXbztQeb4K5iuj3Fk++J3ujLPgrAs61U7+tJq2hSlAB+GJ0C7ltubrk0XgY92/BqMWK8gQUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598710; c=relaxed/simple;
	bh=tfVFIp62p/4b8T0ibnoTlMczwDDXamFdITs9pPn8hBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A71dZZCjiXDfVJM05VyX+1tM4QAK98K3c7jRcF/dii1deKbfZDLqFah4X8Ac5z5T9XDlpCp+DTvrJLnzpM8NogKreE4QOibSHLBOTBhM/YcggxQq0MncV3QKkYECmON6NZZmplFpZDwCVk8hlmHqsUpvX/gt52ZA12SXckgQ4hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=GR0FZEb8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bC1eSN4h; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="GR0FZEb8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bC1eSN4h"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BD7D11140084;
	Mon, 10 Mar 2025 05:25:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 10 Mar 2025 05:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598707; x=
	1741685107; bh=cPPTy+0iWfaYlDx7HqILpP4oKeQvNz4sCg/RB16EhdE=; b=G
	R0FZEb8csgNjD0O/cqG/gGThQOOSkgmJ3eu4KSRdKxOFr+8HsPqswa6oN1oun2WO
	4nOfr9D9dD6QTj4MwfFy/9XvAlTA+/a0MTP0cItj0cSa4rudQhJ+o8HemWIQgt6t
	zMyNIoZITdXWQ+J0BCYbarS5w8wu8E4UH/pChoBAEpMWnqVa0CQSr6cKm4zWIJyT
	+NLZgzjS7cgCn8ZmBLWWmc2LzTgezf4zRSHAh4pOJNj5FboPubmWDQwjH8rcViDj
	SoKBGhRR+iW+5LGUpYlKx+1XFOXOKnGCcynlXYHqd2EiKjBHZcKradv9R5DUJs8X
	qC1FB6KY0u4czkZu94JiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598707; x=1741685107; bh=c
	PPTy+0iWfaYlDx7HqILpP4oKeQvNz4sCg/RB16EhdE=; b=bC1eSN4hbFqyJ34PS
	I4LtsviGeoxSWvwCBlhMCutyJVU84r+3KU8Ps30Mije6mKby+FqQ5iiDsck+NaQ+
	4yPZjd+xKPiNC2FNk4O1lwpYv8H/rQuzq0hV6tOSqrDn15Qw+zVYGW4dwRrILhtP
	FovObV7bHtjdpUGmKBfQSCWxxsfqKiOJHkhcdOTwntcxBoI4QYCiNxUyIEooNI5Y
	Adv3Ck8O/VcOlwe4Os2AYEMpXCDwP8CwrjfcJ5CVSFPMvMZxkwpfyWuQmdAKRZ1s
	p1e6zqpERK/bx0b4v+NwIgbMJJGZHrQix+mBEufFfxVPOOS8HP211sycawQcFxw/
	mWuQA==
X-ME-Sender: <xms:86_OZ04laycDel5Y_RSf_WmRQWxOGhQ1mvwCjw0GNtOBRXsi-s7Btw>
    <xme:86_OZ14SAVz3Ask7RzwJQr6zzADS7t03s9sUhsBRg2_UvoArCsvpebKtriKmGTwe5
    UF2rwv8Vqi3TmSlzg>
X-ME-Received: <xmr:86_OZzee_YxbDeFV5lqVhD22K5gtUSH7IVDZ8x7q7MFL4B_NqecxfiaPdFXGR5Yht2yISyguh8_x3vMO2l80l7yRKZKwKWC-f02AjjMB5xtK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeefnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:86_OZ5IzubX9NdwQewP8obHB0qeEF2OqknXcNhFmhEQwvL-qnppXsg>
    <xmx:86_OZ4LlCydeNXwRWE0STsxi9ymlEfhNS9ol2YncqMEkgJ7U0b5K8g>
    <xmx:86_OZ6wgAiGMxVs0_PuAdh-pVUMS0Zq75wnCn5uqz-cItfNqx9VnPg>
    <xmx:86_OZ8ICcLC8x9D2s7WiB0juAMsaO_EPminKDh4KwIYLsyetJlSoUg>
    <xmx:86_OZ97n-gIlvicRakSTfr-6THSZa_hw_xqLsg0Ambsx6JqAVbsrIU8P>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:25:00 -0400 (EDT)
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
Subject: [PATCH v8 08/11] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Date: Mon, 10 Mar 2025 22:09:54 +1300
Message-ID: <20250310092345.31708-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
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
2.48.1

