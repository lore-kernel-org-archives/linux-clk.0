Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D558C1F;
	Sat, 17 Aug 2024 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723935931; cv=none; b=WryAYrdgQbVUdl/N1Iss1GlmQ045FrHCHi+Wzyt6ieXreZIuiMsXp2qxZKBed9p2aiUltGKFHmPVV22jcIWds0zgqUMdFDPKUfrSbkLTZx0aSfVTpW/SApS1eTO308CuKkYp39jIfZ+Ja1V6HmCSY+dcso9a68j2AeHCVmC1pO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723935931; c=relaxed/simple;
	bh=Ir44G7CzEpXnfyUc8W/RJURbna7YZIFnv2R4okhG0Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aG1onkpbpzNPxPVLtwE/ujzNJBMwJiS+1LcSak/dGjDPgKeP97hXvaxhLLg/owt8neK41OfbO74oZo/2B1W7hC7j1ntkPd4Wfc1IxplmloLsRjs1w3BarcxpKVeMHluFyHWrmiF2C4xxSP8sxgcIZiPk4oNOQh+ALQOTbr7fRgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=jc7aaZeX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lBHetoY4; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="jc7aaZeX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lBHetoY4"
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9CDC1114E500;
	Sat, 17 Aug 2024 19:05:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 17 Aug 2024 19:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1723935928; x=1724022328; bh=oLvmWIUZnr
	Ck+TO/saefQw9KwW75RD24ZO3ER9V57+k=; b=jc7aaZeXV7gy0MX7cc8oUSPOub
	vWDZmxsuQMkrqI6EUJs3j2kt81uD/kW7kyPWqTyCXBAB1CG0leTiFrqqmW9jYN6k
	hu4YLwWzY8lr8PecsZGOE34dL1ceYYOdVHoaCdnx2LN5B1PmQ41HjE23qPkeFszA
	scC+BAEICs+XMVTrDV0jg/Ge4NKM3LyBxn9c57zAOxLL597myZLMY23YT6BTC+/+
	lxAx0aSj5AjdSS4ejM740e3nRAQ380ycdbCv/0963WjNQHzsCbLN7+i6lPIFj1BJ
	cBO4OZ8JmwHd79jmVXqbfIyMlVjMhAiZJ4MvP242VdbEmfMW1kQbY1q1Ny1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723935928; x=1724022328; bh=oLvmWIUZnrCk+TO/saefQw9KwW75
	RD24ZO3ER9V57+k=; b=lBHetoY480X/L+bHy4qU44xKTJY4zdNlAsG5iEPZybCy
	09f1NtocLI7RBgZuJ7ECs5tG8A8uuH49feH4zXeOF7m7w5u23R6QGHfAAC6FY/3z
	ZgTkIuC/E8TVi4FpItmMaB2XgQt5xFXcdsNgi809t+Do51sOar0mMaZ18f6VimTi
	rhHWs/rr1ur7E8aZxmjezEEOn8WS6vQT0jde2LkpBrGRITFAyO4FZyIbxuGPorAo
	7RcBRfkRCro69YG1AMd+ucVLrefQk0r7lJtXb/jG3ZRzhcNV07nrcI8l+kZKmy7E
	NHId1HLuOQlDzAHuZFeTSo2/G8YukuaFOcMaBXa5lg==
X-ME-Sender: <xms:tizBZjvd9FJjPzTltafFRtDCNh1GtIKVbLc5bXW1aoQCJD0-db3Xlw>
    <xme:tizBZkdQX7WLKmWDqIeNz5NXYCq9wbEwDUlotRopxOPY7CbeZ9a4bqQK6L5zGbFih
    1_bI5htWH1Z9xopeg>
X-ME-Received: <xmr:tizBZmxQiWb11132eCfRJlMunboBWbWDRXT94mK12lymdOZcEFt5aIfAPyHKkmdXgBtv8FKuGS5m8qgOmveV1sjxwMb_pVWCU7q9fK0uuTSgOfy5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudev
    kefggfeftdehgeethffhffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthht
    ohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhgusehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthht
    ohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
    dprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohep
    rghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfhhffi
    hllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtth
    hopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tizBZiOyKxdThrD1kmWixcOn-q1ccQxJDt6XrTyDSf0O3-92c37TVQ>
    <xmx:tizBZj8PLu7fgWRxuxO7h8rP0Cp9cUgU4yY8JZs-ylrhdQuPWDLa-Q>
    <xmx:tizBZiW0Sfzcww1RiayeaiOVnxHGv2q7fjDTmrn-aFGp1AtwSgmryA>
    <xmx:tizBZkeD9D3ivua7vaGp8tXUoCaZwJASwarfu8GQk2Ry-af_B_HgUQ>
    <xmx:uCzBZvswQNi9WOVhGLmU3mQd9zFvw8jZ8f_KEDHrnEt9d2pE5_JSCVF3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:05:19 -0400 (EDT)
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
Subject: [PATCH v3 00/26] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Sun, 18 Aug 2024 10:45:47 +1200
Message-ID: <20240817230503.158889-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

V3 of this patch series adding support for the Allwinner DE33 display engine variant. V3 is rebased on top of layer init and modesetting changes merged for 6.11. No functional changes from V2, fixes and review from previous V1 and V2 added, and correction to DT bindings.

Original blurb below:

There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.

This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.

1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
2. Add YUV420 colour format support in the DE3 driver (patches 5-12).
3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 13).
4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 14-17).
5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 18).
6. Add DT bindings for the DE33 engine. (patch 19-21).
7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 22-26).

Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.

Regards,

Ryan

Jernej Skrabec (23):
  drm: sun4i: de2/de3: Change CSC argument
  drm: sun4i: de2/de3: Merge CSC functions into one
  drm: sun4i: de2/de3: call csc setup also for UI layer
  drm: sun4i: de2: Initialize layer fields earlier
  drm: sun4i: de3: Add YUV formatter module
  drm: sun4i: de3: add format enumeration function to engine
  drm: sun4i: de3: add formatter flag to mixer config
  drm: sun4i: de3: add YUV support to the DE3 mixer
  drm: sun4i: de3: pass engine reference to ccsc setup function
  drm: sun4i: de3: add YUV support to the color space correction module
  drm: sun4i: de3: add YUV support to the TCON
  drm: sun4i: support YUV formats in VI scaler
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: vi_scaler refactor vi_scaler enablement
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  drm: sun4i: de3: Implement AFBC support
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support

Ryan Walklin (3):
  dt-bindings: allwinner: add H616 DE33 bus binding
  dt-bindings: allwinner: add H616 DE33 clock binding
  dt-bindings: allwinner: add H616 DE33 mixer binding

 .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  26 +-
 drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
 drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.c            |  99 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.h            |  33 ++
 drivers/gpu/drm/sun4i/sun8i_csc.c             | 341 +++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 229 +++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  31 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  41 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 134 +++++--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h          |  34 ++
 20 files changed, 1271 insertions(+), 207 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h

-- 
2.46.0

