Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156475;
	b=S42bsIQdU1KUj7HibMGaQf2ej+LYUyiH9v4TlBJAYvhsBiYqtbyN4p/27XvEZ0eFoAAK
	 6KjfU8b2ckg4LULpUp3H+cMpcZ+/V8pcMo2BVEbScxiZTG/F1yefFZVFMnvJLD36Z9lqV
	 o7ovkepR3knhgjt4yTT9M96E6sqw4ORbYrMqMOdFytOp9xP7NQ+b0evNK0e9AjgfW5IyW
	 nGmYkT9U5tyxh+EP+jT1AVaxzTZIxN9+wA/GaZlIhGfxH928oue5hg/fpXvL94BW3LdKO
	 eOYhrjbYwVe1EFlZjzGyllfJMGR/IpCzLst3D4/Qx7G7PyDQeuZ1jn64M2nf5rgY/0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
	b=CasS9QM6ifOVyRXhSJjx+xup6gSJKX6HhyCna3zJJWvf986ZKUROWS/64whDQ+VzJYZv
	 2T60kzmFT2+Qkw6qNuw4MWrrYVfWy9AOwCSClE9yjUKWU3Cl7gwkTxLt47gVLjldW2nlA
	 7y6qAbH2eNWa8J+eRsBr9l7TNLonKqGSRJ958/GklI+o7WXpeAqk5+RwExtUYC4hVfoFF
	 SMWXJ2ToZvLTgvY2b10z3XF2NKwdNqHOZHteZn1l8otcMBzaT8BOZOQTrNgna4VYHN39A
	 +L8MJyKnt21RxKbL+NScK2XmWW85Q/6LPx8frjg/QKBt/IzmNyP9C7WXnUSHrfoqa1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWmFUN9p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EDC606A322
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EDC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWmFUN9p
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso32051b3a.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 08:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156474; cv=none;
        d=google.com; s=arc-20260327;
        b=irGxhWYec3J2CarQbqYXdrd8ZUhbKNnQzfvHorI9efTX1SVcxab1TiyKUyM8C8OBZz
         oZq7Lf6iGvoyejhL2kPCRihpid38zCUDBSUlyBzar6MXfe0PN8ucY1rSx+YvTqho7tmP
         iq0SZuY0Cqd78fL5K6lvqdASudNwvwfQaOPA9J8xANulRra5bWD220ET7cNtRgEDuivE
         mJqPicTTgntU10vFb8cqSNKC2/YRW/UQtgyJOmd2Ep05gHtsOQRKFx5Yg5klTurGyxqg
         1HlUK/SVisEMqyLtPYAWMiPK8jJt8oq6e14m4+qaUwMwaVGeVr6d+J9cR44GpuhSkepr
         A41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        fh=2hfhS/TDdw+vB47+SyuDzTOw4Y7UogjPq+LMZLKB1/M=;
        b=R4KXJ9uxFa6eF1/DS8uCP1q69T7iEk5TYqgpk8liP7s9mmMtsUpc1ThluVth3Ueird
         e0wlCLzyWtslvNtC9c5aEKbqsIRan6cz1jC69lmODvDTqei9/VURCFWMRfY90v9VjE2r
         KZDIjHWUxG2YFIgenLNmwb3EoY0eSxG5mahH0OMc6BIJPD2soY3wZVTQm0+6Xl9FskoR
         /cm+ZTkCwcsktHzNYVxzVAAbXS+PbBJSTWyGr0IBoCCnJ3+f1ZrUdijunPovituWaDge
         oB7tYLc+jMVlIfJNjNolJ9z54zNtd+fzGSk5J1RXgMYmOcqYz1bmN0GNYVl6wasSihZJ
         lD/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156474; x=1794761274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        b=CWmFUN9pBrTT2mfrH8h0RhHAHsTdhcyZAJR3kVelJG4UjTfvm7ARJ4hYwZkvbsQB1T
         HrQolTgHsLiUOTuYAWhMrxzxOsTavp7fq7sIRNBSVtjDr7lv9o6Sp+L3HfZNyPy/B4iX
         SZBXcsuvwJ/ONEa6t4xkoiU+ezSgQWseJMLEEaxdqO0ktpUKRK4MMJ6vRAy3VMYwpP0Q
         70IpKmeXrXz+w3UE2gDuLjSiYgPT2P6SgttB9pDZYcu4lWiUjM5zwe2boEQL4kLaL6LD
         CzsQujMvIVgEe+BAMVDczQ8A0ElIHACMH5/Ge1UB6073i7oFnax3sjHxSQ9RyPf8ZFdl
         6d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156474; x=1794761274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        b=it5N31Vbrmp1N5JIYKNVgRoAZOPhacrClkyxjY5E1K9/ENBi+7sAj4HqYG949hAoNx
         IpHzx9Z933OyYrw8fSPcSrAB14HlUahYNfNRGQBAH8uKr/gc24zf1v0G1Bo4q7JWKhak
         taWW8HFqwpTcFVZczfJsuc61UK42ZX0JGulY34QDco5J3A4sNYtQ4Dpbcer7ZTj7v0mS
         W6+YopF1AmeP+bqAFqvF5AM3nIAjTogfBW1OuOw/NubqkM8FNw3f8BlIBen9URROyv6T
         arh7zEoGYwu1UPhMpMhI6B30kdhqc6ckezF7uhkZ1I4/PiObgmQ1p73rTsghzjlZewJA
         lu+Q==
X-Gm-Message-State: APuU4Z9r4srSLBgZkI2kdUTvcGMH6oj3A4Z7wosjTvdtmy+6EcZruJRB
	gAkaTOUHh2j+E7slOOeYs3RGlX6kp85eF6FWXuXvBEG0Faz9ZpJ4JWCtTD6pA/yRtRrKKO3hOiy
	iGlj6/vw7DWJIKQGeK5e7Wr5oGtCuAm4=
X-Gm-Gg: AYBFou1UWV/ccy0Qtrtg80poUsY7twjI56bbK/P14HhiNd/+fg6OgiZJUjZ2hRQNi/F
	9JD4dUMhD+fjnVOf8TpUTn46vKkJORsIlHvzzyV2RLh5JPfhfj97vkYbV+e47sorNQnH67VSH93
	jvgTRKuVvtIFARgI+eOdb3WedqhMrZkzIFHq68+IvocAdpAKogBE04oChsRHF99+jVjFtaYiEz5
	SUp6Kejwx+nFWVjpgdH/MUlaG5UkN8HoPc2LV3+UHlKL5557XrzInCEF1mbDsZyshDgAbVNVGEG
	YADrpRWOKS03/78H5b6qkx57ZmNiufAt7qY4JPSO+ovgoKL9Cvm25W+rZDEwOooNT+RRK0+HVC8
	dYR9jPXrtJBUgK7kAeXls7UC0gLV42J08HbmPRCPj+y7tRl3djJxf
X-Received: by 2002:a05:6a00:4107:b0:8ac:3a71:38a6 with SMTP id
 d2e1a72fcca58-8b66fc970afmr1523563b3a.52.1794156473421; Sun, 08 Nov 2026
 08:47:53 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com> <20261108155702.361022-4-pmazzini@gmail.com>
 <sashiko-outbox-203874@kernel.org>
In-Reply-To: <sashiko-outbox-203874@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 16:47:28 +0000
X-Gm-Features: AclHuK_4qeDidbx21BSiyl5hMY3CGY3Px979lH25Bd33ehuOp-xo-GZuM04gYbg
Message-ID: <CAAxh=jtSHByK2H1fM=1bBiFJPkunKctR1oKU_anf2zYidXtUBw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: sunxi-ng: add Allwinner B288 CCU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:14 PM <sashiko-bot@kernel.org> wrote:
> Should this build sun8i-b288-ccu.o (with sun8i-b288-ccu-y +=3D ccu-sun8i-=
b288.o
> below) like the other drivers in this Makefile?

Yes, I'll fix it in v2.

On Sun, Nov 8, 2026 at 4:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] clk: sunxi-ng: missing CPUX mux and PLL notifiers in
>   sun8i-b288-ccu
> - [Low] clk: sunxi-ng: inconsistent module object name for
>   sun8i-b288-ccu
> --
>
> commit 2d968133b3c297b695cc7e5349c65174d952448b
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> clk: sunxi-ng: add Allwinner B288 CCU driver
>
> This commit adds a table-based sunxi-ng Clock Control Unit driver for the
> Allwinner B288 (sun8iw10p1) SoC.
>
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index 796f443f4d765..debae396555f6 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -41,6 +41,7 @@ obj-$(CONFIG_SUN4I_A10_CCU) +=3D sun4i-a10-ccu.o
> >  obj-$(CONFIG_SUN5I_CCU)              +=3D sun5i-ccu.o
> >  obj-$(CONFIG_SUN6I_A31_CCU)  +=3D sun6i-a31-ccu.o
> >  obj-$(CONFIG_SUN6I_RTC_CCU)  +=3D sun6i-rtc-ccu.o
> > +obj-$(CONFIG_SUN8I_B288_CCU) +=3D ccu-sun8i-b288.o
> >  obj-$(CONFIG_SUN8I_A23_CCU)  +=3D sun8i-a23-ccu.o
> >  obj-$(CONFIG_SUN8I_A33_CCU)  +=3D sun8i-a33-ccu.o
> >  obj-$(CONFIG_SUN8I_A83T_CCU) +=3D sun8i-a83t-ccu.o
>
> [Severity: Low]
> Should this build sun8i-b288-ccu.o (with sun8i-b288-ccu-y +=3D
> ccu-sun8i-b288.o below) like the other drivers in this Makefile?  Adding
> ccu-sun8i-b288.o directly names the module ccu-sun8i-b288.ko instead of
> sun8i-b288-ccu.ko.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-=
ng/ccu-sun8i-b288.c
> > new file mode 100644
> > index 0000000000000..6e12ed8248f20
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>
> [ ... ]
>
> > +static const struct ccu_tbl_clk sun8i_b288_clks[CLK_NUMBER] =3D {
> > +     /*
> > +      * PLL_24M @ 0x034 -- B288 only. It feeds the PLLs 24 MHz whateve=
r
> > +      * the crystal: it converts a 26 MHz one and is bypassed with a
> > +      * 24 MHz one.
> > +      */
> > +     CCU_TBL_FIXED_RATE(CLK_PLL_24M, "pll-24m", CCU_TBL_HOSC, 24000000=
),
> > +
> > +     CCU_TBL_STD1(CLK_PLL_CPUX, "pll-cpux", PLL_CPU, CLK_PLL_24M, UNGA=
TE),
>
> [ ... ]
>
> > +     CCU_TBL_STD(CLK_CPUX, "cpux", CPUX, cpux_parents, CRIT | RATE_PAR=
ENT),
>
> [Severity: High]
> Can changing the rate of CLK_CPUX hang the system because no CPU mux or
> PLL rate-change notifiers are registered?
>
> CLK_CPUX sets CLK_SET_RATE_PARENT, so clk_set_rate() propagates to
> pll-cpux and updates its A31-style NKMP factors in place while the CPU is
> running from it.  Other A31-family CCU drivers that allow rate propagatio=
n
> from cpux to pll-cpux (such as ccu-sun50i-a64.c, ccu-sun8i-a33.c and
> ccu-sun8i-h3.c) register ccu_mux_notifier_register() to temporarily
> reparent cpux to the 24 MHz oscillator during the rate change and
> ccu_pll_notifier_register() to gate and ungate the PLL after updating its
> factors, whereas sunxi_ccu_table_platform_probe() registers neither.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.36=
1022-1-pmazzini@gmail.com?part=3D3
