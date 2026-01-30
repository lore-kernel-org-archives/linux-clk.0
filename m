Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0F134F255
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791761; cv=none; b=RN1fI99+wplizATro4t12W9xCL9jOKYuo2fnnzOP/biANYiuU8hqR374ImXfoyYWEW9hl1141Eiyd5ADWw8KU/IzyCAFAmLe2Nxd21bLvITCJjRUE2qUBLQD877oFb1h5ICPFZtul2CN8KbOd/ZRjLhVUwokAANOKOpvU7z64bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791761; c=relaxed/simple;
	bh=fD9gxQetzThjMYtpnsCWqdvlRxlJACAFBEWU3vYi8Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVWATLSLSNACNQZjQvXsKW64FVN8MJc6elRLsts4cEjEn6o7yTfQVacEGSrIYvKlpbWm6Q8V06kgNkirm88SozrcrbpPp9+TOaPlgYYfPPpb4ctwtwnXj31zMnIHlC5ylN66WGAwck7QRCq3vdApu/2aLDCpcaBfCSQJEGQBjp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56379cb870bso740015e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 08:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791759; x=1770396559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZJO5fek5/fmG2q9I10L0AXJiVKK7FgcGE1eelPW63I=;
        b=FQVLdytjRZprzN09SgWfC/WgRcNyC5VCAFZ0Exl1U0wpA12lWyQwKKOsycyT0eN6+d
         J405/BIMg9CLEcO+jxKafWALNrwp9DjSrstngVB+pqt/qmXlvM+Zkr3hus5Qp2RX6l6m
         RCuyZcvlNi3m2qzT+HG47ZQEa4tZW3zMdZbWsXEtpPg+IXxa3PvIbK0FHfmMWlSnJKQE
         7mYqzawlgbWhr560I5fkSFmBozerNmsYrlzE1BSP4Aaf+Bfaw4+vChwD0JBkPTjFDvK2
         JT6gHxN4f53FtIQZ/tmnuRjsHQ7cv2KnRWFHVoiddzT8XrhQXnVoBRMoMBUaUerA/5Uk
         7Krg==
X-Forwarded-Encrypted: i=1; AJvYcCXMCfuBuCtF7QjtLzjvRa/w4ojlOv2SsU5eea6RJO1GnGK3tGARRAY1bNuSNcfWuBxaxlIpm75nSWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4XTTM48noccXfmCWwvBYTgODdUedEyHQ+Kq3bSyEeTslcOk4l
	FRpCW6o2OseR+8bGle8ZdG3esTmyLk14CitBekm6MdpREkcKc51TKWDhO4K7ua2DkRk=
X-Gm-Gg: AZuq6aKth/QD6CtJXAXLo5lpER7N/AZ1d0CDAukYHi4/3VOgAB/rczQ15MjUSA0IG4s
	TXAr8KWKwgh97GSB7hbXsRB7k0Ju3rDuvuv7wZ7NavnVaNKPkNthMMJB8j8I2kziixeara4xIlv
	lOesBdG9zc/B8z2iJAdNu0rKjlKrIId5HCb7oUQfoOfx89AseZK6cSzWnMHAkj9gZ8UeUMYYYZw
	cf1aXW3uFsStBIRzIos/8mCmg9/AxDyjzdC+yT8XkHN2blnafvLUiOvT+WQpDKSraafWz+kDpMr
	vn0LVGCeTQ/61VJbA56rOSpSN7ri7oYC8MlTZP+WLFDl7ztxKNManWHRZiSSpThDLlsG+S+LdrR
	prvzXC+OZ1UJdFYfOTv8Bu/O2RO9xRMBcbW2ZRfWBQmcMavnT6yojCQ1DX7gprOJwWHyk9f3/Wp
	AfJ8XSNv2MNTF/htgxjMQ2RBvGB9yZC2SsBq4rU3nbGTfZw5tV7VFL8LxajTU=
X-Received: by 2002:ac5:c4c6:0:b0:55b:305b:4e47 with SMTP id 71dfb90a1353d-566a0188ea7mr809980e0c.19.1769791757618;
        Fri, 30 Jan 2026 08:49:17 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685becfc4sm2370956e0c.12.2026.01.30.08.49.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 08:49:13 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9489bf609bcso96472241.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 08:49:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSrbe6ANSKVBI7UUUs8qH8Vhuj5006vOtjeSSs9mxbL8enoXCR+8fTBqmueMk6VnR18JDPPm4c6DA=@vger.kernel.org
X-Received: by 2002:a05:6102:3f05:b0:5f7:24d8:537c with SMTP id
 ada2fe7eead31-5f8e2659a26mr1102545137.31.1769791753256; Fri, 30 Jan 2026
 08:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-5-ovidiu.panait.rb@renesas.com> <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
 <TY7P301MB1984CB3A92C79442592B045DD39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <CAMuHMdUwsC96cnsZqkV63hnG=C86G5ymScY3qnLR9v830D4m4Q@mail.gmail.com> <TY7P301MB1984FB85250A9B18B5F981F5D39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To: <TY7P301MB1984FB85250A9B18B5F981F5D39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jan 2026 17:48:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVObafuLMBOt=atHJtBBcZ8s0C21Ep2juRE0XPih+iHBA@mail.gmail.com>
X-Gm-Features: AZwV_Qh4mmsGcgcGKwaS7OePDsuvOPtDv-k1-Xv8XUGlO0JwZUtIwuEb4QXisgw
Message-ID: <CAMuHMdVObafuLMBOt=atHJtBBcZ8s0C21Ep2juRE0XPih+iHBA@mail.gmail.com>
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

On Fri, 30 Jan 2026 at 17:25, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> > On Fri, 30 Jan 2026 at 14:43, Ovidiu Panait
> > <ovidiu.panait.rb@renesas.com> wrote:
> > > > On Tue, 20 Jan 2026 at 16:06, Ovidiu Panait
> > > > <ovidiu.panait.rb@renesas.com> wrote:
> > > > > Add versa3 clock generator node. It provides clocks for the RTC,
> > PCIe
> > > > > and audio devices.
> > > > >
> > > > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > > > @@ -108,6 +108,12 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
> > > > >                 states =3D <3300000 0>, <1800000 1>;
> > > > >         };
> > > > >
> > > > > +       x1: x1-clock {
> > > > > +               compatible =3D "fixed-clock";
> > > > > +               #clock-cells =3D <0>;
> > > > > +               clock-frequency =3D <24000000>;
> > > > > +       };
> > > > > +
> > > > >         /* 32.768kHz crystal */
> > > > >         x6: x6-clock {
> > > > >                 compatible =3D "fixed-clock";
> > > > > @@ -277,6 +283,25 @@ raa215300: pmic@12 {
> > > > >                 clocks =3D <&x6>;
> > > > >                 clock-names =3D "xin";
> > > > >         };
> > > > > +
> > > > > +       versa3: clock-generator@69 {
> > > > > +               compatible =3D "renesas,5l35023";
> > > > > +               reg =3D <0x69>;
> > > > > +               clocks =3D <&x1>;
> > > > > +               #clock-cells =3D <1>;
> > > > > +               assigned-clocks =3D <&versa3 0>,
> > > > > +                                 <&versa3 1>,
> > > > > +                                 <&versa3 2>,
> > > > > +                                 <&versa3 3>,
> > > > > +                                 <&versa3 4>,
> > > > > +                                 <&versa3 5>;
> > > > > +               assigned-clock-rates =3D <24000000>,
> > > >
> > > > Shouldn't (at least) qextal_clk and
> > > >
> > > > > +                                      <24576000>,
> > > > > +                                      <32768>,
> > > >
> > > > rtxin_clk be overridden to point to the corresponding versa3 output=
s?
> > > > Same comment for [PATCH v2 5/5].
> > > >
> > >
> > > I tried implementing this by overriding qextal_clk and rtxin_clk with
> > > fixed-factor-clock nodes that reference the versa3 outputs as parents=
:
> > >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > @@ -504,7 +504,11 @@ io {
> > >  };
> > > =C2=B7
> > >  &qextal_clk {
> > > -       clock-frequency =3D <24000000>;
> > > +       compatible =3D "fixed-factor-clock";
> > > +       clocks =3D <&versa3 0>;
> > > +       #clock-cells =3D <0>;
> > > +       clock-mult =3D <1>;
> > > +       clock-div =3D <1>;
> > >  };
> > > =C2=B7
> > >  &rtc {
> > > @@ -512,7 +516,11 @@ &rtc {
> > >  };
> > > =C2=B7
> > >  &rtxin_clk {
> > > -       clock-frequency =3D <32768>;
> > > +       compatible =3D "fixed-factor-clock";
> > > +       clocks =3D <&versa3 2>;
> > > +       #clock-cells =3D <0>;
> > > +       clock-mult =3D <1>;
> > > +       clock-div =3D <1>;
> > >  };
> > >
> > > However, this breaks the boot. The problem seems to be probe
> > > ordering:
> > > 1. fixed-factor-clock uses CLK_OF_DECLARE, so it registers very early
> > > 2. At that point, versa3 clocks are not yet available (since versa3 i=
s
> > > an I2C device, it is probed much later)
> > > 3. The clock framework registers the fixed-factor-clock with rate =3D=
 0
> > > 4. Consumers (RTC, timers, etc) probe and see rate =3D 0, causing fai=
lures
> > >
> > > I'm also concerned that if qextal_clk (the main SoC clock) depends on
> > > versa3, nearly everything would need to defer until the I2C subsystem
> > > and versa3 driver are ready.
> > >
> > > Could you please provide any suggestions on how to handle this?
> >
> > I meant to override the references to qextal_clk and rtxin_clk, i.e.
> >
> >     &cpg {
> >             clocks =3D <&audio_extal_clk>, <&versa3 2>, <&versa3 0>;
> >     };
> >
> > However, that could still delay everything, in which case we should
> > just document the routing in the DTS using comments.
> >
> > Can you please give it a try?
>
> With this change, the board doesn't boot at all, no output on the
> serial console.
>
> I think with this we are introducing the following circular clk
> dependency chain:
>
>     cpg -> versa3 -> i2c -> cpg -> ...

I was already afraid so...

OK, then please just add comments like:

    @@ -289,9 +289,9 @@ versa3: clock-generator@69 {
                    reg =3D <0x69>;
                    clocks =3D <&x1>;
                    #clock-cells =3D <1>;
    -               assigned-clocks =3D <&versa3 0>,
    +               assigned-clocks =3D <&versa3 0>,  /* quextal */
                                      <&versa3 1>,
    -                                 <&versa3 2>,
    +                                 <&versa3 2>,  /* rtxin_clk */
                                      <&versa3 3>,
                                      <&versa3 4>,
                                      <&versa3 5>;

Any others needed?

Thanks for testing!

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
