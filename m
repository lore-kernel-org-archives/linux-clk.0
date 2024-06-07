Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E0415DBC3;
	Fri,  7 Jun 2024 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758187; cv=none; b=DL9M9NGbrfP/kPxtnQPpxRaw9/DW+y/aOaniU7Cjmyx/XqOrzcpBKd56eP0cQQ+XdJmBaM/St1xx2B3iCgixeIgxC5PIFqmzyWZ2R3ibYxNshO7mr9gttBZrboEvN4fnFoKbfTux9eGG3q0cllw5CBOQiIVfq4Jx1pehESRKZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758187; c=relaxed/simple;
	bh=tXbTPAc7MX3IjwjXm8g16Cg2buNDK6ArhDWklHp2ubw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPlG7Cy6LwuLd6S5VgulvevNZJy3T9P/4gF7GcYus8GORMG9NVn8oLQ8ud/fcSYB3WIAYwTkE2sfkCcDv3StqiRM92ccmDnbfto5Bvqg9/z0zwx9yGQfSy5A5cgkyFbfnxCtOocmTMvphoWd8JilVl7TMCsdqFj6K7Ic32TUseE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=iTU70gkU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PHk5lWRb; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="iTU70gkU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PHk5lWRb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 18E4C1C000FB;
	Fri,  7 Jun 2024 07:03:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 07 Jun 2024 07:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1717758183; x=
	1717844583; bh=BY+zIofCaC7v+wzShc4ej3nFK7NEM7edW7mapbborSE=; b=i
	TU70gkUBAEwV7XrnWynxYLFHP1By9zArbN7L8Gi3/xQPQr7zrEBzi6swIb4LnNJ3
	ASJAxrDnkvclQpfHgGM1gTTaL0IT5rgTRPQ6CFvEx6JsTR+C1ebDbnwOPxKwhQgU
	TgdswKlpSN34X8tw0GVmQFz1uIJOiKF7yVNBPqY1hgpCeuWQa12n3c7gnuS4KzNC
	r0+gble3x5ksF66LqayWoldRMouTeUv5XEbYDBH4/3UdD/8gWgT0mWyQXZg4ya89
	Lt35kvYldGXmawYx+HegJ8T+AEzE3uwEs4+L/bUqBUrR/Ph3UgBEfALshYflX9A6
	zkIjD+sy/wsq8DthBuPLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717758183; x=
	1717844583; bh=BY+zIofCaC7v+wzShc4ej3nFK7NEM7edW7mapbborSE=; b=P
	Hk5lWRboc1/g7fhar4Fm+Hfty7k8rZIvQuuGod/NBeIqktc+pj0iWnXLLta+9FDL
	TKjZNeX5808KuJmIDt9nTiOatCH6lvRpGERmrSB8BSkyaUOlSB/ruZNTad7/d09p
	3H6Fqd3t4EkF7h83bkEYLnkYUHiRa+DxHvfqfvLoVxsdtwFCwPQalZB6UuGdenvy
	twjM4OR0J2ASzr4xmWhnQ6I5np3DMxBr20DOR12eQb/Rv+kguAUM+4O8B1ITEojT
	o/GkxSYbOv9BdHctwn+YVxXCxjQyPHCnBWcqPX167DrSgO7Omz/KpCnxlo12VqML
	WwOU36YE4qtdn4/9ppeoQ==
X-ME-Sender: <xms:5-hiZjSkA5A0UKlIE0-DlHkM47LuFMt0dtnq0hW9Z7dv7rjXj-lLBA>
    <xme:5-hiZky--VZDe5GP2sWY7YBZZhFBRxB1UD9IjaW4F_njHY69Q8yUMpS5mkY9GqXPD
    0HLH9oRVqG3GyKoDA>
X-ME-Received: <xmr:5-hiZo2mvrY9SKfWXhC7CECV-ABpsagxqWjn2uSHFLMS5dsBswSH1HElEjbrVxH34z6-7PddlVWp9PWOfh5DRnm5f68UdBpqG8Iirtw3G9ocXEv6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:5-hiZjAEry3Xgh2J1mfgCSpJd3c57-ZJLLHlxZwvRbitOQUuRjBvow>
    <xmx:5-hiZsisy2mHnB0DgMPIq706yqmGoInMgKZqkZ6kw97yezlZ6cDljg>
    <xmx:5-hiZnrdOkIMJzsjtvcAcOCGChFtkCqMI9hCGuyosLGwp87ZfEmjuQ>
    <xmx:5-hiZnh6IYF7Of3jjw3ZkIVN1sEB8tFTmIHF1UeRzEVv2UDLUStl1w>
    <xmx:5-hiZnTownI17TI3QOjtk13k9QjONq67a6fhQhnJ_C-Qrn-2nGNjBQb4>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:02:57 -0400 (EDT)
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
Subject: [PATCH RFC 1/8] dt-bindings: bus: allwinner: add H616 DE33 bindings
Date: Fri,  7 Jun 2024 22:59:57 +1200
Message-ID: <20240607110227.49848-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607110227.49848-1-ryan@testtoast.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add display engine bus, clock and mixer bindings for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml        | 1 +
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf65..65f4522e79879 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2
       - items:
           - const: allwinner,sun50i-h6-de3
+          - const: allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e40..7fcd55d468d49 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
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
2.45.2

