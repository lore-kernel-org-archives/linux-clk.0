Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F83314B7
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679273; cv=none; b=qUM+hUcB4NE4W5p/RkDUSht3AEXVL4vKprJlFg/o4+bR9GmQNaqk3/NpU9EuEOaZIUUZylayTID2579L8vtPrq8s4202skjX9/DIlm94BEpjG5J83txK4hUKI2h0Ri7Mtw1PzwuwRx9djaXUj781RPciC5N7/T96XU8SSkvWhiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679273; c=relaxed/simple;
	bh=cQv0F14L7VZaOZP71JRDDpNLLzI0Tf+dEL8n5ccKZl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hR2tumDEFUuvyVpQOc6A/EdL8dbKqZmmovksZFuNENGYaf92oRPHMaqgCGJas8f4LzymOFUDY6LMl5Z8oXEBsagvdkSGf+j7Hn+zZ1LY9F3joQ18gK3sw3t28m6qTk+13cVRTAaStzyA43SvWpyeLtb4AKOew96LAKB+tEkdwL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b04b4974abso15704815ad.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773679271; x=1774284071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwkbFxjRydoL+3S1meFk7eWFdNhpUXApysI3YafwRzw=;
        b=V7gVgY3W4dpeU+fAZ1aQ8H19n6Bi89XeRlKMES3y5g3FORUeJ7O5siKkNlwWMTz+Cg
         dTvkOYKOt1jIQMU65ogPYbtAneGfqSVYVRBhpfGoYtEl/kzD7FzqmJQsUUOBDwU3jmcZ
         J7l2tiPXx+8D6rPfqy48xyPG2ERkERMkLfCngcUPiA+anBNLUCd5ZbQyuLBprexdiI5c
         tbYvu6ZZmM/I8VMtOvIZdpX5FPMdA4dJJdoSYqS2fYU29iBDQmdmeVjq1Kkfo5ZvXiDC
         4vlINXHF9zKXIAigoH06v2En8ymPc09R6KRueA1iU2vfQ3c+/0VIjFlkVOtwq2S1jN+D
         AR7w==
X-Forwarded-Encrypted: i=1; AJvYcCVjsCV6rbSLRVZ7sYG23razqDKFrQbPxMsiO8HZl/rLHzuwm4METwHs6N+0E/g2x9+aCV19NNo4DFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNO99dsGYh6r8NR7mOE/bV6fT1aRue/jNpvZAUBKdx79caaaeh
	p7OP9C5cTGhKAzSKMZw8GavHgat1Hh3II06MLn8XI0Q7KPM8ZOmpRBjayOwBsjQ/
X-Gm-Gg: ATEYQzwcCjNhUj0QfkPuTCYsWWIZPyy8Rwfau7pjWRKdSy9Tx9oibYyhYyyXwHATltL
	c1Z8eSzDHrjG8Lg4xccZBVfNHKSj4jl4WTQIc8Swuj62qkvDftvX6ln34n/slRZJTyu++DJnQcT
	054g1C2S0Ux/1wq55ZUGIDjSaN9mfR087Pp5sk/r4qBf049zmX5p1p0Cp42V1OnBoctMafVg7E7
	p3xUsSKBcf2VVOyG8EnewQagTGrB6opiTssiGIQEeuJWD9iaG3Xb/N/qH/3kgaJTrTr220hlxmE
	2hzASZVw/tqvOy3IDGwP/kUqaQi7oFUCzF8d9Qk0zhagaJtLBBTxx2k+BX+iP4OaIpZcR5eOP+I
	9vxT8HN2K3Qr5rxrRsShNuXiLj7jiV+wxNEEFn4h/Fb3yy/2Z6TelnAF3axx6mwnbQa2xjSq8XB
	L1b1+6EvPxOnLAWIoBE6PFHl+2zlXSwF07WpkvbL8icvCg/+HMvfJbklgq8MPo
X-Received: by 2002:a17:903:1547:b0:2b0:5cee:c405 with SMTP id d9443c01a7336-2b05ceec667mr29270395ad.52.1773679271318;
        Mon, 16 Mar 2026 09:41:11 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb6800fsm8325547a12.16.2026.03.16.09.41.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 09:41:11 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a211df8e3so2321441a91.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:41:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXq9NFITLkbDdfwNmT7jyt3JPJo2SKt0Gaep52B48geHKLsbdoMEAt39je54TDtBfOijeb3mKVPmsI=@vger.kernel.org
X-Received: by 2002:a05:6102:41a8:b0:5ff:f366:dbe1 with SMTP id
 ada2fe7eead31-6020e2ca6f9mr4658842137.15.1773678937299; Mon, 16 Mar 2026
 09:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto> <20260312-classy-misty-platypus-5baea1@sudeepholla>
 <abLrm7x8ggzAhYOg@pluto> <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
 <abgsW1yoGtMNE3c7@pluto>
In-Reply-To: <abgsW1yoGtMNE3c7@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 17:35:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
X-Gm-Features: AaiRm51lpyc-i3j3bxjBB2lDNXTNKjsxn3Z8MoQ6iXS2hbjQwIIJtMCDQtgnhDA
Message-ID: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > > > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > > > rates.
> > > > > > >
> > > > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> > > > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > > >
> > > > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > > > -               if (!ret)
> > > > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > > > +               if (ret)
> > > > > > > +                       return ret;
> > > > > >
> > > > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > > > do not support the SCMI CLOCK_ATTRIBUTES command.
> >
> > Apparently it is not just CLOCK_ATTRIBUTES, but also
> > CLOCK_DESCRIBE_RATES.
>
> I was indeed suspicious that I could have opened a can of worms by
> more strictly enfrocing these...
>
> > > > > > Before, these clocks were still instantiated, but were further unusable.
> > > > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > > > are available at all.
> > > > >
> > > > > ...and this is exactly what I feared while doing this sort of hardening :P
> > > > >
> > > > > So there are a few possible solutions (beside reverting this straight away)
> > > > >
> > > > > The easy fix would be instead change the above in a
> > > > >
> > > > >     if (ret)
> > > > >             continue;
> > > > >
> > > > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > > > FW releases to fix this :D
> > > > >
> > > > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > > > quirk targeting the affected FW releases...
> > > > >
> > > > > This latter option, though, while enforcing the correct behaviour AND
> > > > > fixing your R-Car issue, leaves open the door for a number of possible
> > > > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > > > >
> > > > > ...that could be solved with more quirks of course...but...worth it ?
> > > > >
> > > > > Thoughts ?
> > > > >
> > > > > Let's see also what @Sudeep thinks about this...
> > > >
> > > > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > > > the firmware baselines are derived from it. In the worst case, we can relax
> > > > the hardening until we figure out a proper quirk-based solution.
> > >
> > > Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> > > Geert with proper versioning....so I can check that there are no
> > > surprises round the (quirked) corner...
> >
> > Unfortunately you cannot "continue" from a quirk, without resorting
> > to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
> > control in quirk code snippets"[1].
>
> Yes ... just realized that this afternoon when trying to draft a
> quirk... (see other thread)
>
> > Then I came up with the following preliminary (have to check more
> > firmware versions) quirk (Gmail whitespace-damaged):
> >
> > diff --git a/drivers/firmware/arm_scmi/clock.c
> > b/drivers/firmware/arm_scmi/clock.c
> > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > clk_protocol_events = {
> >         .num_events = ARRAY_SIZE(clk_events),
> >  };
> >
> > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > +       ({                                                              \
> > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > +                       continue;                                       \
> > +       })
> > +
> > +#define QUIRK_RCAR_X5H_NO_RATES
> >          \
> > +       ({                                                              \
> > +               if (ret == -EOPNOTSUPP)                                 \
> > +                       ret = 0;                                        \
> > +       })
> > +
> >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> >  {
> >         int clkid, ret;
> > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > struct scmi_protocol_handle *ph)
> >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> >                 cinfo->clkds[clkid].id = clkid;
> >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> >                 if (ret)
> >                         return ret;
> >
> >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > QUIRK_RCAR_X5H_NO_RATES);
> >                 if (ret)
> >                         return ret;
> >         }

> > Does that look like what you have in mind?
> > Thanks!
>
> Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> behaviour with continue, BUT if the set of clocks not supporting attributes
> and the set of clocks not suppporting rates is disjoint, I feel we need your
> double quirks :P

I could have used

    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);

after both scmi_clock_attributes_get() and
scmi_clock_describe_rates_get(), but I wanted to keep the check as
strict as possible: the former returns two error codes to ignore,
the latter only one.

> If you are still finding out the exact FW versions that are failing maybe
> it is better if you carry on and test the quirk-framework fix above together
> with your quirks and we can make sure to pick all up together...

It is not urgent, as R-Car X5H SCMI support is not yet upstream.

> ...OR maybe better I can also drop for now my offending patch that breaks
> your FW from my V3 series and you can pick it up and post it later with
> your quirks and the Quirk framework fix you propsoed so that we are sure
> that we dont break anything while fixing all of this...

While there is indeed a chance that this hardening regresses on
platforms that are already upstream...

> Also because we are already in V4 and I dont want to risk to post the
> breaking fix (that was at the end broke since forever) BUT not the quirks...

s/in V4/at rc4/?

> Let's see what @Sudeep thinks

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
