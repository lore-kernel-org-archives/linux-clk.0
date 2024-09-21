Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0109F160884;
	Sat, 21 Sep 2024 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912478; cv=none; b=fx37gKb7ZMrQwvZL49xKr5VgNxHdIfgWxlxpKWPN1NpzmPiRehixJwN8/MLjf+EI/wkm6BbyPJBMspBl5c/4OILmTjpNKRDM8OiWcFmKKOf6dwtaxPxQQmwqZaGh7uO7hXViLz3AnvlWJSougaegxttnM1BKh08dMhWpijxti5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912478; c=relaxed/simple;
	bh=onXrseiuYJtcTH5eiSI0w45n1day4k1CP8TJF/Sh920=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1gRUXlI8594TBJ+S4L4LhD9JN9gJrJSk0WDgRlrcoHCSXXWOtWeb27ZlaEZ1kpDho2I4dmIpbElC4nWSjVJsLsD1NP0GNV+VCAimMYHdjfQaHzCbryzyRjaEfIDnKRzzh35+1+wqQsMn9y+3ahXfTnbrdaNHL/8L2OYDhx8o4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ciVtQjC9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q5jEJbxW; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ciVtQjC9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q5jEJbxW"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 31B0413802EF;
	Sat, 21 Sep 2024 05:54:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 21 Sep 2024 05:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1726912476; x=
	1726998876; bh=DuyN5NZacXQ+Rk9ddc0ZW4kv7g8WqG1pwN9DhfgDYj4=; b=c
	iVtQjC9lfCWQGJTttJjwSk7+owQGahbmTqGbdrMAvlb23T6PQjf8SzZTtXBI/rB5
	oY9rwhW12GKcvF44XevxcD2XrjNtumKpFK90kiENSMXmAkS/Svl7UrQt9myiuSxX
	REtoa73vczBMyVjkNn3C/rIP7sBDEHISrZXdB1iCeeM0qXWq4CjtMYPxTxi4JXDN
	eDPblVfgw1ccqe4QoBj7tMLzIc6r4dtsZKaH9y8nXcciMfeF3w8HK/dELqLp/3Fe
	74fWIXK4XMmyM+lRQGqwW/9Fs/LEoFBRrYC/l/kRer0rc9HV1rd/HfTVNZzI07qR
	GUEYnh16NsDfoUmgTeHrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912476; x=
	1726998876; bh=DuyN5NZacXQ+Rk9ddc0ZW4kv7g8WqG1pwN9DhfgDYj4=; b=Q
	5jEJbxWan3ZB1wIl3Hzme9BlSX81tB8m1iAvwDjtcUJoyUvPFi9sqZUd6QoWTXaI
	39oqlpslL71strdt7P7/5rLF4VS4bqZgyr8PVAOv6CvFSp3dw2P53ab6k2zNNqmv
	0R0Sp4SYhRsxuZV4onZ6MA/voglo8tprGIAZ0DfF8n98ZjHMTTfqzizHEy/0Loz7
	F+Y158GNLtyFti8PGBP8FZk6gbbd6uOMVC87eXjnn1SNtNNcAS5zYGG7AUTkRoVy
	StyPB5co+ufdHWrlzF+4D5cv90GkDCItLZhFNK7vYmiJD/vVxA373d4SyfkkG3IH
	D+ePojEnG/ZU29bSLfa3g==
X-ME-Sender: <xms:25fuZpvr4dMUKLbZzWsGbyDEJLcxsWzkRgle1dqUhtte-nK0euiHMQ>
    <xme:25fuZievuBXfiFNJxLdteMKkOem2X2y1k-Dyag2psbJ8VnM3Lz53MjpM7mBNNU-vl
    C4T2iHp81XEJHjOPQ>
X-ME-Received: <xmr:25fuZsz1U255FMyx5Z19RUSoMZU6p-XXmDvRX3_r7EjyalvUjiXvzAFYAtbQPmPJJv9c5r630lFqU33uMsONZN0OFHcGwsonWYIqfWeBcRZK9nhT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:25fuZgNciC2InbG1dAo0wCWJme4hsxVX24LwiY344GDTmRJ00GxeCw>
    <xmx:25fuZp-jwY4K4ExDtEyfjD2x4IDuUBmzlkJjMFzKrNYs_u0LcNiifg>
    <xmx:25fuZgUh7vopbL-K_4sDmeAXtrSMh96izcuTojL3USoLf3g6ixhFeA>
    <xmx:25fuZqceSAK-0nxivQN2GAZUmACefH4qZqATKEB54YujD_Lfum5uxA>
    <xmx:3JfuZp8-n1FK5mxzcUF_XOtLB6p-pqKGT_h-bRHLx1pAS3UyghfcxKEW>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:54:29 -0400 (EDT)
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
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 21/26] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Sat, 21 Sep 2024 21:46:10 +1200
Message-ID: <20240921095153.213568-22-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 and variants have a new display engine revision
(DE33).

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

--

Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad2..c37eb8ae1b8ee 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,6 +24,7 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
   reg:
     maxItems: 1
-- 
2.46.1

