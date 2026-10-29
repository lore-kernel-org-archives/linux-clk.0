Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272077;
	b=pQ1/41IKwchNq8w77SvwDWmIHZ44x829qym48XhNeCMU50pE98mGp2VHcih2m8Faqkdc
	 KszOCJKftA0c9/2KMpt5qAF7t/MeGXRgsa1q4MpvNWdnsdU+5vWHDpcjAVkKyrHBPUSeO
	 QwpzKMNJKm6m0HIRFfwF+MHiwpPY8jYQ8mU6HGewH2loRK4kpofOlYe/k/gwHzvf30dAB
	 sHpMO4z02dXgyu9a52VGdCKgFEas4vBJJIp2unYk0fm/YUbZh5qUToa56rHSJnd3TymzI
	 mptUXj9uR/1GnFVJo26jw3SLCejz1sJFpvAxmksdSSfPy7lxrN3nvVWoaxUv/A62QAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
	b=GSE6qHZldAnnBvyuOFjd1C/ijdN7pPGtWZkLIhM1Z0/xzvMjqIsfsqHgZmcYnbXm9gR5
	 O9Jw8EC3vlfnLlEBVGfTstutHvExzjcsu4zYDPBNLyfJRYWUICNPw66u7BPO6ExqNfJ13
	 TS3kRcuC13TtzweH5hUhmoNhrjYu1zwhVjHpq+RPoqGhaVvtjzp6ovBxSL40IjcE0qW4S
	 F4ooByeDlbuuaK9sa7JgtuYti7tJMeZdN25ny//g/FzUZDU7tX4eum5QASysBXpWj83B/
	 nlEgIXtteZujZpRdvCLtCcY4tFm/BSrMgNTWXhH18LmO8WubN+r60p4tqVwjWobG1Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b26XpTLp;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB3606A31F
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 11:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9DB3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b26XpTLp
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so20437495e9.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793272075; x=1793876875; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
        b=b26XpTLpKF6fBgd1SpM1HN3YP++sypJAEWKvuHcmC9SVClzkNN6Ro5HAoHq5Ih347h
         CSu13J5X6sy5xPVlTGXIM4EfkbKz5t3s8YA86w1Z78aQQVqr5w5JEg+opd/RJtaPH05d
         G9r9aEoqUR9M2UsEc6cRYBJSVno/2g9dSaf1gZEiTTZV99IWHJIqpmtK28yWeNodQWF6
         7lIkO7o7U6Hick4F0ypvW4rcDlLCGoqHFhpYAdQzg/6muM1BuV882NhJP979ywAYYcxi
         jRRaNTd1LLp8+jkfLjNLGeWDdW3RF/qxKEXAXInps/XspLHdp3iva/Z+J4yGr0oRBfiz
         BrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272075; x=1793876875;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
        b=eOUjSLsBd8zXkt+EQ9RRQQAbR0ns0hDOIqV1XuQ0HEEXr9ycBPYiy0Y+Twl6+4Sfit
         1kdmwjwrrhHdK8hL6nhksj6FpzDnXE22za7OXoM3vRO+hoqA83Czsuz++kuCHFe2YJjj
         2GJJijn5c/5EXm0k0VWDMa8HWHbWjsuP5jGiv4OGIyV0zdkEBPOeDvkfqV8JSZaFbj/8
         6oLCJrcT3+dqDfR8T5j1MZSB2sC7my+xTU0cspLbRxSqiDZdq/tb8X6OFRh8ixtnrcOy
         coMab03Zk5CNt1GfDoT1rvid3HARamAPAPWYxhbiQhlHoie11nZegpsE76gKIk42LsiL
         beUg==
X-Forwarded-Encrypted: i=1; AKwUvBxIAn++zg5G3/lbn7fBbTzYXXuzzs6h9UcTGeSdBNWM3QmdjV26d8jyE0jbBnJWMX7I7pfLCvDE0Ow=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXWm0mO8RFZSF9vorH+sbd4idMTy23jQbE3nKXenlYfA21qiLZ
	awRWQ0xSVafmcCy39WenjeQ8Zlf/ZWSYQdhMWW3kn8xEUNjCci2+tScCumqmCJW2O+U=
X-Gm-Gg: AYBFou0YZsDMR6zoTDwRwdmqhyAqxRP4VKd0DsaItqCm4pKdYbuwC4cgYYMn5SsQAKD
	0Pu+0wrVwp8lMB8poeVZ9h6mM3CNCK6M2JcrKDWGCXMpA/vFFH8tttiyLRdmTgo9x9DuFZGttxO
	HuukYIHed2A8Usu5a9271iyblO2b27b1m0tirO+pcoUiQdChZDIfPj9fVE8zdijypEtokKonPst
	uMpXF3rNGVUPkgUW+ItL8sSoe3G0whhDTw37i5l/yJktx5xffB+FNVZaabY3sbimywgQjDfYOON
	K+noGInipAp0llyrKK/om9lcMSIstv8ywvFf3Yu3Af8cSqBf9L2r9qXoVxI+zwaNQ6bvb4iYjGt
	Krdzdea+GUgJhH1XwJ5BTL2eX6kp3EccP+E0npbUg1yQMQSYp8nIBoOdsO68Zi1B+ocUymWgLXH
	/ZH/jEYfMP1YnywKFniOSTaOrLxQNZcRiZ42ApZF2zw3JkNu6+18JYEs9hAD1/9lesiKULMNA+I
	7h01asEPHebgEPGP6jPjyD2TE+mRvlmzqRqlhU8R+IOHgE1cPMxj7wpDJRWoP1ej2ZuNUfa5Wcx
	0+/2zsMQVfyJDirxALuOaSsNdwbWqhrVEyz/g+ZOvoG13DlEYWC84PYGx1W7xHSOUURLjw==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr123729855e9.11.1793272075153;
        Thu, 29 Oct 2026 04:07:55 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f41895fsm51035565e9.5.2026.10.29.04.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:07:54 -0700 (PDT)
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
Subject: Re: [PATCH 2/2] clk: meson: regmap: use the current divisor for
 read-only clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
 <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
Date: Thu, 29 Oct 2026 12:07:46 +0100
Message-Id: <179327206664.1865333.6840169064466594528.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=586; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nrVNC7hHxSqNoUqQLRJq4FIPYelw+3Hubgb0s4fcz7E=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPNTmumOoztc4onjjRI3Jmxovpf2OeJ7SY5/xuKV3pv
 8fffgV3RykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbSJczwP03juURXa+0zXYU/
 u56nXgy9r/GN5TiH6OJfAmbdG2vuezIyXLtkpNMdHKzwRN1b7ofSgcQb547eWz7d+AjrkuO970/
 xsgIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> None of the Meson clocks using clk_regmap_divider_ro_ops set
> CLK_DIVIDER_READ_ONLY. Without that flag, the shared rounding callback
> can choose a new divisor even though these ops cannot program it. The
> clock core may then adjust child clocks using the wrong parent rate.
> 
> Make the read-only ops always round using the current hardware divisor.
> Parent rate changes remain allowed with CLK_SET_RATE_PARENT.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Fixes tag maybe ?

With this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

