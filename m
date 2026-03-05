Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBAF3A783D
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720554; cv=none; b=PvZu5x+HVfR/1wJAjpseMW5QVo+wQ0J8wKZWDWXDcb4h0lgbfp4yb0suyuW2OYI+R1LnfNCgjknGb2u6UM4GWbt2TWLf3EC1ll/7JLIj7M6LmnShGqWaTDGZIQfW86nZ1Vi56TqP3I7FWThDcSW9Lo3sYFsXrEbKJaV38Tx1u5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720554; c=relaxed/simple;
	bh=/3f4nIlcCZ20P6/JbRx5tsmmqG8H3w9dAtoGznvYWWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MI02tI/7zoUsQP3AyNoDh9f9ywnPaJm/frD52JbAVgfKj3i/HtEjEUyEbHLGjpOUVwKc7A4fBsdOLyueIpHpbv0t46V9WscFhetmUCktLB1m7hQg9RVS38Pj8SFq0VjX8vxIortcuN9vrq2SJol3QuB7wVWaPXHXjSClnhxUnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-660d2e4846cso3058986a12.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720552; x=1773325352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMbUtOFBoMgA60FOVDAadgTwgL06nHyrUoMpJYzbdVQ=;
        b=i017MHk0aLjFBVrDhbLbOjqGpVzg8j2j4X/0mgoZm6gihtTd97pfXup32Fya+JC9YM
         aWFyQR0NGKN9nIFIxqOzU5MRM1+Uznc7k1ujBwdBIpUEvwxfks0Me+DefdvlzFDFflrL
         DWNRejPJgbIDhDDlzrEAtx0GtAfTfDv0g5ffCa9mDvOrjDBvo0lF9O9FDXslyV4qpDB5
         XPFZLHnSZ/9jpip9Kirv63nQnk5/O4jYyAKCxC6i+oWfVdLeNNsI9UfCoIGatlKXFrt2
         +uFdQbpVMOSxqAB7wd1oAG2GiDLzTRrwwVit0NyMK+iuqY/CoKGZDCSEN3rqd2LO/jaF
         dGeA==
X-Forwarded-Encrypted: i=1; AJvYcCW0sO7HdfLWQHO3jD+lnQM2fgLY3mSP/ZheJFmwM2SkaY9cQfYhwqJ/lkBvtsbROMk+YIrfitgo5IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLd09PyoC+CeGdk4ibpsWCsM2Ew3w7b0xQode/8rGg60ZCLM/0
	+oF9cYTp/it3BB11pUc9JHJbjKurN3mTTp7LiSjqrxmdJiMO6uKoYV2PPIMGN3V+Juc=
X-Gm-Gg: ATEYQzyYfuLn/B+yFscESzOzEQJvzieQaLrp6VFVNEdvUiQvx/I5DulUTA3VEFWr05K
	SaVSdFwRyu/ftqq3AkVJJjTQQop1eXyf6gwx+XvG09wanTCBTA9TU0PiNRcC/aoJJzo1M+PmpXh
	TmRaWHczrq8lHTj+u4FfVTj/Hyr4US308KplSW2j30rCTZ9Iknhna1egm42IFkJqzpdB/UsswGR
	nxkmhjBbc3KPQPBXyTyoHUnC1T1r0egA3cGtp/byyzch3UKQddwNE1UBeqgYgLYcdxonYQnjka3
	yscl23uAyi/tqybggOtCuFmT7hiEop61fUBtfJr9YvShsAsnnUtUc7YSoLlClIj9lcuhHencuuy
	iLJ2OiH4ywZ6+Nq29kcHN/BdGC5VRK44MOonsFTC9Eq/b4a9C8zjD0Ga7/3DnvmEDuFWq9vJNHC
	KWuNsL2HB0m4IuMoMoNA6n6PDLODETTecCiLg4sLCE0at6DeP4lt5eCQwZQDiBK9UIiKl/BRs=
X-Received: by 2002:a05:6402:4304:b0:65f:fd46:3fad with SMTP id 4fb4d7f45d1cf-660f02d1f04mr3214264a12.31.1772720551579;
        Thu, 05 Mar 2026 06:22:31 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660eafe7051sm2209128a12.21.2026.03.05.06.22.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:22:29 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b941bb3e23cso46658566b.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:22:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDyYQXeLsDrE71NS90p7jZ08vBU6e81/6l8LYSCP6oCaQbfgh+02x8SnI1tsDAkQjcsKB3NglMVrY=@vger.kernel.org
X-Received: by 2002:a17:906:f5a8:b0:b93:c5a9:a5e2 with SMTP id
 a640c23a62f3a-b93f1176dafmr385035766b.6.1772720549265; Thu, 05 Mar 2026
 06:22:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-7-biju.das.jz@bp.renesas.com> <TY3PR01MB11346C1B39DEE4A11270FFAE4866DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C1B39DEE4A11270FFAE4866DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 15:22:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYMWspJWVtbhk00B4nWGY_rb+a7h1WfJ0Y6gHGP72R+g@mail.gmail.com>
X-Gm-Features: AaiRm51ilseGDFMV6nGwWIBx2u0k7pUyutq0IevFJpQaDa-lK7xcm2qHhcqW6es
Message-ID: <CAMuHMdVYMWspJWVtbhk00B4nWGY_rb+a7h1WfJ0Y6gHGP72R+g@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] clk: renesas: Add support for RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 17 Feb 2026 at 12:13, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju <biju.das.au@gmail.com>
> > The clock structure for RZ/G3L is almost identical to RZ/G3S SoC with more IP blocks such as LCDC,
> > CRU, LVDS and GPU.
> >
> > Add minimal clock and reset entries required to boot the system on Renesas RZ/G3L SMARC EVK and binds
> > it with the RZ/G2L CPG core driver.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> > --- /dev/null
> > +++ b/drivers/clk/renesas/r9a08g046-cpg.c

> > +enum clk_ids {
> > +     /* Core Clock Outputs exported to DT */
> > +     LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,

This will probably have to change, as per my comments on the DT
binding definitions.

> > +/* Divider tables */
> > +static const struct clk_div_table dtable_4_128[] = {
> > +     { 0, 4 },
> > +     { 1, 2 },
>
> Typo 2->8

Indeed.

> > +       .num_resets = R9A08G046_LVDS_RESET_N + 1, /* Last reset ID + 1 */

This may need to change, too.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
