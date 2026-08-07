Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279AD477294
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109433; cv=none; b=uaAehY4F/3qrhkntjQ0//SVRjGXUvhqP14ZNPBxpBqeZZug/KUQJrUyht6+YDDH8jfurVr0/5LXnHa47Uzcjo9Rx1cwXYAm1qkyD3yR3H12aNQsAneSiXfTQ1FcQyM2KlO/hA1sOyS0oHDwI9AYi+s2P6EztlT2e6K27AbbQAcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109433; c=relaxed/simple;
	bh=lNRMCMZWJrIGh1fhRbztqbQIc9J7TxN7ZrtNGrtgNXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAntADJtLi2rXETl2SzaWKCs0TW52s23tUbJCqY4Q0irbztVLXzCRio+3if//EGu30F7CHoN/ZKV8ayDBqyyDp6e1tupALc3Neq5iNH2c6fIu3TorMMlH3tRekgPP3K/dUTKKecWOMsYuAjDGlZdl3JpNTlBnPX8W56i4eKCYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e512a9a6bso158305185a.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786109425; x=1786714225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/AAuSUTI9BlhHsMbAPbLkKHE3Mv88lOoxgJOEPTw6U=;
        b=QUi1EG+uGSM00JMJU9u16U1FTnyZH8FpQ5n8BiqBsn8K3eQZsHWu4i3X6nVZ6nuIpq
         NLF1FA9i6g8hwksxyBVQhm8tPu/vDrwI6wdCSmCxS2/uLRywz33AzVSdhzh2+3LzMzr7
         Aa2tkaHf3ccpseQcLqVtvnvrgqaiDLYb0VgvIp1DApHcxNUBPz0CkAkYtz5XSZ9TFamj
         F4G2MTxkb/iZJRiXEdNN3Or51nu02l3WyoLh1dNaZsnuBdbGjESsFh+6xrPgFhIImDEk
         kGWqE0t2JTaveD/NS8mRvwU98xjewmRW24H42+GBRDczdjKhcHSaTFzV443ZgaFRB8E4
         Cr4A==
X-Forwarded-Encrypted: i=1; AHgh+RoKOdMctK94sJmp6pJsnEoTH+fRpFUB1v65NaeL9Qke82cxZJ+dyfQ49+AW2+CtWzERuF62UXDxDaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT7qQrahsxypP0ugIrKwGwZyEakY+92DF9k9oCEGPNM+QGr5Mm
	jfCBRyLfqefp7JbxvPrLR1tbLoxHHHDcVRAv/vvdfqaortysCHUpd/lSZdSSM6iN
X-Gm-Gg: AR+sD10YsfZetqvYJoZ9GVaqbRho2oHxzHtMJl1st1sPPqedsm4bEj+bq+TsqEO/mCZ
	gT6FljVZqihqVDyThun9z29nc/yYw6KZ7OPWXmzWVGL+C+LDMWCEqTfQo2aSoMOmDxXS8HeuBQb
	2gXooCXoJdSs18NjR9SURPCiaBQ5860iTo3inXktpxkH7VE4U4lb/WTB1nt5bjONS0YOu0xOvNL
	U0+ZTg66OSwvLjJSirKC0ai6TphqK/Fx6XV37y+khty2p0Z3ejhUyrPTsZ4VRMoIyzMCJWekFl+
	fq7xm71eLbFknk8So/z/YZwhjFHC0a6TEnHyWcZRbvQiztnhX7J+YytrTDxc2EI0symd0dpXSEp
	Lc9mCDBRhrKB5l87AsifCS5UHSpyGwF8fvSQuphy0zmVntXBt4zo9oZknWTIEY2pvZDqH6a+YsF
	1Rt2alr201eNHGzDgpb4a9t5nsUljY2ukqQnS2EsWr4afMaaAQqcZpqHbIBgNgHqN2ZCr3M2c1H
	nG5NjsjFHUc5NqTD/IpU4OvgrVvR7o3hMnq6w==
X-Received: by 2002:a05:620a:2804:b0:92e:fd2c:6a21 with SMTP id af79cd13be357-9364922a59bmr2187385085a.27.1786109425230;
        Fri, 07 Aug 2026 06:30:25 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e090f19sm150123585a.14.2026.08.07.06.30.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 06:30:23 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so2026428241.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:30:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RovUy7nahRlZZ+Jevyod+nAmgozkVlpgYNm1VV3LgCR2c4bqTWZyz8GXulAGWs4C74ZiahSeMyxvF8=@vger.kernel.org
X-Received: by 2002:a05:6102:1491:b0:740:2d40:a234 with SMTP id
 ada2fe7eead31-760e934083fmr7749766137.9.1786109422395; Fri, 07 Aug 2026
 06:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260720-fractal-prodigious-spoonbill-86f534@quoll> <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
 <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org> <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
In-Reply-To: <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 15:30:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
X-Gm-Features: AUfX_mxDi0guSe9Khaez7xiSfow3Ijch9zm2XE5dr_dyKyhIvomQpIBNYO4wzk8
Message-ID: <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 20 Jul 2026 at 13:14, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jul 20, 2026 at 11:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> > On 20/07/2026 12:50, Lad, Prabhakar wrote:
> > > On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>
> > >>> Move the RZ/T2H and RZ/N2H clock controller bindings from the gener=
ic
> > >>> renesas,cpg-mssr.yaml schema into a dedicated binding.
> > >>>
> > >>> Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2=
H
> > >>> system controller integrates additional functionality beyond clock =
and
> > >>> module-stop control, including reset control, clock monitor support=
,
> > >>> write-protection registers and other system management features.
> > >>
> > >> Nothing of above differences got reflected in the code, so I do not
> > >> understand this reasoning. Binding is exactly the same as the old on=
e.
> > >>
> > > A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
> > > Since the RZ/T2H clock driver uses this syscon wrapper, a function
> > > pointer is implemented to handle the RZ/T2H-specific configuration.
> > >
> > > Also, as the initial implementation used separate device tree nodes,
> > > Geert suggested splitting this binding schema off into a dedicated
> > > file [1].
> > >
> >
> > I still miss the difference. Can you point me (can be short diff) to
> > actual difference in this binding?
> >
> Fair enough! You're right that the schema text itself doesn't differ.
> I'll drop this patch in v4 and leave the bindings in
> renesas,cpg-mssr.yaml (unless Geert has a different opinion).

Given you no longer add a bunch of RZ/T2H-specific properties
and subnodes, I no longer see a reason for the split.

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
