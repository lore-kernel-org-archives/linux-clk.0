Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942971;
	b=e9PNfc3CNemyWzRZIwRNdVEzsvAIcBFy3KBZi70AY+cYXbrTQ5lUXpEHoEHkY4pI5c0f
	 BKMp56vwvA3/YfIKW64ePVdyQo3+JWH4Gr4ptPSvhmgZ6rWUNPWBKUUs+D0MiFpM90a4k
	 EUSw4mXgKTuXZ6YFbtePZ1jatE8npVMkZ3bhhH2XP0tGJZrkSh+eeETKSlV1mxzJbTX+7
	 dkt9O6Tt06W6kzaqnM9dRRSNzR46wKl2gB40mwZMl4Qfn1YEWCPsrCt99wLyjDdjuYgVN
	 SlOP3wR33uxcxyFerBF183EIcVvm1B4e3gadfTDQMUItUfnEuZ4ZshHpjbMOEfxy0tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
	b=Ig+G/TmopnIZkqRfo4K/7GQxcxoCO3pHxOVOtorA92VyJnFsCM09vMvPEcv3nEZqO6ie
	 ggz3xyjo7BicELOh6E9S8M36puCVPdUqdVgfW7mNB3oItgHLgNtWQGLK7MsuPhHnPRPQM
	 P6yB+WSqfAP8ma9LEy0zgvBftmTHQ5XDPzmaf8RZNwSInR6iQ7tuwqsiBo/cMl0CS4vb0
	 jg9wgRKYeb81ySxsNbRnZb7na5kq1j0cE3PXX7oDWhbs9niQaEVz62V+alPuJYdQKyl/T
	 nyVNFJUWRGYuiIiFLuUr5ockycYsu8TiFfK7MOsJ2a006/GQYTt3XwA4xroOd8Jfa+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GRsVoBV+;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E0606A890
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 19:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044E0606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GRsVoBV+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so2386525e9.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942969; x=1795547769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
        b=GRsVoBV+4cTrd58Fb+wnm8ddQzO4U7mJCL3utONuw5zCrgwa5oey8qvumuKwS1X6f/
         yRx7Jm8TWpEKyuWzS16b27xnQJpn0JPrbDqL1BN8W6a0QD65KOQKfLEYnVqch98eGqkC
         BlkLURhqZ83m7VfBO9wUTNAPpXdNC94yTPBfkL6O1v8Ay0B48iJPiTcb9eZfVfzdX2RU
         0tmoAHOuj6BKEYtyo9HK6n+pSqg+RmcqqvofNipV9MFZ6EpAXLVzXSfdDnN9VZJBKHRp
         wgI3G4s1BTP/6ImmI+Z+DE7v0uZebCnybfKjxFZ7cyTd4Ei+HEWuSZ+6blYE7up/VfZt
         uOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942969; x=1795547769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
        b=ZOQQiPBQwN8bTz0QTRHixLLh9cQO2ZpxWztr3LmnIcHzhC6ZnNWwZF7HrsFN3on2mf
         orNgMo4kfNEeOfkfrkZ58fg81aeLHK6AEY7lsuaz1rPgtNvN2JauF8zFpqBfC3r3x9Fm
         9RP9Nth/iaqnNl15M2WhNJs/09GyiX+S8jAtueL6fExT85kQC2iKfgpqj6qINl7xe+H3
         UtZPbcJ7LgDIX59kpkOMlcQdJ3H5B0JUXccMCcWLGjC+N7NcQY2lVPlJuZJoCf/blTFy
         H8YNUlGDMPTB7cG9bmVqaX5UtkwgLsfo7pkCPlqNyMFeH4UYPtIll8cZchKoLhteoNQi
         iI4A==
X-Forwarded-Encrypted: i=1; AL+hErGQGHDab7sOMewEhJa3D6L41eBxvBGaN3g4VOG+NmSFE6GrGbqC5bK90ya6CdWzHC6SFq2d8tf9o3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YWHowWRMzlimcmXTVAxwTCQVcE9czEMN5Cuz2+y/kRyGo15dM
	2EIeemtGBUJvsy8TJG5pv+YdfcTqvZIF8fO3IhdWOOaano6UZq9GAfIHEjMyBUmexJo=
X-Gm-Gg: AYBFou3QXtbqM1wTfxaY34avGcBboDP9hfKPWsjjCwFculoZCiKWFqhvB9az5v4REE5
	si0R+Y8QmFc4aJ5gywx+vCfi7S1uCjMU/JTqsdo+NFF9v3gpKdp3kZLnIiyyBgVm/3prnqTJ+Lz
	wPLpJ+/AduOs+pvViLbvY44EhGeVNtwb7NWQ9T52qM2LzPiwRlljYfUNORrEZrzb3jQ8LQe/Ewp
	V8IA2PImQEMLeoy9usVEShpp3LoV9IG/YtxJchdmnhBPaGyzG7K4e0Nw/EK3xnSpZs6+C6vGcNF
	EG94i728d1TmLLfZH0ShBH7v82zHu8tvmWEuXfG0zQPtia0IHCUH9yTUUXsE8n9FOL6d1gPavK1
	C/t2hYNiQpPdn0nv3A9JsGTKFhiDqjVYn4j0rHh4U/TFEhZE8o0AaBsybdFTn8RAAAIxLZmB8li
	o4RcbE9PtwZd1MLKpa1wt5Y/gbN+w4HrAAtYqtcKl3in4ub2N8mez0qEeflk3QQ1Oe4xNSsMSqK
	puogBloDZT9gmDsd7Tvrgil+8/IQPpmb5lJ6sO2KnwnnMW9PHTeyjVp2FqGgCtWkF/oZ5oQ+6pY
	1vQ0MbhoNKorcHehGQOCRCRU+gtjxogDjIAZ9Lj1AaMXRxDeDEnkOB5y
X-Received: by 2002:a05:600c:8b83:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb7da55745mr2432765e9.27.1794942969381;
        Tue, 17 Nov 2026 11:16:09 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:03 +0000
Subject: [PATCH 2/3] clk: mediatek: clk-mtk: Add composite mux tables
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-2-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

Composite muxes register a generic clk_mux, which writes parent index N
as register value N unless it is given a table. struct mtk_composite
cannot pass such a table, so a composite mux cannot describe a selector
whose parent values are not contiguous, such as the MT8196 PWM source
selectors.

Let struct mtk_composite carry a table for the generic clk_mux, and add
MUX_FLAGS_INDEXED() to declare a mux with a table.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mtk.c |  1 +
 drivers/clk/mediatek/clk-mtk.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..b426f7a36e68 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -239,6 +239,7 @@ static struct clk_hw *mtk_clk_register_composite(struct device *dev,
 		mux->shift = mc->mux_shift;
 		mux->lock = lock;
 		mux->flags = mc->mux_flags;
+		mux->table = mc->mux_table;
 		mux_hw = &mux->hw;
 		mux_ops = &clk_mux_ops;
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..c7822a8d015c 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -93,6 +93,7 @@ struct mtk_composite {
 	const char *name;
 	const char * const *parent_names;
 	const char *parent;
+	const u32 *mux_table;
 	unsigned flags;
 
 	uint32_t mux_reg;
@@ -161,6 +162,21 @@ struct mtk_composite {
 		.flags = _flags,				\
 	}
 
+#define MUX_FLAGS_INDEXED(_id, _name, _parents, _table, _reg, _shift,	\
+			  _width, _flags) {				\
+		.id = _id,						\
+		.name = _name,						\
+		.mux_reg = _reg,					\
+		.mux_shift = _shift,					\
+		.mux_width = _width,					\
+		.mux_table = _table,					\
+		.gate_shift = -1,					\
+		.divider_shift = -1,					\
+		.parent_names = _parents,				\
+		.num_parents = ARRAY_SIZE(_parents),			\
+		.flags = _flags,					\
+	}
+
 #define DIV_GATE(_id, _name, _parent, _gate_reg, _gate_shift, _div_reg,	\
 					_div_width, _div_shift) {	\
 		.id = _id,						\

-- 
2.43.0

