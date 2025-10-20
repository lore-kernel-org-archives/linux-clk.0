Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C719049B
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984581; cv=none; b=YyD0msFS+mL8bASQs04Jp5KuD6Ob3kRUNv6OrmYjSod9/wkr05AJB4nd4PfM8WxuiRDSB32Z6RH3KJtop4NQdJSau8wRnCtODACmyzgDaulVfbxVsrpWYhApjGTq92FohL5DiMioIJtH9ikuZR/IDRxQfT1d/nPqQykLhKSSGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984581; c=relaxed/simple;
	bh=nJnS4KEn5GPnGDMDu5zhj3c6qjfMfV3vNNzdaEccvcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H6WagVroxX1z1hr2peC5KwwIGPS1z5k1O1wA+OUdJjOt8oPe6yOJAIvdxv5c4N/1STKm/un61CyQAKo5zMMUO0IGi0xmSgXglrEEIX/+bEQ1s2LF5n4VCWIA2/5tXTR1lqQ7EZiNw0IAr7hDUP+wu4h+/9dgKOn89xcnknzn9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kI0XrO/E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kI0XrO/E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso21268385e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760984578; x=1761589378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LobheSjDQzmXm5jTVKxbVYkJzFJNe2SiM69pvM7Dmgo=;
        b=kI0XrO/Eddmg4iy8kHI9kFY0uunHeZe/8YUmW4Yy1oHG5zCrjgO26N9vgZ8zwA6pyd
         SI8I/2hI9VGSosWyftCwpYriaBlih632R23bZ5MTZoCe/ocL+qX2+FE9/OfRE5q7Sj1g
         XXnKu9CpTXUbELKW36QTkPlhwMOaJb8FnPcM26TqC+ZVGTDIAgJ9PcLYwKQE7gUZkvh/
         q3dQ7sQQV/QPUjxRI30RKjEHtwViJmxsqKnqcxxqJMQgDbtMvY5W1DEGX/CB4UrDn5kg
         h5s0N7fFP1fqvMAdEO7JXzaX+FrPUPkzbWoLpqA+uK1zQJ8xocmmqNuRjHLHjpkaTdzy
         A4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760984578; x=1761589378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LobheSjDQzmXm5jTVKxbVYkJzFJNe2SiM69pvM7Dmgo=;
        b=YiuMsNwVxjOV+HCcm81wnrK4NyfZojy3F4jGA7RNd7a5k+MvpHhfDK3K7bnJvIsA00
         6hMbkgwN2J9J+S6gAN6prx3JSTKOIvZgzglB2IPknz2ar8jJyVMOtRI19+3GzGG/cajM
         Dn7PSsmy9fTgxfW0Mq0enic2+Tie0GsX4htQw+tCZVwvIRFl33N9xFzXYqJF10iLnwSB
         2K+4I4sDQy17E9o7XaQsIBza1bdhsOEipMfzFHFAEYd292aoysmr/bGP9+TVuwiIl01Z
         XuuNmWMHBTRyI1kBIwn55P8WMEuejTR0gCmvhVG82nkv2esjH4t1zYMf/kmOdlVP8fiE
         BGWA==
X-Forwarded-Encrypted: i=1; AJvYcCVIdq6SNDy/d+lEowzJ26PoK4JPg40R7p7qCGjC7z7KJ2efvIDMIuamqZhIprAONvRHMmX43rANDrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwcVK6P1qLDxqjvSjZqtFo89WnKy0nG8VLIl009qwDsFwCAtK
	RQtjvlhSGcKsDQ9VFvpSW8/aGRTosk5MdtfYAULa93hY38Uj5BPBWwym
X-Gm-Gg: ASbGncvoqmqsylnT5s6s97iwcv/xVdiHId9tHzUqNpAOLKTictE7tLIIpTS/DKb8cgp
	IrCldQM9euRcvwV97P88UU2A3SHsrXCMPfhdtCmhhOm7QHiI782hrmvUmRmlL5tFqT/8ouRPDhb
	bgr2YSOAzPBB46el1SOxJHq/RFncglQmtkAlB94rjml8htseT1EyNY/d9KizwgIhLBI7a5fbHVd
	SEXiwlWXnyoaA54QO4hnADBOwOEuDudGIGx9bDKchoFlJn+voPUJERpI8Ra3HaH8/G9ed6t00lS
	VR4wlVYhpi5fu8SwgNzSDQ0Onk1+Vr5IhHhjTNqKPJP4gnqF5dtJd93sOfKNImwXW3KdToC+s5d
	RCo1jsRGX0jfBagxJtBFDB4L2EgXKxhqbmGhaMMjKjNEdHNC+XB9CGR/PRfZ8T5u/Kq2+VI6uzh
	9VY5WPhYqIkoZSwqmI2EZfnOPDSYkad9ZoF/m5+6L+n3qxKH2hwobAgjpfaQ==
X-Google-Smtp-Source: AGHT+IH8xdImUVWc08yxtV5+NexJ4U7oKJ1he449w6/L8td0W1j3sEp5QRRipKGJLDowyWmFeCZmFw==
X-Received: by 2002:a05:600c:1f93:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4711791c66fmr116218965e9.28.1760984577798;
        Mon, 20 Oct 2025 11:22:57 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a96asm16569602f8f.31.2025.10.20.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:22:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum
 rate
Date: Mon, 20 Oct 2025 20:22:55 +0200
Message-ID: <1837721.VLH7GnMWUR@jernej-laptop>
In-Reply-To:
 <CAGb2v66osdLJa=_nTxz9wppUkxvu2fuS=NgYN8fKOUOLHw6-Ag@mail.gmail.com>
References:
 <20251020171059.2786070-1-wens@kernel.org> <8591609.T7Z3S40VBb@jernej-laptop>
 <CAGb2v66osdLJa=_nTxz9wppUkxvu2fuS=NgYN8fKOUOLHw6-Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 20:09:18 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Tue, Oct 21, 2025 at 1:52=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne ponedeljek, 20. oktober 2025 ob 19:10:52 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> > > While the user manual states that the PLL's rate should be between 180
> > > MHz and 3 GHz in the register defninition section, it also says the
> > > actual operating frequency is 22.5792*4 MHz in the PLL features table.
> > >
> > > 22.5792*4 MHz is one of the actual clock rates that we want and is
> > > is available in the SDM table. Lower the minimum clock rate to 90 MHz
> > > so that both rates in the SDM table can be used.
> >
> > So factor of 2 could be missed somewhere?
>=20
> Not sure what you mean? This PLL only gives *4 and *1 outputs.

Right. Nevermind then.

Best regards,
Jernej

>=20
> > >
> > > Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CC=
U PLLs")
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index acb532f8361b..20dad06b37ca 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > @@ -300,7 +300,7 @@ static struct ccu_nm pll_audio0_4x_clk =3D {
> > >       .m              =3D _SUNXI_CCU_DIV(16, 6),
> > >       .sdm            =3D _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24=
),
> > >                                        0x178, BIT(31)),
> > > -     .min_rate       =3D 180000000U,
> > > +     .min_rate       =3D 90000000U,
> > >       .max_rate       =3D 3000000000U,
> > >       .common         =3D {
> > >               .reg            =3D 0x078,
> > >
> >
> >
> >
> >
>=20




