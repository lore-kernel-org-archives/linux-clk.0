Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63B1428E4;
	Wed,  3 Jul 2024 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004206; cv=none; b=giykQ8zRwnTentbbFyuKPvTDNYELoDyIdZ4ER1PQD0bRL3nJekyi8gbUmdFO3d87Yion4a5k5Hk78zV1dquvdv3wcWtDMtgCv6zoRBDRa04hvExHlcMuihtY/ZFOb+LX5Cp3nEqnr9r8d7r1cta1VVWfHIHmbZH+E05YVm2atg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004206; c=relaxed/simple;
	bh=AU2a52mUjEdsCdRltbhCYdJmSoaw+MvJj+GUGDICYl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ufjzo671GBTNh80r2MTNLI4v/Ost3coOszScYKB9fKXNfLXiQH+DoOrfIUeaIXrdUSpNPlbF5h/j9WOH+g4hKe0phnxcIjcXwCc6dK7VJPo0gdArlGzCCny31A5A+gDH2yZLGU2bBRSrDrAPQNNane4sQC+lzbrXugLMA16gquA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=WfYbY2Rf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SYO3W6O9; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="WfYbY2Rf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SYO3W6O9"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 05800114031E;
	Wed,  3 Jul 2024 06:56:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 03 Jul 2024 06:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720004203; x=
	1720090603; bh=u7JdAqgGOvv2AISHssq4CRhDS9X48GQoVJ+VTUh1IMA=; b=W
	fYbY2RfkNTkzycyg+No8xnhMItCgEjYjzrdTRUvl/+3KOyfdloeJ9Vs4/siB9Ktk
	TB3p3zc8niaUgiRsgGmFHMJjSUFoOfSjK7DCrVwp6eVsLj66xS3S3dk3CztYNqJe
	XNkdAmpHsG6+Rxw+WPKbv+f3KVlXiORy3cQ0YFXqrKE76XQJqzB2L+UYlDz9wVME
	Qg5CYyM9gHWEUBUnPpJpSBvlGHB/c15mvTrAonAcToyyfhXR1OJUKhzaX8IWtZVE
	/9s1BESWgjfabAk8V9S8BT39PjECVT8lIEXIdvY2/0x/3iWfmDMkXjPCDrvsm66W
	pRR3+25bETswI6uqpUDnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004203; x=
	1720090603; bh=u7JdAqgGOvv2AISHssq4CRhDS9X48GQoVJ+VTUh1IMA=; b=S
	YO3W6O9KTd2vOPJDhYrsUWY4MdBgBRcTms8/rGlA0onds1eBDlxD+vpQQR2bytt2
	6FtGTHGzu22mtFdr4oXkZhV9dvC4m7oK/4fW6Ct9ItxchODU3S5k+I0MRh3QmLqN
	9NtHi9yGPoO9ooTAttKwRXMbG8uZ/0aMO9fuWfpDU/yJENAn+2s9MNbVIMryxUVk
	+kmD26cJi3XQCXCQVNqDYZq4kI2esTlmHisD164xqvzWqAzxDKZu/04Q5fv9ZjKX
	SAWKmqIiYoMm7Mq44oBIIn0gsPqa0X4Eps+q5H8yyYzqaLPgBq52vo4l/BOko8m0
	poEenc+stSDpwgriuoEOg==
X-ME-Sender: <xms:ai6FZhuaFkaQdDQajRSZAOMOzrttYTUvtENGU3YwXE_69URT-E6u4A>
    <xme:ai6FZqf77eirUW1SeNw2JYhZoauwLGsjFStdYCsdIaZVTsRyynH3slryYYUh4ympN
    dWkU4PUnwlkt-4qNg>
X-ME-Received: <xmr:ai6FZkyIwMRBvbOpmLuTDpf0m_mNuWM2SAeVIowEJkLEWZxEJrTRq4yTSg1jQCaF7F5cbAeN6YUS0ZfxoPievP4oY6Az8Npf8uqBc4EIDpIC4nod>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
    hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
    htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
    heetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprh
    ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:ai6FZoO8YZMFDpY-89knPhauiPTEgU4PG4_xeS7l-rBaAVwdeleN-g>
    <xmx:ai6FZh-6Ai-1eTh0J2iezebhaoRA-HESGVl3ksHyNKn1nZ_zyKJt_w>
    <xmx:ai6FZoW1225wOnRYhY_ryPb16UnLuXZr7bV8WYj3-F33IsVAUQI3gg>
    <xmx:ai6FZidZ27cbvXt5Syh7R_vbtD0KlaSWKNm8R0ffCQxaBHLpXjczMg>
    <xmx:ai6FZtvdYZpACGa1Hfxo4jmi_fjNcaWsXT9U9NtiQ1KNQMahyiPixGlV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:56:37 -0400 (EDT)
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
Subject: [PATCH v2 14/23] drm: sun4i: de2/de3: refactor mixer initialisation
Date: Wed,  3 Jul 2024 22:51:04 +1200
Message-ID: <20240703105454.41254-15-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the DE variant can be selected by enum, take the oppportunity
to factor out some common initialisation code to a separate function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

--
Changelog v1..v2:
- Combine base register allocation and initialisation in sun8i_mixer_init
- Whitespace fix
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 66 +++++++++++++++--------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 7874b68786eee..e634827e16487 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -404,6 +404,38 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 	return of_ep.id;
 }
 
+static void sun8i_mixer_init(struct sun8i_mixer *mixer)
+{
+	unsigned int base = sun8i_blender_base(mixer);
+	int plane_cnt, i;
+
+	/* Enable the mixer */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
+
+	/* Set background color to black */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	/*
+	 * Set fill color of bottom plane to black. Generally not needed
+	 * except when VI plane is at bottom (zpos = 0) and enabled.
+	 */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
+	for (i = 0; i < plane_cnt; i++)
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+}
+
 static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -412,8 +444,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun8i_mixer *mixer;
 	void __iomem *regs;
-	unsigned int base;
-	int plane_cnt;
 	int i, ret;
 
 	/*
@@ -517,8 +547,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-	base = sun8i_blender_base(mixer);
-
 	/* Reset registers and disable unused sub-engines */
 	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
@@ -534,7 +562,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
-	} else {
+	} else if (mixer->cfg->de_type == sun8i_mixer_de2) {
 		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -547,32 +575,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
 	}
 
-	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
-		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
-
-	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	/*
-	 * Set fill color of bottom plane to black. Generally not needed
-	 * except when VI plane is at bottom (zpos = 0) and enabled.
-	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
-	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_BLEND_MODE(base, i),
-			     SUN8I_MIXER_BLEND_MODE_DEF);
-
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
-
+	sun8i_mixer_init(mixer);
+	
 	return 0;
 
 err_disable_bus_clk:
-- 
2.45.2

