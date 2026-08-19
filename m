Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF43D333F
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166809; cv=none; b=Mux/jXmEeka5PdqajjKCdde1JGJot20waOFO8e6M1dVOc2SC7unkV6uOlj1bqQjMrcWbVl2NDhVSkoY1GOJs/VUBbu6BKuklkdi+iPsyRvK79sFcYufg18nTe2TLJxYL7hcGmHoMlDOsCs3gz1xBsUuTFzyRAkUXynto9vFTgRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166809; c=relaxed/simple;
	bh=GSvf9tiJTgNAYDBIQVpJtLQwvRj2IRYKk6mKKCQJXkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=feNrMD/PVT2lMQpT1BJRj/Sa+sCnekLhY5PDoKSVDLxrsIP3wfGiaOjerAdf4FfKYwHx4xolIoZ/pGyrqixmI28oEOOAfRLLG2JHlM36AgIhE6Yi6oE0ZiYcJCDOGSxk7tDQ+46QwXrUARtue24NRimZl4/g4rqteoTqwYV+BZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso533813137.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787166803; x=1787771603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2hrEOT6/riKwFJGpTfOre0kcDNbj58vo1NWhzAcptM0=;
        b=fZwuf4PsYalCpej7FZWEZ0Nsw6UQ5dQH/EcN1haa2t20NbkkozahXqMO2lpHM+KUQM
         67heJ8EyupSE7qML8ORDokktVtKXcRy/49+TFfB3Lw4/MdVJwfMowG+U0qLxCc7Pt3Qw
         9WdxRcZUJUdZXUlWUSPLZtAmmHhm6vgCVeYz75sODXs4D/OL0p4bAB40Es4chRLcmfjT
         6/425Kxn+r+ws8GJ0a8YyythpsV6Uxyny3MlzX1qRwvIFZfwNPd+y1Xuv4Cgeyfjpk0b
         jD6rxTyS+bDA07CGqBykq2YPyCvZTmTASLM31EGoo99utRU1cJPBDe6ybX+Kx36FJtpQ
         py7g==
X-Forwarded-Encrypted: i=1; AHgh+RqBU8cQx6luWAOANfvVSFT0KLk7cSg3OkLUm8CtcnHjIhthPSQ/3UEQ2WVVhwpZy0P8RGibSz9rmLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAwUFR5YovVXkyTSqmjuVrfrJ/3s/iE3whe4Enrpjj0CppYdGc
	cMkpK3R49pchLWmYOriYmX2Fh6xpKat4ulivbkjvTSWnjtpa8SQDjHIXUyqfb3PI
X-Gm-Gg: AR+sD10Ei+JlknPlbvlsO0zznxUXwphZnwjCpPwYtqi5bWii1NAQA7AC4CbDVnlCf74
	Ojhw5xKJj2H0K9olAstPuJoaOtr9eCbTnfpF/OxndsG4EYqqd3iNk1TOGqBA+GiuB2kBpm38xNI
	eLwJLvN40S3bvGlV8R7xwX+5Q3X3+mpS6PJprsARQxB19PCGBw7xBVum/VVhPO8KfGzrCQ2uFDh
	+kQQZ+S8uq/301wrtnt1SJEAFqvrIStx+zq871/B/EpKuYaMyo5R6XfZDaVe1o3rT85UEx8PIaY
	9gLX7sPAjER7lXNLom119ok3n3Zw4VP/aKcpzQRCb8xPmbFv6jN+cLSa6bdzVLmUxdWBaxBVeqT
	Irp9CCIttDwJ/JUmchaKgnNNGrzVPz0jcYjeDE89yl20HiExc09rRZd4oxG18+H0UoGQjyLD2ML
	Ak5yCccseLgaU9LEO9OWcCcxCj4+OCMmsplCzdfThK0HgBeNXFVwqOMfS0qhCFmUkbcSdo909i4
	5cXyQc2NvGiFtMNvmAjaVIu4g==
X-Received: by 2002:a05:6102:e0c:b0:778:5369:763d with SMTP id ada2fe7eead31-778536977cfmr1785495137.1.1787166802956;
        Wed, 19 Aug 2026 12:13:22 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777d823dbe4sm3409054137.0.2026.08.19.12.13.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 12:13:21 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74aa416ebb1so480849137.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:13:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqZdKnxSVyNN/0kbVYBcK6JmVgSwccxUtQgPQ5hoo9iurANmWBqdOm7wIvvV+JpxVYtbv1goclq4dQ=@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:778:5369:763d with SMTP id
 ada2fe7eead31-778536977cfmr1785402137.1.1787166800995; Wed, 19 Aug 2026
 12:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-mathieu-wdt-clock-theo-v2-0-c048a6394436@bootlin.com>
 <20260727-mathieu-wdt-clock-theo-v2-1-c048a6394436@bootlin.com>
 <CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com>
 <DKSOGEFQ4RJA.3LEW2Y8991H17@bootlin.com> <CAMuHMdVfFZ0P9Na-yD9EzBaUqkyiwjo8byxA2MouBt1DM8xQtA@mail.gmail.com>
 <DKT0MN8YMIAT.2ZI006JRL0OJ@bootlin.com>
In-Reply-To: <DKT0MN8YMIAT.2ZI006JRL0OJ@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 21:13:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsupXQb7Y59ri8wtrjixPpWoLRk5SsuieZLjKG4Y+gwA@mail.gmail.com>
X-Gm-Features: AcwNN1Xiw6RIMxHvPKUqNZp5ReyoCIje1jZT2LSNhpvxk-1rbWAWtnl6RZSRLC8
Message-ID: <CAMuHMdUsupXQb7Y59ri8wtrjixPpWoLRk5SsuieZLjKG4Y+gwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: ti: mux: resolve parent clocks by DT index,
 not by name
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Tero Kristo <kristo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Tony Lindgren <tony@atomide.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mathieu,

On Wed, 19 Aug 2026 at 17:12, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
> On Wed Aug 19, 2026 at 2:32 PM CEST, Geert Uytterhoeven wrote:
> > On Wed, 19 Aug 2026 at 07:39, Mathieu Dubois-Briand
> > <mathieu.dubois-briand@bootlin.com> wrote:
> >> On Tue Aug 18, 2026 at 6:02 PM CEST, Geert Uytterhoeven wrote:
> >> > On Mon, 27 Jul 2026 at 09:44, Mathieu Dubois-Briand
> >> > <mathieu.dubois-briand@bootlin.com> wrote:
> >> >> Resolve parent clocks by their index into the device tree "clocks"
> >> >> property rather than matching names as strings. Name-based matching is
> >> >> fragile because a clock's "clock-output-names" value in its provider
> >> >> node can differ from the name used to reference it in a consumer node,
> >> >> and because names must be globally unique across all clock providers.
> >> >>
> >> >> On AM335x, this caused broken clock trees where some clocks failed to
> >> >> enable because their parents could not be found.
> >> >>
> >> >> Replace of_clk_parent_fill() with a clk_parent_data array that sets
> >> >> .index to the array position.
> >> >>
> >> >> Fixes: ec7aa25fa483 ("ARM: dts: Use clock-output-names for am3")
> >> >> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> >> >
> >> > Thanks for your patch, which is now commit 667f420c09f1417c ("clk: ti:
> >> > mux: resolve parent clocks by DT index, not by name") in clk/clk-next.
> >> >
> >> > This breaks booting BeagleBone Black for me: I don't get any output
> >> > on the serial console, even with "earlycon keep_bootcon".  When the
> >> > watchdog kicks in (or on kernel panic?), the system reboots.

> > With omap2plus_defconfig and multi_v7_defconfig, it does boot.  However,
> > this commit does have an impact on /sys/kernel/debug/clk/clk_summary:
> >
> > --- summary-7.2.0-rc2-00106-g0d4d262c1664       2026-08-19
> > 10:56:51.622275674 +0200
> > +++ summary-7.2.0-rc2-00107-g667f420c09f1       2026-08-19
> > 10:58:13.929823890 +0200
> > ...
> >
> > I.e. wdt1_fck changed its parent from clk_rc32k_ck to
> > clk-24mhz-clkctrl:0000:0, which is probably not intended?
> >
>
> This was definitely not intended, but I believe this is a valid
> configuration.
>
> wdt1_fck has two potential parents. In the device tree
> (am33xx-clocks.dtsi), we have:
>
>         wdt1_fck: clock-wdt1-fck@538 {
>                 ...
>                 clocks = <&clk_rc32k_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
>                 ...
>         };
>
> As I understand it, the kernel is free to select any of the parents
> here. Is that correct?
>
> Previously, the link with the second parent was broken, and only the
> first parent was known. That was my initial issue that triggered my
> changes. Now, both parents can be selected. I assume the second one is
> seen as a better option for some reason, and so now it is selected.
>
> But maybe my assumption are wrongs, so feel free correct me here.

Thanks, that sounds like a good explanation!

> > However, that is not the cause of the crash.  My .config has
> > CONFIG_INIT_STACK_ALL_PATTERN enabled, so any uninitialized local
> > variables contain garbage.
> >
> >> @@ -136,7 +136,7 @@ static struct clk *_register_mux(struct device_node *node, const char *name,
> >>         init.name = name;
> >>         init.ops = &ti_clk_mux_ops;
> >>         init.flags = flags;
> >> -       init.parent_names = parent_names;
> >> +       init.parent_data = parent_data;
> >>         init.num_parents = num_parents;
> >>
> >>         /* struct clk_mux assignments
> >
> > Init is not fully initialized, hence init.parent_names contains garbage
> > (before, .parent_data contained garbage).
> > As clk_core_populate_parent_map() prioritizes .parent_names over
> > .parent_data, the uninitialized .parent_data didn't cause any harm before.
>
> Nice catch. I didn't realise that while doing my changes.
>
> Thanks for taking the time to track this issue.

You're welcome!

I submitted a first set of fixes, incl. "[PATCH treewide 1/5] clk:
ti: Make sure clk_init_data is fully initialized"
https://lore.kernel.org/e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be/
I will submit the remainder (way too many) later...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
