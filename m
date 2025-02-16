Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE90319F471;
	Sun, 16 Feb 2025 18:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731193; cv=none; b=Ppp9Rxdd4vMrQZOIL2ZQ5LbB0iEDJKcuIbRxMTtq2J12GMG7wrdvtb/bV2/0pzw9g3Ade1eoNdrpp0eVGxb2+OxItmElfKmGjD/uh+tcsq8BofJG6HwIDtDkLn9wohdXprJdcJIteknrhKIOg57U0vA3w/sBCGi6OWxO1BU7l0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731193; c=relaxed/simple;
	bh=uzgXJJMEaruw9VJ7FltBzG7mE6vBjD2r0bOVD1fXLv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozn18YsQaXnwleOJK7c40zHIXU/jnOLU3fJUEeQrKZv3tdv84oh4lYT4X9IdWnxPm+MM7zl2CzN9ihZ0rrHZnu+ZsLdwFYC29JMtVidjsnrqHXPA01Bagjkn5qQyaMl71WWaR6OXkChZpPdVhm6y7OCVbn+iV7tdQWogiBqr4TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=b58uyOyq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TsSF14+s; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="b58uyOyq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TsSF14+s"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 67CBA25400C3;
	Sun, 16 Feb 2025 13:39:50 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 13:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731190; x=
	1739817590; bh=hVbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=b
	58uyOyqJ5jv9OsllnTaGcbf0ahweqov/I7rhV6tq5guHoiXk5PfnqjH5ASMjK7Gz
	o7ISZP77bh7lCmWU0sBH9bBWb46xQpfN35tSA8sAmvP0F7TcIMepiyUoiV7wykQl
	DKdcZd/e7j+BtEK8GnclsXplA2LSWc+sofn65cDxIqtCbAIpciMS1x7Q60FPb7II
	Az9aWERfqC0trXttTMl54x3wGBofxvBjPwLeEZ7xuaGgjmrW8F+lRCdBh5vuNrrY
	4XVWLbik+ZiN7jg+MjlgFkR/wC26XxUnN7NnUERrQLHyNkejwXbfcXH54Nn4wIBw
	fGcmRMgbGASgAEDyjZtUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731190; x=1739817590; bh=h
	Vbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=TsSF14+ssyzaTz07+
	5uF87Ooh98jX/TJ4BYzO0jc/V62b7cc9SiRzdDAbYxL5vUGgP7qWawOsOLgvqhSj
	0HcqJv0xiAveWWoCZJUjglNfGehh1uNe+bIguzsUtK/qO78/KiiOzJYcYQcB48sK
	oJ6sYvQ0laYVmUuZJqHn3pE9LRoPAK1KjNdpUkpNlj5b7K+s9fTh37B1sopPEpqp
	QtkE7VDLar2+yJ4OVy/SwlJqr8ENlaXM0kuU6Y6HkiQmtVORba4ZccOXEtqpTW4X
	c89LdM1RcApYcHydKaB4W1ewZ58cwXXMlPKnOMVhbWHrR5YNtAqNhwbdDHRcovuu
	GclUg==
X-ME-Sender: <xms:9jCyZ4LPvjVcTAndkLKEWxpV9YrI5eoUv60O4YABpfOKV2sfPeQQAA>
    <xme:9jCyZ4JCe6CkGGMsqexDHf-yabvcTtyc-GPbcpVZiIX07_jjHWSm-DqIZq9Ef-5AU
    xdG034CDOD6RW5gWw>
X-ME-Received: <xmr:9jCyZ4t1dBXZ1DRY-z71rGCIabEvc8Z2kjZhMopLFnxnlUfCJO0b0z4VHQcJlVcB12yC8OReJ_ZM_Pm9nHp4Nfno5-AylRuTngAHNCtny9fo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9jCyZ1ZaOO_uxuw_ufHHBLWYIRn_kN7f3LFu71i_ogor4AW-ng6pwQ>
    <xmx:9jCyZ_Z-s5MmE_ry4rRtcmkPbIFYJQiwqbCTeeGTinzPZiDcIVrBGg>
    <xmx:9jCyZxCvLAdSz8SgnyNgq5RKgeG2pYtNivnhc1fWR1vfUzU2fA-30Q>
    <xmx:9jCyZ1Z7rOhTjVXFW-7ALPMmfdn522JuuPHmtaIf_xzwCyWYfiIO9w>
    <xmx:9jCyZzL5c7DAoxy5EHq3kRzu-IHNUt56RKK-2OquLlBu3tC9RgMm0f5C>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:39:43 -0500 (EST)
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
Subject: [PATCH v7 17/27] drm: sun4i: de2/de3: add generic blender register reference function
Date: Mon, 17 Feb 2025 07:36:17 +1300
Message-ID: <20250216183710.8443-18-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
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

