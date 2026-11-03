Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695243;
	b=ia/rl0PIkCqOhbsqQy/NGb0EIx/a4wbq57MrqRE3RnDYaqwOaSKW6FsLkRJWXsgchwmP
	 VjJlWl5FXlrvO7M3xqPRjWBRJOBSQ/BY5mX6WqQdMVR0xSaVCFTgQMfHAyUVMNxSuAeLG
	 qzeJDftJWAFIbO0etISNLOr+Ehx7IxyppC0OAIdDGA07Pf1xElFLLUJhJypf3pNvBMIGs
	 LDLza+kPdPZcZRG7vTeLiXZzxTE/Zc6adBWwQZ7Xy18h0JZvTam/nDHtDR9efP6FMbjhp
	 LQfe4XpzNWAgPJ9q5ZVZFMqIxOO0RdyTkOnevBpqMLwLD8/rWCbkXOo7N/shMgkO0Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
	b=Fzu7l03dGMWBjRAsX9u4VHMRSscEsVvhj3Y+7PmmgNKTt34/BIv7cNHjzPNl42Kh5i+g
	 PfZJI0vtFcVn8Pe72QmIEQ2NrlVXBBqfD13AhGyNxL3YkipJIHALwhIjQKb1Y/NeBE7Lh
	 mNfrkBWrK3sxgKbL9Zv4PmtId3pv8YrK9NTJmy/jshQM8+wlJzJ9P35oFMqTTOWdWYLE2
	 CCXEM4CRtAdCaeEytzouIewMK9u0zoTFWRC3tFQHWoh9abHjWsHEsP8jfnyDF0HrB54dz
	 NeEhnGIWRsRJutAMatjmPOobVwHLfX+rXsGDeb4MHKxHA0MyJG+W0Fb0FuZq4Nmzrvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOLJ3DQY;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CA6606D82C
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CA6606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOLJ3DQY
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6fe4372c5f3so2638848eaf.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695242; x=1794300042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=tOLJ3DQYUFTqy8+wS6aTVUgmEJDaN815utBQykLJtiywUfcmccsn78sCFPD8ZoSt2G
         aAnrlwTAZcUd0R81aIngQrYfShPsw5b/1f+sc8Pvpb0YW9CxILEJrup3gvGCi3ngRyAU
         CPu/cNvPg5SStaa/HH0Pc3bf3TsfSaIJbu0R0ot7eOHE3JrpS1zUQbwx6nByNeDLjMfJ
         CWr7H/cfO+KEFKPRT+NfQAsJOsajqJk9b/G1x5Zgj5yTcGdqAgk6/J5K7wFSYCp+SdLp
         uSXAt+TynZBZ5IfBVxLwRmOQOtNrRD2Yh/CPIre1vvNVHFNuJzLE/c5watJNX+FII9on
         SwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695242; x=1794300042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=prLtqAy8/kbjl6PEs+OU4qBIK+k6MGhpgAVCiwkFEvuluLFo8umo5wY1ey4I48zwcw
         Qs10p3VXQqupAiSsnMouHpyREQ2v9dRoctvje696d9WwlR42M4+5r5EorQvWA1MrStEa
         IxoWnsSecTAuHNNYjndEspCln/euviGBPDBHTS7AUp+4jN+3hMaiSfFjGDN8qJ46Jv7O
         5GHujToO38Ctqls0Mza161ir1oM6o/cpcZP97Tu0YPaFQp/ntUcFB5FAerbXK6PqpRYz
         9o+FczagjGQX86g5WNOIzenIWqmMr7xJR81FOqVcFzirdQEwrKohuD5/n7iiNlq1cZoW
         V8og==
X-Forwarded-Encrypted: i=1; AKwUvBzWMeKR7eYjKFfd8t3Pbim+S9J3/h/n868l5rcFW3Y32IqAlnah60cqiOWplgQGGXekqxAKi/Sl+c4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KHaWnr+j9N898xLxwcKbkXiJF8gL0pbuGxJjgHO9gwIC2M10g
	EmydsWmS0Re9vZTnR+gD0Na/qTE3uArxz3hM9WnVtyd0ri3i8qLvByLR
X-Gm-Gg: AYBFou1QiXl8c5jf9oGdDgBVLamiRbFfAjUnBxhUh/vuzb2y28q8Ccg0t1mH0ULOLdQ
	6gU8gHPNXcRcHo4fxTT1TIG9nIPY6L0kXU/AZcWlWxN53ANe2X3GCVzcEValk5Z3V0HsImv3b/j
	l4w5/25OX3Uluvsmph6+1i8H6IZc4RhR5E3d875WZI40E3AlKMykfc8vFB88EXEWmokQdYTreFL
	W1iWa98tvQxNxbPPj8VqS6jaUu4t4Eo23eNv113sb+S2/j0+DHUcyOCTMOo9zIeP12THTkU7D/Y
	wmtZZq3lVDhPhJb9KnKNGUYkkdT4HmakVgMovaO+WpE08fplHJgZanMoYQFqhI8Qs2PEtSIHZlM
	GZBboGECxX2OWXAs5mDlLzJVw506P0NGav0t2aEKRXPRQLl8pwX1w5fuh5YQmhl6Sa7yOQLwJIt
	sK8K1j0WjyT3MNE+QGkvAKEp3xXe5mHd1UfyrJdlssOGIOUxS14mKru3rOUJyf/an9u101tJ+6v
	Bw4Ll6T4HJYhJc8upkfarHMrrq6JkJknYfj3WjdY+uHVoly8/zKlXX02iYpbSkX0gZB2KTuNIvd
	xz2NzrNOuq2PbFQvSHXQA3h3MpJYLKULUexf4rec0wGDIndo+1S2c6sYssP+zlcV9j0uOlWeWtJ
	gKEvfc92thNWEWtXpUs87YK7AV2xcig/XI4j/PMMGuWiBJbBazoI0vssu3pnSEKnWHAsmzla4/j
	B+l/BLk2jKNhG8+rTgapzbdMcPdCdCjqclhRBPjRNePN2VGTEbp4Y=
X-Received: by 2002:a05:6820:240b:b0:710:8db7:5f57 with SMTP id 006d021491bc7-714f2ab5e9amr5840218eaf.78.1793695242282;
        Tue, 03 Nov 2026 00:40:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:30 -0700
Subject: [PATCH v11 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
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
Message-Id: <20261103-h616-pwm-v8-v11-5-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b80ae0ac5eed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -947,6 +947,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

