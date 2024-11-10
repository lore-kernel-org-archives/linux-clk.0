Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E04154C0C
	for <linux-clk@vger.kernel.org>; Sun, 10 Nov 2024 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731242045; cv=none; b=a8CgEN/30Y593tqfILhVLVrFsg8Im9j+v8odRb6KGa/potmLsMYG6jwVw4kO8fDLAaarzTRjImQyq+Hq4r+9dgAtH+ex+R9o4+IVVn00YTlkXWCTpM8vbPe1eDUdBccKw2MlChdm2KArKt189Jj1n47S9DADjK52RDhhwpvak6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731242045; c=relaxed/simple;
	bh=p7gkjEGHpo1D0yrjZJJj+hORANJURnXR82p1kxdPiWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNjQCEVhk0JcAXihkb1wMlS8x1LRg/fmkhrWRc/pzyrzwj1HpuLk87XyEoCJ+g24rj+HBhBsHtrExFKxdwErWoQoNnMU+1nM7iTnzlR9UXfmQg3MUlBKwl5yYNxJ33SZrc0+hnd8uB0nMdgIsbiuPfuMyYQ8tvhuOq0J9Xpnn6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53d8c08cfc4so968665e87.3
        for <linux-clk@vger.kernel.org>; Sun, 10 Nov 2024 04:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731242040; x=1731846840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePMmnRiXJkYLNWS2ahzAE5K60sKD/KQbBf4D5d5ZRsg=;
        b=Lgdl+3H7HHpY/cTe+E7uZk5pbw8u+ETayo5MYPAWc6UYUCc8f/GnDJiJMFureeXDzC
         13dRShivA7eA5dsYcXGzHFS+qi6XG4U1Cj/UnysLI9QJEv8XDKSwk7AzB3KtlcSJQNrc
         6fzLGrZlbaUJ6IL+vfkhN7qw5kxWkddOXGMpv74Cl9zCXKkDEALC+EJu34C4W3k2d2/5
         3NeD1wD6FcZAUPXPTgrb0xbVH1phIOR8kXESldAPk5VFzJtfWeRF6Sc8tCz5iPbJDdV+
         i4e0EJ4gsIpsJW0JIkUanCPuvoaoDojhzkNrK9nV2m9RZwQQ4FnTI6+pIHY9cyLMWGsU
         vuog==
X-Forwarded-Encrypted: i=1; AJvYcCUGvq4mY6du7gtrGKwIaI6pOhqx8bKW5NOVR/Y5ytundUXoc4gPNzlLt2GUjIxQ1snGpysDomqnybE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMpZO61syl2i4Um1n0AVS/cp6lLs129/P3doYmom0ldC1vnp8
	xMKZqY6UvktOY+R+mdzQtfDtBlEVzghcaGltoYan52BRSlF/FWKs3KV6y3XS
X-Google-Smtp-Source: AGHT+IFXcVwLsSZsHHGVgXJ0vrKXgmcqz5fcdn6wrO7I1i4j0ehEa/5jc7d3V2RfONg/YRx4bY4stw==
X-Received: by 2002:a05:6512:398b:b0:53d:6b50:f5f9 with SMTP id 2adb3069b0e04-53d862fde6cmr3611891e87.38.1731242039603;
        Sun, 10 Nov 2024 04:33:59 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82678426sm1208905e87.28.2024.11.10.04.33.58
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 04:33:59 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so29751031fa.2
        for <linux-clk@vger.kernel.org>; Sun, 10 Nov 2024 04:33:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgVJR/2FnqvW6ITRULnFImRHmUKQq9IhRzgrp0qb5IYPL4hGAMieOP09isN7yBSUBDhjPfHsr2SyY=@vger.kernel.org
X-Received: by 2002:a05:651c:1515:b0:2ef:243b:6dce with SMTP id
 38308e7fff4ca-2ff20185abfmr37481621fa.10.1731242038795; Sun, 10 Nov 2024
 04:33:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025105620.1891596-1-andre.przywara@arm.com>
 <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com> <20241108223400.460982d6@minigeek.lan>
 <a4fada26-7ef8-4618-9ddd-0962b7dc6efb@wirenboard.com>
In-Reply-To: <a4fada26-7ef8-4618-9ddd-0962b7dc6efb@wirenboard.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 10 Nov 2024 20:33:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-4VK_V4Ob__VAB0+qETuisvdUEUFVwg-7SfHy4rv6_g@mail.gmail.com>
Message-ID: <CAGb2v65-4VK_V4Ob__VAB0+qETuisvdUEUFVwg-7SfHy4rv6_g@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Evgeny Boger <boger@wirenboard.com>, Andre Przywara <andre.przywara@arm.com>
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org, 
	simons.philippe@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 7:15=E2=80=AFAM Evgeny Boger <boger@wirenboard.com> =
wrote:
>
> On 11/9/24 01:34, Andre Przywara wrote:
> > On Fri, 8 Nov 2024 23:14:51 +0300
> > Evgeny Boger <boger@wirenboard.com> wrote:
> >
> > Hi Evgeny,
> >
> >> Tested-by: Evgeny Boger <boger@wirenboard.com>
> >>
> >> We had stability issues with some of our T507-based boards. T507 is th=
e
> >> same die as H616, to my knowledge.
> >> They were fixed by essentially the same patch, which we unfortunately
> >> didn't submitted to mainline:
> >> https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54=
ca1a1756458af
> >>
> >> It's worth noticing that not only the reparenting is mandated by T5 Us=
er
> >> Manual (section 3.3.3.1), it's also is implemented in vendor BSP in th=
e
> >> same way.
> >>
> >> We tested the patch extensively on dozens of custom T507 boards (Wiren
> >> Board 8 PLC). In our test it significantly improved the stability,
> >> especially at low core voltages.
> > many thanks for this reply, I was hoping for such a kind of report!
> > I typically don't test those things in anger, and only have a few
> > boards, so having those reports from the real world is very helpful!
> >
> > Can you maybe give some hint on how you tested this? Does "at low core
> > voltages" mean you forced transitions between the lower OPPs only, or
> > were the chips undervolted?
> Both, in a way. Some boards (about 1 in 20 or so) would hang after a few
> days of operation.
>
> During our investigation, we found they would never hang under stress
> testing, so we started examining cpufreq-related factors.
>
> Disabling lower OPPs also prevented hanging. If we artificially lowered
> the OPP voltages (undervolting the chip), the boards would hang much
> faster without the patch, and even the previously stable ones would
> start to hang.

I guess we can merge this one then?


ChenYu

> >>   From my understanding, all Allwinner SoCs need to follow this kind o=
f
> >> procedure, however it's only implemented in mainline for a handful of =
chips.
> > Yes, I saw, I have added this to my A523 code already, and prepared a
> > patch for the H6.
> > Do you have boards with any other Allwinner SoCs you could test on, or
> > even already have experience with?
> Unfortunately, no, not really. We only use the T507 and A40i at the momen=
t.
> We=E2=80=99ve never had these kinds of issues with the A40i, though. By t=
he way,
> the A40i is among the few Allwinner chips with reparenting implemented
> in the mainline.
>
> The A523/T527 is really nice; it's a pity it's limited to 4GB RAM.
>
> >
> > Cheers,
> > Andre
>
> --
> Kind regards,
> Evgeny Boger
>
