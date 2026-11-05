Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890182;
	b=s/WwmDinmtskyWZNSXP/drRvm5bC/LbXD1gs9x9i1MYTEfMuUSvgxzluD8hoXklpt6XG
	 bISaUuKtGY0/lVaLQ2efkEoWB6Q1XtTRGPR2QWATX/i/jDNimxLJIq+t2gPEg3hjZdhDo
	 gWf75ZpUU8oLiBX/uyNJhr/VaIs9yxQIv9AQ5ZZPjqUSOvx8BOAhPxVbjpfRiNdTuT0rV
	 V8U5OUn3DPSA7uHeN/cgCADYdigcNy1BpauHPmj4/kHOQ4D85TIimnLP+FFLZ35KzkwOx
	 JxuJXRtK60+Gw6wNf6rmPhlvTe21ceNvZ0NYL4THtwXvwlvuSWB6satqJR4FhYDrr6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890182;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QpwPqOLAugA67x75tYz1g7ohdoIGIFAO4TwGyxZEzGk=;
	b=ueZtjZyEXGNfYM53zwj1yw/DN3/M88H7h9RxHrMdXZ9VCUh8wshyJDGYbGtQ4ogOznbv
	 pnDL5UyuDmX3Wg7PP8zBIdIhkv7gMjmeYhQiElNRjTbblIbHKH8GGHQzC8PGL0NX/jIoH
	 IvicLgQgJxsHf5j+tSaU5LwyoctfPLaqWHp8+4lKBmqkcttPYcdHTBZqWL0b0JLMmdkBA
	 W1lMz27vPb42OwutmWIpc4vnbmVEhxqV1cFf/f1Qgh/HmUlAJFtq3RDHnWeNCqtbNzYeS
	 WFGehw9sv0uY++IiCLluJy+Lk0RrouwH6Nex1VO/TpzKtcTXgij71JKFyl0cf6Am6kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE19606A332
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 14:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE19606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9909e82513fso614749241.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 06:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890181; x=1794494981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpwPqOLAugA67x75tYz1g7ohdoIGIFAO4TwGyxZEzGk=;
        b=TZuUtpzteJl0raExCDrGiP3NEQSNAyh8Ctbn97hUDRQFbO+o6bVZdh+Rz63dmP6eFF
         0h8MWbdbgdxp60sjds3BcjPvpSL52GlDK3MMUHod1GFjdj4pNI9W4eZbB67SjqzE54Pq
         AbvV1WFqEV6W0gkExAxGvTpJ9UBP6L4+2FLClMOPtVVTx1zMd49Wmq9h8MoHM2v3feR4
         ZjEkltGD8D5nFumTSjdgL5LXu1vbV8pu61LH3WKBViCTTsCb2j9lO81+k02ujqXOnw+P
         PeLMSyx1M/4N320J7Oy6zEJtzdoeJSGNa5tsFt8blfVcEEpqI0LIsnZ0TypTt9pVjzsc
         F0/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuZkV2byGkAleQtB+p3r54UGRiyZju9iQsxuLp0uYP0kqbZ2KXSooHnYf6mhmqejbE5KyAY4Q+ZA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/msItQI9zBf9cv0nAWiIEnE76hg0LZ1jMXRNKMwok+juojzgsN
	oq25C6k2MuUdEpficywbTcZrLLp5Y+lW33+0w9i3KJTlUzhU4PB8mYVba9BzKVCItwI=
X-Gm-Gg: AYBFou3z0UpajDxXxhMJuAkyUtC1odID3jQHIrjmIaWlGyhH6P7It6zZCOozcUQ0w87
	VYJnr2NPuOZTFG1nX6XX6i6QfOP3fsfDmCL3Apy+5EryDmeU1CaSBL3kxe8TTNVHffgH2Ka8waV
	qWR7XlNk2ErYwb9Pd44gsOO0qWqhrtlpinHAihEaeBwlatd/Xr+jVckCUIYS7D4eZZritLrTCF8
	2pQx6d1Cq+GHCOgXMvw6UyJlRqZgIe0j++s2TNQio4lG5bC4wmC2m6qbsBMwGK5vsxayS4lfZLV
	ShWYegiDuMZ6+mFLD9AqBqlCwy5TI/jzssENLYEK0tAoagiRbZYCz96Qq2rbJ8cFrU422tQZEWJ
	ktYK+e39Yu8YoogBWElDNnIgV8L9De9pnFkTMADJ+POVV7JQa1lLMKcZtCy4XdT5Nr4keBbH5Ov
	HNhmZvCqdzu7qxzqDF7gum5dwfluW1w8wUHZ1EPlSYXKuvW3c2eV39ALHWTdkYwIVeS8YJACgQr
	Ixy/9CjpiprZztxtqut6tjvFKd0OB5Kr2e7YmaPisngNXbB2ZFIN1RKQVm0cRjOoJnzMYuYldg4
	kDZN+zfXME/3EUo2/uC8JhSihRqhS5fp6/9BU3H740YHLXVkUkc87Ue1peKbVT/Nj6CuIw==
X-Received: by 2002:a05:6102:6208:20b0:7cb:bb7b:77e4 with SMTP id ada2fe7eead31-7d28676b01amr1247126137.3.1793890180917;
        Thu, 05 Nov 2026 06:49:40 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2829d28d0sm2917138137.2.2026.11.05.06.49.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:49:40 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so733466e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 06:49:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzQxasgpAFtw52dN0FNW/tRGM0X+agIcBzBNyMQo0icsps8BhzD90q5Z26cVRjPF6Kg2855rTooaRY=@vger.kernel.org
X-Received: by 2002:a05:6102:3590:b0:7cb:91a5:7cb1 with SMTP id
 ada2fe7eead31-7d286b9063fmr1558321137.39.1793890179880; Thu, 05 Nov 2026
 06:49:39 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com> <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
In-Reply-To: <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 15:49:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
X-Gm-Features: AclHuK8-DY11fAp-Ju55qxGdxFOla992yKCcExdnlJgG4bXumg-5poK1WA750QA
Message-ID: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 5 Nov 2026 at 15:03, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add clocks and reset entries for the ADC controller.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> > clocks and reset".
> >
> Ok, I will apply the same fixes here.
>
> > > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> >
> > > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_=
clks[] __initconst =3D {
> > >                                                 BUS_MSTOP(3, BIT(4)))=
,
> > >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2,=
 15, 2, 7, 18,
> > >                                                 BUS_MSTOP(3, BIT(4)))=
,
> > > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_=
DIV2, 16, 7, 8, 7,
> > > +                                               BUS_MSTOP(3, BIT(9)))=
,
> > > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK=
_GEAR, 16, 8, 8, 8,
> > > +                                               BUS_MSTOP(3, BIT(9)))=
,
> Shall I also rename this adc_0 to adc_?

OK, let's match the docs.

>
> > >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8,=
 9,
> > >                                                 BUS_MSTOP(5, BIT(2)))=
,
> > >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8=
, 10,
> > > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[=
] __initconst =3D {
> > >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> > >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> > >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
> ADC_0/1/2_ADRST_N?
>
> > >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> > >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> > >  };
> >
> > The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> > there are 3 sets of clocks and resets, one for each ADC instance,
> > but this does not seem to be reflected in the register bits?
> >
> The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
> shows single clock is shared by all the three instances.

I take your word on that (I only have the additional doc for RZ/V2H).

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
