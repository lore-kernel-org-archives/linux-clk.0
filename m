Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351053;
	b=RjwW17o4a4T2DMb6NbmVB26P9AYVc3UhrnW7Pggsa2WwPbzuEUF/8A9YXWS6D/rnSuRE
	 w9KcjsW8OxQkt3hcasAMhCMWPcHYV2MykpqAA0DHt/ryg1PNxNh0JI1OyPfpd59ZKZ/Qg
	 hz/7d7lTApwIcGLLuPsYz2q5JvPIKvTUfORIdb+955L31vTc3VZHrs+9+xsizGPrcI1Db
	 kkKgijlguu6GD7dmmAxcGWAdjzpBnTETpbpxj31Ge6wbzLbtYnRWQt7At9y62HvrCXN4N
	 pRiE2UGmAI/8nNraoRCfrA8D3oe48hJjIAEWSjaD6F6393wOrfGIF/FCb2UDiuSEEFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
	b=AgaJVGatTPhyvXBLs3ZfRlr7vV+2jpdX+Aa3CKzVS++ciRqLjwS0ObJ4FTW0yoy4L+C1
	 0SY7cupOLMmKgzQ4PxFrYGSpv1YMVZu5QrvCN6PkcNOTusNHXKP9Fv1nr8rqzIiF31RFA
	 uS6B32C+KC/9B0IMAmQ1Yz6mO16kryb+mKE6t55I38nvBhScahB2vL1Ju6uifu/umDPvO
	 6EB3c9Vgm44CQZjBo/K7qQTLL+a+oc5ApRDck7toOCe2foMxDXrsvtao5S1GHcJJXv9n1
	 osUOC89eKgeFnYzl1zzl0P0G55BEMResnKeDZbLTkY4i9UGRDkVcqTMacxlkBJY1Ilw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LC9JeVje;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F96606A31C
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 09:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LC9JeVje
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso279872f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793351051; x=1793955851; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
        b=LC9JeVjenZNzVagJ7qdBUAr3xSCrKK2xX+ErDqBCM/hOyfSUQl5TWUguX2FSPITYo9
         sSuq93hv1facKhQXVoP3MXZl9vMca+axhzyi9/7WZPeM4isafJjESW9sVGDzCIMY+5fF
         /h3cXUAmJOss9y0aaG9X4AQazR2VC/IpM87oIiDdcrm3djsTez5JPKf/dc7UeG878zcz
         nbSkYJxxXn0f88w/MP40qXVYmU4m3Y6pemUZ8UChvLMxi7w7j7QkTDV2vJ1qdLegpad0
         xIr9VJIGmCww8GPz2tEwD5Bgs6MuzZriwh0RtJ0iJxtA1WKb00IgDLvl6LiQpm9mIq1c
         CEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351051; x=1793955851;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
        b=e+OE4vwZ0Vu//tgEExXxG2e1jzP/HsX0PTG5+PDOzZOuW4aABpcXqDIVnHLeEGGpx0
         r/+VTjeI/aMaO4g76xq47I4QVqTfEGMrw+3ggTUB3+9+whc89dArfdOFldJKQkHfuLju
         /2kZ+exM4h3tpgEeGNxd1IZdr2SU5tgtzigv71yW4c4VZOP+dPABhpV4GlgdDIs6pGg1
         b+z77oOKkRBk9ywhJm9Q+T3xkKW7o9aXAn7B8nx97+VMCodnPc1qbpzuajWaLcriGUBQ
         9D6Id5ghbMOFn8++Acu+Mljx/LT91XkV03So9EDBgn+PgiUYHcG93FVomU7IaZHIJK9F
         9EHg==
X-Forwarded-Encrypted: i=1; AKwUvBwZdH/XyjCKYUoTu2OT6Af38qS08yUhDWE+xHmFX615qxv58pXGUgASvtgAkUiW4ehE7hhRcEbGOJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIydZa96b7+g8ULTkcSSfJlAlYtpxW+Unfx8LIj1HOY+AGjyJqX
	cPRbL9A08ongi4sm2R7rnItNnUbqGH/LlS+dL+Nptc74k3wgvZZzfGnzKHpXZujFrWNKzWqhYXA
	NKorhFF8=
X-Gm-Gg: AYBFou1O+7sBvDx6alB+eJow9sjhwHor6/xWJ8807USeNwcPowm+TgZqyPVpJnZqAdG
	bU3nbCZnBQmc5lJ5Esl4ku7rrc+eac2Baq5kBchsf+9YZ3wcEbp2sBT86lI35igQiXkFimI6qGZ
	eSkcb+5YBMTHoS9CaZo+r+3IOfsd5Ef67e+WvTKJNVJycVXb68lEgZeWzYKeCN4BtHaurW+Uviz
	OZf73e48sIpEFX/lXFIL60S1MFjivD6tdn0gZxZiPZglgnnMRiJIzqiFc0zgtafgKg8D+IB45od
	s2FTRASZwRNDHh2l+DdIgDZ+r8/71noO/hGfh4z6lQy03QZX4j3xChcv6zMhP9GHnYvSRLrmZT5
	gjcY7FJJZigpNE2wXsu8pru5iVxX8wBvD6lhbcGy25LSGg5hKNz5+dUpmjvRbPryXUstfJAWna+
	HPfjQKWr+az//e5bKkLm22MyQ4TPqIkFatZm1oWTttb0kOmrOdt6BChf4Z1Ys/cgNR2cAzLGnT6
	spGEoLjPLMgGM7mGsIQCCMavRgmVoOxUB327gmZTAylg8z6C2SHiZpjCwJMhYaaH2b1sblmm42c
	YxeT1CLCg67f6LIb0nQ62Nbr2vpfsZ+B3ZPMGb6R5jCIfKVMkg==
X-Received: by 2002:a05:6000:29d3:b0:48e:5df2:a011 with SMTP id ffacd0b85a97d-48e6e2c14a0mr2402572f8f.5.1793351050905;
        Fri, 30 Oct 2026 02:04:10 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm1977127f8f.42.2026.10.30.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:04:10 -0700 (PDT)
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
Subject: Re: [PATCH] clk: meson: Fix PLL enable timing
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
References: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
Date: Fri, 30 Oct 2026 10:04:05 +0100
Message-Id: <179335104535.2573818.8004160070280286355.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Xx/eVbgodhm0RN6K7j9bFweBrB1LQw7pZ6RJPufC9Ko=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPYjsvLvb60dNYISrD82ePdkjGlu8bu59yTpnJIHckl
 d9Fel5hRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACaiIcfwP+H5ve7nf765rXFe
 3Xhp8cE/jpN2ld5xm75PWd5+WuaClckM/zRXCy/+OTWaq/BGwcM/q6vN/z03MD/MvFqk3Sg99NV
 zCT4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The hardware requires a 50us delay after setting the PLL enable
> bit to meet its timing requirements.
> 
> Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
> may fail to lock under stress testing.
> 
> For example, enabling the GP0 PLL at 1512MHz may lose lock and
> result in an output I/O error:
> 
> echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
> echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
> sh: write error: I/O error

This is something for the cover letter or bellow the --- for a single change series.

> 
> Add the required 50us delay after enabling the PLL.
> 
> Testing on GXL shows that the PLL works correctly without the
> additional delay and continues to lock successfully after the
> 50us delay is added.
> 
> On A1, remove the redundant 10us delay before enabling the
> self-adaption current module, as the new PLL enable delay already
> covers this timing requirement.
> 
> Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.
> 
> Fixes: e40c7e3cda07 ("clk: meson: clk-pll: add enable bit")

This is the commit which introduced the enable bit and it is not really
what you are fixing here

A more likely candidate is b6ec400aa153 which introduced the delay
sequence you are modifying here.

I've got this other patch addressing PLL delays in my queue:

https://lore.kernel.org/all/20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com/

Which one is it ? both ?

Please consolidate and resubmit.

-- 
Jerome

