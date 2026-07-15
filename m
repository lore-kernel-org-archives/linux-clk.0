Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1704E3D9526
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105800; cv=none; b=dbQNXP/893pFgLSSqHNy2Kfhhp59ZGNgw4JA5+8okkJQvufsvE130IRK4FbfEXAEYMMdOYBxtbztKnxoHdWWCAUBpm/Pcj2bZD8xf6lN8AkRp0AApJGC3bmi2Sn/xULcbtPq4AKkSg7nRuMNwWd2Bx14moGGo0uYhvBzzmzTWYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105800; c=relaxed/simple;
	bh=UpStxGVYslbxooun+2Y901dqVJN3H5rYG1yY1FSZ/gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPylnfsD0PAssKpVB07QIZ42RBEBwsBRP27oaXlqLsTnlXyLG/FArg1/mEX50Qc7SELgmsZ5BOM0VJEf8/7P2JA+RQJALolY/ca3U49UB7pnElS6umCHgASHEvXxYSav5Ibg9PYNPYZW6MzS3j7h4ZaIIu0lIaQ7X0ue1lIVY7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-737de52625cso2436602137.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 01:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105798; x=1784710598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIyweZY2e0/6Tej8S0XE9Agd9YDC5DXPE+LxKJOtIuM=;
        b=GKgmtLVRLEBJCBR1ccThS9yn1SiTTpeY2Gl9Zr9Qiw4qtDEXzvzXVHBcxkFr7Hk2Ub
         s0p6MjlOxpKyxYo/kPwkhWF/sGy2U5fIwOCUvV9thoMh1MXt5pNNFaOE5UmBQ+miUj11
         7nRhs5tdqVlz54hQhZljnC5uBsyFy5zvjPiN2RTCYcDqxP4QkiGR1QwukgA+rO7T9GIk
         woSJbx4VPV93RE3wvEIYHvMTCjcGXQTBwquygDoDwywlZw2/6VaVk7h/5+SalMXtiLzY
         YC/J89EZxHNqfQ1J6VtjJ4BqMjfhWJl7iDmcG/L7ece8+vbOGHnPwcSUk/vyOgQGMXOF
         Y6xg==
X-Forwarded-Encrypted: i=1; AHgh+RrqANRlgpUV138utMG+swKLUyPUIO4i8wM88d4dGBCcgxJfKWZOKeH6hWMtOZ926a3rbOeQlQ8x62U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3IWPBCeUv7P2g0UHuJ8ald/GnkdBFnEScJsl0PcQn9UodH6W0
	s1IbTeKejp/2N5bdoOOTJAfvP+k7RkObYAvKaKGt+kZ9uth6mHCmyK4UG+ghGlDZTHQ=
X-Gm-Gg: AfdE7cm0WiWgbEWBQVs5VEBoqvXZPqQzxMn4PO6KK1MN3ytSJulzFNzXP5sRWYLbctO
	vcrdU+AjBOkL2uSYmSSY2h0+LEpwrcLT7SJsJ2eP9toRU1DEPik3InAphz3NUS8HKXc7HkCgIbP
	IEI8jXw2tl3LqVO20nK8t5viiwfKZFsZP48AjpnSUhmfI2xMknS1XFpXAEnjOLSyGdOsXnMRbg2
	Y0mtLTLSLFqJkJfbArR1V9lyHegAWEXnqsUTpN0+oi0QuAuUXuvUMAaVPKDILcIQmPxPW27uj99
	pjS+uGTkNL8M4dZWseWqzSoCCVkGbP0MAuPIQ2z8fx2JQzQ4+5LpIR+uRHAsKknhJoCm0sutM+a
	xp8/Co0JLsDhXcfxG88x+N50P3qnWjGHXBmdx8c6G3kbAjbjlUyDQMXChYCn2XYmwJavL+oHEMx
	nJwZM7t9zl+ROruG+JY1mETHuEF6SDqFnM8ECoot/XfJcUFaVlRA==
X-Received: by 2002:a05:6102:370c:b0:745:31e9:f3d2 with SMTP id ada2fe7eead31-74587394a0dmr3067781137.10.1784105797861;
        Wed, 15 Jul 2026 01:56:37 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a90d4fsm12153693137.5.2026.07.15.01.56.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:56:37 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9691bfc9f81so2950339241.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 01:56:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqJPTRolm/K0kPqNzt8/cDsxXx0VyOWx0eVAyA3YM7v1EkTWi7vvClRR9ODeF4YmbWa0Y2sFhAUZuk=@vger.kernel.org
X-Received: by 2002:a05:6102:1499:b0:737:ba2e:8a26 with SMTP id
 ada2fe7eead31-745875931d5mr3323342137.27.1784105797210; Wed, 15 Jul 2026
 01:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
 <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com> <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
In-Reply-To: <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:56:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
X-Gm-Features: AUfX_mwT5leJvJcjodDPFjgFmedyheuuombdI-qCHkgNmnfgE8I_sxJbNtJF5DY
Message-ID: <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
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

On Tue, 14 Jul 2026 at 18:51, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Jul 14, 2026 at 2:27=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > This series adds support for the System Controller (SYSC) blocks fo=
und on
> > > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical lo=
w-power
> > > > management and access control functions.
> > > >
> > > > Hardware Architecture & Dependency Challenges:
> > > > ----------------------------------------------
> > > > The SYSC in these SoCs is a multi-functional block responsible for:
> > > >     - Clock & Reset Control
> > > >     - Low Power Management
> > > >     - Clock Monitor (CLMA)
> > > >     - Access Control
> > > >
> > > > A key architectural detail is that these SYSC blocks are physically=
 located
> > > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Softwar=
e Reset)
> > > > address space. While the CPG/MSSR driver is already implemented and
> > > > functional for these SoCs, the integration of SYSC adds a layer of
> > > > complexity due to a cyclic dependency:
> > > >     - SYSC requires CPG: The system controller needs a clock to ope=
rate.
> > > >     - CPG requires SYSC: Access control registers within the SYSC c=
ontain
> > > >       bits necessary to control the PLLs managed by the CPG.
> > > >
> > > > If implemented as a completely separate top-level system controller=
 node, we
> > > > would face a cyclic dependency between the CPG and SYSC drivers dur=
ing the
> > > > boot process.
> > > >
> > > > Proposed Implementation
> > > > ----------------------------
> > > > To resolve this, the SYSC blocks are represented as child nodes of =
the
> > > > CPG/MSSR controller in the device tree. The SYSC regmap is register=
ed
> > > > directly against the CPG device node. This hierarchy correctly mode=
ls the
> > > > hardware address space while allowing the drivers to share resource=
s
> > > > without deadlock.
> > > >
> > > > I am sending this as an RFC specifically to get feedback on the
> > > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > > dependency cycle.
> > >
> > > Personally, I am not a big fan of subnodes.  I assume you are using
> > > subnodes because you can register only a single regmap per syscon nod=
e?
> > Yes so that the consumers don't have to specify it by indexing.
> >
> > > Would it be possible to just extend the existing clock-controller
> > > node with two more reg entries, and expose them through a single
> > > combined regmap?
> > >
> > That should be possible. Or would you prefer just to extend the sizes
> > and create a single regmap for it?
> >
> >                cpg: clock-controller@80280000 {
> I wonder wether we rename this to `sysc: system-controller` but the
> compatiable string has "*cpg-mssr" postfix.

I think the current name is fine, as clock control is the main function.

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
