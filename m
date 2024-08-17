Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1189F155C81;
	Sat, 17 Aug 2024 23:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723936057; cv=none; b=ZgLFN0qDhydqmizq39gUSQ0rfqJFz7+NspKoLFz8TB+9cOUFPsiogFffI1U10pUyIwuNpwMaHjUNQRdQYyytJjHMxwqdHjwzOLX8NURyXqbtCI6jVSDeBTxUeryO6q0OdJkiZzZc/Pp6ZkE/ttLDvQ5kKYXJo7WX3kowrf9wuUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723936057; c=relaxed/simple;
	bh=8hcwGpY/92K6qmCmtOO0QZxRNaBOcFfS4+v4/aSDytM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+CgirnH9P1U7yT63xLhQzyIhyJ+a7kdEAQn9Jq4AonF7dRQEhBK3XOdN8cfdFlBWx6Swb4VzaMHLvxLkqsxyXmXYt8uKLkkAX98PmUKcBMw/Nxj9Co8j0F5OQ1YxRHmpc3bKWRn+bCbUiWDqgxp9mjKKGxeFYW5+9BezsYwXms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=e7tYQUdQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RN06p3ar; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="e7tYQUdQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RN06p3ar"
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfout.nyi.internal (Postfix) with ESMTP id 463FA138DD43;
	Sat, 17 Aug 2024 19:07:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 17 Aug 2024 19:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723936055; x=
	1724022455; bh=/hpMFGryuo6jfsN8JFVi3Qm9QriXMZp5D6MBHxqzRy4=; b=e
	7tYQUdQAUljHzss+dE5RqOVXHYVKCAjn2vHdnUSYjmoIluHtWO2j9/iBsCqRa3Wu
	HSWURhRl0mM7KsvHz3+HzLqi8MVfk4RohOe7dg5hf+09/uGOwWbUpToJ0Y6UQcGl
	HVw+v2csrTyrjMtyQiD7G9sW3rGLepXqYjs2MGQDIj5X1T0PkGtkmEjlP1ji0f9+
	l5RKR44r9yatdN1NcLDy4yDfsTOkwkT46UpOMMxdbFh0DNTl/WfXecmVs+oxFX4L
	SPGl/mBLemCam3bHLae041ga5VAdH14iIwN69D+TbCtVmWr33Ua9JgVJ0O+rz40f
	mo3+Xkl76w0+/TpMW/ixg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936055; x=
	1724022455; bh=/hpMFGryuo6jfsN8JFVi3Qm9QriXMZp5D6MBHxqzRy4=; b=R
	N06p3ar2yadlBiddjnHeElectR7dmeQPggP2EtnzxB5tiBs+okOZKWayGT2XjOSo
	VrsVtTV8v7QjPCbppxts/+BNjdfmTYp3rBQNbtaKx6lw4ZaZZLnyaxrrpepMQUAj
	Ofz2QWhmUHn1aZ0o7uTDNZRZFjHf2N/1dhXnhWX9gZ5RtOdpCD8gn1Krnapei2kf
	IbnGomBZpMT9fViK2R6QAB90c86PKx/5keccjFVE4uAsu4c494GMPSH3YGkvDlV8
	vOL4mf11TZ9OWaJ6aLsU/bKgHBpVkkD2lktqE4WMdegFRnhbzYwGyDAD/CB80XKC
	ZlIjCIIy9RgYr2++gVyCA==
X-ME-Sender: <xms:Ny3BZt99jmtrBHlARhOH97wpFdAFMn3d9ZMvd3_VXVF3PPuSG_rJlg>
    <xme:Ny3BZhsOTIQtMsccNwKiD1ToigZKT7MQl6eT2RtwkflQUS03QU5sx5mR0VF8KlkA6
    C-cZHdUVSy11SK47Q>
X-ME-Received: <xmr:Ny3BZrCbUguY_Axy2mmXeYKkMFlKH-TlKt8GIrC2Vw9YVHG8hddncVmk5W9jLX_TNWy0tr_h4P2MM0Nu-sxLDvovH7oFBIsJ05hfEIXvA2WyDt8l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Ny3BZhfWL3VcILSu19i3zkCfz9W2BiDmsH_zzlSb_xbyDwiCVsRmxA>
    <xmx:Ny3BZiOWLmsqdwzdNR2DB9EFvuWQ2N80wREg6-ojm9jsZkuPDTAV4w>
    <xmx:Ny3BZjn748BPVcIEX-srvvlnhEKqVJPV3t6it342yd25N6p-_DJosw>
    <xmx:Ny3BZsu-8G3vtJQH_uJGw5PqPMRz9TuL5wl2JYHfc7QvlADLSfNIsA>
    <xmx:Ny3BZp_zCl6F3J4udsW0GjC_yT8ljfZErt7YW4827DyVR9pRmPhtKGH6>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:07:28 -0400 (EDT)
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
Subject: [PATCH v3 16/26] drm: sun4i: de2/de3: add generic blender register reference function
Date: Sun, 18 Aug 2024 10:46:03 +1200
Message-ID: <20240817230503.158889-17-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817230503.158889-1-ryan@testtoast.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
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
index 82956cb97cfd9..75facc7d1fa66 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -224,6 +224,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
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
2.46.0

