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
In-Reply-To: <b42e2bb3-2cd0-3115-9be4-16e3a48b46fd@codethink.co.uk>
Message-ID: <146776626852.35356.9847034661606022714@resonance>
Subject: Re: [PATCH 6/7] meson: clk: Add support for clock gates
Date: Tue, 05 Jul 2016 17:51:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Ben,

Quoting Ben Dooks (2016-07-05 11:01:14)
> On 05/07/16 18:56, Alexander M=C3=BCller wrote:
> > This patch adds support for the meson8b clock gates. Most of
> > them are disabled by Amlogic U-Boot, but need to be enabled
> > for ethernet, USB and many other components.
> > =

> > Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
> > ---
> =

> This seems to be a lot of structures for clocks that may
> never be use. I think it would be better to provide a custom
> lookup function that creates these as needed and use the ID
> in the dt as a offset+bit id.

We want the real clocks registered so that we can disable spuriously
enabled at late_initcall time with clk_disable_unused.

Furthermore, I'd like to not represent all of these gates in the DT
binding description (see my response to the earlier patches in this
series), since it becomes ABI (and a maintenance nightmare).

Regards,
Mike

> =

> -- =

> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
