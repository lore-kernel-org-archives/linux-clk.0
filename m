Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC34CA79E
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533989; cv=none; b=O9Kutb0UHOw3sWgLDRABdJyDsnLrpfdPV34SFJfhKwKf/MTMPhtAGvtcoyBoLPHeVELvyiOjZNceZ9xzPRBRjHzl/inuHnvzeag+mvAV2ywbIYhUMBy4zWWoccE61GIiuDV7WgJBdFZQvpMu1sFRiNeCKaN2AyRfrylrYHGybdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533989; c=relaxed/simple;
	bh=ghXH2BJF4jduj/BjXt7Xua8zEA4xRov01HKEMrdgGlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzwhAf5IoFrCcgYbGztiHfTZ1/zgBEDWvGbiFr3xO7Rqa9/4UeazHLMBRnP6AxCLio05hVpOre8J40sAVWWzCE1DNqco4r6YBdmarGTsY5IjBpvhLXXQ8LVVXEPuf1XG6/upvioU4K9qTiG4e85BsRVxvuYp4oqiEkzF3WSg5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c7991578c2so463671e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 07:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533987; x=1789138787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=inqGTZSC3u1CgB7ts6dRXUQ1Jo9pob/IqZxPyHHBxZ8=;
        b=QZt3fBwxg+RsfRM/xkpOFEc4y25XoTGSYkEHJHZF2BnZMg8ueNhkrlPOlL2RNH1z4K
         IuNqMtfG8pivjcQ1r0Zgm/lQcodpe0f/xWgwUvNfMMgyfUS8gwUiQEk/CbgggRpU1wG4
         3Q+hDyqoU21rtGXkJzIuH1l7El5UxWNkhQVxqwCe99CysQbgv7hnvH4vDKADo6L/cX9U
         6mOlYFoVGMICYw3eSVgKHRlbhwfKMnIpYr8FGK6r3uaS3XWnQwvIEd75t0lDBJAebq/l
         RLo7cVV1q1g7cdb0cqq6VApSig2RacOfhW78M5PZ2+KOzLwiUjuOil2F6uyQrymfhWKk
         Vd9g==
X-Forwarded-Encrypted: i=1; AKwUvByamwDqnmSLw5H5BMUnlBsXbtbTUwgh5GiOokOMJFriMPxb0gZuM5udrKa8KlVbMdHvA94oXPgKGnc=@vger.kernel.org
X-Gm-Message-State: AFuF++nnG69QqMi8Nyz06o0YVyUvtUtS5DSocEmXQqJslLD1BN2jIIV2
	FTAz3Dudw/zVRBlfrrjFkwHEdWE1atZgTmQOXvG+YOvYJNrrDSN37x1eP55MWRS7
X-Gm-Gg: AYBFou3TsWEnHCFFhKVmsaSxTCVHIbSqw+dN3SEEG9c9yc0CcrqD5mIrytpFoOKR1Jm
	ay4limV3mnlSzQPUsk1dCcRhCzpxPjkzqQx6IKFnP3b1u7mlpFnziwzNyyC8ToNx4NrKiiFH/zf
	Jiktc2TChtG/vf+Rnn5b9GgDIJOUI7WZMw/qKwbm/ypZUEh2SPeNmnQVQyqWsJLgecebN8fBbDs
	OEAxHfvefUmv4SggYM02l29y8vWkobTtvW7GqSNIldpYU29MzMn5ligiJc4Ro27AOnxAPboN1de
	RTTLhAL442ML9xWdynjJt7+ImvpVKKMD5D7hDVxSkzBil7wFSoSZ6ovNg73fp8RFRMPCL0A8oCZ
	RnV2oO+7qfLHmeRpDRx0dPFwJa1Sy+YEPJYy/DV5pFjsJewBvWzm5bQ0XCtGdbNd8ytTmWLOOuH
	p1YMsWnIfugFNsaMRfJXzXhm2hwhjhDdB3qBALETvId7AmIOvezhWqtEZj6wzXzbUwoTPq+PR99
	a7/v1L0dEv3IhLL5V46iRWyxA==
X-Received: by 2002:a05:6102:6b01:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78a4a6c8a04mr2047948137.4.1788533981620;
        Fri, 04 Sep 2026 07:59:41 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76aaasm1938327137.3.2026.09.04.07.59.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:59:41 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-745497ac8fcso315298137.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 07:59:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzFY2k9ROaJ6KymkkqAutwCmgI+FmcVq6amrkIATW7xLNp+LQ8meQ/2OfggdgVIAcQtaWDjc6mXSo=@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id
 ada2fe7eead31-78a4a7186d7mr1918546137.7.1788533980738; Fri, 04 Sep 2026
 07:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com>
 <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com> <b2f486b8-a391-41bc-8a7f-dc81c6752205@kernel.org>
 <TYCPR01MB11865BD2FC199EFC6BE613A5DA2A82@TYCPR01MB11865.jpnprd01.prod.outlook.com>
 <a7cc6bf8-706a-4b51-a0ce-d6246045d5da@kernel.org>
In-Reply-To: <a7cc6bf8-706a-4b51-a0ce-d6246045d5da@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:59:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuhpaEjzoLowag=RUMah-LjtSkmkDSJu_ZaYYHAHHcSg@mail.gmail.com>
X-Gm-Features: AcwNN1XOIqok-XF1Ox7YMle_czDmXRTGGzFdPMRVImnv13pc2p3_Z9A1m7XbeZw
Message-ID: <CAMuHMdWuhpaEjzoLowag=RUMah-LjtSkmkDSJu_ZaYYHAHHcSg@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 1 Sept 2026 at 16:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 01/09/2026 16:11, Ayman Chaudhry wrote:
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> On 21/08/2026 17:03, Ayman Chaudhry wrote:
> >>> This patch adds power domain indices for the Renesas RZ/G2M v3.0
> >>> (a.k.a. R8A774A3) SoC.
> >>>
> >>> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/power/r8a774a3-sysc.h
> >>> @@ -0,0 +1,30 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/*
> >>> + * Copyright (C) 2026 Renesas Electronics Corp.
> >>> + */
> >>> +#ifndef __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> >>> +#define __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> >>> +
> >>> +/*
> >>> + * These power domain indices match the numbers of the interrupt bits
> >>> + * representing the power areas in the various Interrupt Registers
> >>> + * (e.g. SYSCISR, Interrupt Status Register) */
> >>> +
> >>> +#define R8A774A3_PD_CA57_CPU0               0
> >>> +#define R8A774A3_PD_CA57_CPU1               1
> >>> +#define R8A774A3_PD_CA53_CPU0               5
> >>
> >> No, value is 2. Or not a binding.
> >
> > The values are pulled directly from the R8A774A3 hardware manual and
> > as a result are not sequential.
>
> So not really a binding.
>
> > This is compliant with header files for similar devices, so if we were to change
> > the approach now it would probably make things more confusing for the
>
> No, it is not compliant. Maybe it is done the same way as old devices,
> but feedback was provided already for a few years, so plenty of time to
> accept it.
>
> > user and it would also require some special handling. Given that this is
> > compliant with the style for similar devices adopting the same bindings,
>
> It is not compliant.
>
> > it's easy to understand as the numbers come straight from the HW manual,
> > I would actually prefer if we could stick with this numbering scheme if
> > possible.
>
> Nope, as explained many times already for obvious reasons. Otherwise
> provide me clear pieces of code which you bind here (as in DT bindings
> header purpose).

I agree all numbers < 32 match a documented hardware bit, so technically
we could use the numbers directly in DTS.
Note that unlike e.g. interrupt numbers, the power domain numbers
appear multiple times in DTS, and are also present in driver code
(drivers/pmdomain/renesas/r8a774a3-sysc.c).  So having defines means
having less magical numbers in driver code.

BTW, due to similar pushbacks against offseted interrupt definitions,
we are now ending up with duplicated defines in .dtsi and .dtso files:

    arch/arm64/boot/dts/renesas/r9a09g077.dtsi:#define RZT2H_IRQ8   24
    arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso:#define
RZT2H_IRQ8  24

So please let us have our symbolic definitions ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
