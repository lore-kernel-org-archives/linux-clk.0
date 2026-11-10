Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328751;
	b=RNXQLqXNJzmFvgVeMTqZ6PF5O7HtOpxapCHY0bTVfrWjiDAh8WywnaFIQbs2dqKKm56h
	 4Jywf9HC48N2fGdSSb6/kqvVLqBJiBRE5ouXNwVgWIqDIpquxMmF+TD37MX7t7Y0P7IZs
	 NKcpoQJmjOza3uMw1NA10owBJT7or30ykG8Q52qSeyefL0mDunpAVnle5FrJX9kKA68AU
	 /DDahXBnGBSW6pvQ275/BE30uaW/Ue8TFvlgg3Ck7i413qYZ3zsoVu76to9O1dP9zNQ6C
	 hCfMajjU6l+HvfkSWTpiTFRYgXcp3+bDjCdq7HTep/TCjwRp3/8G8PDZedH5iha7TFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
	b=Y0CSU4AKoVZENc7YF+vfHu6l2aOPTnIEeFkoGmB/tTQOrp8CHu6hgdx9yc11Sm+GV483
	 KGVaJ87Z8/B89WisQuGa54ct9TvIgbKODIzLAvHFeuIse9SwYNOzQNl2EaH8bPdBQYg5j
	 xEWJ5YZf7nngeNm5Rd3hK5L7zNSe5SpeBkSnZ/Vl+ByhHcQ5AYn8J8VxgG7OcwLvlbuEH
	 sSmuEDtBOv8zvzhcjTOAeISfoNpSojdzWRkzBa2dZgOxbpyFm9tZmSB5iSOOJdQnuAa1v
	 O69GYxz225xYgjucejSocxMDb4WaA+mdw+eEQM2AX1JcDfUtieds7G3o6w84MHhVC9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FXU//d8p";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8EA606A20A
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 16:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB8EA606A20A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXU//d8p
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1531631f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 08:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328749; x=1794933549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
        b=FXU//d8pOsy9podTaNS7TxAN7NZ0x1Auiy+e17xXsQGRXxy70dAmQtboqPh9IKHxo5
         15uk7fvsXCDiKnhpoZa0okUmtr2CrrECoKCwiwsqL54mnPOvDSDxBxJb2dYMz2LRS550
         tv9NxPZqoXGPgh/BYyMLWhveLCzPhw1zxFOvoXF9iy+QMGW421ddmikeIJrINJ8AW+jn
         rHCfy+JDFNvlY/X78nOJdFchweEOC17mF3RSvJR78sCjIfmENxETapXbEacIy0RZcjEc
         WBuN8YfovMPJ4tRnM/Wb9s3d0utdl1TKih7wUZkeh/93JXaRZnjWup5qAZbfK8R3Xs8d
         phaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328749; x=1794933549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
        b=2GblaJuYqIkKZzVLdheWjc4sH67KJqwL80VTmoQACsqG3AfPm+aRtdgB1/uNYm1qhW
         +U9tQlaSy9W3LoeEPsfygrTPg6OqRTNjZ5o+J4kGN3pht+7LMwVr+ubXmm/hSdekqw51
         u0NCxU6efwPSyNPIJFT5dOTujQ6AvN7keIpM5ht7LwbPCUIu22XdaG50YU2t9SA3k0CB
         kDRog5xVS63jC+ThbsZHcuI+9XwkBZBWVWLF3nv9Fl3zKDDsSUV2z6/3PxWA626KoVyy
         kThBTXqdE7sz1JCnpCBKVaUWvOAqd/ef+6hzHHGLTS9NWgNPN3HYIVW+CHLLeErhuPCw
         /IjA==
X-Gm-Message-State: APuU4Z8aZFrZnAgwqFZiYUMD/OgRdDOMK8bctthZBSCDyriAl0pVSQ1w
	qYGvc1pY4etbuBfHtwlCgyTWvbI/7GFmVtQsit2kDa+mgjhkbjPLwwzB
X-Gm-Gg: AYBFou2hmKHnv/KZ6ueUVV40rwQLjSjQl1DuGwho/TtasE+vhF3TdumkHITEDwYtmEQ
	igNHz6aBG0xpZUU76HRLCrWgj6Ze1uB76xdGfL/4WbhGPZsBaBMyZ/McSxx5lVBdJGaBFTqYHAT
	RVyyQVOrxNJxhrwiczfAYrzfQ9K7UZ4NQPSjx7MuJg7ennrXCP51bxUGgf3ClQ72GF/p02Evzb7
	MlUO9Tj3xfKZGbAVU4nzkWPLIWtQjxqbkImvQ8YLf2sxqJaV+1ifsfd95oP1jN+SckFqxqDQWV7
	HHszra7mU5bOFVg71Nt/PIno8RGiVKr/wdUgmgR6hpSqDLVxbQM0PnkRZ+MdHZB/QTGNRFft9Os
	+uqx6MM7TN05hgE3XLDoWkuYQhWlr04geXvhw5NI5mXeAFCVg5Q45D+In+WGWM26GfRGZF9lJ5B
	yahPfB6iHmWwIHjGLxStQKn0YwxUNjXu6TNC3Za+DClZZm40mj74w/vUerHxi+7q2rt1SKVqOiL
	KvFQA8fJYSN3k9iBQxOW812IezA3k+EJ9K1kzdz1k/6bm0ZWrNqAu4TV4m0WLfcJE2r6xZfFOfc
	UaRm4/vmkpBGqTCM4QSMkpuUgK6CRzcQ8y9dE9zkIhQx0+LWFmu14aMjaY0ymmZpVxQ9KJnYaZN
	hBvYk0OjRO0G4T8/d0a4aW3KuAKUMUmSdnP3TYuzTTepN+MO0Dny9RJ2gPZe5PEFFMNg2BucgIC
	318uQIRxU8P5pMPuU7UtlsQwLUcC0knHTcTKfACe+Bn0CdBMaVGz3FrLiSxtFDWj4qmTJj0W/iJ
	SjHXkuxGuQOnweBPvSezrbtT3EkSaM0LBVAH1nyyw==
X-Received: by 2002:a05:6000:25f7:b0:492:4156:b8f2 with SMTP id ffacd0b85a97d-498318fccdcmr5748430f8f.54.1794328749233;
        Tue, 10 Nov 2026 08:39:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm5888355f8f.10.2026.11.10.08.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:08 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Icenowy Zheng <icenowy@aosc.io>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h6: Keep both parents running while switching VP9 clock
Date: Tue, 10 Nov 2026 17:39:04 +0100
Message-ID: <20261110163904.1098187-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VP9 clock mux only switches while both parents are running. Its
reset default parent is pll-ve, which is off at boot. When the Hantro
driver sets the clock rate to 300 MHz, the clock gets reparented to
pll-periph0-2x, but the mux doesn't actually switch until pll-ve is
enabled for the video engine. Until then, the VP9 decoder has no clock
and every frame times out.

Set CLK_OPS_PARENT_ENABLE, so both parents are enabled during the
switch.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 7fccda96d444..a10f0502c5c1 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -336,12 +336,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(emce_clk, "emce", ce_parents, 0x6b0,
 static SUNXI_CCU_GATE(bus_emce_clk, "bus-emce", "psi-ahb1-ahb2",
 		      0x6bc, BIT(0), 0);
 
+/*
+ * The mux only switches while both parents run. pll-ve is off at boot, so
+ * moving the clock away from it would otherwise leave the VP9 decoder
+ * without a clock until pll-ve gets enabled for the video engine.
+ */
 static const char * const vp9_parents[] = { "pll-ve", "pll-periph0-2x" };
 static SUNXI_CCU_M_WITH_MUX_GATE(vp9_clk, "vp9", vp9_parents, 0x6c0,
 				       0, 3,	/* M */
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
-				       0);
+				       CLK_OPS_PARENT_ENABLE);
 
 static SUNXI_CCU_GATE(bus_vp9_clk, "bus-vp9", "psi-ahb1-ahb2",
 		      0x6cc, BIT(0), 0);
-- 
2.43.0

