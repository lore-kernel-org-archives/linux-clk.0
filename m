Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B40763F7;
	Thu, 20 Jun 2024 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883166; cv=none; b=FhpOPU19sOdMc/wLagebOq1QqDxqy2fA+K9ihBqTXDCmnA5FGxCSgzK+T+R1i+WAeeKaxU3zwlsKByRZ/1GiBI86GTkDMfU3Ph6vmXkuGYhMrrdgvIaXzLo646JnnKdPsIAX9C3OnnMEbJJ3ys0yMpXCq2lzMMAcqlVYWjNGElM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883166; c=relaxed/simple;
	bh=heDiJEjs6mesX0rdDdgsOGMTO3hoayvu3dlC6Q77ZV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3jPTKlnIDsRWevGOGAK4jwDvZ1vhRQ4XaS1muI5Aion4tiqd6elUW7tLCSSNhhk9pBwdK3+rECH5DU2xtbfE+6lS82kFh5YXrPCg9LjHz3C1MFuX+x4Nx+4UvghWHPqBTHhM0lur0m19HHQ+KdzBo/s6X4bXrwrM6PqOIvHQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=BllAtnk0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=adzNlids; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="BllAtnk0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="adzNlids"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id EA0781140246;
	Thu, 20 Jun 2024 07:32:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 20 Jun 2024 07:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883162; x=
	1718969562; bh=gA0fk7RhzgXLr4ifn4kXARpTKlfF9h2FMMET8uXXhTY=; b=B
	llAtnk0iFgCo7C/jf2sV+Y27WpDcg1hc++zIAaQnzLR81VWVJrya0u1Q82ZSbF/Z
	zDwuGTt89Xr40q+AGDOebYj7GJ+qlFZA2TNQUcpGHKaUSjxh972rh1hgTkiSDVWC
	lnuFUvBJjrdjhUl9W64rwpt/SShuzvm92IvhWhkf69Xl+oHbhLtEuAMJ60GfH1ZO
	c81KA2BNnYqx0fJp9svsaeesMf5dEDvsD4/4hmuvfJdc/bZV9K3eBCxBHKZ9jCMu
	uVsIc9yx9leDmYSu1p+Gv4jJeRGSGKIlx4Bq5wTlTRaKZLxTGSa4saQHQjUc8Iyz
	GpFY+yOpK7QSGo7sS1C5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883162; x=
	1718969562; bh=gA0fk7RhzgXLr4ifn4kXARpTKlfF9h2FMMET8uXXhTY=; b=a
	dzNlidsrnu04puZulLChFbEZsyquBaKzIfaWsZ0xWJnYU7eq+NpdM8O9SAJWzW78
	doK+SQCF/E7XroZEiEkFn4rzd02JK1Fihx4jmy131Y1dfGd1vYOjur+APm2lHNAB
	iGwOaT4oIZ4gu92liOmakaTSvA8Xij47hf/d9XxFnIaKKLGVv3qqC89owmfumjbD
	W45r2CLrBQicndRKzH5cEKwjgoLVusISnDVy3BrjwH86u6MjD4lme3ROsy11yLSG
	SdRpyvt+SaAAmteBmh2mzdGkUFOGsV3U0ibe7pAtJJL3wVe/yetrbenhR5/ewRVT
	XiaQf8k4b1i5CE2HN2JSg==
X-ME-Sender: <xms:WhN0ZonmcR9qypKdkuEZZMjbzvbee8NskRNjm-TIfQllskYr8mIIUw>
    <xme:WhN0Zn1a4FQ6E09ACcgQs7IcufJ-M7ylEwXhmu_q84hAQep59a-_NId3GQLUAYNMk
    z9yhv_578jlhVOFNA>
X-ME-Received: <xmr:WhN0Zmotb32mJ1ZMehY2OMLoyjrdtlWNcbvEHpUZeEwHJmQQfAlzhQN8Qn5B_mpc-BkXCw4tqR6t-RwV6szJkFK1IISXhLiWTIqu8TUxTOfNcpoH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:WhN0Zkn-vln_qXY6eKbSDjyi2ixTlKeQmPaKKFCuXt8OOAcIRfZoag>
    <xmx:WhN0Zm2fV8SOS1gmfTHzzpWJNNin2KWeMZKivgScXf2ZgEKnJxJMJw>
    <xmx:WhN0Zrtr7VFefMAO8-pLM3Bb8cK-iKHUY_oFacyjxOXJ-s5sWKTdog>
    <xmx:WhN0ZiVy4h1dANw14Kt4y6Bd_mkqbfNshajRRUgTIaUH6WWuZKDDEw>
    <xmx:WhN0Zkn5MdHdGYm5HmMLgKIqx9juYfLhx5ik79X1Bou64H-qiHHojOsI>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:32:37 -0400 (EDT)
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
Subject: [PATCH 06/23] drm: sun4i: de3: add format enumeration function to engine
Date: Thu, 20 Jun 2024 23:29:44 +1200
Message-ID: <20240620113150.83466-7-ryan@testtoast.com>
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

