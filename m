Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284123DA7D4
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038937; cv=none; b=BEmMg1cYnTfO43kxQWQpgX5A8M/0BR6RXNxOM2JqwMUH/srCw27GmP5x+8w+J/ro1BYPgI3n8rdZn3Cnf31ipwVC+feCemtNVY2ZNR3iDHaW/w5LZ3qmD/bIUx583W9gbdSlT2s3riO+KwAYfbHhtBX0s10dONaz+bg/Sm3kazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038937; c=relaxed/simple;
	bh=3WWUYT1S+sWCthHEyd69qr4QRMOSskrJUjp0/GRNRCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7Hy8y0RElhPvvD/7OB/ozhEbVZszne/lBAmNGxAyZM/mwitpzF5qeinKayGj/ZCzYWd+QMrMSwNMpFoeemBYEvSA/M/U27qxatX3Ld1YJ2Iro/vWg2WMLJv01tmrJm4zh7mvwIHWsvHeN0CtsBqD8YR6DC7oV7yMxa8QNtCSJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56f65f62b4cso2617076e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038923; x=1777643723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W09Put2d2jcS6dMqMtNkVaKBleBYHmqz0mTuj06mJ8=;
        b=EcPdKKI87r4/xHgY0tNrXfFeElvj0ZkD2JMFN/jUo+eUpMBqJHy5+PgJ4qqAjRDaIX
         ff1RGJEXaq88zqthDJR/H2AOWSSlFqhgEywaAsmLXLsZQ1j6YGY2IrYm9I9482UWnXl7
         6zPU1MVXErmdNo3ghh3qhGemLLitA5AYC0xNW+iSWhtwO4L3FmZpM0zWRdko9oPodMw/
         0hsxv3M32emUZU6n+byBfleakjGGitfLDzZeIZ7SvAmCdln4UofesHJxNkPhCtWlR0MI
         WrwSIVoZkrEok7x9gB/WD4tRklODp3HH7h4zaqRp3RwMTPQTXJsBsF7ep5lkjMPGty2J
         fULQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X0P7ebT2FWcEi6KrfjLsEnfFvDv0Y2SfiDotcQ4tapU77HViY6oBvUcUhbqlEg/6cYTNK376WJro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHMxiH5sKQfDgVe7byioZTe/G/rr09NKsI8k93uGSUlPWArWSN
	6MUGQBidSefpv+2rQgYb6/lewB6Inn0y+/lGs6wbF7FTfcJwloREcimLQBDbbXE56CA=
X-Gm-Gg: AeBDietGfpwhMdwKWiFhUdY5UeW5M7QE0aMBREIvIJyaln73K5UwS/7mo92BnVzCinP
	6v45AHi9ypM9Jhn7zK+RSdil+vNvAaYBDnZpmRGbiUYL5QFBMz0LgqNxjQnJ5ghQDQ15T1RTvfy
	JxAJc1dijp7rqdYQJXv0FBrInybZh12VsUDgH9y0WC3TWn3R+aBoMaJq7+0ndsHgU8EpNac5b5W
	363Let+ivaaFwUWeqeCpXR4t0yTKgalPjLw61OHdrTMNGZQCZLiGeoFQ9NALXOUCYUvZhpLmpX+
	hnN/Nee675oVI4qn06uHSzv06boXfbckCgNHiceF7cJKMxDig8OtGcXptV2b/9Y3piLZ+kH1M4C
	8+8WkBsV2jAqzy5BoqOrVZj32l5fYE74u5yzz8lS9SW7ZHyEGtTXHuSZ6lDe55U8BMyiz3jajFv
	sSlTOuIUFTpxrd0M7r82rGSpNNVDhsQFfWxKiCVtw8I+DQ1jEYgodr21EORUnFvw6ttEq2ODaKj
	jo=
X-Received: by 2002:a05:6122:3124:b0:56b:7484:39b with SMTP id 71dfb90a1353d-56fa57fe337mr17077456e0c.4.1777038923351;
        Fri, 24 Apr 2026 06:55:23 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa90335e6sm14254438e0c.0.2026.04.24.06.55.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:55:21 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56d933b555cso2564525e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:55:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hX3SK4Fngxl/7d80Q98EEv/64qKdBlGus05Cp9P/34UiA6KjR0DL0eiVYL05yYsfVAhO9nbzhL44=@vger.kernel.org
X-Received: by 2002:a05:6122:888b:b0:56f:adb8:7c54 with SMTP id
 71dfb90a1353d-56fadb88baemr9569375e0c.3.1777038919660; Fri, 24 Apr 2026
 06:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
 <aetw1WcSCDxk11AV@pluto>
In-Reply-To: <aetw1WcSCDxk11AV@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:55:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
X-Gm-Features: AQROBzDgUwf7y8JAYn7HmssU55ZLu_QWLKDdr6HYpgz_IN4dOPPU1wpFaeXKzVc
Message-ID: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com, 
	f.fainelli@gmail.com, vincent.guittot@linaro.org, 
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com, 
	dan.carpenter@linaro.org, geert+renesas@glider.be, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Fri, 24 Apr 2026 at 15:32, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:07:59PM +0200, Nicolas Frattaroli wrote:
> > On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> > > Add proper error handling on failure to enumerate clocks features or
> > > rates.

> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > ---
> > >  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
> > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > > index c9b62edce4fd..bf956305a8fe 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> > >                 SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
> > >                     clk->rate_change_requested_notifications = true;
> > >             if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > > -                   if (SUPPORTS_PARENT_CLOCK(attributes))
> > > -                           scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > -                   if (SUPPORTS_GET_PERMISSIONS(attributes))
> > > -                           scmi_clock_get_permissions(ph, clk_id, clk);
> > > +                   if (SUPPORTS_PARENT_CLOCK(attributes)) {
> > > +                           ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > +                           if (ret)
> > > +                                   return ret;
> > > +                   }
> > > +                   if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> > > +                           ret = scmi_clock_get_permissions(ph, clk_id, clk);
> > > +                           if (ret)
> > > +                                   return ret;
> > > +                   }
> > >                     if (SUPPORTS_EXTENDED_CONFIG(attributes))
> > >                             clk->extended_config = true;
> > >             }
> > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >     for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >             cinfo->clkds[clkid].id = clkid;
> > >             ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > -           if (!ret)
> > > -                   scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +           if (ret)
> > > +                   return ret;
> > > +
> > > +           ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +           if (ret)
> > > +                   return ret;
> > >     }
> > >
> > >     if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > >
> >
> > I see that a quirk is being added for this, but I thought I should chime
> > in with my opinion for future approaches in this direction.
> >
> > I don't see how this hardens anything. All this does is break platforms
> > that were previously working by returning early. At most, this should
>
> Certainly the naming in the subject was chosen badly (by me!)...indeed it
> should be more something like "Enforce strict protocol compliance",
> because at the end all of the broken platforms really run a slighly odd
> out of spec SCMI firmware that does NOT implement one or more of the SCMI
> mandatory command...
>
> > be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
> > returns nonsense, a clock driver should imho try its best to work
> > around the nonsense in a safe way, because the alternative is that
> > a major part of the system (and thus likely the entire system) no
>
> ..well yes we definitely dont want to break deployed platforms BUT also
> we dont want to legalize this kind of out of spec behaviour in future
> firmwares...hence (a number ?) of quirks an FW_BUG warns probably to
> let already broken deployed platforms survive while discouraging such
> implementation in future fw implementations...
>
> These firmware most certainly wont pass the SCMI compliance test suite [1],
> which indeed we do not mandate, but the reason these bugs happened is
> exactly because the kernel SCMI stack was buggy and left that door open...
>
> More specifically these kind of out-of-spec behaviours are not really just
> a matter being 'picky', the problem is that any resource set in any
> SCMI protocol is defined by the spec such as to be described by a
> contiguos set of IDs and the drivers are designed anyway under that
> assumption from the allocation point of view, so allowing a clock ID to
> just fail one of the mandatory commands and skip a domain would jeopardize
> all of this and, even if clearly is NOT a problem here, seems a fragile
> assumption.

How can you have all of:
  1. a contiguous list of IDs,
  2. implement all mandatory commands,
  2. restrict the use of some clocks to a subset of the agents in the system?
Use a different list of IDs for each agent?
What if a mistake was made, and a clock was exposed to an agent by
accident?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
