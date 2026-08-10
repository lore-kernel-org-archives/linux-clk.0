Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F873E1231
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366639; cv=none; b=Paa63z/+pdNEDVfT1Fm72rvtaqSi4ekfez06swaGZYE6wfq2hMK06UAshGww9JWFGCvdRSlIBn817zA9txEcr2d0CwbYqV0WG1UHRCDrjC0aIPjI4KJ3J6IzaY+QixD8P2Gr2G7kmPcSgkHl+bAnYKbZQFptPq8m3ykdjK/J++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366639; c=relaxed/simple;
	bh=ChS/Bn6zepkpnRtJFlAWRaPzmlVSNNX2nqtInB7kA8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQkbGmJo12Pv34FLIwUWtIOw7GUzgfxDCQrsI/ZdOcTNey68SoH7Gzag3eiPTJaQ0VwthyA5BulBWX1ktud/QBX1B+5BkiszeujQeLBPg7Q7dLDsIBexipqqpk3RI/fIW3S7+AafeRnjD3xVp/JxF1gTEqmg/5n4Ab79defX1ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so430661137.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 05:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786366636; x=1786971436;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ucqtpg0grkHChPvWz58kRJ+3MP3h2PLHcjZkUQRzebw=;
        b=aBTwtdztctzn5P2wbUmh9QBdsmF2fh/7HVMqyB79q82G+U8DzKj+7L/X8G2MrDc6MC
         pI5Q8k0HUltOPrQB60B+5vikiUnAiO/5VgC9irWzJ4Jve0rNqqWpT1k9uFiDB6NckbFe
         1+HzQzMZzJqSNzYWgOiGDTGKH1qg82s+FSP0C766qwf9WA2p2VYnjX3fjNLSH1w11xC4
         WWvRI65YDrBWKf+W2ZhBxkTR188vqInDiHlj+Qmyq56+ONXtkKOYc3OvCiyJivB9LPjh
         L2nchtfRYS/Gbqek2g3FdaCoI2qNZ/rMRY83f4+YO4MTEN/+S9ZA0Jk0wCPViIHosqic
         9nrw==
X-Forwarded-Encrypted: i=1; AHgh+RqgzdICN+1C/o8EsqsK87J5YFbCnoEA84wRrIwtvXzKodRlzunQ43rtUr7st3eR89NIPh+wN3dW5XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcF4Sl8tQpe/yFy09NsEUwiP4kkn9fGbbyAVuj1pWmFmvWQ7V
	mmGWl5WI7Ag20RHkFaEq3XOQH6LGZO04au7z3aCQCVYE/49C2m8ahvkLTsVlIumD
X-Gm-Gg: AR+sD10kM1I9ASsCnskjfxqp2m4HLkuW5NbhR450eLGFUj/m6SRo636JqoxbMgJvyTg
	X3Jm29nralAf0aGum2SHQi7gJQi7iqZwYSsoqkQDqRuQWrytD5PMGfGhplVDp4vCFNKX3/Ie/Cf
	ooaJLQF8kqCVDq/DP1Ir4MBLdB4bevvhyK3JCErPFLQj44cMc2vbs86rzvgxiIE8790ID2AHsC4
	C32vUC7NPyVOlj75D6HGAjt9sznXo8/3M/P625vW3w0lda7G8t3xx7tPoR7Va9AVZT23kTrhBXK
	3XIJI3LjnOlJLjWj1gzXimbZmp7O8Yel5rHb5A0606jtBbRAdTbdqdJXEpomLA83ORyjmTZ0YrK
	x2qSvBrti86M6f31RsKjTkwskM5Xjbk9xOl/hCkfqVfYX/qJHlz6taO4SG60CKh3OAcZNipGB8A
	8FX6jzK+75m71pTdaW7njI+NBH9O2F4/lLSc0Iu0++cFI1MFrBtmgqlaa+qfby7PpsLSKja1BNs
	WQRXALbsUREFrMn6dbqUOKLFVlt5g==
X-Received: by 2002:a05:6102:dd0:b0:738:ecd7:1984 with SMTP id ada2fe7eead31-7642d16f338mr5097643137.3.1786366636597;
        Mon, 10 Aug 2026 05:57:16 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4daa5csm4543221137.1.2026.08.10.05.57.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 05:57:16 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so761676e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 05:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roz9AMUeaMfDNZegiVI+SzEl8bTrroMArAZtXZmKhWUnQWnhJT68Mgd8aWMcJLgvE1GKLlfqxf/gh8=@vger.kernel.org
X-Received: by 2002:a05:6102:3ec4:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-7642f8bd6d4mr4730624137.11.1786366636139; Mon, 10 Aug 2026
 05:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
 <20260619164030.380098-5-biju.das.jz@bp.renesas.com> <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
 <TY3PR01MB11346C90ECE3632E3006BFDA986CB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C90ECE3632E3006BFDA986CB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 14:57:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFyOwuOge4PYTaDEmL=T1PTn3iNRiR==5C4ZKRKKew0w@mail.gmail.com>
X-Gm-Features: AUfX_mzvJXPduQ5dapuJXvaFriBFz3yz-qOGbJYm-qfllV6oQ4scPBZHL6wJT9c
Message-ID: <CAMuHMdXFyOwuOge4PYTaDEmL=T1PTn3iNRiR==5C4ZKRKKew0w@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 28 Jul 2026 at 14:35, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add support for RZ/G3L DSI mux that supports 2 duty cycles.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > @@ -120,6 +120,11 @@
> > >  #define RZG3L_PLL7_FSTD_DIV_MR_MIN     (8 * MEGA)
> > >  #define RZG3L_PLL7_FSTD_DIV_MR_MAX     (16 * MEGA)
> > >
> > > +#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM          4
> > > +#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN          7
> > > +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM       1
> > > +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN       2
> >
> > I am wondering if these macros are worthwhile, as IMO they make it harder to understand the code.
>
> OK, you mean find a way to determine the parent based on some variable.

No, I mean to use the actual duty numbers in the code:

    - duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
    - duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
    + duty->num = 4;
    + duty->den = 7;

But probably this can go away anyway...

> > > +
> > >  /**
> > >   * struct clk_hw_data - clock hardware data
> > >   * @hw: clock hw
> >
> > > +static int rzg3l_cpg_dsi_smux_get_duty_cycle(struct clk_hw *hw,
> > > +                                            struct clk_duty *duty) {
> > > +       u8 parent = clk_mux_ops.get_parent(hw);
> > > +
> > > +       /*
> > > +        * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
> > > +        * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
> > > +        */
> > > +       if (parent == 0) {
> > > +               duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
> > > +               duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
> >
> > The 4/7 duty cycle is due to the division by 7 between M2 and M2_DIV7.
> > Perhaps it should be set by that divider clock instead?
>
> You mean define a custom clock for M2_DIV7 and call setduty for grand parent
> from LVDS bridge driver to distinguish LVDS from others ??

I mean to define a custom clock for M2_DIV7 which sets a duty cycle
of 4/7 (i.e. an odd divider clock which sets .num = (div + 1) / 2 and
.den = div).

Then you can just drop rzg3l_cpg_dsi_smux_get_duty_cycle(), as the
clock core will happily call into the parent.

In hindsight, I should have given the same comment when
rzv2h_cpg_plldsi_smux_get_duty_cycle() was introduced.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
