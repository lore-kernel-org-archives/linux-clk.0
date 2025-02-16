Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A860E1624C0;
	Sun, 16 Feb 2025 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696187; cv=none; b=rOKG3sENyOpKjIdFS3FX/2At2mqjLmj7x0k6iAyQ9nqxNuYz6R5hbRWzs0X4xn/TN7Nfi9LJpNp8Sympu8qTmWMFb4iz1gI8ikZEjkbkW99a6ATLJm+GVfcPDlh3wyQ3SvvHFqwzmXXRa9j+hOVtcxI1o2QmFPf70M7fHqJB/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696187; c=relaxed/simple;
	bh=mKQDC0iycCu5m9T3PtSfL2CE+zV2o52gW9fpH+YR4EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/pbymvLpP135dJ2HydUPXxfTZME2/j24bPmEzDztD+3jeaQGJsQ50TLgL9XwlgeGlsjg74J1FZBoaEj1RTY1+aOVMYalMYhk62QIJeTv4LYAovOIcG75hxG427SnvtrXNPjqd1/4Hav8+3TN2JnbDA/FY3x3op8jakfq2ehSfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=JFL7pzN4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=w1NjdJBN; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="JFL7pzN4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w1NjdJBN"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7AE6625400DB;
	Sun, 16 Feb 2025 03:56:24 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 03:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696184; x=
	1739782584; bh=cv3R3GZ5j7ybxKWdldciH+Bemda5Bt/xlY41lt6XoL4=; b=J
	FL7pzN4ArWXjFDBEVwJC2My+CkZP5MqSlTrvFN1gBfqoA1UG3AVwChZSu/dYXuZa
	iOVFJ7odV+Vv+Is43LLSNRp14GLmzLS4KgrEhkgppL0JMFKmg68GAhwxML671dYd
	pu5Pn4mrBxglXwvtLZv7j80lgYmfkgbGlEgktKX3pOC4XdSNedhCmUNmtp+SUFoc
	X2yk8SycYqZPu0WE0nflXnvXtVPkLS2rE6umExuCgdhV3mSQGg2+cr5qwYC6Jq7W
	ME4hvhL25zgGxHQfQFiTpsjmH8cT/g7cJBIPXzq71wNPRTFsM3zHF3+AiEsX1pzg
	17zp9bM5GawU/ERUEC1ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696184; x=1739782584; bh=c
	v3R3GZ5j7ybxKWdldciH+Bemda5Bt/xlY41lt6XoL4=; b=w1NjdJBNTC8y5hKBm
	dIfMXDGanRuAKSg1ogSWN3flEOW7+OP9i9jisrc8Y2WV1O79qIUvX4yy4ft4bB8g
	JDPhcF7AMzAJ466ygo8bHZaqlPTVKr2bMawLpAciN4+YauX0ccV+62CxxlqYaijt
	HmxPRjr5pEbhHHqO61j7tC3zFYd2GOh0z5dtYmjsECqVn28Aeh+kolO8y0ypHNeV
	zjq2N4w9qdzeufpjnPAEQ6YTYoMfYrZFaFzd2vOvqllxVEx+C4qqgMtjfdSy3Zk3
	KxmWE1aQDT90AoX50enh3Eiscy7iy0z5K0oYykzC0FhhIiCyyNhuZHB2ZpEOuHGb
	BQaqw==
X-ME-Sender: <xms:OKixZ0KRmGx9U4slJka_7NkY3ed-mqDRd3mdVlbDTMuQFLrlsAvXLg>
    <xme:OKixZ0JBRbyz6ky_2u8RvvkSdWLR0M4TDcGGxE3qzABS87mdICEdsdBwGU4yZC8O3
    _Lt9qpkP--gRgUq6w>
X-ME-Received: <xmr:OKixZ0ttVr45a1-tXcdzIDtfpg2LRS8Ysd_4pUd9RgZOFt7QWdd9Pt-nbGQHoGZqZcG9RJtfkEO-gSB_Cz6Kg00oWqGRb4JX_wI1quiup3Hh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:OKixZxZXBcEviSkLrNqLtLBmbp51u6ED0grXvR9wjXYr7H-pBL8Jgg>
    <xmx:OKixZ7acD5Rc3tAnGXWUEfcO_doESv70k8VVwguMvIrvpsaT0E_XAg>
    <xmx:OKixZ9DZH96MxkaKwV_ABsAfTA9krVLYs9v8cZ4_VvrApt_qT_GAmQ>
    <xmx:OKixZxYvns8AGqzGoOCXCtcSJZm3K573qvY70yvbn6gtaVmcU37gSA>
    <xmx:OKixZ_LQbE7vEnOPQrOXd9YiMOMBSaLBmpk7axmcdBLf8HUOETPJ43Hi>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:56:17 -0500 (EST)
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
Subject: [PATCH v6 06/27] drm: sun4i: de3: add format enumeration function to engine
Date: Sun, 16 Feb 2025 21:50:37 +1300
Message-ID: <20250216085432.6373-8-ryan@testtoast.com>
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The DE3 display engine supports YUV formats in addition to RGB.

Add an optional format enumeration function to the engine.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sunxi_engine.h | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index ec0c4932f15cf..c48cbc1aceb80 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -123,6 +123,17 @@ struct sunxi_engine_ops {
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
@@ -215,4 +226,22 @@ sunxi_engine_mode_set(struct sunxi_engine *engine,
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
2.48.1

