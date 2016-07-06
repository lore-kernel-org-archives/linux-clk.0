Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 =?utf-8?q?Alexander_M=C3=BCller?= <serveralex@gmail.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-7-git-send-email-serveralex@gmail.com>
 <b42e2bb3-2cd0-3115-9be4-16e3a48b46fd@codethink.co.uk>
 <146776626852.35356.9847034661606022714@resonance>
 <07f37b8b-cfd2-ebc6-a693-4372d6c34293@codethink.co.uk>
In-Reply-To: <07f37b8b-cfd2-ebc6-a693-4372d6c34293@codethink.co.uk>
Message-ID: <146779266886.35356.2727828069246665428@resonance>
Subject: Re: [PATCH 6/7] meson: clk: Add support for clock gates
Date: Wed, 06 Jul 2016 01:11:09 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Ben Dooks (2016-07-06 00:35:28)
> On 06/07/16 01:51, Michael Turquette wrote:
> > Hi Ben,
> > =

> > Quoting Ben Dooks (2016-07-05 11:01:14)
> >> On 05/07/16 18:56, Alexander M=C3=BCller wrote:
> >>> This patch adds support for the meson8b clock gates. Most of
> >>> them are disabled by Amlogic U-Boot, but need to be enabled
> >>> for ethernet, USB and many other components.
> >>>
> >>> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
> >>> ---
> >>
> >> This seems to be a lot of structures for clocks that may
> >> never be use. I think it would be better to provide a custom
> >> lookup function that creates these as needed and use the ID
> >> in the dt as a offset+bit id.
> > =

> > We want the real clocks registered so that we can disable spuriously
> > enabled at late_initcall time with clk_disable_unused.
> > =

> > Furthermore, I'd like to not represent all of these gates in the DT
> > binding description (see my response to the earlier patches in this
> > series), since it becomes ABI (and a maintenance nightmare).
> =

> Erm, so writing /more/ code and having them defined in /two/ places
> is a nightmare? Sounds more of a nightmare of having the ID in the DT
> represent the register/bit offset and then having them created at
> lookup time.

I apologize, but I really don't understand what side of the argument
that you are pushing for based on the above text. Something is a
nightmare, but I'm not sure which design pattern you are attributing
nightmare status too.

Anyways, clock string name is required always, so even if you encode
register and bitfield in DT cleverly, you've still got data in C,
assuming your point was to remove stuff from C. That might change some
day, but not today. Memory footprint should remain the same with either
implementation.

If you have an alternative implementation, patches are always welcome.

Best regards,
Mike

> =

> =

> =

> =

> -- =

> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
