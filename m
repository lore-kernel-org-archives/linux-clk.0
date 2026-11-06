Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953837;
	b=PJ3TxLbeftPj4bivS4uXfXNiDuWXbASEEysGi43GV69keWuoevSofdvjYD8ATdtuV8kv
	 JaoPq3PQB/bPxkdxuLTVUibdmJrIqtOwBc/iHeKiM2FOpIQiaHgxqXUb4peHc7zR/fEnI
	 prX2jOU5+n2FmDRc2Pqhj88zO9db+iDhIflZjPEQ3DY5A0uzPVhMyiC4n3XYEW++cPg2G
	 GbRXndRzPU8BUmI7hopqDzdf0HotRnWg/yl8fjWTkukkvEc7LVtl5e8yKycWpgZJBtURo
	 OHVvfcgv1I6lCYQAUOIjLCvhqULIp3mcp0DXmtwv2UcNfwtzOg7VuKDA9SLmYOO9XEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
	b=fVIecLMkaWloyHfEZMEo0hmyHLEApWA3gNyRBFFJ4Ur8OaXbp38mL96oSFP29NKb7FHX
	 cpl4MaECOJf6kVeR4pQXcJBqA2Y9jO5n63JGsbkPl6iLXe5+/6rOMgnrVP5RM1uNwBp71
	 q2dMysHysUxKuuy/2VTflts6w9ChgSyvdcNqVraJo4+KSPMU9Q1W2fAJWSOHRDXVD8Ple
	 D40zWbLTPLtheUtJcXxt7IM69K0md6Q9Z8aObZTUZGmqts9XiC/tF4a3nhFpL/IkKCUR6
	 DpNw9pdaIXPCS8noT5Pma5FEiqG1amkeioPaZAWchDeK5fg+yaItoZFnpJtOk128SaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y1eY3KP3;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A81606A331
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A81606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y1eY3KP3
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491971ac844so301791f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 00:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953835; x=1794558635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=Y1eY3KP3gUC2WREteGQ5tKEYe5s3n0BGTbCtGv1+dyHdwaZ0qcXwHLBXys/2W8YHU8
         mMvi7yD9IXYTcxzl7tbSF8l1dcHpigt/dVkgwwENE+ZOlOi4YGsesxOuYcTqT3z5N7qj
         IZZEIYMeLTiaa+PUjI6Bd3QrS/8Ss26PVTAc6TKY8TibOS/HEP7TABU3kI+4ZjU84I39
         7YTLxMctNVlZsWII+ulLTV9dhdGBauvzZSdBbSt/rZ9QfMsmhHDVCFNnWO1iUQ4WFDYJ
         450Hxqyu7Yne3NPJ+Z8hr4+EnNiZyDYYr+L3Z9K1zv8rhjlWpXi3VPsTBoQPwq7bcqU0
         ooQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953835; x=1794558635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=hmEfuoVg0LKTFTYQqOI8x1/9+LitmKZeeZdeLtkEejhLiazO19H6wdNTI6pgov7UCV
         N2P9Wd5M+zlJkEJi22C1efosDI3NxkARn36u8bDjWYjgqPPZbUAYfc5ntGYzxkHJFlKh
         iCr+P0Tq2MuLFrOK9qJbJjls5KJrh8qkai1R98Tl+DzdQfRkqEI9LO9bQuJyqQTkZz07
         MSEArSzoUNPIKhxobl199GS1geuX8tJQ3gWfKgLMWPYtVlY60RzwoUPvavsYNk1v6YnB
         rxl6fnuJkPpZRvYMqCtCQdQKaeh2E9i1pzcl27Jt0e6yu7LcyXihPJtV4FWSmO+Rrv8w
         9BHw==
X-Forwarded-Encrypted: i=1; AL+hErEiHJLqqtZNo+95BsSjSWPbkjaPfV7rnp2KArrNusIcnkipMgVCYMYtwlUMISP+ug34o3ViE1PJUik=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AWFcpt6RktQnGnrigIWI8al7YtISpjGEq6t/OGPXvfv3YCO/5
	5Umy5a2ytycwZVE62FBc842XRXvkrsZBUQ9njZySyFfnAdNVJokr3rNniFfZSZg2mWk=
X-Gm-Gg: AYBFou3H5OI6iWqcdHsLDva7sf2qNGOKbQ71E/zps1yMgvrVav0eRWuP4SNkjzEuXAl
	ledLcFeqqu4EvLkR7rtijFGks2WELEVVjvkBhXGreYdUntpqNOW3Nxo91vIDdzbYI1B8+36YdB2
	5cXLG9bXiAd2Mx72rv7nSbf79Pzy4wP0g5+rpMrRg6yy0wsoTYcA53VmxfbMK3KHxxoUWrU20Hv
	SNfFb/gsERRkokxmhNRuRqykiAlc850IPq74XT4km9dAKrv/GME98dEv+oA/4AdG57HpLhZpy+W
	cqelfFsnXlmpfisY+5YGwq4DT09qMHmPfbyZt53YTmHyL5qWdLfSALIG0fVEhmD8FTVbKY+H5Be
	H8zinKT23zcbO0WSST6pXzSdrib1GHRICbbMeNJ7vgi6Hw01o2VKDsaAOgAB+TUm0eror/NP7Nf
	VBh8cbsqwdo02bUv7pqjd++bUqM1oYN4PW4oYYmJL473440F9jjN3XUZUqfZ9aAGIuQGQnXp2WA
	cq5hwu3KL7MS3g6gQinbe5KirdCHw8CIB9xvW0ucQ2U9aE4Jm8btw7KwI+0xTnuTQrhqZFDZMW8
	xj8ns8Mgsu7D5cUxMLowmW2dbFt7rSMfi8zB+Gi1UEgliEjZQo+tHMvgSrHQ4ZqWCpgxXT93/mO
	mRKpfmA3GBX6s5Tpi8mCK9CDqMxOXrenAnO2IT1FClBj+WA==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr3030579f8f.5.1793953834697;
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:25 +0100
Subject: [PATCH 2/7] clk: meson: pll: Support PLLs without a pre-divider
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
Message-Id: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The common PLL code assumes that every PLL has a pre-divider. This
does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
meant to run with theirs set to 1.

Make the pre-divider optional so these PLLs can use the common
implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..44b33051405f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -76,7 +76,9 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	unsigned int m, n, frac;
 
-	n = meson_parm_read(clk->map, &pll->n);
+	n = MESON_PARM_APPLICABLE(&pll->n) ?
+		meson_parm_read(clk->map, &pll->n) :
+		1;
 
 	/*
 	 * On some HW, N is set to zero on init. This value is invalid as
@@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*n = index + 1;
 
 	/* Check the predivider range */
-	if (*n >= (1 << pll->n.width))
+	if (*n >= (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
 		return -EINVAL;
 
 	if (*n == 1) {
@@ -437,7 +439,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, n);
+	if (MESON_PARM_APPLICABLE(&pll->n))
+		meson_parm_write(clk->map, &pll->n, n);
 	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {

-- 
2.56.0

