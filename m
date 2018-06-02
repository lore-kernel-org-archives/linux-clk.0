Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CAMuHMdUNXQDdv-CQs+KpaHJ8gGFjFrPRNXF3HPZNyTdQr+23Og@mail.gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1526641120-1585-1-git-send-email-geert+renesas@glider.be>
 <152788083877.225090.16757573144833344500@swboyd.mtv.corp.google.com>
 <CAMuHMdUNXQDdv-CQs+KpaHJ8gGFjFrPRNXF3HPZNyTdQr+23Og@mail.gmail.com>
Message-ID: <152791486506.225090.5983323218999937025@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clkdev: Remove duplicated negative index check from
 __of_clk_get()
Date: Fri, 01 Jun 2018 21:47:45 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-06-01 12:22:33)
> Hi Stephen,
> =

> On Fri, Jun 1, 2018 at 9:20 PM, Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Geert Uytterhoeven (2018-05-18 03:58:40)
> >> __of_clk_get() calls of_parse_phandle_with_args(), which rejects
> >> negative indices since commit bd69f73f2c81eed9 ("of: Create function f=
or
> >> counting number of phandles in a property").
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> Commit bd69f73f2c81eed9 is in v3.9.
> >
> > Did you send this to Russell's patch tracker? Otherwise I can pick it up
> =

> Not yet. The patch tracker is for reviewed patches, AFAIK.
> =

> > to clk-next.
> =

> Thanks!
> =


Ok. If you need my reviewed-by to add it to the tracker feel free to
have:

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
