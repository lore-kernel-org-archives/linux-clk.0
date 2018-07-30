Return-Path: <andriy.shevchenko@linux.intel.com>
Message-ID: <c82487a125591c14e66ba56dc3202aa0093f0aba.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/2] clk: Add of_clk_get_by_name_optional() function
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Phil Edworthy
	 <phil.edworthy@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Russell King <linux@armlinux.org.uk>, Simon Horman
 <horms@verge.net.au>, linux-clk <linux-clk@vger.kernel.org>,  Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 30 Jul 2018 13:57:07 +0300
In-Reply-To: <CAMuHMdUWWb7uyiG6NdRaJxM0X4JfioWx=o9J7jD18rgiTz1m4w@mail.gmail.com>
References: <1532939768-7018-1-git-send-email-phil.edworthy@renesas.com>
	 <1532939768-7018-2-git-send-email-phil.edworthy@renesas.com>
	 <CAMuHMdUWWb7uyiG6NdRaJxM0X4JfioWx=o9J7jD18rgiTz1m4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2018-07-30 at 10:55 +0200, Geert Uytterhoeven wrote:
> On Mon, Jul 30, 2018 at 10:36 AM Phil Edworthy
> <phil.edworthy@renesas.com> wrote:

> > +struct clk *of_clk_get_by_name_optional(struct device_node *np,
> > +                                       const char *name)
> > +{
> > +       if (!np)
> > +               return ERR_PTR(-ENOENT);
> 
> Shouldn't this return NULL?
> Or let __of_clk_get_by_name() handle that (cfr. above)?
> 
> Hmm, of_clk_get_by_name() has a similar check, while the current
> __of_clk_get_by_name() already handle np == NULL, too.

This check is needed to prevent NULL pointer dereference below.

And I agree that absence of device node should be considered as okay
case for optional clock (!CONFIG_OF case, for example).

> > +
> > +       return __of_clk_get_by_name(np, np->full_name, name, true);
> > +}

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
