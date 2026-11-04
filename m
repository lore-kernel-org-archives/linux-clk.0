Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818235;
	b=nnfGsg5p5FoXqLxtBh5VfluFiKONTka8nRKDcGEqQpSZ5rstpm75gz7c9R1m08U8Cihw
	 G9VES4gUVZfxm5NtzGeJtW3pl2tyHwQ/qhVONqmABmAJJlvNcqv8hctmezQn3toxs72bi
	 nf7L9pCh9D/wTdwgOalNZstHtVTSvHe6/wtYgLigFuGCk3FgAhm28RJOjcHhkEqtb1GKz
	 50CPeqsEUoTJIuXcMJTMigOGEMk0S42Mkm0M7e7Y6rQFEcyKI4LX0MkqD1phsFX/u7J9s
	 RkGef55vJQj36iImkeNQp4JC7yhv6cOOARv6OoVlPwze4XqcgjqMuBdMmXKd9xseRDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
	b=ynGK22P9t6QW3dRhAw7879JLwwMlv9IpTNezu2QA+PFsx5TDnhP/qIYeuRl3J4QK+KbY
	 XbZTGQUWrIwxjywGLqfKhQFfxXf7+yt4YP8uXKAEIEGgHJRZnq/Pmr7bE9Qld8obV/Kh3
	 1blJBxRjSA8CYDXGWBpf3TPIQZVIhtYgoCwGmRNv53uynQRVXkhwgivibrh4rer0QrckG
	 Zxd8o4X2LvXWsKHejaCW1ir/vKicv68C++6jQo13uhuuhGTNntgAdeFYdgQrKZggXwyp3
	 JRkyo8ofyVp5pOL+FgjC8mSZG1yuzJ19d+SASRQrifi4Ou8ACvG555iy5Ls8eTIMeeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVttMWLp;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A05606D819
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 18:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A05606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVttMWLp
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso915831f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 10:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818233; x=1794423033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
        b=vVttMWLp5uEBekMbz/D7wYbFBLE7jE3b5xgl9OS5+A0pTFPUUK0fBdI32bmkcmuqvK
         bAHH1CsNxbXewPaNyXqIp3nPt2Nut7eTfMPC5JyPt29tMx78M5CXBBBg+wN8yYe9Q4tj
         8v4MINxv3L1zCX2T4fZZFqYn7/uPckMx7fOMsQ4TydiEMr9w5j6LtVQjy4Gf2Imdhf2S
         Pbx9QOXUHW7BOW0mlW/OBs/c0AQy97VnAxrvFhuirZV3gXKpRr7jEjhoKcYdEaNNKYw0
         rders/Lh3SKGmO8X2LrKlVeyDymXMV3nR4Tq72UOsMzNsaPSsdWUIPe1wEinJbspsIWy
         QnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818233; x=1794423033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
        b=1nmFxDfKCJgEfBaD2Hw5Tdn08Nf2XC1G5VlDJBreJVAV/tER5Swyd13fsGfCENS6+8
         2Qg/Igu9meP7g4lnuEKaE5CPqFrTLEiQHa9/RwD3Hxu59G/UARUcGxCALCOozR0Jwa3J
         CJWXt4AEH0McvLzYlNXXtazTAx5Im6mbqOuTW/fjkmXvH0J4NCy9veBceh8uLqEBV2Ya
         FnI/2IcWdAWenB1tGRpcREw0Sm3kTKKpFinX9mjeu4v56S5LoA8iGb+NmAX4Wipx4Xb3
         GH5o1YFn0ZO4ua5mb3AKzZdyeVLThnoq0oc0WfcNukdQFze+MzL72Ss75z9a0jf6RDgp
         vjgA==
X-Gm-Message-State: APuU4Z9+9B8CJzYRCFXO69UAoXyRILkO1Td4E5HWhylpWvdDyKMkN/z5
	VMa+7BC5sTUw8jZEkN1Yy5fGSO/XzzERpBTKOP2dm4pEKg513wqS8Hld
X-Gm-Gg: AYBFou3uzxN3vF9tEw07ykR8RWC4TJ3vhT87Uk1JXgMUZvU2ANbKzeYVVgC4bYUEGZ9
	iFVVCGefe5+zlkbG25ONMX+iZcd3TOLN0Hln8T2rPc20QNM1Oq04OCMGZ5oiunku3uCpjw4IEnL
	eSpWTrkz2i1cqHKjxjWs+SrlLLoWjhJSS/OroF6JqIh/mnECUJyX0rf1PA7m4RyFQ3n9LHB56vH
	KzcnJUioHx3LIPEPR8s0C9rKx5fuv+qYNleuZvt32fICUcPhbWelWxXsMzTcjf+NSu6P92mjJkM
	sEd/GbP03hMbnYiw73oohIdbrlkVUzaR78PphQ+B4rsWLXU8S/otNzBue+1OM4WicwK9q53KUz6
	AS2/igl2aNx/xRQqA7DhYAuuAVeVMuVaGJObJC5uODjDjAwibifnUUq9ZV0C6S++U2j+Jxp5uMd
	uS3QgVWAxWDVDskWmF7Y0oEao0RPWdFzFFe381Krj0boLjwPJtN6E1Kz764JPu9MT64LIuOG3qd
	etyfVfCzes7fWys/rDfi/gCEnAAXQRB7IIWV+uxFzZ0b55rVlPnvQ8aZETgb7yM4aVbRT67raGC
	j+iRgLQfszXB5aufa5GcD5faCcLOadMgMErthb6wwrEaf/hVLo8NHxkZwj8xOmgYMeki87N4CdK
	YIcGUifwX1RBFN8nxrY2jKHOgAwKDJhv5quwLCFdDQBaq8CZf/1PdHJJEoqAfO3U/b5sqYm91aK
	OftLpIl6dpR9jS3ZeyR0gaoQxNhAhbWwDyDdrFdonr63Ngz5XErq5acdiDG7cUI77e4yiHFLxKk
	gROFzrwGkAtl/qsgbWSn1CVC/JVDhIqHogTbBc3kJ0U9X1PR1qtwWmDYGxrSPYe2Uk=
X-Received: by 2002:a05:6000:15d3:b0:490:9fe2:6a3a with SMTP id ffacd0b85a97d-4909fe26b79mr2502099f8f.15.1793818233140;
        Wed, 04 Nov 2026 10:50:33 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm5399898f8f.3.2026.11.04.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:50:32 -0800 (PST)
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
Subject: [PATCH] clk: sunxi-ng: h6: Let the SPDIF clock set the audio PLL rate
Date: Wed,  4 Nov 2026 19:50:27 +0100
Message-ID: <20261104185027.883011-1-jernej.skrabec@gmail.com>
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

Unlike the I2S clocks, the SPDIF clock can't change the audio PLL rate,
so it can only divide down the rate the PLL already runs at. That covers
only one of the 44.1 kHz and 48 kHz sample rate families, and the other
one is sent at the wrong rate.

Propagate rate changes to the parent, like the I2S clocks do.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 7fccda96d444..3e8e79871eb4 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -571,7 +571,7 @@ static struct ccu_div spdif_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("spdif",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

