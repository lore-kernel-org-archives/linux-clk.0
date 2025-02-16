Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D401632DA;
	Sun, 16 Feb 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696272; cv=none; b=SPidM+iQDl2prRuNVGl0i53OenAiGkuUtFjiEuAKstGP1x/Co+U11ZKhY2892zdRaUvyN0mvSP+VUGWwlgEcBQJgQccCIuQqh7+9RcTCmg6azMtOFIa4jlp72aqU7OmizcbHqteWOGTF+lQ+wBcmd13Zwzj2wgQrzwSCt/AQrpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696272; c=relaxed/simple;
	bh=uzgXJJMEaruw9VJ7FltBzG7mE6vBjD2r0bOVD1fXLv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfIL43JUi5pMZNjqOudSgXzdte7ObUJD/QcZ2c2s6hehSPPXQWrMUPEN9TUf3bxHgjeph/mA/LvPsVM9TzMAD68MP/jx8NAliLUmg/AR4lAF4FK7K9WiluS3OCs3GVDN1+yUUMCBQbtOjv8ROEp4x5jBSetMgIMOPxY3zPUGSbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=U8qY5pFD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kP5lt/Tg; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="U8qY5pFD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kP5lt/Tg"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A37B525400DB;
	Sun, 16 Feb 2025 03:57:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 16 Feb 2025 03:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696269; x=
	1739782669; bh=hVbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=U
	8qY5pFD4WOPJYBWIxAs5lHDtuuJNBxP0uAA1VDwyb5+OfezqaTQ2f/wwvN8/AJhW
	XTInR+kG1tTVQQ6gVzNuCaF8Mw4SSE7OHyobIOMWD53654AO1Elx/FsCS1ZXnezF
	izKL1jjhb6lwwksi8XfchtOO2ShVlSdw178kxhUseLK//L/TYAEuJs0DtkdLFgbb
	jUEHRrQP8eCPTpR1e0GedGumA5rch+1gNMuECtlo+5psf4JA31vKT+0cgGYo2rH+
	IKSMh4P//917PJ8Vj+ub7g7rRTeMq85CKVmoM004Kv6ai2APvRB7w25T8YzpuYUE
	pMKWWGG43q/tb8xHKoyUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696269; x=1739782669; bh=h
	Vbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=kP5lt/TgaN5MF6+rt
	tv9ioyhqfeNp9MID4xAAeSYaR9a8ZqMSjBslSdk5ur3SVyMPKHlx7alcfhlKIEt4
	MSwMlF77ifz4tAwL+oZhS2NilDAGdG5v6j3wNPkVYAM6nufHz6w7tVeXcjiZLosS
	bqx+zMkTynT3G7jHg+lvgdzzhXrU0GFg6lmrYFDvw0RbLYMaqoRrtrhyOfyetol6
	ijI2WRzEXVMC2B1HTUbnbib0pocVXOkME6ZJwB6k8cc7hxV+6KjLgvyOiee/kzIM
	kIZW3g4NkakcP8dOCrNYqTeLhxSctPS8bk2EqCK2VfF+0DgyZD3AxlSGX4rhrDcl
	GWAnw==
X-ME-Sender: <xms:jaixZ1IEKv9WevpFpC_oShQ4WItojSJn8NWJ-cYQIJk52InqlXg9XA>
    <xme:jaixZxKfU8R6nhl1oQyrOQ_AarVLiP0zYdrJwJblUoA7AbJeA1Ob_HlXGtVZOjtmJ
    kTYyz_Yh6aKuwq3ow>
X-ME-Received: <xmr:jaixZ9s-ffDDyEl9Z7cZzd4x_vcQPYw5wUJQoVUfvqIOv6GUNuAERlJRyiPehNioNyWCSilwN3ySZ3brBRUqLmTygeVg9eb-fO82wlNmNyr->
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
X-ME-Proxy: <xmx:jaixZ2bxkwziwoYYPCeKMNXFeHuZl19tkvJLLGN8DC-uOuKcI5rzgg>
    <xmx:jaixZ8YwK4B6jQJJI9UcGi4QGqLq8PxANI7unN1D9n52bZykldb11g>
    <xmx:jaixZ6BEpIv9ebaQxKZJUl-kSQmf7FOozYQAIx7vhdzrT49dEa505Q>
    <xmx:jaixZ6aJtoDldwk6XcM7sbYNOHY38QUrxdES5KkxaVziSkRyuLmQUw>
    <xmx:jaixZ4Kqqz7BAL8xleGy8fzcvpzI6Sa8VC4lOc5JS82b_BGA82S1AZ94>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:57:42 -0500 (EST)
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
Subject: [PATCH v6 17/27] drm: sun4i: de2/de3: add generic blender register reference function
Date: Sun, 16 Feb 2025 21:50:48 +1300
Message-ID: <20250216085432.6373-19-ryan@testtoast.com>
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

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index baf2d024898a9..db962ccd66964 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -235,6 +235,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-- 
2.48.1

