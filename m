Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D948BD4F
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998307; cv=none; b=h826+jpEsK72E8WwvVbEdAxionmst7vA6SafEJQoXf5fVrU8niAsOtUR7geFZv8tjYu3ay2/5sRpfH1MTkkFMVlTbVj5ra6SqvXoedTcuMY5tc1rUiGWR7YV2JqXBqV0JfpF0e6/4/hqhkDRMc/LShmsrjaElgXPKfgo9Z39tQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998307; c=relaxed/simple;
	bh=ajnOZwCq/PnZN7aH7cLkkTdAAF7vLV6z6+ahVx1kXwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZ1kWMYKz+0mXNhp3WEaQWM79Y+0ASliQMxEGanXod13B93IC6XkJ4z80E92kGUUQLO/NevyFDd8FY1V1+7m5KQLt2BV5wGkIDAFh8wSsLSPWzq9jxY85PTAT7t5RrHKoPscFtMVD48i01Gg9sn9g9jEQZblBK0CbGD2CV4Z/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso5806517e87.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 09:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998294; x=1778603094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhE1GPrxyKAsw37Q2fShYI5FmXFiAGB5BC0k4Zz9C/U=;
        b=UDlUd38ucarufNK5vrSDFFt5zWblFJBYWSljIj8FPrKReFzpXzxfrJGOPq/KbBr7V5
         FMwPoTXo4C4wc7boi3etnkzrZPhjfgkN6NLtZ/gvm1MLLaK5sWckdfJUi0V53D327qXT
         PzotqBpj2SgLdnm7M31BjsLZAX6n/YEhZLNVI/yLWjWHCCzFqFeVzAl26jJNgxMnpEtI
         85smg5kc/2SbFihQh1QqcWSOnFegEQ+cnUUd8OrosnhLMB2/gxzwRTMiyKO12D4J2P3q
         /aDjglhFHXMp+IlEc6NB1NJ6W3CYBOB0FwSIQp/DeDJ16Rvah5b06jijgcGLaoG60x36
         10Zw==
X-Forwarded-Encrypted: i=1; AFNElJ99HkBcymUidykg4Z5WPzeBU1n/f4/VVd+D+E7TTqoJgQFZHRXDZsJzoDVs/G0EDK2me78Yn5qX/pU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUBTYGL0r+J2/UkfD/s4icCbAPPlNeRiFb8y8rMi6AkOeGLVY
	t/Qnpt5qywyKLdYR3DBBGt32nAwH6F6m5Vi0r2rI3l5qryQpi3BrublvgTA5mrdz
X-Gm-Gg: AeBDiev32JpzWBmyarZURonpKdflSbLhUbpK5YOpPWoUNr+S4bhWdb/tTO7YAN5NA/8
	d1WVPjJhbP+2tzhujQgngWU9ml6aXCFuG05SFmW2ghqrmt6IluLaB0C7EXVrWTfOo5K3S6YrgdF
	PtGzl4aQwvM/xrbq6wPcJ3z1ixYk9jeQDPYlmrd52VKUK6MscdbUW0xwT4AxZbYhZNk0uzteFkN
	CQCdbHSvjmqbfRvHgr5NzvfVnET3i+aOpxHuTHN6jLHHB0c/8Dv7kRgMTS/jT8bwhqtskUJJWl+
	8Ci/Z08Z55LzyOpC/fMOWWvO6jcKRCJGwb/8+ZLUZ0/lyoOaQCOdxfnGdzlXsoRDeiV/ZKk3LFk
	N7UX2CJbDDXIF5TVkwU8GADijafImDcTSTRJ7JT6JD4Oiq7JBLmTIu7ix/FXNibbHBxsvUNcxsa
	g8HlBp6+I+FfOyAP+NISsUQPxtNy0OdExSM+bmHCQHS7UBv8Egu+BJgd/dyax/8+xXAw==
X-Received: by 2002:a05:6512:3c85:b0:5a8:6cab:4871 with SMTP id 2adb3069b0e04-5a86cab495emr4285731e87.36.1777998294189;
        Tue, 05 May 2026 09:24:54 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm2930862e87.43.2026.05.05.09.24.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:24:53 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so22149831fa.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 09:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QLTX8Xj9wp9GcvLfcEmxikHjp/dwUMUhLzJHoynUngDpaN0NL2k7mR2guJnstJzlDcQeoDXZxABg=@vger.kernel.org
X-Received: by 2002:a2e:bc88:0:b0:393:940e:d5eb with SMTP id
 38308e7fff4ca-393940edd6bmr44531191fa.3.1777998292458; Tue, 05 May 2026
 09:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com> <afoRe6DI4GJIVtg4@shepard> <20260505182017.10d71c11@ryzen.lan>
In-Reply-To: <20260505182017.10d71c11@ryzen.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 May 2026 00:24:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v666gCJiMpeWKpANHPufCp-nVJvdky+Gj87zUagvcrwTiw@mail.gmail.com>
X-Gm-Features: AVHnY4J2M27F_ij2YPG2EBXpDPE1R3Ey_Ifi-Xq3Eypf1d-qnvtALFOdRCX5tAU
Message-ID: <CAGb2v666gCJiMpeWKpANHPufCp-nVJvdky+Gj87zUagvcrwTiw@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 12:20=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 5 May 2026 17:49:15 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> Hi Paul,
>
> > On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> > > Add the clocks driving some core system related subsystems of the SoC=
:
> > > the "CE" crypto engine, the high speed timers, the DRAM and the assoc=
iated
> > > MBUS clock, and the PCIe clock.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++=
++
> > >  1 file changed, 135 insertions(+)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index 17a4ffc0b7f52..c59f3f789d052 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> >
> > [...]
> >
> > > +static const struct clk_parent_data hstimer_parents[] =3D {
> > > +   { .fw_name =3D "hosc" },
> > > +   { .fw_name =3D "iosc" },
> > > +   { .fw_name =3D "losc" },
> > > +   { .hw =3D &pll_periph0_200M_clk.hw },
> > > +};
> > > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > > +                                  hstimer_parents, 0x730,
> > > +                                  0, 0,    /* M */
> >
> > I was looking at the A523 ccu code and see lots of
> > SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.
> >
> > Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_G=
ATE
> > instead? It would surely be less confusing.
> >
> > One difference would be that the ops end up as ccu_div_ops instead of
> > ccu_mp_ops. Do you need ccu_mp_ops for some reason?
>
> Yes, please double check that (as it *is* confusing), but to me it
> looks like the CCU_M_ version has just a pure divider, whereas in
> CCU_MP_ the P is a *shift*, and the M a divider. Those timer clocks just
> feature a shift, which I don't think we have seen before?

We now have SUNXI_CCU_P_DATA_WITH_MUX_GATE() which was recently added by
me exactly for the timer clocks in the MCU CCU [1].


ChenYu

[1] https://lore.kernel.org/all/20250911174710.3149589-5-wens@kernel.org/
