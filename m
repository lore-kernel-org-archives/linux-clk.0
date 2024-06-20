Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E4F1AB912;
	Thu, 20 Jun 2024 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883238; cv=none; b=lYjkFTb4vqPFZ0tMLcDEFd6WGePTT7OnHXZ8bOcujToEuH4+gzAevDKXgVz2eY2s6XvUGVCywEg5MnMRQJY1zELtpWtT3cSlZ0tbABarOrGZNCrYGcHn1z85a4yONP0/dEwQi/F9fdfNNXoRW7rHgK0WhBrh/n7VgbncjvimeD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883238; c=relaxed/simple;
	bh=vXAPShGgYN7eBYfxLhceRlv2VMdfemXX+hsz915Kwqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmfFRA5QEzqYQ2RbFhrPQm39E+528t9theTA2n+6bBzW4/qKWR6la3OMWU2q+hGrG4jDHsHyug22UzoTC4SsoRHOALyfgBCQ5AEuHSkrQU//2rpDb2hGQwRW8htCd4p0TF3uDrzUNIC9W+AYnQk8IIz56tv6P+lCaFrvsfxOibs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=QLMGPBcK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mDFVYOer; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="QLMGPBcK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mDFVYOer"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 91C2B1140275;
	Thu, 20 Jun 2024 07:33:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 20 Jun 2024 07:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883236; x=
	1718969636; bh=zAFJQHsCA6T/KnG6k6AwcsnCn0bPOeW7iUnBKgovQvA=; b=Q
	LMGPBcKeEXu5hFdSF2cqztKrSIHmFMLpZTgwDuESPrtEnJ6ykrx4WxgJHtXF7FsU
	MA9OBD9fYPpPCHorHKYT6Hb1YJFmeqmKSjqYdPKbsZOitqydv3jqNh2N2himamcd
	AuSywgVkDD2dSKjHfUuNxBc7zFGM92CORFaiQqTf6wVZ601Jlb+XDiRtRF3JjQGD
	jCrTu8G8E3RUD+E/VBR6eCDX5M/NqCVVmuJx1fsxZn1YiuqUwjLpMXNwrwJgfvUX
	J+grWlJXOoQIu+HD0BEgOlVw+C99CuZXhl4D3rw5orUQ1OsAL1dhRh3RDc3sxRT5
	QQSGF0srTro5CuR6vILlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883236; x=
	1718969636; bh=zAFJQHsCA6T/KnG6k6AwcsnCn0bPOeW7iUnBKgovQvA=; b=m
	DFVYOerzHA1+oK7g14vVRCGtty0/K+VfF+PgJCzEclvcONncDC3WbxEJpeWdb8aG
	TwB3l8SNI6lJyWPkPszD6R+iUKiOoNrCWdAmToQtl7kcce9zrxSi/VrIg3T+TROd
	tKvqAzTkM5AnOGT+HmmIgDyCPakm+NnJlso2G03ikJnFsqadYaWiuq4vrTh6gaiz
	V5+ltPetLrykbJaBPQbE+a5f2KteC/1xqdpmDsd0EXrW8yXWSTFyvP5Erzuwm2nS
	XGyvs6ZyiaHohi8sYQ8xNHFbn8rTIipgOeDj6ekT65ywm+rPMm8UrwU0Jkg5DME3
	efq7qy3jtVjXrdcdbISYQ==
X-ME-Sender: <xms:pBN0ZqLA-BGzLxOR7EZrKV2jBeI3Kt_582t56bdr_4tWZQWY0gr3WA>
    <xme:pBN0ZiKtSX2wA2b495ohbcpbTroPT2QnFDl2RwEEkZG3G4YRxKcO7qbw5yOOkSdcE
    3-JPuY0fTQ77HrVCg>
X-ME-Received: <xmr:pBN0Zqubo5jN4L2b4hWXh4yanPuxsDtZ8QM-DgDbqbQarI6zrDIgR9GDkTG1cCbH-RXEArQN228VVOJ4oEUAiKYHSWQTUokSsb1y9Fi0Zu5G0_6f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:pBN0ZvZVDAxOi_Jd6QdfYABdVnbJGNCNCk1o6lvc3jwPPAjbStvxyg>
    <xmx:pBN0ZhZihwUw1QClm2oBeKzPJp0ravEP-kVj7Clys-uvKDACm5NrSw>
    <xmx:pBN0ZrAj8_1zGJkXwi5ZA4vaIS2-31pPm0qhrdMnlYU0CS-dVAZtlA>
    <xmx:pBN0Znbjc4sM_cGthMzmmjH1vt2-q7485kDiHEDSgwsFjViDPa2JuA>
    <xmx:pBN0ZuLTVDNmnTVYFeSufGOUWW592aGq0RDhX6SrTnyzb3XqX9rbDueX>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:33:51 -0400 (EDT)
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
	John Watts <contact@jookia.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 19/23] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Date: Thu, 20 Jun 2024 23:29:57 +1200
Message-ID: <20240620113150.83466-20-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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

The DE33 in the H616 has mixer0, mixer1 and writeback units. The clocks
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
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index b0b8dba239aec..36b9eadb80bb5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
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
@@ -290,6 +301,16 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 			"Couldn't deassert reset control: %d\n", ret);
 		goto err_disable_mod_clk;
 	}
+ 
+	/*
+	 * The DE33 requires these additional (unknown) registers set
+	 * during initialisation.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun50i-h616-de33-clk")) {
+		writel(0, reg + 0x24);
+		writel(0x0000A980, reg + 0x28);
+	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
 	if (ret)
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
2.45.2

