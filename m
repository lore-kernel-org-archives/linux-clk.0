Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5B3FCB20
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359835; cv=none; b=fwOT8aVr6qYSxtXrJCZgnzI/pa7afjfMdzfrafJETDV/OONagWA/2Ptvh3Z2gYNf4XzwoW/hDNeFXi5jEQrCFFZj2jdFL1ggtvIdSfOC9CdOocHzoCyxnuhpjyPcowAoObfYxA8rKHtbk6EbS2NHaw5bjKTF7S/8v6ZBvjJq2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359835; c=relaxed/simple;
	bh=v0TQlWPzu8GTPZY9FpXVbuwaCxkxoZDN7EjwI6xWIr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH5wQ9ZhEJohC/bqWudwVZhoPoh5WZbR3xjPnzuiadRDWjoNZ2B24zCSV180/xfWsCrWPZSCSwB9jKF0ZIiApocMy3mUqxEG6/8IUzj7iio3UVotbZg77bkVJGBe+BXb0sZBMKaGgx7/YyzGddd7oVkePHXKuUOhQJqA63CeiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-60318fdfd25so293036137.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359833; x=1774964633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3UNdFM/2oVC0aBHnMmb6liNAkmGmbywgRrpmh1ChmU=;
        b=ZbIkUlRsErJ2s0gSHuNMyp61ysYA8B6Q7piwAnWmr0gZeiKpunOL7tMOVL54Xme2UR
         KZFkcy/NdxIgfsG4LgyVTnmPwBnSoIUwbku0UNjo0n4rR0YjRJwW4xFTqHSUdluOANMz
         GJNGO0e4tRBQbGbDR+DJATuTaCyaR7aVNsVdiIMy+kHiQGWgElNjE3gWP31ZBudke3ZW
         f0fo2/xCzFWHkNcBqQTQm4xIuQOJnBw9KFLZS7pmQc2iI1hHdphZwUf3dhUIuJslTOIO
         fegoBtScdjC5uQVk1acIaim4vWbzwfTLy66N8V6lzAdBuYMg1WwliqAJtnd0NnDiXYXN
         dQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUShYl2Y3y8VMSyJef/F+BKKeudVwDzlCPYvI0OiUkU5d7YKbCjsrXctd/tRsfbEzKB58zd+zXMWAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3UmsMfOzy9MzgZbVeXeDm5S+wl6U71EyNIvfLjBMpfl5D8y/J
	pLi+3pFz0ClE1cA/0305rlKldRhvW4Mwm5rMA9zoD6Wq3RU++Iq/bA7oWen5Q8n5KoE=
X-Gm-Gg: ATEYQzxN9ShFVo2pPbWMIfkkwNR+6a3NWqccVBBnQK96KBWtxTGwNu9I1GAAei/Ar0n
	Z9NBU6tmiZu24es3rLIRb7+q/qsKLBuKET56j7EW2JJkW+Xnz/GM0PZAdPcWKbp/gwNmtJrWpb9
	XSYjvY0Gvdj1TS8uz8x7FucK1ZqVnMPCxGgnEXuFPNQmh2iCTQkGs6+COTYW1xysJnv1Srw7+9G
	ETuvRqiuFdb+6V07CN7pJTNSAg4q0V/2eLv948/xyGIcZN+fwuKQQZX3j2L0leRdWxWIp/cVJLR
	t59hBP9I1BzBI9mREKs9D2p89YM56NmYFQob4i4atIc2maSQSf0ul750VQKFZwY6osoZizMYkCj
	TTPUDCRHYkauWPMdzO11X5mmVf8cSOHPTt41Gl+vNGdJMHGfIUw6ZuqY521Gu268Z5/t7VetN4U
	7JtKDKCKOvKQcjROCzcinnxyApqNsGx7R6RuFUpAVvfQkqQYaa+i52yRKtuKEcpuNM
X-Received: by 2002:a05:6102:4492:b0:602:aac7:b8c4 with SMTP id ada2fe7eead31-602aed2fcbdmr5643037137.25.1774359833104;
        Tue, 24 Mar 2026 06:43:53 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb5b832sm10953535137.12.2026.03.24.06.43.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so2305009e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULzdeiG+MYzE+YoTVMWPeIkZuP4NV2Zcim4Dy59S0n9r+1Zr+22K/Vr4fsBuuwvyC9gT4aR0Zu7zE=@vger.kernel.org
X-Received: by 2002:a05:6102:5812:b0:602:71a7:63c2 with SMTP id
 ada2fe7eead31-602aecd0de0mr7186355137.23.1774359832015; Tue, 24 Mar 2026
 06:43:52 -0700 (PDT)
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
 <abgsW1yoGtMNE3c7@pluto> <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 14:43:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm9X5TLaAHgCsMqjFZLvUsDjrf4CqzNiO-Hsr4X9bDtw@mail.gmail.com>
X-Gm-Features: AQROBzDvNZgLoQvhVJc-PSdP06Iq5zvkWOybQz-6zVMkfKMPvuuu_fBc0vUNAPY
Message-ID: <CAMuHMdWm9X5TLaAHgCsMqjFZLvUsDjrf4CqzNiO-Hsr4X9bDtw@mail.gmail.com>
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

On Mon, 16 Mar 2026 at 17:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > > Then I came up with the following preliminary (have to check more
> > > firmware versions) quirk (Gmail whitespace-damaged):
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c
> > > b/drivers/firmware/arm_scmi/clock.c
> > > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > > clk_protocol_events = {
> > >         .num_events = ARRAY_SIZE(clk_events),
> > >  };
> > >
> > > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > > +       ({                                                              \
> > > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > > +                       continue;                                       \
> > > +       })
> > > +
> > > +#define QUIRK_RCAR_X5H_NO_RATES
> > >          \
> > > +       ({                                                              \
> > > +               if (ret == -EOPNOTSUPP)                                 \
> > > +                       ret = 0;                                        \
> > > +       })
> > > +
> > >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >  {
> > >         int clkid, ret;
> > > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > > struct scmi_protocol_handle *ph)
> > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >                 cinfo->clkds[clkid].id = clkid;
> > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> > >                 if (ret)
> > >                         return ret;
> > >
> > >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_RATES);
> > >                 if (ret)
> > >                         return ret;
> > >         }
>
> > > Does that look like what you have in mind?
> > > Thanks!
> >
> > Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> > behaviour with continue, BUT if the set of clocks not supporting attributes
> > and the set of clocks not suppporting rates is disjoint, I feel we need your
> > double quirks :P
>
> I could have used
>
>     SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);
>
> after both scmi_clock_attributes_get() and
> scmi_clock_describe_rates_get(), but I wanted to keep the check as
> strict as possible: the former returns two error codes to ignore,
> the latter only one.

So these are two mitigations:

    #define QUIRK_RCAR_X5H_NO_ATTRIBUTES    ({ ... })
    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);

and

    #define QUIRK_RCAR_X5H_NO_RATES         ({ ... })
    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_RATES);

gated by a single quirk entry clock_rcar_x5h_no_attributes:

    DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
    DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL,
                      "0x10a0000", "renesas,r8a78000");
    __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),

In general, when a specific SCMI implementation has multiple quirks
and needs multiple mitigations, do you prefer to have individual
entries for each quirk plus mitigation, or just a single entry with
multiple mitigations (which may not be limited to a single protocol,
unlike my example above)?

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
