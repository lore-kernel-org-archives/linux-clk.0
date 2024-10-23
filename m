Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2AE155CBD;
	Wed, 23 Oct 2024 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670375; cv=none; b=gzU0/tIVPhrtkyzw3JbpObS4dwO5oqq+CYbt/EGF621csbF+Xegu+o6qIarvieegUQ1s+/Ink1IO+n9F9JJgwcEe7/zel7gnvZlJM9vOo7kwZP54ABAWIEfV+glIf/uDubMD8Mu23o9yT9LZmvkpJ8qY3KiYH9aFFCJ8H0riyFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670375; c=relaxed/simple;
	bh=swoHZitnUxOyrKtp9TmaKWwF40O6gGMp/5+Codl//04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4g7oJ/r6eCBPfEQEEkzrhbPbGcW2drsdHXnqqzdJWw7OijRTdgItsrzoTG1NBeAjEQ6ffXGboHSyCPaNpaxG+YfQejcEhkXqSZQFfiFn3q+Fp8hiRy2KNqWt3ejKcZ0GXzjuR4xUswKRpd4vUp2AZCFw0VdeSKgrs6cU+plWFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=H7xCsreu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q2tKGxnV; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="H7xCsreu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q2tKGxnV"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 33E51114018D;
	Wed, 23 Oct 2024 03:59:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 23 Oct 2024 03:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1729670371; x=1729756771; bh=elHpuajvwi
	yNA9OK8x4fvj9BtjIaAO6sLsdUEmQFU98=; b=H7xCsreudOiEYguWOLp1R2Sj/D
	WyWe2YygznB/gn24le3RjwDCwf7EHrIrGo+E9bJgmQsjGOSERfMvyD0yhMbUcZDA
	HVhQYabxYBrMXk0eV3Auvo3WfiNVMzEwVxWUHU+ApIpD2xPH8R9iZ1uM3xd7SdPN
	wlYYHE8O2TeItYGaf+8wLjBKN6RjYO9zCKxqtoxYil00oeumFNuq8AjDAFrtnIIX
	o6fb7jlw6Fj+qtku3M+/F2DR4jN71796FjTn75VD72WPz/4WpLGWqGEAx66hExgs
	WNLTzIzqH+QvFu8Uy+BRfh40Jm9dQnOXHmJVI+Q+/Po4ZTrJsz3isy/ZSocw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729670371; x=1729756771; bh=elHpuajvwiyNA9OK8x4fvj9BtjIa
	AO6sLsdUEmQFU98=; b=Q2tKGxnVMxIQa65c+wFeGTQX6ITSsvo+JF/WYL+A4TWV
	piraClaqQ2kL28TWtzfvNGGCgRpwmBp0puNKPOpkFFA6Wrj7Gh+C5IRiI4EFfShE
	sOKuhiCHmMDmtApH+t7nuPB48vNQXeJ+6M3qjOzwkkt/SM5NrB/zVgAzRmV0mMy/
	ttU2sr8jBs6X8C+QKtbStAh6e56A5RehJ6Mk3XOuME5kMRLtCze8jmFKreenGWa7
	bq9Zj+hAQGS6WJlWoMyrzAWmJTgYt9u8L9SDAqR58U4HGbAIrjFtqYJkGgsu31Sv
	yRwJINBz1hlD7QN+3Nf74OJ9OQu/HSeyPQbY6Hu+BQ==
X-ME-Sender: <xms:4qwYZwDk2SV1wvgH2mbnVpZs475ySYiUTvk5pIiyq849nde6IrbkHw>
    <xme:4qwYZygwlFgO73vhkR-CwSBcJHV_RzYpa8BGWmcwfFSX5SRcNPdI5aQD0_sNSE_oc
    NyO0PDtzDfM932PpA>
X-ME-Received: <xmr:4qwYZznJnOZIaJolnFyUKfbyXFJ3fAp5Dy8uaVYZq_yxAB2xX7S7cTSkH4Lv1oQCH54JynFduJq1Cc_pxOuk9AWQS7g1bYeH1-s_eSoA3Ri1XJBJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
    homheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefuddu
    veekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphht
    thhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifohhoug
    esghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrg
    hisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhhorghl
    phhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhihhlih
    hpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:4qwYZ2xP-kAcrAhI2aATOxRvbzHFbJceIaQxRUz-r-8mEWDTy1MeEQ>
    <xmx:4qwYZ1SdwqndmNEZfjSud9FwtGJvxiGzvab-RJNB9mSkwtovextclA>
    <xmx:4qwYZxYRjYNYakZsZZz9T5rL9gs7WKrh4EO1s4fdfUuvJZaJ_7pkYg>
    <xmx:4qwYZ-SbTwfFe4CGkGkFHJOK0PetXn3Y5lngiyDeZ-TzoVQ6az5lqA>
    <xmx:46wYZ-jIyJQxzc9SqZWKEWc4LRrwhyyJCm-9MpkmEj2N4j4Pqexf26ZJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:26 -0400 (EDT)
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
Subject: [PATCH v3 0/7] ASoC: add Allwinner H616 audio codec support
Date: Wed, 23 Oct 2024 20:56:56 +1300
Message-ID: <20241023075917.186835-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

V3 of this patch adding support for the Allwinner H616 (and variant)'s audio codec. Some clarification of comments, particularly regarding the clock driver changes, and a small fix for the device tree binding (apologies I forgot to re-run dt_binding_check on V2). Review comments otherwise addressed and reviews noted.

Changelog v1..v2:
- Reordered patches to group ASoC changes
- Corrected PLL_AUDIO clock dividers to match values from manual and vendor SDK.
- Remove PLL_AUDIO_4X clock from the device tree binding (not used in the driver).
- Restrict TX-only DMA changes to the H616.
- Change the codec name to fit into the 16 char limit.
- Move the codec (and spdif) blocks in the H616 DTSI to restore address-order.
- Add board enablement (and power/GPIO changes for RG35XX to support speaker amp).

Changelog v2..v3:
- Update clock driver patch commit message and inline comments to more accurately describe SDM changes.
- Fix missing "-" in H616 conditional binding as reported by dt_binding_check
- Add additional clarification of internal playback_only quirk in sun4i-codec driver
- Add short driver_name to H616 codec driver and restore descriptive name.
- Remove leading 0 from codec node's address in H616 device tree to match other blocks.

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
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  46 ++-
 sound/soc/sunxi/sun4i-codec.c                 | 298 +++++++++++++++---
 10 files changed, 404 insertions(+), 75 deletions(-)

-- 
2.47.0

