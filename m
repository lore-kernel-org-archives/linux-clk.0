Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD643DEAD6
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 20:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782331251; cv=none; b=rbbxHPdDN4KBsHiw0dhFl9S8QqUVmCjsDjfnTtI2kkFddO9PoWDiK3JyBM1oj2Ooh+9Au4s1eZ7Vd5MQIjWi5OIiW3QXkc5gcut8KsnVrArgXBPrgkeg5WIixORLSgqpLpGlX/C7Stfg4oCP1/80RRAesplvWOHzhiA0/fCJJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782331251; c=relaxed/simple;
	bh=FWDkFxX3VbBclJHn0qziHUPLz4S00abKehaSLai0TFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzPkCnUXwtLTBYe/0oGDdtODTsCmTzIP7jmuy4fgvVgoexSAe6cqHfTz1c1dGoiL7WkgSnVnOBIuY/sZsQWgJPVC9CNV4U9gRMOllYFHLDD86RczC1QamcI07Svzt4F+LvJbCp+qvnJ1WQf8ooZcN88DJwlE3mcZvV5ZtGW9bbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U97RBkx+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U97RBkx+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46cbe01d4b6so661757f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782331244; x=1782936044; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou7sRiViO9r41tx6wwdMLvYt+1RgLBADg7cisaocX2c=;
        b=U97RBkx+tpuF8lLRW/oDBTM/uJs4kw/3Oa/+lEmLbwcgGQiTl7E5lkMCMxM2eSDF5I
         eFPe7R7tUUxjQFYs/AsibGahH3uTH064SYe8BbUu+mdKql5S4MT2xw8HwrX2HDcbLujh
         JL8sXaw1VD8UJsFbvb+UVb/aocPabD3uWBzph6QWdAtFee4FcgzJ+W099MzlKkT2bAfC
         91GgxXaOhorv4HZdRYi+FlGjDUWuEaWLhjJ4qQd+oO/Gwa1t6/pgiqng9JyAp/lssgz4
         Ed9ri2r/LrQCfT7JsoYwtkXeAOP5W//Z57qv1WhKPnhwGwsorfda8SNESHPT7ciceE+R
         AVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782331244; x=1782936044;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ou7sRiViO9r41tx6wwdMLvYt+1RgLBADg7cisaocX2c=;
        b=V6Hs5mZ5KDMwW+x6xYyTOGeJgG1igHeLbOHTpl0bF66vSe0Z9Yg+ea549PIZU74duS
         CZS3tTP9dFC1tjoEAvzhkjEeDf/mNMS7xsFjyIqW7k5Z+8buAztyylTf3CjQydUdq4T3
         y/7QEWywRLEDID2tUHKGi6sHdToBLFceRe/YNd3dohhk3h2pLYMCr9QpTR/p4z5SUjOj
         +lW97UxDqrLskOp4BdFbOzb81nz7UWNZz7IB8na+TjhWd4ZXvFVT4rHYmAIVbULej+q3
         yjA8rl38pJXJiS0RHSe4eYiDTPuXa88SRbUMrgxdciuftMlB5SIsxes2ho1X9kOAfDLT
         Xc/w==
X-Gm-Message-State: AOJu0Yz80V9fC53yzxCYJXpLOAURJHUXGBmJ2r4mBCKXCSh7gTe5EeqO
	7++nk7zeOni3eROvie2ER4WJAgvTWx2dhUsAXBUJKjoqrkOVidgeNRvy
X-Gm-Gg: AfdE7cnQwEysJZOsLiDeghVR+sCy4lXOtkIYPvihWmdJfUpujDrMrqxldeE4YHJogHG
	Ngo9bri+wLIimTWWWgeMc22Dcwz65LpV0zmWpoPUKJLNWwvFJyVkSRDVvZGzkMFsaHgg7K0buRv
	MJxQdnox6Flz4GzdvgIvFUxQPjUNDhQUmeG4Z6mHNoBtUB3HNFUxFzxLRGOVQBArds31gA+gNsS
	Fpw2FD+1b7RjVCU6+eE4yvqbOW6gtplbQNToddVUerc3/pcVqzw9ivjVteIsdqzhy00E5jk5hTI
	pgxTibXV3TgvQ2SUkeghBzZ0s+DlBfwAyZduIde7vAFrtJTHI0apt1wWSPngUdKsrZ7D1fN+O+2
	ZtkHvRSUAtYku0xp2UX/0Ja7HrUI8hSoNUytTcnlLdlPqFzt5u5VX/gG+57RzZuESvGRCXDbOFs
	m98rBWmYUR+yHnKz52Aj0zFGqEaw==
X-Received: by 2002:a05:600c:528b:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-4925b3801c4mr125691855e9.25.1782331244005;
        Wed, 24 Jun 2026 13:00:44 -0700 (PDT)
Received: from strix.localnet ([197.250.227.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49264011d5fsm17039315e9.1.2026.06.24.13.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 13:00:41 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Wed, 24 Jun 2026 23:00:04 +0300
Message-ID: <7_XKp5ZWTJeJfxJieymOJA@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
References:
 <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
 <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParthVt_moD_RiKok0jux0DKSA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextParthVt_moD_RiKok0jux0DKSA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Wed, 24 Jun 2026 23:00:04 +0300
Message-ID: <7_XKp5ZWTJeJfxJieymOJA@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
MIME-Version: 1.0

Hi Philipp,

Am Donnerstag, 18. Juni 2026, 12:24:26 Ostafrikanische Zeit schrieb Philipp 
Zabel:

> > +	[ZX297520V3_UART0_RESET]     = { .reg = 0x78,  .mask = BIT(6)  | 
BIT(7) 
> > },
> Is this a single reset line controlled by two bits (do you know what
> they are)? Or might these actually be two different reset controls that
> are just always set together?

I suppose I could expose both bits as separate reset controls in the binding. 
The lower bit is usually the one that actually resets the device, while the 
higher one works similarly to PCLK - it disconnects the device from the bus, 
if asserted. Depending on the device it may or may not leave any residual 
effect behind after deassert.

The stumbling block is the dwc2 USB driver. It only takes one reset, so I'd 
have to add another one (or abuse the dwc2-ecc reset) and presumably add a PHY 
driver for the 3rd reset or add a dwc2-phy reset.

The AMBA bus already takes an array of resets, so the pl011 UARTs are fine 
either way. For stmmac I need a glue driver for other reasons anyway. the 
dwc,mmc2 controller on this board seems to have only one reset, so no need to 
extend the driver here.

--nextParthVt_moD_RiKok0jux0DKSA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo8N0QbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiEogP/R8cmmFdsmQf1KC8sEpC
FHs5LDtbqZiDlTBbyS30EkcQvlrgJiE+Nw4ooyuaXdp/yAsXGx6+PcJa+ts3U7n9
zq47YLFyEbK/eIOiZUL11INgY7fvX+rjmIjUycP/e+QDjZWWwnCylBPS49sy527A
eL8/Rc9Sh2c1YqqqPrdWXEPCYyex16JFem9/dW8rmBJ+wXtHSZpL4Pp0bnnWEFbB
pmFzhiVb9YI4/+zDV91/utODGohYddgEqjrpdqnFnp4PQ3NKlLL+IJPOVWOk2gxf
AWsdTFzbH9KqSeQnCxWw28tUhRdv9FNmL0TLNWzwUIssCxS26glrCoeXAP0G9qzd
08VmDofaWsbFRaDA2JncmPzJmb94sae4luwRCx611c2DfkgQjfT6r9U+jVKMKXIB
ys7km03W9hFCIv4oSqZDDzRXhD1h5m3CJA/OfqswLDTvNzUyQPCq9ofGg/O0Xr5+
7hqx5VO2owAQ1LvQfPuRrjzXdrhFF54Tm8zNxCEszhiJZwBQJ+muvqRtg6Om8KDd
SZ92FKvcPWcKdA1CAra4b9nPJuGviEvaXQpYh+6ja+Nubcfyf2EUIlidSU2EhaVC
192zUu5x+IC1lfvdMXBulb9LgPz6yi9S+71ytaYp+Mhn4I3X+gn0n/sLGEmL75VU
VTD9frYuMZXmnW5169uuFcAU
=/taJ
-----END PGP SIGNATURE-----

--nextParthVt_moD_RiKok0jux0DKSA--



