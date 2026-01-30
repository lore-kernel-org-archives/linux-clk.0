Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6828136B064
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786102; cv=none; b=JOtPRHi87gLMhlcjnIlmGCR3+M1KWAoLHq13xex/8vQdUStoHXMHLqUr4V0t0PEfrHX9y+qK3rTEDAqayiIeOHhzfMQPKCh1qrBdJ5jvRK0ax2Uc3BOG3IepdIOMPaoQJIKA7gIc4x+e/59bAPMO0Gex1nDzbdnmSCVteUMHwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786102; c=relaxed/simple;
	bh=SCFTBM65OjdnEPSOyA/r/B8nbJZrxArFeaTdSVVDLVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNdeUlTir+OJsr+haQxuMaxWXVNQnV4oybPyg0KI5zKqkKczW9WTgiIeyKzVNJw7QgSkEwf8q+81th6/j0d65rMBbPcYBO/b2gdD/JnkFuDdbpWcF1/NAeuBVRndWGcxA9XuXLSFgI5LvEjvecon09XP32ZPdftwLoMzGI+p27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5664340e14fso601872e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786100; x=1770390900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5GxIpMewJabp2FPSWHiEBeFWfyS29PfJrKQD476a5o=;
        b=BFchjPmzXO2TvcCJ0gF8B4sIudeLUzJ6FFZH+hkwoVcQSofZlITAJ8vmO4lryHSGet
         1Kvp7K/HoGqCaY0zx4VQLEAE9OygZR0wVIyhcm9Olc8D/YItSyZs63xNmpimruE3FmK/
         t3k3sZ98OsNZVPoujT/CncNgDm+ACrXB2IwVrZ9FAzTK7r7JHIq3huJ/v9Wildmcg0sr
         5Lrr14AgRbkx2gVTnhf+QQEDI4Qn9F5ImjqMLSgATaHe8k7qorgjQIcDwPVZiolNC/BT
         KMOtEH9vsba88RZCIPqVrPUJfnYFQP/npteQ9Fel6zKvLxg6g1j1rYoi2W60KWvp+mRL
         hDrw==
X-Forwarded-Encrypted: i=1; AJvYcCVQjSA3lU6pbsmD+2OtMyN/Q2Rcje80hxlPRh/KL5a+iKS3HMynY2vN+qc4I7f8BuFci6Y/s0Q6TMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx73TazL2g0rEK6uAND9YG2ap8xGUbGoPOvbdEXo7ikAH7HxQfV
	nmBPn9BK6gYR8+dWVRtWKBVs8c5HBfbOMga9aGFE7TF/ezHUwKn4PNSL/McyL6Ww
X-Gm-Gg: AZuq6aJzoLlKicgf66pSDh3BnonFZ1Fz3X1FVsRS1cMnyti94Fexmzs12D61aLvQQpV
	1maEW7/g6K9LzWXW41OWddgJaQ2rYnYV9sZQOAZgarzAeZKedOaL92ntQYEBvW7M+OhQsuq9MNh
	HUUxHpTPylBybLp4SzBRtsyuHMs/rO7fCECck8GRR8AR4ZcdHtkELRTfAeCfTmCb7TjCZHVmLPp
	Fyvp4dHdopWaNS471AFnZqyUZByOZmxhHV6auy07df4x2fimt4WJ9j17C74eyJ7Ni24XR0Ok7id
	NVmh9cKbJBWx5ROKeYHiTgt7jr9b014jjiKQi3Z2nh9qUE1X6t0CsS6x041s25MOPgebJACn0Qg
	q1ZETtTi5oGB5luHTO95hUsj0X4M6asfaEausNP7faKpQ6QE/9rquewK3DzLZqjJXnzgcw9xW7/
	Mx8ZoTrArhTLAh8fB6a8frfMKoWzTjlxUV5xf5nKpi3+1oOYAL
X-Received: by 2002:a05:6122:32c2:b0:566:2494:39d7 with SMTP id 71dfb90a1353d-566a0136965mr899845e0c.18.1769786098453;
        Fri, 30 Jan 2026 07:14:58 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685bed029sm2224097e0c.13.2026.01.30.07.14.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 07:14:55 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9412cb281acso654121241.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:14:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlWeEtK3EE3tAExrXl3syyl/JJPkkJhFEvaFO3FYJ/05ZoQtUv5BSHCET2MN2HpFgd9hk0eZVYhCo=@vger.kernel.org
X-Received: by 2002:a05:6102:c0f:b0:4e6:a338:a421 with SMTP id
 ada2fe7eead31-5f8e245a613mr777546137.6.1769786093798; Fri, 30 Jan 2026
 07:14:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-5-ovidiu.panait.rb@renesas.com> <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
 <TY7P301MB1984CB3A92C79442592B045DD39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To: <TY7P301MB1984CB3A92C79442592B045DD39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jan 2026 16:14:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwsC96cnsZqkV63hnG=C86G5ymScY3qnLR9v830D4m4Q@mail.gmail.com>
X-Gm-Features: AZwV_Qi6n9e2kcogpnHrc6feOuUgDWyZ2jOoQdQQziRL-Ylwm9-bZFnrkPgSJg0
Message-ID: <CAMuHMdUwsC96cnsZqkV63hnG=C86G5ymScY3qnLR9v830D4m4Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: "magnus.damm" <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ovidiu,

On Fri, 30 Jan 2026 at 14:43, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> > On Tue, 20 Jan 2026 at 16:06, Ovidiu Panait
> > <ovidiu.panait.rb@renesas.com> wrote:
> > > Add versa3 clock generator node. It provides clocks for the RTC, PCIe
> > > and audio devices.
> > >
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > @@ -108,6 +108,12 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
> > >                 states =3D <3300000 0>, <1800000 1>;
> > >         };
> > >
> > > +       x1: x1-clock {
> > > +               compatible =3D "fixed-clock";
> > > +               #clock-cells =3D <0>;
> > > +               clock-frequency =3D <24000000>;
> > > +       };
> > > +
> > >         /* 32.768kHz crystal */
> > >         x6: x6-clock {
> > >                 compatible =3D "fixed-clock";
> > > @@ -277,6 +283,25 @@ raa215300: pmic@12 {
> > >                 clocks =3D <&x6>;
> > >                 clock-names =3D "xin";
> > >         };
> > > +
> > > +       versa3: clock-generator@69 {
> > > +               compatible =3D "renesas,5l35023";
> > > +               reg =3D <0x69>;
> > > +               clocks =3D <&x1>;
> > > +               #clock-cells =3D <1>;
> > > +               assigned-clocks =3D <&versa3 0>,
> > > +                                 <&versa3 1>,
> > > +                                 <&versa3 2>,
> > > +                                 <&versa3 3>,
> > > +                                 <&versa3 4>,
> > > +                                 <&versa3 5>;
> > > +               assigned-clock-rates =3D <24000000>,
> >
> > Shouldn't (at least) qextal_clk and
> >
> > > +                                      <24576000>,
> > > +                                      <32768>,
> >
> > rtxin_clk be overridden to point to the corresponding versa3 outputs?
> > Same comment for [PATCH v2 5/5].
> >
>
> I tried implementing this by overriding qextal_clk and rtxin_clk with
> fixed-factor-clock nodes that reference the versa3 outputs as parents:
>
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -504,7 +504,11 @@ io {
>  };
> =C2=B7
>  &qextal_clk {
> -       clock-frequency =3D <24000000>;
> +       compatible =3D "fixed-factor-clock";
> +       clocks =3D <&versa3 0>;
> +       #clock-cells =3D <0>;
> +       clock-mult =3D <1>;
> +       clock-div =3D <1>;
>  };
> =C2=B7
>  &rtc {
> @@ -512,7 +516,11 @@ &rtc {
>  };
> =C2=B7
>  &rtxin_clk {
> -       clock-frequency =3D <32768>;
> +       compatible =3D "fixed-factor-clock";
> +       clocks =3D <&versa3 2>;
> +       #clock-cells =3D <0>;
> +       clock-mult =3D <1>;
> +       clock-div =3D <1>;
>  };
>
> However, this breaks the boot. The problem seems to be probe
> ordering:
> 1. fixed-factor-clock uses CLK_OF_DECLARE, so it registers very early
> 2. At that point, versa3 clocks are not yet available (since versa3 is
> an I2C device, it is probed much later)
> 3. The clock framework registers the fixed-factor-clock with rate =3D 0
> 4. Consumers (RTC, timers, etc) probe and see rate =3D 0, causing failure=
s
>
> I'm also concerned that if qextal_clk (the main SoC clock) depends on
> versa3, nearly everything would need to defer until the I2C subsystem
> and versa3 driver are ready.
>
> Could you please provide any suggestions on how to handle this?

I meant to override the references to qextal_clk and rtxin_clk, i.e.

    &cpg {
            clocks =3D <&audio_extal_clk>, <&versa3 2>, <&versa3 0>;
    };

However, that could still delay everything, in which case we should
just document the routing in the DTS using comments.

Can you please give it a try?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
