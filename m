Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8726CE05
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282545; cv=none; b=Q5Cn/CWI4yMDvqde3aFgrKfDAs7CCTWrcYlsQnDNuJ1XFNBQ7SjAK1qYXatVp1E5khEp5OSFX/fY9OEHj0djsgNjOibib6mSj4fAOx43wx4GLwH9azBOP+FZZUUGsxLMWpEtx3wAGRl39KAVZOG1zrzZ87IjyTCF4JEsv0o1vhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282545; c=relaxed/simple;
	bh=GGByPRbKiZCMiBixxbxKzpR7CpahMYzsWAFszsM9luc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCUx2LycTjCUhGOLE1OHmA7/GaLhpvEgZbZAB8/HdoBVfvNqX9fTnfLJDs31TbuW/fU4STvccpxXVKURIJqwXWj+rWg+dENnlZF7jJ+7qmFdKhbFyWM4PCn1+liQAh9sCufbAV0jMhfWlIV56hYB5C5+lFbt6xPTeB2FRtv/QOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba67b332bbaso1151531466b.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 02:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777282541; x=1777887341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKaphviOKh6WHGvvV2s3OO7+pEMmVDq4wkrroHAe/4E=;
        b=p/2uivNnywWr6NSbdtFyWfPUOcW4MghPTKUuYjv6szoXsrWNPSBXUqjZDKGSb4YC83
         oCgkPYxTI4mnQvgjzdK8dt0eN80MpoYtvOlF81sSO8HNjf1S7CE7q+6L0DoCaGnJ6MPp
         b8gikuCVL5I9FmR8GL7NggKH13iBiaeFyxw6k6MtS5F6+hHcoZPPlCgIdRw71Ya1QgcC
         s/4F0IM5ooFN9QNdZ8XU4U5HgcYdsCJvN1Q6YI7uzLH3QNC4dWookA4ADlyyFcrYnqso
         iVt/+1pjUTFTgQDRZp1w9hUViSLQJaLzbtN0VWYRDaE7/IZ0FAPvbR4w6tD6l/WF9+ml
         5UTw==
X-Forwarded-Encrypted: i=1; AFNElJ/6OOSPCB/iP83JP3WeZBM2Ae5TZNqqn9Jm3FZRqlw4dp7q3sk5tbV1B58g+7kyw5WF3rMPumD7Hmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEdooLXvBQ8F7IM830TKAQXe25Esbm5IXF9vDiL/322vI0xAm3
	yNhX0mG0QGAZbBhOWiF91GS6wUxpa6wAM4WFn04h82WRu2hDztEQaXl/afkKNTeCw2o=
X-Gm-Gg: AeBDiesb38da5xQ2jW7/spjWuB2Hci3LkMqqjXLNjhhGI0UJgjRXNOmuOkiAS5GKCT3
	D48ci5Nt5q3FUNtj7yJrk5acCl/RIu7647zNOgZEGWhuUJ2VmtMZPmYSI4CSYs99KFOdiPRjnj2
	dfwpWDaFrQ50GPkMhFXYagdVInvTDAXBW7FWwHjo4SOgcZd3qVfUiCMZhGUMikuckPEEXEcjF6p
	4wdSEgS3I4VhqSpBAfc0fZYCBp0ruxv46C1lY8Czc3NyYf1Bm+bNJHVRFnYIDBMo22mMAINv/jW
	gXNQFmcVFYdgZWbXmFZIsUHNsGHqcNFrzeLc7cUr3eSnxnpT+t8xjsQgRVt2fHZpQEVOFG9vZas
	fXDCybPymmfSH0kx0Mg3aa6eUgPyo5b+QbQYFb1P9DJp6daiWhocfPtuJMMRzaE7qS3KWLZm+On
	u3WSzApLmZv3jTqQuZQKPajWNwUjm3GOigJ/E31ONE1vsTw2oARrnbulXl5eSAH26fi3ALyeM=
X-Received: by 2002:a17:907:9494:b0:bb4:927b:643e with SMTP id a640c23a62f3a-bb4927b7108mr53662966b.11.1777282540497;
        Mon, 27 Apr 2026 02:35:40 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e26sm1104983266b.8.2026.04.27.02.35.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 02:35:38 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ba6838e76f2so991661266b.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 02:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/v5vNPWlosbgDq+K0C7vvua5HBLe4lmrXed8j0YCrgmuan0SwkjxD+yWFB8yZmxnfZuOQ7VgEceEA=@vger.kernel.org
X-Received: by 2002:a17:906:fd84:b0:bb5:8562:823c with SMTP id
 a640c23a62f3a-bb585628661mr33199266b.10.1777282537883; Mon, 27 Apr 2026
 02:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
 <20260330132349.149391-3-biju.das.jz@bp.renesas.com> <CAMuHMdVr8FKx-n7OEgFf6vufzPRK-XrYDEPn_Ki0siknT57DOw@mail.gmail.com>
 <TY3PR01MB11346170F9CFA9DA98539A3F5862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346170F9CFA9DA98539A3F5862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2026 11:35:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRK2W_F4ST41W9snChH-f3WtCmPtePQzj+oZnjcKp1og@mail.gmail.com>
X-Gm-Features: AVHnY4J59OtRzGhWHPYLLecHfzizRVy-LGPVJfLunkpA2TvBZiT6a3LEqeQg1Yc
Message-ID: <CAMuHMdVRK2W_F4ST41W9snChH-f3WtCmPtePQzj+oZnjcKp1og@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r9a08g046: Add CA55 core clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Apr 2026 at 15:24, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add CA55 core clock entries.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/drivers/clk/renesas/r9a08g046-cpg.c
> > > +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> >
> > > @@ -25,15 +26,24 @@
> > >  #define G3L_DIVPL2A            DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
> > >  #define G3L_DIVPL2B            DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
> > >  #define G3L_DIVPL3A            DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
> > > +#define G3L_DIV_CA55_CORE0     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
> > > +#define G3L_DIV_CA55_CORE1     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
> > > +#define G3L_DIV_CA55_CORE2     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
> > > +#define G3L_DIV_CA55_CORE3     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
> > >  #define G3L_SDIV_ETH_A         DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
> > >  #define G3L_SDIV_ETH_B         DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
> > >  #define G3L_SDIV_ETH_C         DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
> > >  #define G3L_SDIV_ETH_D         DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
> > >
> > >  /* RZ/G3L Clock status configuration. */
> > > +#define G3L_DIVPL1_STS         DDIV_PACK(G3L_CLKDIVSTATUS, 0, 1)
> >
> > G3L_DIVPL1_STS is unused.  Perhaps you wanted to add the I-clock, too?
> > If not, please let me know, and I can drop this while applying.
>
> Please drop it.

OK.

> > The rest LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
