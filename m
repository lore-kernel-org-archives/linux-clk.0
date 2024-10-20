Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D21078F;
	Sun, 20 Oct 2024 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413125; cv=none; b=tiVyerNg8GDSaECoFSYixW/CMoH83iJNxQeqMOfl0L7zQ/MAlVAkiz2MDrIUEB203dUocfQug8b7dM+2FTxUqr7E5d4/ql+wA7Soyj/VBzF74yCtx/eakAMAAaIaic93M+DeLw2aFNh926Y6UvMyA6K9tZmUWz8x0h0vJrI3pUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413125; c=relaxed/simple;
	bh=/5nViu/bmIePsGuB+dzmN9XZR4iyu9XiGbiGzzgZoE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKfpR2zVMcmC6ouDK173WkIjBIcwCIwVyornExIXFIeS8N8s9RmqYCECI2ZzD7EPOrwbxVpr8Gp1jUBc6w9bu85Nq6JD5HRTp1w/4ezsnphpQWuenzBBSmSQWlp0yrja0vF7eqY0FAhf3vEMvy7cuplfOnXDrwhui9i7B8yjUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=W9KTwfup; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jsi9HHpw; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="W9KTwfup";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jsi9HHpw"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id EAC731380191;
	Sun, 20 Oct 2024 04:32:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 20 Oct 2024 04:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1729413120; x=1729499520; bh=2weQOXWCcA
	a/ThgSUhPb/LBC5XOmM7XD78NKpSzI2Xk=; b=W9KTwfuplv1ab8u3KEEuk/0WEq
	NQljQcIGyNagOBd6vukMIdiqlR3iqAq/VGhB4WHfHNexRQn4DarIA3dajeMJhw/6
	dC6LjTj9UPr5yhcm/SiY4R40tEMw3Hj/nJqgmjZ9Dh5l3KZKse6dSQ+tVFplbnHP
	zFsqdz8YM3g7LbEeENdZFDAXu0VDjIL0eCqsipVA36cXk64A8DWOixhZDvQruxNU
	pI8u61iENt4bADzA5Dcd/OvV9FxYWDhdhHpbxRpE3AE/TOS7ijN2aK4c16uwgbGG
	UbCUIaaOapbt3RwQ6CsRcI4ko/HYdikG2wZUL0s3z4+6Eftyx2O4nPxv9UEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729413120; x=1729499520; bh=2weQOXWCcAa/ThgSUhPb/LBC5XOm
	M7XD78NKpSzI2Xk=; b=Jsi9HHpwYfJ/8px/Fjd369NwEPm1Ucr7Ncv+OgdRW9x6
	boM1VanBUkCX6cWXWdlnrUmM/cdCzknGky6GrUTclaOBpU4VN8zIScLFwF90q2Lz
	ddiCDGBBHGOKf2CIobCBIGbd/zyfZi62ccJhQR5kljZ2VysSdaYfLBrW1g4dxIIH
	ivXC5kevITRwHLQ/wz2aTT+sFQR7E4TBeOWEiWMKPU6bTHGQgeKLXhkuVbEd4l+f
	PJGsBCcp/tHWGQ/H3BXZBfrKPh1c82jdaMnM4+atCubMIgINlZt3jzeXebAX6Xlg
	0M2KTStuCuRXSOBzyCtdNaDXX2OnxDWYmdhApzIvCw==
X-ME-Sender: <xms:AMAUZ5nJWWx_rtP5OBauK4rD8AxK5TiUweaAcHixHGoh8JgjC_Og6g>
    <xme:AMAUZ01oXJxSZuitB4Lp7duHN46TWWlCCFQhMNm-YtEjILWsJBHQ3Ss3dYULCKQn9
    5emhIYsn4BUuudjyQ>
X-ME-Received: <xmr:AMAUZ_ruaX37X_wHXjOVmuj9ZjCobGE388MeXP1xiKWjoCkWkn2ZdqUIcOO1aB2rkxLFWXQuKoKWvSDWEbwKTjegFlgG3YvnFNx2P2Y7JYTlUoZ5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehjedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudev
    kefggfeftdehgeethffhffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthht
    ohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihoohguse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrih
    esshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgtphht
    thhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhope
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtohepmhgrtghrohgrlhhp
    hhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhhsrdhphhhilhhiph
    hpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:AMAUZ5nIKvJT1fuTHO9EIptnjP9xhUj3P9CMvvXB37q2akKHBs2m8g>
    <xmx:AMAUZ32jwGNbMWatd34aINotEhXw7xdj7FNpDMvXb-sJ7QAqVF3AgQ>
    <xmx:AMAUZ4uGCioUVX9oAt8R9jz1aRMkd6YMdHETNp1uFrZSiwH7HUngPg>
    <xmx:AMAUZ7W8HWDPV_NuGmnU5g-b02VZzcM_txs9n8ivygKsUZhz_nFWtQ>
    <xmx:AMAUZ-17UfqWESnBT6_D3eZ6a9tdF6ZoLeZoOv63hXpu5D0zMMEyw6Fb>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:31:55 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 0/7] ASoC: add Allwinner H616 audio codec support
Date: Sun, 20 Oct 2024 21:30:50 +1300
Message-ID: <20241020083124.174724-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

V2 of this patch adding support for the Allwinner H616 (and variants) audio codec. Some rework to improve clock correctness, and DTS changes to enable the codec on boards added.

Changelog v1..v2:
- Reordered patches to group ASoC changes
- Corrected PLL_AUDIO clock dividers to match values from manual and vendor SDK.
- Remove PLL_AUDIO_4X clock from the device tree binding (not used in the driver).
- Restrict TX-only DMA changes to the H616.
- Change the codec name to fit into the 16 char limit.
- Move the codec (and spdif) blocks in the H616 DTSI to restore address-order.
- Add board enablement (and power/GPIO changes for RG35XX to support speaker amp).


Original blurb below:

Hi,

The Allwinner H616 has a playback-only audio codec, with a single stereo or differential-mono line output.

This patch adds support for the H616 (and H313/H618/H700/T507) SoC. Based on the  Allwinner kernel SDK driver, and tested on the H700.

Regards,

Ryan

Marcus Cooper (2):
  ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to
    quirks
  ASoC: sun4i-codec: Add playback only flag to quirks

Ryan Walklin (5):
  clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
  dt-bindings: allwinner: add H616 sun4i audio codec binding
  ASoC: sun4i-codec: support allwinner H616 codec
  arm64: dts: allwinner: h616: Add audio codec node
  arm64: dts: allwinner: h313/h616/h618/h700: Enable audio codec for all
    supported boards

 .../sound/allwinner,sun4i-a10-codec.yaml      |  53 +++-
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  |   5 +
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  44 ++-
 .../allwinner/sun50i-h618-orangepi-zero2w.dts |   5 +
 .../sun50i-h618-transpeed-8k618-t.dts         |   5 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  13 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  44 ++-
 sound/soc/sunxi/sun4i-codec.c                 | 297 +++++++++++++++---
 10 files changed, 401 insertions(+), 75 deletions(-)

-- 
2.47.0

