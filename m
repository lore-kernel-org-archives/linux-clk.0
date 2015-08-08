Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <878ub2h8tg.wl-ysato@users.sourceforge.jp>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-clk@vger.kernel.org
References: <1435570978-1734-1-git-send-email-geert+renesas@glider.be>
 <878ub2h8tg.wl-ysato@users.sourceforge.jp>
Message-ID: <20150808005844.2416.62598@quantum>
Subject: Re: [PATCH] clk: h8300: Remove "sh73a0-" part from compatible value
Date: Fri, 07 Aug 2015 17:58:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Yoshinori Sato (2015-06-29 07:45:47)
> On Mon, 29 Jun 2015 18:42:58 +0900,
> Geert Uytterhoeven wrote:
> > =

> > Drop the bogus "sh73a0-" part (accidentally copied from shmobile?) from
> > the compatible value.
> =

> Ouch.
> Applied. Thanks.

Sato-san,

Do you plan to send pull requests for h8300 clock patches in the future?

Thanks,
Mike

> =

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/clock/renesas,h8300-div-clock.txt | =
2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/Documentation/devicetree/bindings/clock/renesas,h8300-div-=
clock.txt b/Documentation/devicetree/bindings/clock/renesas,h8300-div-clock=
.txt
> > index 36c2b528245cd48f..399e0da22348b19e 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,h8300-div-clock.t=
xt
> > +++ b/Documentation/devicetree/bindings/clock/renesas,h8300-div-clock.t=
xt
> > @@ -2,7 +2,7 @@
> >  =

> >  Required Properties:
> >  =

> > -  - compatible: Must be "renesas,sh73a0-h8300-div-clock"
> > +  - compatible: Must be "renesas,h8300-div-clock"
> >  =

> >    - clocks: Reference to the parent clocks ("extal1" and "extal2")
> >  =

> > -- =

> > 1.9.1
> > =

> =

> -- =

> Yoshinori Sato
> <ysato@users.sourceforge.jp>
