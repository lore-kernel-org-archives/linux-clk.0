Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081AE224AF3;
	Mon, 10 Mar 2025 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598651; cv=none; b=QNp/6zuXJrSysnBJnYMfODtY53eR5nUG1j1pnTZdhnsmfnlul1sp7k5n7+aRNP6hVnSrIOJoJljjOo+O9hzD/OikRuHgnAfuh4FA7aMjXzLkqOVrLbzkfTv6WHand6sQwY3qJFCHNsGTx0/zPXIhguOoNHoW5uxYseKZm9+sUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598651; c=relaxed/simple;
	bh=/eAqlfhHZWhVTlxCkxk0GzTCjpWW0hFZt2WE9+N05TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VgPz48r9/u9KOC2sJZc/Xchpiz/vTMQ1/nL+rZTWvZGq9YZ/00No7D0O3MsAyHUuSwbJv7lksqGEuyzX3FdWe+B5iqoVfkxhpeDY+cSuwGfeSyzECYUONCDFjTvaHRwYAETcNkGSQg5lWhrCSIVzXWunLtplJovti6IURwP1C1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Nq1j/ZLq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I6syfa+6; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Nq1j/ZLq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I6syfa+6"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EEC7E1140113;
	Mon, 10 Mar 2025 05:24:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 10 Mar 2025 05:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1741598647; x=1741685047; bh=Y6AvpxPV0M
	o1yVWZRVzYjUPjprmwSTfhUrs8dR29Pi0=; b=Nq1j/ZLqe7UJNP/Uyx77LHg2q+
	RTpdstQulVVnLjcJB8xaL7lvbZL4pSqFxTtDO0jSrg1XmeFXR8xGVZHo/mlmqmSD
	QIu8hOSmokQSsoomyfTWXGE+o11RnJo7k8T2rRiwXR2Q+tbFULLr+d1z1nPn3piz
	0M4OU7V8rMyPjmd+Dk+jox4HDX4v9aQj2Qux227fK8409FBkit7dEdOHbduxV/0W
	t5dhWwRxKqykXCMZEAhJ8s5jOTTtgD18B0ZHYmTomfZZZeDidSbRKJjhJpUFOkEg
	at1KF+yM25eJrSniEoxF++iS2vhWQtbARZiSs+NiFUHUPwcYMeb77z20hq9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741598647; x=1741685047; bh=Y6AvpxPV0Mo1yVWZRVzYjUPjprmwSTfhUrs
	8dR29Pi0=; b=I6syfa+6rVc5xIoelp/IT4Qjzx+ZaC7pQW5oWTbIN21AAq3v9ao
	6IRZUKAAwZpb9m/D3T79CDYqOCPix5lmHCaugz/M0I/L8FnPLDws3IJoWmr6ifY4
	r3gk6wmg9c4l/fA8SJOEPkrzGNRUY8RfVxxAOTUIFmtj6cKv+hw4pedMwbcql/2m
	7Cx84+qqtmVXmZKOy7XiPenixktnmrj5pGkldvbE0mTvVfFeZR/5PK330YDnH+m3
	t+1/kRVqMLWxXCxWzv4FJCYcGxtTCsElBgDTEWGQYjUfrYh76p9u73w53SEwHQqE
	1FDFKVivRua7SRd77Xx4MVMeUb+aQ6VY5zA==
X-ME-Sender: <xms:tq_OZ0UxoEZdsAHVTUVpEkyoVujyFXaznvbwByUhstvfwigPXT0J9w>
    <xme:tq_OZ4kUC4gnBp21HrQfpJSqpMUQwR_KyKmUY8-I7ltZzFxxCQYwVUckkldypqJHR
    HyiXRj92CMmd45S9g>
X-ME-Received: <xmr:tq_OZ4Ys15T949m4KehC0CVwEQsH7eiAwFM0gYQKo9p-Gp9zK_ll4EeFFU86yx__6D3FsHv9uvc62fp0mbuuhjnH9202ZB1cWOG4JJZEjSWT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeefjeejhfejhffgiedtleelhfeukeefteeukedt
    jedvueeugeduheduffekveduueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnseht
    vghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepfigvnhhssegtshhivgdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkh
    hhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgv
    rhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehj
    vghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuh
    gvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:tq_OZzXFCTaz2AliDzDXKOtAqAOVo6z3gFoyh8L_ITvsOiuWaUisYQ>
    <xmx:tq_OZ-lZdsg7cLSu5fy4rc7nCML41v9QZBZ2akaH970xX22KXUSxvA>
    <xmx:tq_OZ4c63iAcDtugH5Thqa85ZyjOWlsrVVVKGo7WLfMLcRcc2Iz9qg>
    <xmx:tq_OZwHHRSDMaAbDMt_K2bMkM22vVr3OIak9W83I5-VUHb6ndsTRhQ>
    <xmx:t6_OZ63J3Aua1M-t_dgdtcrWc1lXZEoofrxYzE6nR2OI3TTw1yp3oTHH>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:00 -0400 (EDT)
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
Subject: [PATCH v8 00/11] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Mon, 10 Mar 2025 22:09:46 +1300
Message-ID: <20250310092345.31708-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

v8 of this patch adding support for the Allwinner DE33 display engine, used in the H616 family of SoCs. As discussed in the previous patchset [1] even though the DE3 and DE33 engines both support YUV, and the DE33 adds RCQ/DMA shadowing for hardware registers. This adds complexity to implementing YUV support because of the lack of support for appropriately timing these writes. Therefore v8 removes YUV support and the colorspace code refactoring to support that, leaving this patchset as the minimum changes required to support the DE33 engine with the current driver. A further patchset/RFC for the more extensive driver changes needed for YUV and ultimately HDMI support.

I have also decided to pull AFBC support out of this patchset to go with the YUV code. While relatively standalone and also applicable to RGB framebuffers, it is not required for RGB output and seems to fit much better with (and is more useful for) YUV support.

The upside is that this code is relatively less complex for RGB support with the existing driver, and the patches [2] for the TCON and LCD support for the H616 and Anbernic devices using this SoC can be applied directly on top of this smaller set (noting feedback on that set prompting a v2 which is WIP currently).

Original blurb below:

There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.

This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.

1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
2. Add YUV420 colour format support in the DE3 driver (patches 5-13).
3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 14).
4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 15-18).
5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 19).
6. Add DT bindings for the DE33 engine. (patches 20-22).
7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 23-27).

Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.

Regards,

Ryan

[1]: https://lore.kernel.org/linux-sunxi/7770397.EvYhyI6sBW@jernej-laptop/
[2]: https://lore.kernel.org/linux-sunxi/20250216092827.15444-1-ryan@testtoast.com/

Jernej Skrabec (7):
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add mixer configuration for the H616

Ryan Walklin (4):
  dt-bindings: allwinner: add H616 DE33 bus binding
  dt-bindings: allwinner: add H616 DE33 clock binding
  dt-bindings: allwinner: add H616 DE33 mixer binding
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support

 .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  21 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 +++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  30 +++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
 11 files changed, 242 insertions(+), 63 deletions(-)

-- 
2.48.1

