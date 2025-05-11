Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325441DA61B;
	Sun, 11 May 2025 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746960108; cv=none; b=pKUZ8gsDr2Oi3CljRt1TIvQr/O5WgxdRVglrEzh3OLWhhTCa+Wt5NNt2IzH0HzasKf9rxqDSuzcJzaGdMJSN9MRnMD4FH57XUH84P0XI+hWXe3bOfI3hGLl1PCenA7vCzjoFcg0BYku3NNEiWfNLITreEz0suMSLho1+N3ikBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746960108; c=relaxed/simple;
	bh=aZoikp89y7cJcIPUp4ePFYiWIPaV7kWCGD5DN6RMkTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URDvNWL4ZICRopsLTeemQ30tJ4Ui8Ao7LsfjYAEN5ViCBJiO+8/8KM5lO2ga6ydEL8d2YJxobmTeBbmm8AFbbv4PvU/TvaRk7PA5wxQzG3aqbuJWTsnR7QD4kkpKz2odN0i9uHo/dWJBmrkwts/mlEgB2wN7deemMVFOB8xPIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=pvtqAqrB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kkNLWRUN; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="pvtqAqrB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kkNLWRUN"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AB96D2540073;
	Sun, 11 May 2025 06:41:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 11 May 2025 06:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1746960105; x=
	1747046505; bh=XtwvmT3ILxwmenRSwnAPhEfiZJxNC6NRedG1CH+5ZFg=; b=p
	vtqAqrBk4TkBe7Jx9Uk+0zLZXG+eBlB0STdmOzNu3XCKSNie0uJb7W5J8iSkHG2H
	FlUSEHKC+J6djLY54m08+PjOZFMnoSIZwgsS+WtZxRXjtQ44sxY/lTv/h2iT71Tc
	acZ9c+sR/lNZ/XM+dJjEepqOtOPf3KHHkUJISaMwfHVt3Zn3Y9nRTVGXK2bzTIOP
	Q+dMALZb2/reUOTuWhsk3NGzkkb/4P4cFa1OXt9Yt4WuDIRC81GMshsb32bL4tQQ
	utdfwtoFIprrAurGNuhdY6pw5oNxdqg06APppdyWapODI/kQLHbuUl3PF/JfqZtL
	+bkzrWtTdOsQ7D53M0pfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746960105; x=1747046505; bh=X
	twvmT3ILxwmenRSwnAPhEfiZJxNC6NRedG1CH+5ZFg=; b=kkNLWRUNY99wPOtW+
	7BCPLAFzCiCRG9b0WRdFaXAZEguW4vBuIRBWHf+h77XDf6YPT2zaKMOFAJwSdqQ/
	E1bWRq6q1brRWFMPxj8txnz61wmbWIKDzRS81AOt9dAsagAbAZooy8hroNgzm4pP
	QhyqRLzol7H8pBIyz+JcU7ftxJYx/l9BoNuYbXToXPSj5d5fjI6wxbmY6sk2Plpz
	h4NLLk+PWxe9f+R9gcSOCwxEZxpyJlSGpoIhbn9oJJpGIyiRK5WFXXvn3+lD9EaS
	ufi6vkJeb4ZynXNy3wXajuIFk8SUodhQ4b+/AjqN+y+R188pHvWIGR/eo0AM9BLk
	0djxA==
X-ME-Sender: <xms:6X4gaNBt0XBGDJRuqA-YiDEzpdjikpk4BtE5lSNy33w2MdKi2wuVtw>
    <xme:6X4gaLi9ihWC65GRBycPTa1TCFtSjGy6HKSWqYDShbnTZmAWG9kGel9Msns00Hfb2
    6d2WmR85Aiz9hVOvg>
X-ME-Received: <xmr:6X4gaIlvhj_hQ3XJhdz93ifjYmb8CZgrBeNfP6q5UCs6WfCUoGUxgFm38dSzN6EZVnTN4XMWBTCLo8SxiXPyfCxHdqGmQzGiwVLxVx5IOWHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:6X4gaHz_obla813hv5iDa_gQUC6OKRTmVVMJzK4-MWpC5kAKeJZNiw>
    <xmx:6X4gaCT0FuA0sWHqWP49O21EByBnbSi1wEdj7cMj-YpORngM03biZQ>
    <xmx:6X4gaKbnNNPdIgOWhoLcWAjau5EclRnQk4mbQg55I2W8vZijn2hAgg>
    <xmx:6X4gaDRXS2kp6wO-kfOnCMAoUq3F1ZwZd5p9gCRTTyI1iw4trKv0DQ>
    <xmx:6X4gaB4u3FHfWYH48uOkZPHQyZj2MtGW5x7whyBs33U-TBhRn_a5ewa3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:41:38 -0400 (EDT)
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
Subject: [PATCH v10 03/11] drm: sun4i: de2/de3: add generic blender register reference function
Date: Sun, 11 May 2025 22:31:12 +1200
Message-ID: <20250511104042.24249-4-ryan@testtoast.com>
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
index 7fe5ce20082a..43c413052a22 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -217,6 +217,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
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
2.49.0

