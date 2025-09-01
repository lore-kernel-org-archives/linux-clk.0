Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902F93AC1C;
	Mon,  1 Sep 2025 00:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756686042; cv=none; b=ctJmG/yFJs507M4mV/64DyzAuKkF3LMFSLrVgucrMIEiIcqgYmS9x3EI2lK5bxMG4nQLoCdcAWUjgGfLdVZWNc0O4HgyxXqhfI1dZydQ+zasG+3heFIngO4BKTeJXDdUev9YzZZoH5OwdVx15aXioqNNwrimUMQO4myOduUi27E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756686042; c=relaxed/simple;
	bh=dU6VSuqZNPYc1Kwd1vEczzF6SMJVLr744+sk2xhrRGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sk/4MBdiby1Xllqa5l1pVpUSXSJqenU4t6OIl+yzyX3efdINi4cbfgqDQLWKwysqesK6kYgHDPEorPdZ7bw280Gg01aIEtZy946CCe16e8qMCW1ePRAiqzwmZLJr0LEqRqRrRjTAaiNyLZ8z+XnHKgxvuemuZLwwYuOz/Nt3yaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6kZUNyD; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6kZUNyD"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61cd3748c6dso7857820a12.3;
        Sun, 31 Aug 2025 17:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756686039; x=1757290839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGA1e9SWx5rX3wnMF8cYm7WiNRZD38DWQOe4gRTSbMk=;
        b=R6kZUNyD+4seiYKihZyvQSEJft+hukJ1gXPeMHWjVkNU9QdPR5Nf7SHhXxDE0kwj6r
         e+EjPFn5GxRComXUdmJmNv8fC/JrG4OKAMdnXwg0Mw6jHwWrjMdm6FmccZ4RbE/ZMUM9
         mj6kJXkUrOunsknYYB8Rhnb/MWge7Th9ouiyjpUl2NwenSENmxyPqwe/5SpqN6Mc7pMe
         o6db9hrhlDj3t/fRb1hyy+B9kfa7xj0w0k48nTbxkhD6GRkjQ+l+1TggnPPNfRgpQXqC
         U5GaL1ae8HSk4JKLRNpOGGqu1p92ca5IG5VFxXMemBr4NKFhtWLav3yOdP2/96KhjU4q
         //EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756686039; x=1757290839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGA1e9SWx5rX3wnMF8cYm7WiNRZD38DWQOe4gRTSbMk=;
        b=T3JnF6IY+40e1C7M15jceXbZc4ffwyZpe97qkPKk9wgZlV3/Sw2IsKB9XUvrVsGnPa
         25iHN41SxUang3STST6LOlOCKupd8hukHlBlV7ZHT99hoDLRjTONwvUrkSvVRqrCcSz9
         r8W1xxQ+UltS2vLlDHDkLWtKCrg6+QK++e6B2nUIQq7to6hYAmH26xB6fHorY0XmzFVH
         /kWFG3pwramoO8aeZ1Tdilgb44+5SeD9gsIDyQBP4+UEfvFH2Mx/PI0FnvVK9VaCfbtK
         SMiftbuIiZBCdG/FQtFddj4J5qYkxHgXwH2pahr4sXY+UwRgZvad0Lpakm9eYqE7HpVy
         ZQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCU6Z2KPtn5yXIJMadCqTqkYESa5kujfyYs+iLFw70RoL0XwyoGRl09eAsZ7D9Jit3F3iM2tpV665zAo@vger.kernel.org, AJvYcCV50pTPHb8QoFVNsjRBf+D/Ac/U660eQ3yyR4AaM7EIktSUUPjzssAsCt4iZD2ni1fF/Qdr2CgjGkbi@vger.kernel.org
X-Gm-Message-State: AOJu0YxBg3W53XCBa/1b1h8Xe0+sH+M4RHOYRHEhKqVf3aZ868AoiraI
	Sp+XdZYcg3qSXOKHoZA75wOdAHqc7nd7LKPv4oSTj23IB6I90RCsnEO79ltyr8SQznw4hMT5A9S
	IHKiUv8YApLV26VeBr0hgvvaLS7GXAzA=
X-Gm-Gg: ASbGncvWVgGJxWer+ZOA8wGIR8BYqLx7kt+efC92vkowUfy5e+NtzQ4R2VZ+47SauPD
	Z2ALTVmbp6J/ugckJbGrV2IHjG9aLniq0BjHvZGfcXgJSHycXFXNYtalCD6ky+r5rCYh23ieGk1
	EfwLuQk9AT0fkj2y649gh0NdBdz8T3rWSv+boYNgwBwk2TXyzUeqnORdMCNs4c9N4hSw9/fDvVU
	ZGTbse2EJo25g==
X-Google-Smtp-Source: AGHT+IE2lhwT6Yzu3q9B3kLM5n807WkxfNRIG/AC95Pv7jUReWAmbkcsG8EsO/ckMMSuQjMFJIJQfLO5Xj7HXKZ2xPM=
X-Received: by 2002:a05:6402:4303:b0:61c:deac:4693 with SMTP id
 4fb4d7f45d1cf-61d269881e0mr5843191a12.12.1756686038562; Sun, 31 Aug 2025
 17:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <20250831104855.45883-6-cn.liweihao@gmail.com>
 <3368190.aeNJFYEL58@diego>
In-Reply-To: <3368190.aeNJFYEL58@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Mon, 1 Sep 2025 08:20:27 +0800
X-Gm-Features: Ac12FXyWs5ayjwnKI44Mb7gtjPKcOLOC6rRUCDyygTcTJqSzEgRm03n4Up5wwFo
Message-ID: <CAPEOAkRZbnVNCRHQnfJu610TK6gkJ0+YrpoL3-xsqTWm7NUsWQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ARM: dts: rockchip: Add display subsystem for RK3368
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Sorry about that, I didn't notice this before, I will adjust it
according to the documentation.

Best regards,
WeiHao

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=E6=
=97=A5=E5=91=A8=E6=97=A5 23:04=E5=86=99=E9=81=93=EF=BC=9A

>
> Hi,
>
> Am Sonntag, 31. August 2025, 12:48:53 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> > Add vop and display-subsystem nodes to RK3368's device tree.
> >
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
>
> please use the appropriate patch prefix. For arm64 this should be
> arm64: dts: rockchip:
>
> The one you're using is from the arm32 side.
>
> Also please sort things appropriately both node-position and order of
> properties inside nodes, see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/dts-coding-style.rst
>
>
> Heiko
>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 26 ++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3368.dtsi
> > index 73618df7a..0e47bf59a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > @@ -858,6 +858,32 @@ vop_mmu: iommu@ff930300 {
> >               status =3D "disabled";
> >       };
> >
> > +     vop: vop@ff930000 {
> > +             compatible =3D "rockchip,rk3368-vop";
> > +             reg =3D <0x0 0xff930000 0x0 0x2fc>, <0x0 0xff931000 0x0 0=
x400>;
> > +             reg-names =3D "regs", "gamma_lut";
> > +             interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > +             clocks =3D <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_V=
OP>;
> > +             clock-names =3D "aclk_vop", "dclk_vop", "hclk_vop";
> > +             assigned-clocks =3D <&cru ACLK_VOP>, <&cru HCLK_VOP>;
> > +             assigned-clock-rates =3D <400000000>, <200000000>;
> > +             resets =3D <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, =
<&cru SRST_LCDC0_DCLK>;
> > +             reset-names =3D "axi", "ahb", "dclk";
> > +             iommus =3D <&vop_mmu>;
> > +             status =3D "disabled";
> > +
> > +             vop_out: port {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +     };
> > +
> > +     display_subsystem: display-subsystem {
> > +             compatible =3D "rockchip,display-subsystem";
> > +             ports =3D <&vop_out>;
> > +             status =3D "disabled";
> > +     };
> > +
> >       hevc_mmu: iommu@ff9a0440 {
> >               compatible =3D "rockchip,iommu";
> >               reg =3D <0x0 0xff9a0440 0x0 0x40>,
> >
>
>
>
>
