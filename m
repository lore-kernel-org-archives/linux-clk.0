Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5C3B813E
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986343; cv=none; b=kzSfYIs79wEc/SQWHZbKlw9HVHkw3AXX4XIOASpyA7+q07tVjRtT4PjkGR0Yp7bwdEwmsmkx3KCw9RxsQ3c0SiDG37EyH9vNBKXGlPQQ4TQJR0aV3gyKbNgN+kPAq3U6wWaYbtAj3We3iUS/X9GayM4F26RKmFKE119YzGLsQk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986343; c=relaxed/simple;
	bh=WH7ygTNscZDNtrCTOXSpEWJMVHfsRLI1QJDnre33/jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgdCIdN1rYmc/cL1fTiJx517KdLzN9Ja5iNLRob4twXbbpJxLpmyphXiG3u2yFiUXDtJNoPVGe6fYyAwM/kyD/MxxXZ5iNjlK001+IgLTRIYSzwTc0aAu2eJ2ftMmxQ2FPT5W7+0qfGq13t7vjNZvSdJB9kYqmJ3NhesIJLsr20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=necy7xUH; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="necy7xUH"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e2254dso352527b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 03:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986341; x=1790591141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JR7S6X6iySsYfrgafldkm6sJ9nXMwqRmDnXnIDDxCr8=;
        b=necy7xUH+G6A8IvaT2BQy0AV3dZAe2ui5gbyddK+NWFaT1ZaS7WYbAWC1PCNzOrKjg
         anELuN3n4tp1634mbbl85MGDa2AkTtkokRyd71BWKoJ5QWuc0ZdUTwQA5RD1GARfKwjM
         b/Zt1E9BTxEkqcfrdXHBz+w7jyrVcsF5Z4hFvyf8CX6eWPFFtdW8gNwzMJhLTTGyjsXg
         91kGJdziFGhV2MIXWqK3WYmeMOnRjtV+KOTgsqlb+q0/ZLf25Vicha1yWis+93bo9kY6
         wVN9qtFMWGg7fof8WvuHOHaqdRLSOSgyaj11wdCdYfCA8xqPp5EbGyD0w6VKJx9Z9BRQ
         I9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986341; x=1790591141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JR7S6X6iySsYfrgafldkm6sJ9nXMwqRmDnXnIDDxCr8=;
        b=N9bysqnu4Y8sz5m8il2+hCDXHQbvYeXmcZTOE3J44bSuRcaAZB7MBHRUadOWXHD1hM
         p1AadiNE96LZkHSlk7+8KI5VUWnXLYzxgAM5x8nO5QmAr8ZTx6nN2uNZrvZwuvzFH6/5
         +CUssCKX/IlqlpxRGwKnCDlkW9WRwlMXthXTsmXGs3WhGyGA8ENsTlhmkdFEwrQpCio6
         aLPtg2GneCHkjm71C3bUYDVhtYHRxwjkqIp/0NSPsZFLBpTltwzWgj29h/nHiBsgf1+0
         6tAtnNj3mBtmPyI8SQ3pUX4bEOxIONDvhLUmpWkG+JSQS0j5jE6Hd0JnzyMx7PLSd+kT
         P3QQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2xSsayml99QJSqcxwsAKIhIUw+2QwtgtTPrTndKtrWUIRXdPmTi82yBJNw2jUTPvNAfsMbm+XGkA=@vger.kernel.org
X-Gm-Message-State: AFuF++lh/V47PkRdY3o/vSwSDWLDcHnD9zoi5DNnX03sxJmc3T0aMwVJ
	grzuogJdEOXFYjMz60uvgp+jkhFjfVjekEK15i5XdhgyWvQKbzADlEg0
X-Gm-Gg: AYBFou2L4u3tqYyEUGZRt6E9r/1S3wfBE8z/3QQP4qf/RRJiSEag1EGrFM+xIxTP0R+
	4shhtCgdSiCqraGxBjzvsxjGteFTlbALHwn73I4qgTbnculgaA+Sgz/EiK7b7tDxEEKhwYkINf+
	cxGsOT+tgwX79PSzhiFa2Hu8HVqOCQLY9AysphwkTe9nJfM/R6xBrmeNtwRWSFPqb2j7VOP2W9e
	Akg5uqZcmgiTf4ZSaxlWSuGwm/gVoJ4/ZvIrcEbDNTLx2Ghlfxsmp9CNgrTYYZvPnvMeWKGYDuo
	lWDgKTOZ/vf0NJGLxmaYUvo3WBPCmYkSDfdzxV9T5Wl0XyYgXbm1GycF99BZNP3LTEnAABFoqbC
	++oSc2tDWoELQNwX9bkDMoKk6C7edsOxSbX4GbT9vxdgaxlzubC0S13o72rQBop829lWepy1Mqe
	clXfuTuxSU6fVWg/wJWtE9YIcZdVni7gWUHq0Du+RNpy1NrmWSWsUxQBsOP/VfDdjSiY4F2mKsa
	jRbmPFe9+DJ1dkVvUUHlGD+HPKx
X-Received: by 2002:a05:6a00:2986:b0:84b:e69f:1b3f with SMTP id d2e1a72fcca58-874d3584850mr9977483b3a.8.1789986340714;
        Mon, 21 Sep 2026 03:25:40 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:40 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 4/6] clk: mediatek: Reserve missing MT8173 topckgen IDs
Date: Mon, 21 Sep 2026 19:25:20 +0900
Message-ID: <20260921102522.1640072-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reserve the unused clock ID 2 and the binding-defined
CLK_TOP_HDMITX_DIG_CTS slot in the MT8173 topckgen provider.

Neither clock is implemented by topckgen: ID 2 corresponds to
the removed DPI clock, while the HDMI digital clock is provided
by the HDMI PHY.

Keep both onecell slots populated with dummy clocks so the
descriptor-based allocation covers the complete registered ID
range.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-topckgen.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-topckgen.c b/drivers/clk/mediatek/clk-mt8173-topckgen.c
index 42c37541cebb..9c50f66766b4 100644
--- a/drivers/clk/mediatek/clk-mt8173-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8173-topckgen.c
@@ -624,6 +624,11 @@ static const struct mtk_composite top_muxes[] = {
 	MUX(CLK_TOP_I2S3_B_SEL, "i2s3_b_ck_sel", i2s3_b_ck_parents, 0x120, 8, 1),
 };
 
+static const struct mtk_gate top_dummy_clks[] = {
+	GATE_DUMMY(2, "topck_reserved_2"),
+	GATE_DUMMY(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts_dummy"),
+};
+
 static const struct mtk_clk_desc topck_desc = {
 	.fixed_clks = fixed_clks,
 	.num_fixed_clks = ARRAY_SIZE(fixed_clks),
@@ -631,6 +636,8 @@ static const struct mtk_clk_desc topck_desc = {
 	.num_factor_clks = ARRAY_SIZE(top_divs),
 	.composite_clks = top_muxes,
 	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.clks = top_dummy_clks,
+	.num_clks = ARRAY_SIZE(top_dummy_clks),
 	.clk_lock = &mt8173_top_clk_lock,
 };
 
-- 
2.55.0

