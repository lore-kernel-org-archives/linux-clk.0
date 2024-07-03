Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D81741F3;
	Wed,  3 Jul 2024 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004154; cv=none; b=VOOwgmP7kMAyxRFQMvE4MpLwertmAX/M8odmlWXyzhpn6k3+ZN/EGcqFP8ii/Tz9j/MWcnaaBiBlR850X4tMFqBMR+8kQWkBLoFy1CEWD5541cdExkJgYhQ+KnDM1xvn46zAItmDfQTQPAx4zTMyAOvmF1guSyKGQCro7KANXug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004154; c=relaxed/simple;
	bh=heDiJEjs6mesX0rdDdgsOGMTO3hoayvu3dlC6Q77ZV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cu3JnQBae4uUHFMgPCmAyTYs5W1Y84VCWlIfYq5TwHQhtNBrsVMYL3pxO1rPMp+VcIf2BxvEWywRfQnM35k0vr5a1ucagnz27Ufglg9I/P7ARM5ZbK3lIn7KkPYUob+SyYrJkP8IGMtm/YvPmugmULQc1EZa9bRr29C3gYsidHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=uhlwT2lx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OFYVsEQ5; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="uhlwT2lx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OFYVsEQ5"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 55A801380622;
	Wed,  3 Jul 2024 06:55:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 03 Jul 2024 06:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720004152; x=
	1720090552; bh=gA0fk7RhzgXLr4ifn4kXARpTKlfF9h2FMMET8uXXhTY=; b=u
	hlwT2lxWgOsBmCLfjznDPDbhYpBbnW13YjsGi5umHKmzHQGi728sqbgS3PwC/shx
	ZBevGjRmfNWRo7SoiF26jfp2olhSFGiLz8/nf0RqBX45Ha8C6UfSELo9OCG9Ds8j
	6iqrsjIySUn/O2/f/+J7pInhsjhY9yZDvXtEvsyh2Acy8fy6WbToBz/kXbWrw/6m
	+OHWXF+i5v+xMj6V6EKcQAfsa7aQPvIxuqsx4pp94MmPwLxKv9rXIdiwXwCnG/7e
	yVyd/ucaXqBIJcOCEYxVsziFKbxEZXN46/UzMGwVBqEOrn1Jog+NW+v8g1UDysMT
	rtRyQ8ax+Ldh+ndROjIEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004152; x=
	1720090552; bh=gA0fk7RhzgXLr4ifn4kXARpTKlfF9h2FMMET8uXXhTY=; b=O
	FYVsEQ5sMeBOUBNuxZQgC2+4k9XYs+yHffjCHKKTVjc636eej9l+6BFLjau6d/il
	a82hZxu6s04X5XM2CNiHiuAaqVZmW34GCdaWjOKndr19TurvywP9FsyUY0qC/0S4
	vLcomiyN7bqoFZ/7wJN6c5CvUPdUO4hP6wdxREC21tPKDGCXCbm7kfPH3KhpLg4B
	YpTQGgVyxhFAbBwlxIQAfG0COmqc/7er7fDdd6vW3lHe8gousTvODbTUsrEIf3Tg
	9Vie9crUv8C3dykosLeZO5J2hzR02WFyeS/DCqHv6TtQMqYi8HxS0oof3NA4oMC4
	jLX4knRhL+LfvdFbnIObw==
X-ME-Sender: <xms:OC6FZjbpeR-dybxgpW1q-Y-qZ_kTTAaDHlMXHUByP17R_J1kdXbUXQ>
    <xme:OC6FZibsLAjMNxKGEB1leRjMnPAC_097D5l3JkBWK-vF1zZL38UD7fW9WelkY9l6a
    JbLFf9a83LNsBwehw>
X-ME-Received: <xmr:OC6FZl8Is3U1grIgDMYPkI29eA5tlYvrjaA5cDJXXfFrja7HonVI22fIZUOMUINaWNy0NbkuCI2R6FVg9GRB3L4P3KwA5K_phFWNfrMvydHVBNdV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
    hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
    htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
    heetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
    ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:OC6FZppWN1U47CKlzx5lvGx2tjpW05Y3oEn68EGC6LXzfs7gLb0WFQ>
    <xmx:OC6FZur_mZ77CmGze60LsU8xQiYBxodH-uqH7L3gDa_21f0VziO1uA>
    <xmx:OC6FZvTOHDx7XBOvRLYqSN9SEedQPh8X6nXL6FMIdSdLi8GmbIcuPw>
    <xmx:OC6FZmrnwE0nxuy93qmNpI-9OgO5pRZu1m0hJ5Yt9rdPuCPZtX6F_g>
    <xmx:OC6FZnbWmXHWV3M7uHp1iRgBO1FQnRN8uwp4tuODXI5qy2NkhHCufrmc>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:46 -0400 (EDT)
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
Subject: [PATCH v2 06/23] drm: sun4i: de3: add format enumeration function to engine
Date: Wed,  3 Jul 2024 22:50:56 +1200
Message-ID: <20240703105454.41254-7-ryan@testtoast.com>
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The DE3 display engine supports YUV formats in addition to RGB.

Add an optional format enumeration function to the engine.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sunxi_engine.h | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index ec8cf9b2bda41..98a78990fa870 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -120,6 +120,17 @@ struct sunxi_engine_ops {
 	 */
 	void (*mode_set)(struct sunxi_engine *engine,
 			 const struct drm_display_mode *mode);
+
+	/**
+	 * @get_supported_fmts
+	 *
+	 * This callback is used to enumerate all supported output
+	 * formats by the engine. They are used for bridge format
+	 * negotiation.
+	 *
+	 * This function is optional.
+	 */
+	u32 *(*get_supported_fmts)(struct sunxi_engine *engine, u32 *num);
 };
 
 /**
@@ -208,4 +219,22 @@ sunxi_engine_mode_set(struct sunxi_engine *engine,
 	if (engine->ops && engine->ops->mode_set)
 		engine->ops->mode_set(engine, mode);
 }
+
+/**
+ * sunxi_engine_get_supported_formats - Provide array of supported formats
+ * @engine:	pointer to the engine
+ * @num:	pointer to variable, which will hold number of formats
+ *
+ * This list can be used for format negotiation by bridge.
+ */
+static inline u32 *
+sunxi_engine_get_supported_formats(struct sunxi_engine *engine, u32 *num)
+{
+	if (engine->ops && engine->ops->get_supported_fmts)
+		return engine->ops->get_supported_fmts(engine, num);
+
+	*num = 0;
+
+	return NULL;
+}
 #endif /* _SUNXI_ENGINE_H_ */
-- 
2.45.2

