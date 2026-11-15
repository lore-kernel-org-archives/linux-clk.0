Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727926;
	b=LKJJb8QmLmziNRQBibW25/LDe2FeXeiK0u6KGs+b3Q5CXL6bW7Jv+EOofhW1DjGiEES+
	 /EfAxFGR535nGRmL5swsIQRd0kRMaSIclywd39ZTXOAg7kGAI+EFRdo45EjF67a17JchL
	 wPAdhvNITWKfBJLrXkHiBMCW84owKBwDXOkD1u3iYJa9M7NdFtqUo5mqYSTaaR1OeswUW
	 Puf/f1oAcbMvjaVhRhm9U1aP6N7KHyIrJOHFJh+6FKNtXzjMVgxA8XSrtoBF/LPM+ynxw
	 LsFG3GMQ8xst5YQ8NX7djnB/4ZT2s68vTNGmFm3evibCjkwXmrO9VDR8jBm8UUt415Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
	b=qNBJdSSz6oSn2vOW+7HHUiSncjWToBo6vN9w9iF9FD7I1Hd6IztURckHuFsR628EP5en
	 Z7cbGruAx87xXsISjef0L7GWeBBZLyM3jWFHInEB5Qby+3ESfLidgm3udLJKxf5G7qjuJ
	 OFi6WjntPzOSY+oahRBUakfC3IrENQiqy3oId2G08h4Kyo5eLVL0Xy3//TVEHuuQN3d8X
	 BogrdYFHkVFcWC7oau+U3id3858ruApGxW9nZEN6GS7wmp090RqGDJPzDtRjQri77Ksan
	 sewvhoxOUuwWWKPGASmxl0xAtYhcDEIxiA0LQ12YwG9ZAHwQsCRNv7LzASextxVZ/Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A40606A323
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 07:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A40606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18775455e9.2
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727924; x=1795332724; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=zGLp07qNJvhQ6+u0soNSdE4zISfLgteQxFDtiLB3+MHdU5R8cLNayQpDOu9z6E8HsN
         cokgnkhAr/wayCMP5a5YNMbrz8W4SjZLOU5BRZvRdWywNx6ylkAud+eGM9IO9xu5mMW7
         vNaai9gq6sOgHH/Plv7KLPJqtlQ7SNQhP8MwbOsiVY9oebQhNkQHqvTKMcZy20gw6VyG
         k7ZCwjq9cWqbqhlBhjXQDv7h88lCfGgbi6MypmIx2cT/mMVK282PdLi8Wwi9Md6f2p2U
         0P0GPJt+gXIMzGs33ytfrKjlEGV7t0Pg95zZC84eG54l5hQ2KUyeWmzxrEwtZdsEBCOn
         OqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727924; x=1795332724;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=gLZ0JPwz/fbQMgKEwdl6XreUIKrJiSxieLG9GE+L1JH1zi+sqWJGDiYW1gYuQFv9/A
         ERI6HW2BCcmAQ68a8+PcrDt6uxEXA5B6tT3dN66D6rqk5wqbrOKgCZw+5EKfsT26P+v6
         zpuyxmG6DxVP2zvTzqYztlbws5Nmkw/3YdiLiSCymUHJiBwnyItE/+NOIKPCcKw54d1m
         2U3a6o2CAE75uLfKKVev3b+Y/hBT4/SRqWkEV0BEurKiTStM89RVYoFi8rvWJElVRaqL
         k2gsO1SaIz9rTD057YK1arzdVTTWTB/aJv4vW5ttpVgUOMCVvwFrzSUgLjQ+M4glC4Vu
         7joQ==
X-Forwarded-Encrypted: i=1; AL+hErF3ZH4Kjr7cztm+ozMkJj7zknvY6n1zMlZVlhppDMGvGK9QVEW+pOMXadtjwm/2LmoEBjZYJ2Vr1l8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ASvRAAacMyKkXvtr9Ir5I4qEcnCY9nrK3N0a6ObJqB9rlQ4kw
	3jFf674jo71rVp+x0ZDcBkpMhZu+p8kXJAwzco23MmE8f/g/tcNzPDw6
X-Gm-Gg: AYBFou0ILt8aEQAhgd6JDyMugD2io6AJBlDc3BJdUthRQNkL/AglNfi7+duLbGtBFHk
	YyjF0jSju9v3AWjYqa7DTjXjdX8Y+UUsd6/5N17kmuqvQyvkZGddslYpHma5g7i1Dbeverl8rrl
	Z2F4Fj6Y0KZz/jByX+7FVZ+4Gp79z9kzzjFE9IwcXhwcYWMS2SEuoKdBSCvZQWtPDwMdG4WK7V5
	kLckWOPCpovayuK7ejZOUeY1tO9v36RDjFe5Da/dOb4cwWbsi91Efpya3NNJNRdXvMYE9YbdNnX
	g9Xsr+Z8kigMZxAgMdr+LmwYm9Tjbe8u36xbVN4kyXs9JnADtSnreFnX2A4sS+cbMVLFnZ72Cou
	qEELML6Gx2xNhdHRZecUS0PyWSenBxfcAd6bf1u3ZJiS8fOIp2IR+od4t3dupCa8TfYZu0zJlir
	mkiADjA8UeEb+eWgSl3hueCy77OAEpodcpPxpCG1vQ+veps+3FmW99ZiM03r+MGKn1Ezq37ArjU
	5oFGMTRuaVPmuKCXnBL5VIMWGi5mElHWZwmEIAunEmv/ODKgkMDPH4aS69Uf15EgvQDtpFRJU87
	0aq4BHU9ZjOlzR3eC9U+kb3wONnnCJtiJGw0LETcn9vHNYYbu43u28zDBAWlP9FW9E8kkyR/NQz
	icfD25D/zJYzkgo16tscNtVy5uXOzWFwwRurgsmPPP4XY59Et6uGHavRxIiBVwk34WY3eVIwH3A
	fiWGsfCkv5l0MMWHru/CyhWiMyGOMkmMkXGlxQkms95LYq9fv2j0dvqlldK/WiMvCh2JuybdThT
	86ArPYQGYCEHUEi6vjqI9pe/0Eyu6m3lsvAeV1L2cPzHGo=
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr146703185e9.21.1794727924403;
        Sat, 14 Nov 2026 23:32:04 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm183982925e9.2.2026.11.14.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:32:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject:
 Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
Date: Sun, 15 Nov 2026 08:32:01 +0100
Message-ID: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via B4=
 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > From: Han Gao <gaohan@iscas.ac.cn>
> >=20
> > Add myself as maintainer for the V861 bindings, clock and pin control
> > drivers and device trees.
>=20
> I think traditionally sunxi do not add maintainers for specific SoCs.
>=20
> Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> item instead.

Usually no entries are added at all.

Best regards,
Jernej

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  MAINTAINERS | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..dfc300dc1eb2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> >  F:	include/linux/irqchip/riscv-aplic.h
> >  F:	include/linux/irqchip/riscv-imsic.h
> > =20
> > +RISC-V ALLWINNER V861 SoC SUPPORT
> > +M:	Han Gao <gaohan@iscas.ac.cn>
> > +L:	linux-riscv@lists.infradead.org
> > +L:	linux-sunxi@lists.linux.dev
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > v861-ccu.yaml
> > +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> > +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > +F:	include/dt-bindings/clock/sun252i-v861*.h
> > +F:	include/dt-bindings/reset/sun252i-v861*.h
> > +
> >  RISC-V ANDES SoC Support
> >  M:	Ben Zong-You Xie <ben717@andestech.com>
> >  S:	Maintained
>=20
>=20




