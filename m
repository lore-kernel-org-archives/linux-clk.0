Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82414A093;
	Sun, 29 Sep 2024 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727604488; cv=none; b=Y0XWk+w/8vpqET7p0qZHZfM1swOY/vcvyQMZzZLk+23nFbIueAkJ/FhJnKY3VBps1mnXUUEFSnd+2BIYKsJ8GOZNbswR2CyAUw3JlvQ792pfJ8rW+WrOVQwgb2YPiSONYhe8guyY1D23TzjIiVzRy/B8J+1wy133KBdAcDtDYww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727604488; c=relaxed/simple;
	bh=i/WgwW8snmBIE4BE4+bV0vMMjg700dA3wyDwztBM/Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rns8JL+7UZGQuV2LwUvqokGACh9JdPPi8vqY83OHf1JjWH9QBGUTheNwcmW/eTErTZBx1eQbEGxwfq3GkdynXETW4x7bPVbPh7ONA0yjnF7++Zr1914R51416kQ6HgpcIY2l7Yw+bAZl6QkKubIwyOOTKPDTl9Dvl7ZDWtDXp5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=zoUlBg1E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nCdA9Iuj; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="zoUlBg1E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nCdA9Iuj"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id F049C1380665;
	Sun, 29 Sep 2024 06:08:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 29 Sep 2024 06:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1727604484; x=1727690884; bh=i/OIhISlqe
	hecC/cuY/05u+IRYh2h/4N3+ecIYTjGxc=; b=zoUlBg1Ed8BkiesoHJ4ocqurLx
	6ludI2Gk+4HDVBG0a4UDIpAcvE1VEB6ptTO8w7i/v9g+r7xH3T9VHDr5KU6o4j1n
	cciMY5SZromKD3RwNPU5AnT71TpOUYUbgKbZdltF3QCU5i47BfXOgXS554GXSKLj
	EOR5gCkDe4DMQvf7sSEtf4Ea58ct74yVZxmhQ+AXut3AqjD82JXPnav0Gqh/EqxS
	oIpSX67cVQ8sJYkRCw0/Pn4gEecHWRUCuHEX2vKgFoxewSuu/vB6CqmKsBLWYJrf
	Ad5Ziebfcxkw5h0FyrclXqatcYsNDc1ckNAHnUzrGlgbqWRqUbg9g0qTP1Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727604484; x=1727690884; bh=i/OIhISlqehecC/cuY/05u+IRYh2
	h/4N3+ecIYTjGxc=; b=nCdA9IujnqFAXK0mZj7PCLYI0yliEm43iOo36zERGA1p
	U7V2uOWgctpNc50hBrDCnflTMU/+5xRNsH7S3inraIh9Xdr/aJJkovvsGK6WJ9I0
	Ih3RqJeAIdbiSxj9kE3iZzwO2Uta1h7UZ7b3+MggGbNGj73HwSjOUQGhPR0TLvF1
	3pdnzkO+GW1MfWFZ/824XcPjmnDSGgCwvNCzaPtd3QLZXYZBjSFhzXY4/JhMqKGR
	lT1hdX/1FXEkova7oOQ8s3P1WWOfYgO/8PSiDOxfZCP/+oLD0oMuhk41u2y4YvHi
	BPfBsTVCUkmYXQ6QXjJQFt7CHqzWNz/OWlciUB7+qw==
X-ME-Sender: <xms:BCf5ZogDdSWEV4KQ94D6FCwxjy7KRxj8US-x0b4bZ0-vIyNRid4Uvg>
    <xme:BCf5ZhDNVI14hpe3m-bsjILwJAUxqdbi5I0L_Kvc-iX9LIXehSKZKcjG31_Msg7cg
    YReoUXNv9ot_WaLCA>
X-ME-Received: <xmr:BCf5ZgEIeD8oeiH-84E3qf2qHIHtAm_wavXEy_ZIZeRiNo1NqDjltk3qdBfM0idWBM8GM3pP7_wHEz6Nudk-84CQ-CE2yqmeJnANhcybu96x7TIq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudev
    kefggfeftdehgeethffhffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthht
    ohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihoohguse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrih
    esshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgtphht
    thhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhope
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidqshho
    uhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrh
    hmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:BCf5ZpS6G2EBf6Qx9nTorLAILYKu20-hNMJQYhkmuP6mQEQX58R-Eg>
    <xmx:BCf5ZlwtI9dSrgacvCpjt3cZnUuunZJEKYBIZysboQMBvzvO35Z-dA>
    <xmx:BCf5Zn6UcU4lqgu1se7kTERJ-e7aKvN2f8JvhE2iprfV5o7yD4QhYQ>
    <xmx:BCf5Ziz_igw0HQf3KFmKlL6VhZZhIEthNZSwduqG6g47J9WJVQpxHw>
    <xmx:BCf5ZlgsMdszo4Ngn8fDNKY7euwWbd2cxzvnDTOQnSvOeC43ExykkRDb>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 06:08:00 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 0/6] ASoC: add Allwinner H616 audio codec support
Date: Sun, 29 Sep 2024 23:06:01 +1300
Message-ID: <20240929100750.860329-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The Allwinner H616 has a playback-only audio codec, with a single stereo or
differential-mono line output.

This patch adds support for the H616 (and H618/H700/T507) SoC. Based on the 
Allwinner kernel SDK driver, and tested on the H700.

Regards,

Ryan

Marcus Cooper (2):
  ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to
    quirks
  ASoC: sun4i-codec: Add playback only flag to quirks

Ryan Walklin (4):
  clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
  dt-bindings: allwinner: add H616 sun4i audio codec binding
  ASoC: sun4i-codec: support allwinner H616 codec
  arm64: dts: allwinner: h616: Add audio codec node

 .../sound/allwinner,sun4i-a10-codec.yaml      |  55 +++-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  15 +
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  36 +--
 sound/soc/sunxi/sun4i-codec.c                 | 297 +++++++++++++++---
 4 files changed, 337 insertions(+), 66 deletions(-)

-- 
2.46.1

