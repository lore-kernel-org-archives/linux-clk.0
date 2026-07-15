Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A9D3DA5C3
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105681; cv=none; b=ktDGFduioU9xNYm/2T08iG4YYjfdcmytAog/7Zw3P47UdIT90FaWWTb9dBqQ62dExBRAAuQPs/BfG6+F3Yxc4BYCrDOm5mZhheFfOILF2SLqeLcHU+cbvnvRLVuyUzo3a7nkBfwhbcyv/bBYMAt6m6nY6qcyFKiwY6HvNiCh6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105681; c=relaxed/simple;
	bh=4p7JA6EZMNI8+iBrijHrUHNSvFWoAG8Fnu6BsUPc+bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVqYEao15bLwWKCNj2UxpAAxtre1CWlo6Ty6T4ELf21oK/keVLKbA9McKi+C9d4rnzC3YAa3ctPnOTBdbs36K3s8/xweEQLdmaVvm9TeU1Amz0kKJLelm44Eyr5HwhLzNoYFQsKFl/aHgnZEzctq/Ym7B/gbaomjKPzqsTnxto4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so3241457e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 01:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105678; x=1784710478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByrjGjRxl6chD7mBfQkVFOKBnkOxHgRz/c3eqExfhhU=;
        b=mWGwRM6cPwLN5OsfUYLJtTBeWt1BN9dq4C6s9Up8imrZ/wh/1ETjam8/nImmIi550r
         0s0eGqYUq5ComwIbSIJdXnYNUn+khztyoAd8Aralsh6wsfmh7b+qurmpRCvAihkU5pZ0
         sZDj+twJIQaubP6isMdrlZcxIgMcvCA+JTlOY/W47f0+F+njGcVZub5fa2GyOYSZqeRk
         nPq3lS2WAuoc28mhnOSdsM31EICVI4D5pKaqwWD/rREMN2yD4wxP33sbXX2jc1i3m9fn
         dx75TAd9qxvzd0geivAtcp4dMvgAetTECSdr2zOndq/DLnkm7qvL1O3NjSr8Xjlbal8F
         MHSw==
X-Forwarded-Encrypted: i=1; AHgh+RqUhQeZmOwnUx5w7GP4N1IsZ9FUpYPNVK5XKmOR1jmikqFNfDL/VCY3x+HlanJCPupHjiOLJ3sCy5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWd87bk26oE/tM9PndPwoXyUPpX8hrOumKphywtpsdzNW4Z0J/
	KfH0otOqaocRL5WiLBnAXIbjjNUSKqRiyj0CVnFrzG7Uf2bWtSxQiiyfNNV2sc+eEe4=
X-Gm-Gg: AfdE7cnxGRmGrsOIFmWGL9SU7ccwwzFXvMIE3vUyWmo3nAozObJKU5nh7PVpvh/cUfR
	pdWbTkobysM5mz9pBjHs1p9nOFjDMGh51F+r/VyL0F3stFr5Alv5nvolXeL81Eteh8oz0P7eBuP
	x6y/E1xfBEx5LnBV7iuRaTjHSd+hC3ID+GR7EgGP/oZiFDXEHkPak2r25n91UFM08RLP90qvexi
	8Z8SYXzt0Aow+eFsBHkVsn1hIHnZ9wEkyl4EmKhyCHL8ZuS0/kDaJYUFaObPreQzt4yCRErNGQK
	dLI8haByATUSHNxkgWEKt9efnOPy7/W/EE+FJIoTTcBfn4+YlnmE1cekwoC7kraSLv6AcUmElp9
	U/H3/R+ixB9+mHcOuJ2f9+DFVK1h3+s3Lp9TkQHks8CDCRq0m3BHht3xgkmxbEvBFeyNSYTc8QF
	Bv6qkXoHozK8n3GJmyxSvIp4suaXmIhWCKQ7OyDPdGOp/MS9pBww==
X-Received: by 2002:a05:6123:109:b0:5bf:8469:c7a0 with SMTP id 71dfb90a1353d-5c1161c970cmr3289063e0c.3.1784105678073;
        Wed, 15 Jul 2026 01:54:38 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfc655c77fsm6618161e0c.15.2026.07.15.01.54.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:54:37 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73b909fbb6bso3343908137.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 01:54:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqfTQ6vSigrxyIg+FGdJrotmNr1rCFtbwyAoYN4lUrCNjno6VS3C6opI4bS25/UngMMPSd+Ev0x+f4=@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:738:fd01:5b60 with SMTP id
 ada2fe7eead31-74587311ce1mr3372984137.3.1784105677124; Wed, 15 Jul 2026
 01:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com> <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
In-Reply-To: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:54:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
X-Gm-Features: AUfX_mxDHx3n63ocxRYS-KeudKm3TNmAE-PyMFFvcB9KNeYvoVs9ROnUvj_T4n0
Message-ID: <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 14 Jul 2026 at 15:27, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > This series adds support for the System Controller (SYSC) blocks foun=
d on
> > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-=
power
> > > management and access control functions.
> > >
> > > Hardware Architecture & Dependency Challenges:
> > > ----------------------------------------------
> > > The SYSC in these SoCs is a multi-functional block responsible for:
> > >     - Clock & Reset Control
> > >     - Low Power Management
> > >     - Clock Monitor (CLMA)
> > >     - Access Control
> > >
> > > A key architectural detail is that these SYSC blocks are physically l=
ocated
> > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Software =
Reset)
> > > address space. While the CPG/MSSR driver is already implemented and
> > > functional for these SoCs, the integration of SYSC adds a layer of
> > > complexity due to a cyclic dependency:
> > >     - SYSC requires CPG: The system controller needs a clock to opera=
te.
> > >     - CPG requires SYSC: Access control registers within the SYSC con=
tain
> > >       bits necessary to control the PLLs managed by the CPG.
> > >
> > > If implemented as a completely separate top-level system controller n=
ode, we
> > > would face a cyclic dependency between the CPG and SYSC drivers durin=
g the
> > > boot process.
> > >
> > > Proposed Implementation
> > > ----------------------------
> > > To resolve this, the SYSC blocks are represented as child nodes of th=
e
> > > CPG/MSSR controller in the device tree. The SYSC regmap is registered
> > > directly against the CPG device node. This hierarchy correctly models=
 the
> > > hardware address space while allowing the drivers to share resources
> > > without deadlock.
> > >
> > > I am sending this as an RFC specifically to get feedback on the
> > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > dependency cycle.
> >
> > Personally, I am not a big fan of subnodes.  I assume you are using
> > subnodes because you can register only a single regmap per syscon node?
> Yes so that the consumers don't have to specify it by indexing.
>
> > Would it be possible to just extend the existing clock-controller
> > node with two more reg entries, and expose them through a single
> > combined regmap?
> >
> That should be possible. Or would you prefer just to extend the sizes
> and create a single regmap for it?
>
>                cpg: clock-controller@80280000 {
>                         compatible =3D "renesas,r9a09g077-cpg-mssr";
> -                       reg =3D <0 0x80280000 0 0x10000>,
> -                             <0 0x81280000 0 0x10000>;
> +                       reg =3D <0 0x80280000 0 0x20000>,
> +                             <0 0x81280000 0 0x20000>;

Yes, as they are contiguous.
These registers are not accessed unless there's a user specified in
the DTB, right? So there is no issue when booting an old DTB that has
the short reg blocks.

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
